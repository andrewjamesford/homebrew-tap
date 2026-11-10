# PageFlick tools 1.0.0 preview verification

Verified on 2026-11-07 (UTC) on an Apple Silicon Mac running macOS 27.2, Homebrew 7.0.12 and Python 3.15.2.

## Published artifacts

- Tools source/tag commit: `96efba11384828643ebdea928277a46925eeb1d9`.
- Release: https://github.com/andrewjamesford/pageflick-tools/releases/tag/v1.0.0
- Source archive: `pageflick-tools-1.0.0.tar.gz`.
- SHA-256: `8da11256437b1a7c61da6d07527789a318d8770b49d3b8a76ce3791b80637b21`.
- Formula tested from tap commit `9139c51fd5f4f8e9d744ca71f69a782b196cbe7c`; subsequent verification documentation does not change the formula.

The source archive was downloaded without GitHub authentication and its SHA-256 matched the formula and GitHub release asset digest. The public raw formula matched the locally reviewed formula byte-for-byte. The annotated release tag resolves to the source commit above.

## Passed

- Source archive extraction and all nine synthetic CLI/MCP tests.
- Wheel built from extracted release source and installed in a fresh environment outside the checkout.
- Installed-wheel CLI/MCP fixture checks and MIT license/package metadata checks.
- `brew style Formula/pageflick-tools.rb`: no offenses.
- `brew install andrewjamesford/tap/pageflick-tools`: successful installation from the public tap/release.
- `brew test --verbose andrewjamesford/tap/pageflick-tools`: version, synthetic pairing, `0600` connection-file permissions, and five-tool MCP discovery.
- `brew audit --strict --online andrewjamesford/tap/pageflick-tools`: exited successfully.
- Installed command reports `PageFlick local tools 1.0.0` and uses `/opt/homebrew/opt/python@3.15/bin/python3.15`.

The initial extraction additionally passed the nine-test suite on Python 3.13 and 3.14. No test CI workflow was added; a GitHub dependency-graph update is not test CI.

## Limits

This is a preview. The public App Store listing checked on the verification date reports PageFlick 1.0. Its compatibility has not been verified. An app build exposing the local API setting is required; the companion does not add that setting or upgrade the app.

Tests used synthetic data only. They did not pair the user's actual app, read the real library, modify MCP client settings or publish an app update. PageFlick's app source remains private and separately licensed. No signed standalone binary or installer is included.
