# ColeMei Openwith

Homebrew tap for [openwith](https://github.com/ColeMei/openwith) — manage macOS "Open With" defaults.

Two packages, one engine:

| Package | What you get | Install |
|---|---|---|
| `openwith` (formula) | The `openwith` CLI + interactive TUI | `brew install colemei/openwith/openwith` |
| `openwith-gui` (cask) | OpenWith.app — native GUI with menu-bar popover | `brew install --cask colemei/openwith/openwith-gui` |

Install either or both — they share the same core and change history.

> The cask was named `openwith` before v0.5.2. If you installed it under the old
> name: `brew uninstall --cask openwith && brew install --cask colemei/openwith/openwith-gui`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "colemei/openwith"
brew "openwith"
cask "openwith-gui"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
