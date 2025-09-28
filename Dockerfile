# ---------------------------
# Stage 1 - Builder
# ---------------------------
FROM python:3.11-slim AS builder

WORKDIR /app

# Install build dependencies (for compiling C extensions if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy dependencies list
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
