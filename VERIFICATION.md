# PageFlick tools 1.1.0 preview verification

Verified on 2026-11-10 UTC on an Apple Silicon Mac running macOS 27.2, Homebrew 7.0.12 and Python 3.15.2.

## Release artifacts

- Source/tag commit: `f048e42431d10a351a687d1b5ef412c7ed720fff`.
- Release: https://github.com/andrewjamesford/pageflick-tools/releases/tag/v1.1.0
- Archive: `pageflick-tools-1.1.0.tar.gz`.
- SHA-256: `f16a55e2e6e94b766f7b54fbc566abec963210faa9256bc4cda9af721d4e1708`.

The annotated `v1.1.0` tag resolves to the source commit above. The public release archive was downloaded without GitHub authentication and matched the reviewed archive byte-for-byte, its SHA-256, the formula and GitHub's asset digest.

## Passed

- All 14 synthetic CLI/MCP tests on Python 3.13, 3.14 and 3.15.
- Exact release-archive extraction, Python compilation and CLI version/help checks.
- A wheel built from the extracted release and installed into a fresh environment outside the checkout passed all 14 tests.
- Wheel contents and metadata checks: companion script, MIT license, correct version, no runtime Python package dependencies, secrets, app source or library data.
- Fresh companion installation from the public archive using the final formula in a separate Homebrew prefix.
- `brew test --verbose`: version, recap/summary help, synthetic pairing, private `0600` connection file, MCP server version and all seven tools.
- All 14 tests run again against the actual Homebrew-installed command, including recap/summary CLI subprocesses, both MCP protocols, pagination, consent/compatibility errors, cancellation and private exports.
- `brew style`: no offenses.
- `brew audit --strict --online`: passed. Homebrew's rubocop-md dependency emitted an obsolete-configuration warning, not a formula offense.

## Scope and limits

The isolated Homebrew prefix used copies of existing runtime dependencies; this validates a fresh companion install, not a clean-machine Python/dependency bootstrap. The normal installed companion and pairing configuration were left unchanged. Synthetic tests did not read a real library or enable book-text access.

The 1.1.0 runtime matches tested recap/summary companion commit `359f72e462b5dbef160e8b4e91d76d6397ff13db` except for its version number. Its native Swift API integration was previously verified in PageFlick 2.0 development builds, including separate text opt-in, restart persistence, revocation and key rotation. A compatible released Mac App Store binary remains unverified. The companion cannot add the required endpoint or consent setting to an older app.

Recap and summary require the newer book-context endpoint and **Allow book text for summaries**, which is off by default and grants all paired clients access to book text. Recaps omit the entire current saved reading resource; whole-book summaries can include ending spoilers. The CLI returns source context or a prompt, not generated prose.

No app distribution, account permission changes, model calls or test CI workflow were included. Python 3.9–3.12 were not available for this verification.

The [1.0.0 verification record](VERIFICATION-1.0.0.md) is retained as historical evidence.
