# nandu-org Homebrew tap

Official Homebrew tap for [Nandu](https://nandu.ai) command-line tools.

## Install

```bash
brew install nandu-org/tap/ndf
```

That's it. Then run `ndf login` to set your tokens.

## Available formulae

| Formula | Description |
|---|---|
| `ndf` | Nandu Development Framework CLI — see [nandu-dev-framework-cli](https://github.com/nandu-org/nandu-dev-framework-cli) |

## Updating

When a new ndf release ships, this tap is updated automatically by the release
workflow in [nandu-dev-framework-cli](https://github.com/nandu-org/nandu-dev-framework-cli)
on tag push. Manual bump:

```bash
cd Formula
# Edit ndf.rb: bump `version`, replace each sha256 with values from
# https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/<tag>/checksums.txt
```
