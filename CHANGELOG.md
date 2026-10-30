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
