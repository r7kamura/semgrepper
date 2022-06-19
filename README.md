# semgrep-action

[Custom action](https://docs.github.com/en//actions/creating-actions/about-custom-actions)
to run [Semgrep](https://github.com/returntocorp/semgrep) on GitHub Actions.

This action runs `semgrep ci` and output results by GitHub Annotations.

## Usage

```yaml
# .github/workflows/semgrep.yml
name: semgrep

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - uses: r7kamura/semgrep-action@v0
```

## Inputs

### `config`

- `--config` option value for `semgrep ci`.
- optional
- default: `.semgrep`
