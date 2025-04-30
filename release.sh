#!/bin/bash

# Load token from .env file (must be in .gitignore!)
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "❌ .env file not found. Please create one with GITHUB_TOKEN=..."
  exit 1
fi

# Check that token exists
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ GITHUB_TOKEN is not set. Check your .env file."
  exit 1
fi

echo "🚀 Running semantic-release..."
npx semantic-release
