# MCP Hands-Free

Universal hands-free voice input for MCP-compatible AI assistants using Whisper speech-to-text.

## Quick Start

```bash
# Install the package
pip install mcp-hands-free

# Add to your .mcp.json
{
  "mcpServers": {
    "voice-input": {
      "type": "stdio",
      "command": "uvx",
      "args": ["mcp-hands-free"],
      "env": {
        "VOICE_SERVER_URL": "https://your-server:8766"
      }
    }
  }
}
```

## What is This?

This MCP server enables hands-free voice input for any MCP-compatible AI assistant (Claude Code, Gemini, Qwen, etc.). Speak your requests instead of typing them!

Perfect for when:
- 🍕 Your hands are busy (eating, holding a baby, etc.)
- 🏃 You're multitasking (on treadmill, cooking, etc.)
- 🧘 Your wrists need a break (RSI relief)
- 🛋️ You want to chat from across the room

## Features

- **Hands-Free Input** - Speak instead of type
- **Multi-Language** - French, English, Spanish, German, Italian
- **Browser-Based** - No client software needed
- **Auto-Recording** - Browser starts recording automatically
- **Universal** - Works with any MCP-compatible client

## Requirements

You'll also need:

1. **FastAPI Server** - Coordinates voice requests
2. **Whisper Service** - Speech recognition (via Wyoming protocol)
3. **Modern Browser** - For microphone access

See the [full documentation](https://github.com/theagentattic/mcp-hands-free) for complete setup instructions.

## Usage

In your AI agent:

```
You: "Get my next request via voice"
```

The browser automatically starts recording, you speak, and your AI receives the transcript.

## Documentation

- [Full Documentation](https://github.com/theagentattic/mcp-hands-free)
- [Quick Start Guide](https://github.com/theagentattic/mcp-hands-free/blob/main/QUICKSTART.md)
- [Contributing](https://github.com/theagentattic/mcp-hands-free/blob/main/CONTRIBUTING.md)

## License

MIT License - See [LICENSE](https://github.com/theagentattic/mcp-hands-free/blob/main/LICENSE)
