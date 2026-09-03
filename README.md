# santi-ug/homebrew-tap

Homebrew casks for my macOS utilities.

## Usage

Installing by full name taps this repository automatically:

```bash
brew install --cask santi-ug/tap/<name>
```

## Available

| Cask | Description |
|---|---|
| [`cvtex`](https://github.com/santi-ug/CvTeX) | Tailors a LaTeX resume to a job posting and keeps it to one page |
| [`void`](https://github.com/santi-ug/void) | Blanks the display and locks the keyboard for screen cleaning |

## Adding a cask

Casks live in `Casks/`. Version and checksum must match the published release
artifact exactly or installation fails on the checksum — `scripts/release.sh` in
each project rewrites both from the artifact it just built (void's DMG,
CvTeX's zip via `scripts/release.sh publish`).

## Copyright

© 2026 Santiago Uribe. All rights reserved.
