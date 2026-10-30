# UpTax desktop releases

## Repository boundary

Read `README.md` first. This repository distributes Windows x64 installers
and automatic updates. Application source and build tooling belong in
[`uptaxai/uptax-integrations`](https://github.com/uptaxai/uptax-integrations).

- Do not implement application fixes here or copy application source into this
  repository. Locate and verify the intended source branch/worktree first.
- Before changing anything, inspect `git remote -v`, `git status --short`,
  and `git branch --show-current`. Preserve unrelated user and agent changes.
- Keep installer binaries and updater artifacts in GitHub Release assets,
  not Git history. Repository files should remain distribution documentation
  and agent guidance unless the task explicitly changes that scope.
- Use synthetic test data only. Never include customer records, tax returns,
  credentials, signing secrets, vendor binaries, or vendor-derived schemas
  in commits, release notes, logs, screenshots, or published artifacts.

## Build and validation

- Build once and publish the exact tested bytes. Freeze SHA-256 hashes and
  byte sizes of the EXE, blockmap, and updater metadata after testing; any
  rebuild or replacement invalidates that evidence and requires retesting.
- Require a release manifest with baseline release ID/tag/source commit,
  candidate source commit/version, reviewed diff hash, packaged inventory and
  mapping coverage comparison, asset hashes, and validation results. Retain
  sanitized manifest/evidence as release assets; exclude private paths/data.
- Run the source repository's
  `node tools/release/verify-release.mjs verify <plan.json>` immediately before
  publication, following `tools/release/README.md`. Failure blocks publication.
  Integrate the gate into the actual publisher and propagate failures; do not
  assume a separate or older source worktree already includes these checks.
- One designated publisher owns the release window. Other agents hand off
  changes instead of racing to publish. Recheck the live baseline immediately
  before promotion; a changed baseline requires reconciliation and retesting.
- Compare uploaded draft assets and downloaded published assets to the tested
  manifest hashes. Never replace the tested EXE with a fresh untested rebuild.
- Follow the source checkout's `AGENTS.md` and documented build/release
  process. Never choose a checkout solely by its folder name or an old tag.
- Record the exact source repository, commit, version, build command, and
  test results. Build from the intended source state with fresh outputs;
  do not ship unrelated local changes or stale artifacts.
- Run the source repository's required checks, including `./run-tests.sh`
  and the applicable desktop/package checks. Skipped suites are not passes.
  Report packaging and synthetic install/update verification separately from
  source tests; do not claim unperformed checks succeeded.
- Verify installer version, architecture, asset names, sizes, hashes, and
  updater metadata against the actual build. `latest.yml`, the installer,
  and its blockmap must describe the same build. Follow the build tooling's
  signing requirements without exposing signing credentials.

## Publishing and update channel

### Mandatory changelog and release notes

- Every release requires a versioned entry in this repository's
  `CHANGELOG.md`, the source checkout's release changelog, and matching
  GitHub release notes. Create the changelog file if absent. Prepare them
  before publication and preserve previous entries.
- Build the change list from the entire previous-production-to-candidate
  diff, covering every contributor's shipped work, not only the releasing
  agent's task. Do not invent history or use "bug fixes" as the whole entry.
- Use this structure for each version, omitting no section (write "None"
  where appropriate):

  ```markdown
  ## <version> - <date> (<Draft or Published>)
  Previous production release: <tag and URL>
  Source: <repository URL>, baseline <SHA>, candidate <SHA>

  ### Added
  - <user-visible additions>

  ### Fixed
  - <problem and resulting behavior>

  ### Changed or removed
  - <behavior, mapping coverage, form/year support, compatibility changes>

  ### Preservation and validation
  - <source baseline/diff review result>
  - <packaged mapping/resource inventory and coverage comparison result>
  - <regression and packaged-app checks; failures, skips, untested areas>

  ### Upgrade steps
  - <required user actions, or None>

  ### Known limitations
  - <remaining issues or None>
  ```

- Confirm the candidate SHA identifies the actual built source. Keep the
  user-facing changes consistent across changelogs and release notes.
  Mark a release Published only after publication succeeds; drafts and
  planned work must not appear as shipped. Missing or incomplete notes
  block publication.

### No lost work between releases

Every new EXE must preserve everything in the previous production release,
including all mappings and every contributor's changes, except for
intentional, reviewed changes within the authorized task. Verifying only the
new fix is insufficient. Apply the source repository's **Preserve everything
already shipped** rules before accepting an artifact for publication.

Require the following release evidence:

- The latest published production release/tag, its exact source commit,
  and the candidate source commit. Unknown provenance blocks publication.
- Confirmation that the shipped source commit is an ancestor of the
  candidate, plus review of the complete diff for removals, reverts, and
  changes outside the task. Reconcile stale or divergent source first.
- Comparison of the actual previous and candidate packaged payloads:
  mapping/resource inventories, hashes of unchanged assets, mapping
  keys/coverage, bundled bridges, and supported forms/tax years. Every
  missing asset or unexplained difference blocks publication, even if the
  source tests and installer build pass. Explain expected generated-file
  differences; do not require byte-identical EXEs across builds.
- Synthetic regression results for previously shipped functionality and
  packaged-app checks, with untested coverage stated explicitly.

Recheck the production baseline immediately before publishing. If another
agent has shipped a release meanwhile, reconcile and repeat the comparison
against that release. Do not publish a stale candidate over newer work.

- Inspect current published releases and drafts before selecting a version.
  Do not assume the first listed release or an existing draft is the latest
  published version. Do not hard-code a current version into these rules.
- Publishing can trigger required updates for installed users. A request to
  fix code, write docs, or build an installer alone does not authorize a public
  release, replacing live assets, or changing which release is latest.
- Prepare and validate the complete release before publication. Use a draft
  while assembling assets; do not expose incomplete updater metadata.
- Publish only within the user's authorized release scope. Existing explicit
  authorization is sufficient; do not ask for the same permission again.
- Never silently overwrite published installers, reuse a published version
  for different bytes, delete releases/tags, or repoint the live update channel.
  Corrective releases normally need a new version; follow the authorized
  recovery plan for any exceptional rollback or channel change.
- Release notes must describe shipped changes and known limitations, not
  planned work. Include source provenance sufficient to trace the build.
- After an authorized publication, verify the release state, downloadable
  assets, and updater metadata. Report the exact version and release URL,
  validation results, and any unresolved limitations.

## Handoff

Clearly distinguish local documentation edits, source changes in the other
repository, builds, draft releases, and published releases. Never report a
local build or draft as a delivered update.
