# Screenshots Needed

This directory contains screenshots and visual assets for the project documentation.

## Required Screenshots

### 1. demo.gif
**Location**: Root of README
**Purpose**: Show the complete workflow in action
**Content**:
- Terminal showing "Get my next request via voice"
- Browser interface auto-starting recording
- User speaking (indicated by recording animation)
- Transcript appearing in terminal
- AI processing the request

**Dimensions**: 800x600px or 1024x768px
**Format**: Animated GIF, max 5MB

---

### 2. browser-interface.png
**Location**: Screenshots section
**Purpose**: Display the browser recording interface
**Content**:
- Full browser window showing `voice-input.html`
- Status display (waiting/recording states)
- Recording controls
- Clean UI with visual feedback

**Dimensions**: 1200x800px
**Format**: PNG

---

### 3. cli-usage.png
**Location**: Screenshots section
**Purpose**: Show terminal integration
**Content**:
- Terminal with MCP client running
- Example of calling `get_voice_input()` tool
- Response showing "Voice input received: [transcript]"
- Preferably with syntax highlighting

**Dimensions**: 1000x600px
**Format**: PNG

---

### 4. architecture-diagram.png
**Location**: Architecture section
**Purpose**: Visual flow diagram
**Content**:
- Component boxes (MCP Client, MCP Server, FastAPI Server, Browser, Whisper)
- Arrows showing data flow
- API endpoints labeled
- Color-coded for clarity

**Tools**: Use draw.io, Excalidraw, or similar
**Dimensions**: 1200x800px
**Format**: PNG

---

## How to Add Screenshots

1. Take or create the screenshots
2. Optimize images:
   ```bash
   # For PNG files
   optipng -o7 screenshot.png

   # For GIF files
   gifsicle -O3 --colors 256 demo.gif -o demo.gif
   ```
3. Place files in this directory
4. Ensure filenames match references in README.md
5. Commit with message: `docs: Add screenshots`

## Style Guide

- **Background**: Use dark terminal theme for consistency
- **Font**: Monospace, 14-16pt for readability
- **Colors**: Keep high contrast for accessibility
- **Annotations**: Add arrows or labels if needed (use red/yellow for highlights)
- **Privacy**: Remove any sensitive information (IPs, API keys, personal data)

## Placeholder Behavior

Until real screenshots are added:
- GitHub will show broken image icons
- This is expected and acceptable during development
- Add screenshots before official release/announcement
