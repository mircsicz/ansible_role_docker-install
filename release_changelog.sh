#!/bin/bash

# Check for conventional-changelog-cli
if ! command -v conventional-changelog &> /dev/null; then
  echo "⚠️ 'conventional-changelog' is not installed."
  read -p "👉 Do you want to install it globally via npm? [y/N]: " install

  if [[ "$install" =~ ^[Yy]$ ]]; then
    npm install -g conventional-changelog-cli
    if [[ $? -ne 0 ]]; then
      echo "❌ Failed to install conventional-changelog-cli. Aborting."
      exit 1
    fi
    echo "✅ Installed conventional-changelog-cli."
  else
    echo "❌ Cannot generate changelog without 'conventional-changelog-cli'. Exiting."
    exit 1
  fi
fi

# Generate changelog (append mode, all tags)
echo "📝 Generating/updating CHANGELOG.md..."
conventional-changelog -p angular -i CHANGELOG.md -s -r 0

if [[ $? -eq 0 ]]; then
  echo "✅ CHANGELOG.md successfully updated."
else
  echo "❌ Error occurred while generating changelog."
  exit 1
fi
