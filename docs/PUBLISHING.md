# Publishing Guide

This guide explains how to publish the MCP Hands-Free package to PyPI.

## Prerequisites

1. **PyPI Account**: Create accounts on both:
   - Test PyPI: https://test.pypi.org/account/register/
   - Production PyPI: https://pypi.org/account/register/

2. **API Tokens**: Generate API tokens:
   - Test PyPI: https://test.pypi.org/manage/account/token/
   - Production PyPI: https://pypi.org/manage/account/token/

3. **GitHub Secrets**: Add tokens to repository secrets:
   - `TEST_PYPI_API_TOKEN` - For test publishing
   - `PYPI_API_TOKEN` - For production publishing

## Manual Publishing

### 1. Update Version

Edit `mcp-server/pyproject.toml`:
```toml
version = "0.1.1"  # Increment version
```

### 2. Update Changelog

Edit `CHANGELOG.md`:
```markdown
## [0.1.1] - 2024-01-15

### Added
- New feature description

### Fixed
- Bug fix description
```

### 3. Build Package

```bash
cd mcp-server

# Install build tools
pip install build twine

# Build distribution
python -m build

# This creates:
# - dist/mcp_hands_free-0.1.1-py3-none-any.whl
# - dist/mcp-hands-free-0.1.1.tar.gz
```

### 4. Check Package

```bash
# Verify package metadata
twine check dist/*

# Should output: PASSED
```

### 5. Test on Test PyPI

```bash
# Upload to Test PyPI
twine upload --repository testpypi dist/*

# Enter your Test PyPI credentials when prompted
# Or use API token:
# Username: __token__
# Password: pypi-... (your token)

# Test installation
pip install --index-url https://test.pypi.org/simple/ mcp-hands-free

# Test the package works
mcp-hands-free --help
```

### 6. Publish to Production PyPI

```bash
# Upload to production PyPI
twine upload dist/*

# Enter your PyPI credentials or API token

# Verify installation
pip install mcp-hands-free
```

## Automated Publishing via GitHub Actions

### Test PyPI (Manual Trigger)

1. Go to Actions tab in GitHub
2. Select "Publish to PyPI" workflow
3. Click "Run workflow"
4. Select branch (usually `main`)
5. Enable "Publish to Test PyPI"
6. Click "Run workflow"

### Production PyPI (On Release)

1. Create a new release on GitHub:
   ```bash
   git tag -a v0.1.1 -m "Release v0.1.1"
   git push origin v0.1.1
   ```

2. Go to GitHub → Releases → Draft a new release
3. Choose the tag `v0.1.1`
4. Title: `v0.1.1`
5. Description: Copy from CHANGELOG.md
6. Click "Publish release"

7. GitHub Actions automatically:
   - Builds the package
   - Runs tests
   - Publishes to PyPI

## Version Numbering

Follow [Semantic Versioning](https://semver.org/):

- `MAJOR.MINOR.PATCH` (e.g., `1.2.3`)
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

Examples:
- `0.1.0` → `0.1.1` - Bug fix
- `0.1.1` → `0.2.0` - New feature
- `0.9.0` → `1.0.0` - First stable release
- `1.0.0` → `2.0.0` - Breaking changes

## Pre-release Versions

For beta/alpha releases:
```toml
version = "0.2.0a1"  # Alpha 1
version = "0.2.0b1"  # Beta 1
version = "0.2.0rc1" # Release candidate 1
```

Install pre-releases:
```bash
pip install --pre mcp-hands-free
```

## Checklist Before Publishing

- [ ] All tests pass (`pytest`)
- [ ] Code is formatted (`black .`)
- [ ] Linting passes (`ruff check .`)
- [ ] Version number incremented in `pyproject.toml`
- [ ] CHANGELOG.md updated
- [ ] README.md is accurate
- [ ] Documentation is up-to-date
- [ ] Dependencies are correct
- [ ] Package builds without errors
- [ ] Test installation from Test PyPI works
- [ ] Git tag created and pushed

## Troubleshooting

### "File already exists" error

You cannot overwrite a version on PyPI. Increment the version number and rebuild.

### Import errors after installation

Check that:
- `pyproject.toml` has correct `packages` configuration
- `__init__.py` files exist in all package directories
- Module names match import statements

### Missing dependencies

Add all runtime dependencies to `pyproject.toml`:
```toml
dependencies = [
    "mcp>=1.1.0",
    "httpx>=0.27.0",
]
```

### Package too large

Check `.dockerignore` doesn't include necessary files.
Use `MANIFEST.in` to explicitly include/exclude files.

## Resources

- [Python Packaging Guide](https://packaging.python.org/)
- [PyPI Help](https://pypi.org/help/)
- [Twine Documentation](https://twine.readthedocs.io/)
- [Semantic Versioning](https://semver.org/)
