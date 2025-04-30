#!/bin/bash

# Load .env variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "❌ .env file not found. Please create one with GITHUB_TOKEN=..."
  exit 1
fi

# Check token
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ GITHUB_TOKEN is not set. Check your .env file."
  exit 1
fi

# Dry-run logic
if [[ "$1" == "--dry-run" ]]; then
  echo "🔍 Running semantic-release in dry-run mode..."
  echo "📄 Output will be written to dryrun.log"
  npx semantic-release --dry-run | tee dryrun.log
else
  echo "🚀 Running semantic-release (real mode)..."
  npx semantic-release
fi
