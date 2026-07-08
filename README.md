# homebrew-tap

Homebrew formulae for [tylerbre](https://github.com/tylerbre)'s tools.

## Usage

```sh
brew install tylerbre/tap/slot-machine
```

`brew tap tylerbre/tap` is implied by the fully-qualified name above (Homebrew maps it to
this repo, `tylerbre/homebrew-tap`).

## Formulae

- **slot-machine** - orchestrate tmux + git worktrees for Claude agent fleets (CLI `sm` +
  MCP server). Source: https://github.com/tylerbre/slot-machine

## Releasing a formula

Each formula points at a GitHub release tarball of its source repo. To cut/refresh one:

1. In the source repo: `npm run pack` -> `slot-machine-vX.Y.Z.tar.gz` (tracked files at HEAD)
2. Attach it to that repo's `vX.Y.Z` GitHub release
3. Update the formula's `url` (version) and `sha256` (`shasum -a 256 slot-machine-vX.Y.Z.tar.gz`)
