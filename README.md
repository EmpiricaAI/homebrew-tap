# Homebrew Tap for Empirica

Official Homebrew tap for [Empirica](https://github.com/EmpiricaAI/empirica) — epistemic self-assessment framework for AI agents.

## Installation

```bash
brew tap empiricaai/tap
brew install empirica
```

## Verify Installation

```bash
empirica --version
```

## Documentation

See the [main repository](https://github.com/EmpiricaAI/empirica) for documentation and usage guides.

## Links

- **PyPI**: https://pypi.org/project/empirica/
- **GitHub**: https://github.com/EmpiricaAI/empirica
- **Docker Hub**: https://hub.docker.com/r/nubaeon/empirica

## Layout

Formulae live in `Formula/`. This is not cosmetic: Homebrew resolves a
third-party tap by taking the first existing entry of
`[Formula, HomebrewFormula, .]`, so once `Formula/` exists a formula placed at
the repo root is never read. Add new formulae to `Formula/` only.
