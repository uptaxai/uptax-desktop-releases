## v0.2.79 - 2026-11-17 (Draft; publication blocked)

Previous production: [v0.2.78](https://github.com/uptaxai/uptax-desktop-releases/releases/tag/v0.2.78).
Source: [uptaxai/uptax-integrations](https://github.com/uptaxai/uptax-integrations), baseline `8e962065b039b1039dd1fbd41ff787f4a7986ca5`, actual built candidate `e862db0befbbefc4679fdae72826233e8d36a646`. Exact frontend backport `8fde036ea584439158436f9b23727311a6ce62a9` includes the stalled-reporter fix from PR #38; it is retained in that PR's ancestry.

### Added

- Drake 2025 individual W-2/W2PR coverage, sparse W-2c correction, and bounded failure reports through the authenticated desktop session, as described in the historical candidate notes below.
- Draft-only Windows QA installs the actual published v0.2.78, upgrades the same directory using the frozen candidate, compares installed files, checks login rendering, and uninstalls on a disposable runner.

### Fixed

- Errors after importer process startup preserve the unknown import outcome. Prepared merged returns retain verification proof before registration resets it.
- A stalled optional diagnostic report no longer prevents the confirmed no-dispatch timeout result from appearing or the busy state from clearing.
- The preserved-payload build recipe now includes the reviewed importer-process runtime overlay and the exact corrected shipped-UI backport.

### Changed or removed

- Both independently extracted installers contain 2,697 physical files. Sixteen explained payload differences replace the generated frontend main asset, update desktop outcome/reporting code and native importer binaries, and record version/provenance. No JSON leaves were removed. Other frontend assets and bridge resources match v0.2.78.
- No public update channel was promoted. The old f607951d installer and its results below are superseded historical evidence only.

### Preservation and validation

- Candidate EXE: 185,489,548 bytes, SHA-256 `fe0eb6b43cf35dea2aed22a86ea4b3f953a451414960b9c5ee2a326879d8b11d`.
- Blockmap: 194,334 bytes, SHA-256 `fbc84d3f3cfca2bfe155a32baf3714e9fafea20d88594985b508e47e0d0a5d32`.
- latest.yml: 342 bytes, SHA-256 `dc40fb765a2b2390e2e275518e956adefd31b487fd59c237e1388d436d87b7b4`.
- Exact candidate packaging, updater metadata, x64 checks and 17 runtime dependency checks passed. Frozen manifest SHA-256: `79e41956b73b3d18c964cefc62c331f6082afb7be9a58a507effc67f7748537a`. Its pending install status records build time; the subsequent independent Windows report is authoritative for QA.
- [Windows QA run 44098195399](https://github.com/uptaxai/uptax-desktop-releases/actions/runs/44098195399) passed: 2,697 baseline and upgraded installed files matched, version 0.2.79.0/x64 verified, login rendered, uninstall completed. The earlier run failed at draft asset access before installation; workflow token permissions were corrected.
- Native importer tests: 1,103 passed. Shipped-UI backport: 2,295 passed, one skipped. Current frontend PR #38: 2,546 Node tests passed, one skipped; Vitest 455 passed, 21 skipped; forced TypeScript and focused timeout browser passed.
- The broader repository run remained non-green: 513 top-level checks passed, 123 failed, one ATX-offline suite skipped. Missing licensed Lacerte sheets account for most failures. Current producer probes were subsequently repaired and passed five checks with two unavailable historical-checkout cases skipped; that focused pass does not clear the full gate. Later validation-only source commits do not change the binary's built-source identity.

### Upgrade steps

- None for users while draft. Before publication, resolve and rerun the full source gate, reconcile the current production baseline, and run the source release verifier against the exact frozen assets. Preserve the tested bytes; a rebuild requires new validation and hashes.
- Production Telegram delivery still requires independently verified backend deployment, migrations, bot settings and worker state.

### Known limitations

- Publication remains blocked by the non-green source gate. Windows package QA does not establish complete tax reconciliation, live production Send, or production bot delivery.
- The frozen-plan verifier was run after QA and rejected publication with `Missing passing evidence: source-tests`; asset hashes, production baseline and payload comparison were checked before that failure.
- Retained K1PA screens 406–414 in separate importer PR #233 lack a supported ordinary UI route and remain unverified; this candidate does not certify that separate feature.
- Draft assets are not a published release. The public production channel remains v0.2.78.
