# Andrew Ford's Homebrew tap

Homebrew formulae for Andrew Ford's tools.

## PageFlick tools preview

```sh
brew install andrewjamesford/tap/pageflick-tools
pageflick --version
```

This installs the optional CLI and stdio MCP companion, not the PageFlick app. The formula targets Apple Silicon Macs running macOS 27 or newer and installs Homebrew Python 3.15. No runtime PyPI packages are needed.

**Compatibility preview:** an API-enabled PageFlick Mac build is required. Version 1.1.0 adds CLI `recap`/`summary` and MCP `book_recap`/`book_summary`. These need the newer book-context endpoint and separate **Allow book text for summaries** opt-in. The native API implementation has been tested in PageFlick 2.0 development builds; a compatible released Mac App Store binary remains unverified. These tools do not upgrade the app or add its local API.

Enable the API, copy the connection details and pair:

```sh
pageflick pair --clipboard
pageflick stats --period week
```

Keep PageFlick open. Current API-enabled app source preserves pairing across ordinary restarts. Re-pair with `pageflick pair --clipboard --replace` after resetting or replacing the saved connection, or if an older app build changes its key or port. Restart your MCP client/server after upgrading the companion. Configure only trusted MCP clients, because reading metadata and history can be shared with that client.

- [Tools, setup and privacy notes](https://github.com/andrewjamesford/pageflick-tools)
- [Preview release and archive](https://github.com/andrewjamesford/pageflick-tools/releases/tag/v1.1.0)
- [Companion's MIT license](https://github.com/andrewjamesford/pageflick-tools/blob/main/LICENSE)

The formula's license field describes the packaged companion. It does not change the separately distributed PageFlick app's license.

## Update or remove

```sh
brew update
brew upgrade pageflick-tools
brew uninstall pageflick-tools
```

Uninstalling the tools leaves the PageFlick app, library and pairing file alone. Disable the app's API or rotate its key to revoke local access.

## Maintain

Update the formula's immutable release URL and SHA-256 together. Never use an unversioned moving branch as the stable source. Installation must not access pairing secrets or the user's app library.

```sh
brew style Formula/pageflick-tools.rb
brew audit --strict --online andrewjamesford/tap/pageflick-tools
brew test andrewjamesford/tap/pageflick-tools
```

The formula test uses a synthetic connection file and offline MCP discovery. It does not query the user's real app data. Live app compatibility must be verified separately.

## Verification

See [the current preview verification record](VERIFICATION.md) for the archive checksum, installed-package checks, Homebrew audit results and remaining app-compatibility limits.
