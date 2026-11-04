## v0.2.76 - 2026-11-05 (Draft)

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
- At the user's request for an urgent build, optional source tests and live ProSeries verification were skipped. Package-required build checks and actual installer/payload comparison results will be recorded after the EXE is built. No skipped check is presented as a pass.

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
