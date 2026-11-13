## v0.2.79 - 2026-11-13 (Draft candidate; not publish-ready)

Previous production release: [v0.2.78](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.78).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `8e962065b039b1039dd1fbd41ff787f4a7986ca5`, candidate `5fb97745c6b3132d3db630111fa9100d68436bb7`.

### Added

- Drake 2025 individual W-2 input covers 260 writable fields on the main,
  additional-entry, and Ohio screens, including supported Box 12/14 and
  state/local rows. Separate W2PR input covers 64 writable destinations,
  without treating Puerto Rico withholding as federal W-2 withholding.
- Sparse W-2c corrections update a uniquely matched saved original and retain
  values that the correction omits.
- Failed Send to Drake jobs write a fixed stage, code, and one actionable local
  diagnostic. The shared desktop reporter queues one bounded, redacted failure
  report and retries it through the authenticated session. The companion
  backend draft adds a durable Telegram text alert for stored Drake failures.

### Fixed

- Registration and readback distinguish a proven no-write result, verified
  backup restoration, and an outcome requiring inspection in Drake. A verified
  imported return that fails to open asks for manual opening without another
  import. Importer exit and result status must agree before desktop success.
- Drake shell creation requires a confirmed empty client search and retains
  duplicate-client guards. Invalid or ambiguous source values are held for
  review without replacing unrelated saved return values.
- Native field guards protect W-2 state identifiers, localities, dividend and
  mortgage names, foreign-country details, and taxpayer addresses while
  retaining valid independent fields.

### Changed or removed

- Removed the suggestion to retry a Drake Send blindly after a possible
  saved-return write. No supported tax year or return type is removed.
- Drake support remains 2025. The previously shipped frontend, ATX, CCH,
  Lacerte, ProSeries, and other bridge resources are byte-identical to v0.2.78.
  Source-only OLT fixture tooling and Lacerte producer-contract test changes
  are not included in the desktop payload.

### Preservation and validation

- The v0.2.78 source is an ancestor of the candidate; the latest merged
  integration master is included. The actual published v0.2.78 and candidate
  NSIS installers were extracted independently. Both contain 2,697 physical
  files. The candidate has exactly 10 reviewed payload changes, one of them
  the new Drake outcome module, with zero file removals or removed JSON leaves.
  Every other resource, including mapping files, matches the published hash.
- Candidate native .NET tests passed 1,095/1,095. Desktop npm tests passed
  459, with five skips and zero failures. The final packaged dependency check,
  CCH/ProSeries bundle proofs, and updater metadata check passed. A synthetic
  failure executed through the final installer importer and reporter reached
  a disposable backend and Telegram with one authenticated POST.
- The first full `./run-tests.sh` completed with **579 ok, 57 failed, 0 skipped**.
  A complete rerun with a pinned Lacerte backend and Django-capable Python
  improved to **607 ok, 29 failed, 0 skipped**. One failure is inherited Drake
  Online mapper drift; 28 are Lacerte producer, fixture, schema, or historical
  backend-source checks. This remains a release gate failure. The exact frozen
  installer passed a
  synthetic per-user v0.2.78-to-v0.2.79 upgrade: all 2,697 shipped files
  matched the tested payload, and the upgraded app reopened with the same
  isolated profile after its updater-current check. No failed UpTax-button Send
  reached a deployed backend. This candidate is therefore not yet publish-ready.

### Upgrade steps

- Do not publish or install this draft for customers yet. Before an eventual
  release, deploy and configure the separately reviewed backend Telegram PR
  if staff expect Telegram alerts. After a validated release, users should
  review every imported return and manual-completion report before filing.

### Known limitations

- The backend Telegram PR is draft and not deployed; the provider-neutral bot
  is configured only for isolated local verification. Current alert formatting
  is Drake-only, and no desktop screenshot is transmitted.
- W-2/W-2c/W2PR coverage is input mapping, not full federal reconciliation or
  filing clearance. Ambiguous or unsupported facts remain manual review items.
- The 29 remaining repository-suite failures still block the release gate. No
  public update or EXE release has been created.

## v0.2.78 - 2026-11-12 (Published)

Previous production: [v0.2.77](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.77), source `6e99db12a28a298e749de9c7771cd54a55feede8`.

Actual built source: [8e962065b039b1039dd1fbd41ff787f4a7986ca5](https://github.com/uptaxai/uptax-integrations/commit/8e962065b039b1039dd1fbd41ff787f4a7986ca5). Separate test-only validation source: [fbb6a4ee5507d2aebf18cc5346b04617abcb9a7a](https://github.com/uptaxai/uptax-integrations/commit/fbb6a4ee5507d2aebf18cc5346b04617abcb9a7a). The tested installer was built from the first commit and was not rebuilt from the second; all2,157 packaging inputs and63 runtime overlays are byte-identical.

### Added

- Twenty-five guarded1120S candidate bindings: fiscal start/end, stock
  acquisition Other text, five columns for four-plus shareholder loans,
  Texas extension payment, California extension payment/prior credit and
  registration identifiers, Georgia PTE election/admission/contact fields,
  signed net income-adjustment statements, foreign entity address fields,
  the explicit positive basis-order election and original beginning face-loan
  principal. Principal is distinct from debt tax basis and the K-1 override.
  The profile has286 bindings, retaining all120 existing saved proofs;
  the166 candidates are not promoted by this release.
- Exact original1099-DIV ordinary/qualified amount receipts associate with
  already retained Schedule K amounts after received-K1 subtraction. No
  additional native dividend amount is created. Incomplete sources and
  book-dominant totals remain review items.
- Typed original/context conservation and field-specific review receipts for
  state, owner, period and representative facts, including null/zero/false.
  The matching backend source-conservation candidate is
  `bdcbc0128cac7a1c63cb92685c46549c4dcadfb7`; it requires separate deployment.

### Fixed

- Large-return preparation no longer repeatedly scans the full set of source
  paths when propagating deferred-input relationships. Exact raw path boundaries,
  original values, dependency decisions and review receipts are preserved.
- Source accounting and review-task matching use per-conversion indexes instead
  of rescanning every manual/deferred item for each source group. The earliest
  matching task, source-less fallback and stable report order are unchanged;
  review receipts are retained rather than removed to reduce processing time.
- Review reports explicitly warn when a present audit file cannot be read or
  exceeds the existing report size limits. Detailed source/preparer information
  and counts are marked incomplete; normal missing early-stage files do not
  trigger the warning. Original artifacts and read limits remain unchanged.
- Lacerte connection waits tolerate bounded foreground activation and identify
  unavailable data folders and connection stages. A unique hidden loaded
  workspace can be restored without starting a duplicate application.
- Contents navigation focuses the actual navigation control before typing a
  screen number, checks focus at each input boundary, and does not click a
  tax-input body while navigating. Foreground, modal, client-identity and
  active-data-path guards remain enforced.
- Dynamic loan records validate exact original cents before the existing
  whole-dollar formatting, preserving physical row/owner identity and exact
  original receipts. A malformed original cannot become valid by rounding.
- Explicitly omitted live return facts no longer authorize an inferred
  IRS-discussion blank command. The report requests recomputation and retains
  independent cached amounts and ordinary explicit-answer behavior.
- Saved-verification and promotion remain unavailable for new fields whose
  complete native reader/proof protocol is unqualified. Missing identity or
  linked destinations withhold dependent original receipt credit.
- Qualified full-name links accept unambiguous ASCII case differences between
  current owner and basis originals, including repeating loan records. Raw
  source names and full-TIN identity guards remain intact.
- A positive debt tax basis that rounds to zero uses the basis-only zero
  command instead of invoking the principal default. Exact original cents and
  complete parent/detail conservation remain required.
- An explicit zero ending-buildings balance uses its field-specific zero
  command instead of importing one dollar. Actual one-dollar balances remain
  amounts; nonzero balances rounding to the automatic default need review.
- An explicit zero shareholder ownership now stops Send before import.
  Lacerte can otherwise substitute calculated stock and K-1 percentages.
  Both percentages remain exact manual originals until a safe zero input is
  qualified; deferring unsupported fields cannot bypass this stop.
- Basis-row nondeductible amounts now explain the missing current-year,
  adjustment, replacement or carryover classification. They remain separate
  from the allocated current expense and are not added as a second carryover.
- The current public ProSeries1040 fix is preserved: Send stops before any
  create/update when a saved return remains unreadable after lookup retry,
  since it could hide the same tax ID. This replaces the published warning
  followed by an import and preserves the other ProSeries workflow.

### Changed or removed

- Removed behavior: interpreting explicit return-fact omission as an unanswered
  IRS-discussion election, and rejecting complete dynamic loan populations
  merely because their original amounts contain cents.
- Existing import-only Send remains the default. It does not verify saved
  values. Existing hand-entered amounts can remain and accumulate alongside
  imports; review the resulting return and report.
- No UI, dependency or updater-feed change. Other tax software behavior is
  preserved apart from the current public ProSeries safety fix stated above.
  Supported Lacerte file routing remains TY2025:1040.IB5,1065.PB5,
  1120.CB5,1120S.SB5 and990.RB5. No filing/payment action is added.

### Preservation and validation

- The build preserves published v0.2.77, including the ProSeries1040 profile's
  126 bindings, all frontend files, importer, ATX and CCH resources. Every
  changed/new Lacerte runtime resource is explicitly inventoried and checked
  against source; no previous mapping or proof is removed.
- The preceding frozen mapping-source assembly passed1,113 composed tests with
  zero failures/skips. Additional startup/lookup source tests passed246 cases,
  an exact packaged-byte replay passed69 cases and direct packaged Find/startup
  replay passed44 cases. These checks overlap and are not a coverage percentage
  or proof of a saved Lacerte return.
- Path-relation and source-accounting regressions exercise the actual production
  functions and fail the old repeated-scan work bounds. The optimized paired
  fixtures retain byte-identical public results and complete private diagnostics.
  A28,033-leaf synthetic case completed in8.3seconds and retained its full
  95.7MB diagnostics; the old implementation exceeded a240second measurement
  limit. No old full-size output comparison is claimed for that timed-out case.
- Exact-installer extraction, dependency/updater/architecture checks and
  relevant synthetic startup/update evidence must be recorded in the final
  release manifest. This source entry does not claim an unperformed install
  or an unfinished release gate passed. No publication occurs during building.
- Full-repository validation is retained separately from scoped Lacerte
  results. Known licensed-template, unrelated source-role and timing-sensitive
  test failures are reported as failures rather than passing evidence.
- The optimized runtime passed 1,135 focused source tests with no failures or
  skips, eight actual packaged workflow cases, two packaged performance cases,
  and installation verification of 2,697 physical files and 302 ASAR members.
  The installed working profile was preserved. The final validation manifest
  distinguishes these overlapping checks from complete native-return coverage.
- The separate validation harness retains the original historical serializer contract
  separately from the current producer review and supplies a tracked,
  deterministic offline OLT business-fixture generator. These changes preserve
  existing assertions and do not change the tested application payload.
- Drake native-runtime/catalog and original-mapper drift failures are excluded
  from the required passing scope for this release by explicit user direction.
  They remain recorded as failures; other required checks remain mandatory.

### Upgrade steps

Install the Windows x64 update and review the imported return and report before
filing. Deploy the separately reviewed backend source-conservation change to
provide its additional originals; an EXE cannot add omitted server JSON facts.
If an earlier unpublished 0.2.78 or a higher unpublished version is installed,
run this installer manually: the automatic updater does not replace an equal
version or automatically downgrade a higher one.

### Known limitations

Complete1120S mapping and full saved/reopened native qualification remain open.
Explicit zero shareholder ownership currently requires manual review; this
release stops the send rather than importing a different calculated allocation.
New candidates, false/zero clearing, broad source domains, complete statement
readback and existing-client overlap need their documented qualifications.
Other form profiles remain subject to their existing candidate/manual limits.
Actual remote-user connection causes are not established by synthetic fixtures.
The excluded Drake checks do not certify native Drake import behavior or resolve
the outstanding original-mapper drift review. Drake source and packaged importer
resources are preserved from the previous production release.
Large audit artifacts can exceed the HTML report reader's size limits; an
explicit warning identifies incomplete detail/counts. Retained job artifacts
remain necessary for the complete input ledger; oversized files are not claimed
to be fully displayed by the HTML report.
Publish readiness requires the final exact-artifact release gate and truthful
evidence; generated files or test counts alone do not certify it.

The complete unchanged repository run finished with 628 passing suite commands and four failures. Two Drake failures remain failed and are excluded by explicit user instruction. The other two were validation-harness defects repaired in the separate test-only source above; actual reruns passed33 Lacerte,168 OLT and135 CCH tests with zero skips. The required non-Drake checks pass as a composed validation; the raw whole-repository command is not represented as a zero-exit run.

Exact installer SHA-256: `4f638f989963379d2ee43646080baeb53b3ae8e605cebbb6f3ff74e56a844ebe`. Detailed sanitized validation and asset hashes: [release-validation.json](https://github.com/uptaxai/uptax-desktop-releases/releases/download/v0.2.78/release-validation.json).


## v0.2.77 - 2026-11-11 (Published)

Previous production release: [v0.2.76](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.76).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `c3e1ca4bd38fac2ff1a424f90c36fab20c5806ee`, candidate `6e99db12a28a298e749de9c7771cd54a55feede8`.

### Added

- The ProSeries 2025 Form 1040 preview supports the locally proved combination of six partnership K-1 copies and two W-2 copies. Its bundled native profile grows from 82 destinations in v0.2.76 to 126 (40 verified and 86 candidate), with no previous destination removed or downgraded. Candidate mappings and saved-value diagnostics have the native proof and coverage limits stated below.
- Guided OLT source adds mappings and workflows for 1040, 1065, 1120, 1120S, and 990. Guided ProConnect source adds routing and 1040, 1120S, and 990 mapping changes. These browser-extension sources are not packaged in this Windows installer. Bundled CCH resources remain unchanged from v0.2.76; the separate ProSeries 1120S audit is not included.

### Fixed

- New-client ProSeries Send creates a blank 1040 on the user's installation, waits until ProSeries saves a readable file, and restores the converted `.25I` so HomeBase registers the client.
- Restore selects Form 1040 even when ProSeries last showed a different return type. The opener selects the 1040 HomeBase view before locating the exact saved return.
- If the exact HomeBase row remains selected without opening, Send checks that ProSeries is still at HomeBase with no dialog or other return open, then tries the exact saved path through File > Open Client.
- Saved-client lookup retries unreadable files, then skips any still unreadable file with a warning; an exact readable tax-ID match requires approval before update. Native copy setup recovers foreground focus and tolerates the observed form-label tooltip.
- Lacerte Client Info navigation retries an absorbed tab click while retaining exact client and tax-ID verification.

### Changed or removed

- Removed behavior: directly writing an undated annual estimated-tax total to a calculated Form 1040 payment cell. The affected send stops before import because that route produced an inconsistent saved tax result.
- ProSeries support remains limited to the 2025 Form 1040 preview and an attested local native profile. This release does not add ProSeries 1120S Send.
- Release tooling can hash large source diffs without a child-process output limit; source tests accept integration-specific backend roots. These changes do not alter the desktop import workflow.

### Preservation and validation

- Candidate source descends from the published v0.2.76 source. The exact v0.2.77 installer retains all 2,022 baseline bridge files; its bundled ATX and CCH resources match the baseline byte for byte. Extracted payload comparison found 63 added, 31 changed, and no removed paths, with a recorded review reason for every difference.
- An earlier synthetic new-client run wrote and read back 11 of 11 planned inputs across six K-1 and two W-2 copies, requested Full Calc, and reopened the saved return. Exact-source scoped checks for this rebuilt candidate passed: ProSeries 274/274, desktop 401 passed with 5 optional CCH skips, release tools 19/19, and pinned Lacerte producer checks 20/20.
- Exact new installer SHA-256 is `6c9f4f9d001861a76482e8a8c455cc13357762375fdd19c714f0f7391ad44018`; blockmap SHA-256 is `00bac174b5512dedb7cc671d9ac0f88fd67288eb45b254f6b753e94ad01f5385`; `latest.yml` SHA-256 is `2dec2aa39dfcde1dd31b18901e771791c8944ff81ff275e2cc9ed747d4f2da65`. Package metadata passed and the exact payload was inventoried.
- The new build completed the scoped mapped-input workflow, saved and reopened the return, and verified 34 of 34 planned inputs plus 2 of 2 calculated checks. The UI reported `PROSERIES_PARTIAL` because 16 dependent calculated checks require review, 24 candidate mapping values remain, and 44 source items still need entry. Complete JSON coverage and calculated Form 1040 line parity remain unproven; the user accepted these disclosed limits for publication.
- The full repository suite has not passed: an earlier run recorded 557 passed and 8 failed, and the current required run reported failures. Inherited Drake failures and extension-only OLT failures remain excluded from this Windows EXE decision, not counted as passes. The exact rebuilt installer passed synthetic v0.2.76-to-v0.2.77 install/update and the release gate. The five release assets were published and downloaded again with matching hashes.

### Upgrade steps

- Install the Windows x64 update and review the saved tax return in ProSeries before filing.

### Known limitations

- Complete 1040 JSON coverage and calculated-line reconciliation are not established. A saved-client file that remains unreadable after lookup retry is skipped with a warning; it may conceal a tax-ID match and lead to a duplicate client. Review the warning and saved client before filing.
- An undated annual estimated-tax total has no proved native ProSeries input route and stops before import.

## v0.2.76 - 2026-11-05 (Published)

Previous production release: [v0.2.75](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.75).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `17d1d6433be1974e879281c9fb97ccba4796abd7`, candidate `c3e1ca4bd38fac2ff1a424f90c36fab20c5806ee`.

### Added

- None.

### Fixed

- Send to ProSeries remains visible for a 2025 Form 1040 when the desktop cannot use its local ProSeries profile. The disabled action explains whether ProSeries 2025 or its verified profile is unavailable.

### Changed or removed

- Removed behavior: silently hiding Send to ProSeries when profile validation fails. Import remains blocked until the local ProSeries installation and profile pass the existing checks.
- No mapping coverage, supported tax year or return type, or other tax-software integration changes are intended. ProSeries 2025 Form 1040 remains the public route with 82 packaged destinations: 11 verified and 71 candidate.

### Preservation and validation

- The candidate is based on the exact published v0.2.75 source and builder preservation inputs. The button change touches frontend visibility and fixed-code profile-status plumbing; it does not alter the converter or native import.
- The installer build and its required package checks completed; staged EXE, blockmap, and updater-metadata hashes matched the local build. At the user's request for an urgent build, optional source tests, a full installer payload comparison, and live ProSeries verification were skipped. No skipped check is presented as a pass.

### Upgrade steps

- Install the Windows x64 v0.2.76 update. If Send to ProSeries is disabled, read its explanation and check the ProSeries 2025 installation or contact UpTax for a profile matching that ProSeries build.

### Known limitations

- This update exposes the reason for an unavailable ProSeries route; it does not make an unverified ProSeries version compatible.
- The converter does not map every possible 1040 JSON input. Unmapped facts still require preparer handling, and candidate mappings require review. This update was not live tested on the affected client PC.

## v0.2.75 - 2026-11-04 (Published)

Previous production release: [v0.2.74](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.74).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `b156d7c83965fbd43aaf876f4cff1144f0308a04`, candidate `17d1d6433be1974e879281c9fb97ccba4796abd7`.

### Added

- None.

### Fixed

- A new ProSeries 1040 client can create a native blank from the supplied form plan without requiring a private form-list file that is absent from the installer.
- Saved-return verification handles an empty list of fields needing repair in Windows PowerShell and accepts ProSeries' trailing-dot format for whole-dollar W-2 wages.
- Full Calc attempts guarded foreground recovery after the idle wait before reporting that the return lost focus.

### Changed or removed

- Removed behavior: None. Existing-client updates, the Full Calc workflow, the v0.2.74 interface, other integrations, and supported tax years remain. ProSeries 2025 Form 1040 remains the public route with 82 destinations: 11 verified and 71 candidate.

### Preservation and validation

- The v0.2.74 built source is an ancestor of candidate `17d1d6433be1974e879281c9fb97ccba4796abd7`; the complete source diff has seven changed files, including version/build metadata and the release changelog. No mapping files changed.
- The exact v0.2.75 installer extraction matches its build output across 2,608 files. Expanded v0.2.74 and v0.2.75 payloads each contain 2,910 files: seven changed, none added or removed, and no removed JSON leaves. Mapping, converter, and generated-profile files are unchanged; eight checked ProSeries scripts match the candidate source. The packaged app reports v0.2.75, the intended source and frontend revisions, no test mocks, and the Send button.
- A live synthetic new-client run using the candidate source created a native blank and `.25I`, verified five of five written inputs with zero missing, ran Full Calc for wages and withholding, saved, and reopened the return. This run does not substitute for testing the exact packaged installer.
- The package and packaged updater checks passed. The desktop serial rerun passed 382 tests with zero failures and five CCH-specific skips; 197 ProSeries JavaScript tests, eight offline PowerShell suites, and 13 release-gate regression tests passed. The first JavaScript run differed on one generated-file line-ending assertion in the detached worktree; its normalized rerun passed. The exact-artifact release-gate result is retained with the release manifest.
- The broad `./run-tests.sh` run was attempted but did not finish. It recorded 65 passing suites before a .NET test failed because vendor templates were missing and a Drake drift test reported pinned-hash drift; the run was stopped at a bounded point. These failures did not occur in the scoped ProSeries checks above.

### Upgrade steps

- Accept the Windows x64 UpTax update or install the v0.2.75 installer. Review the ProSeries return before filing.

### Known limitations

- The converter does not map every possible 1040 JSON field. Unmapped facts remain manual items and candidate mappings require preparer review.
- The synthetic run does not prove compatibility with every ProSeries installation or every 1040 form combination. The exact installer was staged and extracted offline but was not installed and reopened on this PC because an existing UpTax instance was running and NSIS installation changes shared registry, shortcuts, and user profile. A live end-to-end import or update check of this installer was therefore not performed.

## v0.2.74 - 2026-11-04 (Published)

Previous production release: [v0.2.73](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.73).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `896ab402f35c8f6bf1bb6647ed18e74556cb6d7f`, candidate `b156d7c83965fbd43aaf876f4cff1144f0308a04`.

### Added

- None.

### Fixed

- Send to ProSeries uses ProSeries' own `SaveDirectory` for saved-client lookup and `.25I` placement, even when a stale UpTax environment override names another folder.
- A new 1040 send creates and checks a ProSeries-native blank return with its required forms before writing the client `.25I`.
- Three-copy partnership K-1 checks follow saved native copy identities rather than XML form order. A freshly ProSeries-created blank can supply the K-1 template after its same-run hash and native shape are checked; duplicate and mismatch guards remain. UpTax reports a specific native-proof error when those checks fail.

### Changed or removed

- Removed behavior: None. Existing-client updates, Full Calc, supported tax years and return types, and the v0.2.73 frontend remain. The 1040 profile still has 82 destinations: 11 verified and 71 candidate.

### Preservation and validation

- The v0.2.73 built source is an ancestor of this candidate. The installer builder used the exact published v0.2.73 EXE and extracted payload as its preservation baseline.
- Exact installer extraction matches the build output across 2,608 files. The expanded v0.2.73 and v0.2.74 payloads each have 2,910 files: nine changed, none added or removed, and no removed JSON leaves. Mapping, converter, and generated-profile files are unchanged; the 1040 profile remains 82 destinations (11 verified, 71 candidate).
- Packaged dependency, bundled-resource, installer-version, blockmap, updater-metadata, and synthetic updater-window checks passed. Desktop tests passed 382 with zero failures and five CCH-specific skips; 197 ProSeries JavaScript tests, eight offline PowerShell suites, and 13 release-gate tests passed. The initial desktop run had one timing-sensitive test failure that passed standalone and in the serial full rerun. The initial ProSeries JS run lacked an ignored workspace; after creating it, the serial suite passed.
- A live ProSeries import was not run at the user's direction. New-client and multi-copy K-1 behavior remains unverified live. The exact-artifact release gate and production publication are pending in this draft.

### Upgrade steps

- Accept the Windows x64 UpTax update or install the v0.2.74 installer. Review the ProSeries return before filing.

### Known limitations

- The converter does not cover every possible 1040 JSON field. Unmapped facts remain manual items, and candidate mappings require preparer review.
- A live new-client or multi-copy K-1 import was not performed for this corrective build.

## v0.2.73 - 2026-11-04 (Published)

Previous production release: [v0.2.72](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.72).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `e4939708c5cd6b66f7490c2d1f8faf19e365ecb9`, candidate `896ab402f35c8f6bf1bb6647ed18e74556cb6d7f`.

### Added

- Send to ProSeries for 2025 Form 1040 converts supported UpTax JSON inputs into a ProSeries `.25I` return. It finds a saved client by full SSN, updates that return or creates a new one, opens it, runs the guarded Full Calc command, saves, verifies supported inputs and calculated outputs, and reopens it for preparer review.
- The Send dialog reports conversion, client lookup, file writing, opening, calculation, saving, and verification separately. A repeat click safely replaces an earlier UpTax ProSeries job.
- The packaged 1040 profile has 82 destinations: 11 verified and 71 candidate. Candidate writes are marked for preparer review.

### Fixed

- An existing matched client is backed up before mapped inputs are updated. Unnamed fields are preserved; duplicate matches or unreadable client files stop the send.
- The 1040 import no longer retypes written fields on screen to trigger calculation.
- Unexpected nested contact facts in the 1040 JSON are recorded as unmapped items instead of being silently omitted ([source PR #166](https://github.com/uptaxai/uptax-integrations/pull/166)).
- The source release preservation gate can review this large ProSeries diff without hitting its prior 1 MB output limit.

### Changed or removed

- Removed behavior: screen retype in the new ProSeries 1040 route. The eight-second idle guard remains before native ProSeries input.
- ProSeries catalogs for 1120-S, 1120, 1065, and 990 are included as source work, but this release does not enable their public ProSeries imports. No previously supported tax year, return type, or mapping was intentionally removed.
- The Windows installer bundles the UpTax interface and keeps the GitHub update feed. ATX, CCH, Drake, and Lacerte resources from v0.2.72 are retained.

### Preservation and validation

- The published v0.2.72 source is an ancestor of candidate `896ab402f35c8f6bf1bb6647ed18e74556cb6d7f`. The reviewed source diff adds ProSeries converter, mapping catalogs, native import, desktop bridge, tests, packaging, documentation, the contact-census correction, and the release-gate output-limit fix.
- Focused desktop ProSeries tests passed 52/52 as recorded in the source release entry. Packaged-payload comparison, mapping regression, synthetic install/update, broad source tests, and the final release gate must be recorded here from the exact final installer before publication; none is claimed as passed in this draft.

### Upgrade steps

- Accept the Windows x64 UpTax update or install the 0.2.73 installer. Review each ProSeries return before filing.

### Known limitations

- The 82 packaged destinations do not cover every possible 1040 JSON input. Candidate mappings and unmapped inputs need preparer review; an imported return is not automatically ready to e-file.
- Full Calc has saved-output proof for selected wages, withholding, interest, pension or fully taxable IRA, and partnership K-1 cases. Other calculations remain unproved or unresolved; the current installed-app return has not completed end-to-end verification.
- Firm loading has shown a server-side database failure in an installed session. The responsible team is handling it separately; this desktop release does not change the server.

## v0.2.72 - 2026-11-04 (Published)

Previous production release: [v0.2.71](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.71)
Source: https://github.com/uptaxai/uptax-integrations, baseline 830d40c53e8c6507c9e7fb2ba053b62ca4f6d2e9, candidate e4939708c5cd6b66f7490c2d1f8faf19e365ecb9.

### Added

- None.

### Fixed

- CCH 2025 individual imports assign one sequence of activity numbers across partnership, S-corporation, and fiduciary K-1s. Mixed K-1 returns no longer reuse an activity number and fail while updating a later K-1 form.
- If CCH creates a return before rejecting a form, Send tells the preparer to inspect that return in CCH Return Manager before retrying. A partial import no longer triggers an automatic resend solely to fill a spouse SSN.

### Changed or removed

- Removed behavior: None relative to v0.2.71.
- CCH K-1 unit and instance numbering changed for mixed K-1 types. No CCH field binding or mapping key was added or removed. Supported tax years, return types, installer configuration, ATX and Drake work from v0.2.71, and other integrations are preserved.

### Preservation and validation

- The published v0.2.71 source is an ancestor of the candidate. The reviewed source diff changes the CCH writer, Send failure handling, their regression tests, the desktop version, and the source changelog.
- Native CCH synthetic imports and exact-client re-exports retained every submitted value across two partnership K-1s, one S-corporation K-1, and one fiduciary K-1. The desktop suite passed 335 tests without skips, and the CCH Node suite passed 494 tests. Focused CCH source tests passed 123 cases with four existing skips; the published v0.2.71 source passed 116 cases with the same four skips.
- The extracted published v0.2.71 and candidate installers each contain 2,796 payload paths. Twelve reviewed paths changed, none were added or removed, and no JSON mapping leaves were removed. Four ATX bridge files differ only by CRLF versus LF line endings; their normalized contents match. The four CCH profiles and five ATX templates retain their published hashes.
- The initial full repository run stopped after 227 runner suites because C: ran out of space. A retry with free disk passed the focused Lacerte broker/K-1 mutation test and 67 further Lacerte suites before the broad run was stopped after known failures. The native Drake suite still needs licensed Drake 2025; the Drake Online extension drift predates this release and is outside the user-directed desktop scope. A CCH metadata guard failed against older backend producer checkouts, then passed 128 tests with two skips against reviewed backend commit `1a27b874ae41646bdb7adb179c9d064781fab9ea`. All six ATX offline package cases passed, and ProSeries 1120-S source coverage proved 358 of 358 end states. The broad repository run did not pass; the release plan records the scoped validation and remaining limitations.

### Upgrade steps

- Accept the UpTax update or install the new Windows x64 installer.

### Known limitations

- A previous CCH import error may have created a partial return. Inspect it in CCH before retrying; this release does not repair an already partial real-client return.
- CCH fields listed for manual entry still require preparer completion and review. The affected real-client return has not been resent or recalculated with this release. The Windows installer is unsigned.

## v0.2.71 - 2026-11-04 (Published)

Previous production release: [v0.2.70](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.70)
Source: https://github.com/uptaxai/uptax-integrations, baseline 474ac7620bf23ff41c39b86cf0b4f98b9a4c8e95, candidate 830d40c53e8c6507c9e7fb2ba053b62ca4f6d2e9.

### Added

- No new return type or tax year.

### Fixed

- ATX Form 1040 sends include source-backed 1099-G unemployment and dividend payer inputs when the separate source document list omits them.
- Dividend and interest payer worksheets keep Schedule B in the ATX package.
- An existing ATX return send compares saved Schedule 1 unemployment with the UpTax source amount and flags a difference for preparer review.
- ATX can match an existing Form 1065 return by EIN and legal name. Form 1040 review notes group calculated totals and blank or zero inputs.

### Changed or removed

- No supported mapping was intentionally removed. The v0.2.70 Drake changes remain in the source used for this build.

### Preservation and validation

- Desktop tests: 328 passed, 5 skipped. All four ATX offline whole-return suites passed, including existing-return replay. Importer smoke and Windows update checks passed. An attended send verified matching dividend amounts and a repeat update of the same ATX return. A separate unemployment send correctly stopped on a taxpayer ID mismatch before import.
- The broader repository test run was attempted but did not pass because of pre-existing Drake Online drift and backend contract failures. It is not passing evidence for this release.

### Upgrade steps

- Accept the UpTax update or install the Windows x64 installer.

### Known limitations

- A taxpayer ID mismatch requires correction from confirmed records before ATX import. Preparers must review saved forms and calculated amounts before filing. The installer is unsigned.

## v0.2.70 - 2026-11-01 (Published)

Previous production release: [v0.2.69](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.69)
Source: https://github.com/uptaxai/uptax-integrations, baseline 1f466d50d2e973de6063669614a8df27ee3777c3, candidate 474ac7620bf23ff41c39b86cf0b4f98b9a4c8e95.

### Added

- Drake 2025 can import a source-backed Form 1095-A policy when the policy and tax-family facts agree.
- Drake Form 1125-A can carry reconciled, source-described Other costs. A source-labeled purchases amount can fill the verified purchases field.

### Fixed

- If Drake asks for sign-in during client lookup, UpTax tells the preparer and resumes the same send after sign-in. Read-only searches now have a deadline.
- Drake 1120-S identity and Page 1 deductions use verified fields. Unsplit officer pay and wages remain for manual review.
- Form 1098 uses the routed deductible interest and Schedule A tax amounts while retaining the original Box 1 amount separately. A zero deductible share clears an older saved deduction.
- Invalid or ambiguous capital sales, W-2s, 1099-DIV payers, 1099-R payers and shareholder K-1 groups stay out of Drake as complete groups. Independent valid records can still import.
- A readable intact transfer is not refused solely because it is marked not ready or pro forma. A supported pro-forma 1120 import displays the fax-or-mail filing warning.

### Changed or removed

- No supported tax year, return type or previously shipped mapping was removed. ATX, Lacerte, CCH and ProSeries packaged resources retain their v0.2.69 bytes.
- CCH no longer refuses a readable file solely because of a readiness flag; its unsupported 1120 package still stops before import.

### Preservation and validation

- The published v0.2.69 source is an ancestor of the built commit. Both actual installer payloads contain 2,796 paths; 10 reviewed paths changed and none were added or removed.
- The full pinned source run passed 523 suites with no runner failures or skips. The exact built checkout passed 983 native Release tests with no failures or skips. Packaged importer preflights matched v0.2.69, and packaged updater and Drake review window checks passed.
- The isolated Windows harness passed all 32 synthetic scenarios with the same assertions and a longer test wrapper deadline. No live client saved-return calculation has been verified with this installer.
- A separate-account install or upgrade was not repeated because installer and updater inputs are unchanged. The foreground window changed during the extended packaged-DLL harness; that observation does not identify a cause.

### Upgrade steps

- Accept the UpTax update or install the new Windows x64 installer.

### Known limitations

- Preparer review items still require completion and calculation in Drake before filing. UpTax does not infer missing ownership, labor splits or prior-year carryovers.
- Existing uncertain send outcomes must be reconciled in Drake before repeating a file. The affected saved client returns have not been verified with this version.
- This Windows installer is unsigned.

## v0.2.69 - 2026-10-31 (Published)

Previous production release: [v0.2.68](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.68)
Source: https://github.com/uptaxai/uptax-integrations, baseline 5066154128d3174471df0a8e9f9bfe8b833953b0, candidate 1f466d50d2e973de6063669614a8df27ee3777c3.

### Added

- Release verification requires source provenance, installer comparisons, and evidence before publication.

### Fixed

- A saved Drake import finishes even when sign-in or opening the return needs attention. UpTax removes its extra sign-in confirmation and limits the optional opening step to 60 seconds.
- Drake failures before import begins are reported as failures instead of uncertain outcomes. The progress card names Drake and displays saved-return review instructions.
- CCH receives the supported S-corporation K-1 section 179 deduction through the existing verified destination.

### Changed or removed

- Removed behavior: None relative to v0.2.68. ATX and Lacerte retain their published behavior and resources.
- No tax-year or return-type support is removed. The hosted interface and previously shipped private profiles remain in use.

### Preservation and validation

- The baseline installer is tied to source commit 5066154128d3174471df0a8e9f9bfe8b833953b0. Shipped dependency versions and private resource hashes are recorded in the release input manifest.
- All 33 initially failing suites also failed on the published source under the same conditions. Reviewed backend contexts, Python 3.12 and test-only corrections resolve the shared failures. ATX and Lacerte runtime code is unchanged.
- The extracted payload comparison covers 2,796 files: no files or JSON mapping keys removed. All five ATX templates, 101 ATX bridge files, 189 Lacerte bridge files and four CCH profiles match their published hashes. The ATX template README has only a newline-format difference.
- Installer metadata, packaged importer smoke checks and synthetic updater-window checks passed. Thirty synthetic Drake Windows scenarios passed using assemblies whose hashes match this installer.
- All 522 suites passed across the full source run and targeted reruns at validation commit 36fd98790c795653ef76d4eb8159b47ace82a7f4. The initial run had a stale generated test inventory and Windows process failures; the inventory was refreshed and affected suites passed on rerun. This maintenance changes no packaged code or build inputs; the installer remains built from 1f466d50d2e973de6063669614a8df27ee3777c3. Two optional unpublished CCH prototype classes remain unverified.
- The test installation updated from 0.2.68 to 0.2.69 and reopened. Synthetic updater blocking, failure and exit checks passed. Full attended negative-case testing and browser-storage retention after upgrade were not completed.

### Upgrade steps

- Accept the update in UpTax, or install the new Windows x64 installer.

### Known limitations

- Drake may still require its own sign-in after reopening. A saved import does not need to be sent again for that reason.
- Review manual items and reconcile saved returns before filing. A successful import does not establish complete mapping coverage or matching tax calculations.
- The existing Windows packaging is unsigned.
