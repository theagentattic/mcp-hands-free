# Dockerfile for MCP Hands-Free FastAPI Server
FROM python:3.11-slim

LABEL org.opencontainers.image.title="MCP Hands-Free Server"
LABEL org.opencontainers.image.description="FastAPI server for MCP hands-free voice input"
LABEL org.opencontainers.image.source="https://github.com/theagentattic/mcp-hands-free"
LABEL org.opencontainers.image.licenses="MIT"

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY server.py .
COPY static/ ./static/

# Create temp directory
RUN mkdir -p /tmp/mcp-hands-free

# Expose port
EXPOSE 8766

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV WHISPER_HOST=whisper
ENV WHISPER_PORT=10300

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8766/health')"

# Run server
CMD ["python", "server.py"]
