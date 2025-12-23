# Contributing to MCP Hands-Free

Thank you for your interest in contributing to MCP Hands-Free! This document provides guidelines and instructions for contributing.

## Code of Conduct

Be respectful, inclusive, and professional. We're all here to build something useful together.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title** describing the issue
- **Steps to reproduce** the problem
- **Expected vs actual behavior**
- **Environment details** (OS, Python version, MCP client, browser)
- **Logs and screenshots** if applicable

Use the bug report template when creating issues.

### Suggesting Features

Feature suggestions are welcome! Please:

- Check if the feature has already been suggested
- Clearly describe the use case and benefits
- Consider implementation complexity
- Use the feature request template

### Pull Requests

1. **Fork the repository** and create a branch from `main`
2. **Make your changes** following our coding standards
3. **Add tests** for new functionality
4. **Update documentation** as needed
5. **Run tests** to ensure everything passes
6. **Submit a pull request** with a clear description

## Development Setup

### Prerequisites

- Python 3.11 or higher
- Docker (for Whisper service)
- Git

### Initial Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/mcp-hands-free.git
cd mcp-hands-free

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Install MCP server in editable mode
cd mcp-server
pip install -e .
cd ..

# Start Whisper service
docker run -d \
  --name whisper \
  -p 10300:10300 \
  rhasspy/wyoming-faster-whisper \
  --model base \
  --language en
```

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=. --cov-report=term-missing

# Run specific test file
pytest tests/test_api.py

# Run specific test
pytest tests/test_api.py::TestHealthEndpoint::test_health_check
```

### Code Style

We use automated formatting and linting:

```bash
# Format code with black
black .

# Lint with ruff
ruff check .

# Type check with mypy
mypy server.py mcp-server/src/ --ignore-missing-imports
```

**Before submitting a PR:**
```bash
# Run all checks
black .
ruff check .
pytest --cov=.
```

## Coding Standards

### Python Style

- Follow PEP 8 style guide
- Use type hints for function signatures
- Write docstrings for classes and functions
- Keep functions focused and under 50 lines when possible
- Use meaningful variable names

### Example

```python
async def transcribe_audio(audio_path: Path, language: str = "en") -> str:
    """
    Transcribe audio file to text using Whisper.

    Args:
        audio_path: Path to WAV audio file
        language: Language code for transcription (default: en)

    Returns:
        Transcribed text

    Raises:
        TimeoutError: If transcription times out
        Exception: On other errors
    """
    # Implementation
    pass
```

### Git Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Start with a type: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `chore:`
- Keep first line under 72 characters
- Reference issues and PRs liberally

**Examples:**
```
feat: Add support for Spanish language transcription
fix: Resolve timeout issue in voice request polling
docs: Update installation instructions for Windows
test: Add integration tests for MCP server
refactor: Simplify audio processing pipeline
chore: Update dependencies to latest versions
```

### Branch Naming

- `feature/description` - New features
- `fix/description` - Bug fixes
- `docs/description` - Documentation updates
- `test/description` - Test improvements

## Project Structure

```
mcp-hands-free/
├── mcp-server/              # MCP server package
│   ├── src/
│   │   └── claude_voice_mcp/
│   │       ├── __init__.py
│   │       ├── server.py    # MCP tool definitions
│   │       └── client.py    # HTTP client
│   ├── tests/               # MCP server tests
│   └── pyproject.toml
├── tests/                   # FastAPI server tests
├── static/                  # Browser interface files
├── server.py                # FastAPI coordination server
├── requirements.txt         # Production dependencies
├── requirements-dev.txt     # Development dependencies
└── docs/                    # Documentation
```

## Testing Guidelines

### Writing Tests

- Write tests for all new functionality
- Use descriptive test names: `test_<what>_<scenario>_<expected>`
- Group related tests in classes
- Use fixtures for common setup
- Mock external dependencies (Whisper, HTTP clients)

### Test Categories

1. **Unit Tests**: Test individual functions and classes
2. **Integration Tests**: Test component interactions
3. **API Tests**: Test FastAPI endpoints

### Example Test

```python
@pytest.mark.asyncio
async def test_get_voice_input_success(self, voice_client):
    """Test successful voice input retrieval."""
    # Arrange
    mock_response = MagicMock()
    mock_response.json.return_value = {"request_id": "test-123"}
    voice_client.client.post = AsyncMock(return_value=mock_response)

    # Act
    result = await voice_client.get_voice_input(language="en")

    # Assert
    assert result == "expected transcript"
    voice_client.client.post.assert_called_once()
```

## Documentation

### Update Documentation When

- Adding new features
- Changing APIs or configuration
- Fixing bugs that affect usage
- Adding new dependencies

### Documentation Files

- `README.md` - Main project documentation
- `QUICKSTART.md` - Quick start guide
- `CONTRIBUTING.md` - This file
- Code docstrings - Inline documentation
- `docs/` - Additional documentation

## Release Process

Maintainers handle releases:

1. Update version in `mcp-server/pyproject.toml`
2. Update CHANGELOG.md
3. Create release tag: `git tag -a v1.2.0 -m "Release 1.2.0"`
4. Push tag: `git push origin v1.2.0`
5. GitHub Actions automatically publishes to PyPI

## Getting Help

- **Issues**: Open an issue for bugs or questions
- **Discussions**: Use GitHub Discussions for general questions
- **Pull Requests**: Ask questions in PR comments

## Recognition

Contributors will be recognized in:
- GitHub contributors page
- Release notes
- Project documentation

Thank you for contributing to MCP Hands-Free!
