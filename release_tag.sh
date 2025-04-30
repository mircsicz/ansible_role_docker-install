#!/bin/bash

# Config
LOGFILE="dryrun.log"

# Step 1: Check log file
if [[ ! -f "$LOGFILE" ]]; then
  echo "❌ $LOGFILE not found. Please run ./release.sh --dry-run first."
  exit 1
fi

# Step 2: Extract version
VERSION=$(grep -Eo "The next release version is [v0-9]+\.[0-9]+\.[0-9]+" "$LOGFILE" | tail -1 | awk '{ print $6 }')

if [[ -z "$VERSION" ]]; then
  echo "⚠️ Could not find a valid version in $LOGFILE"
  exit 1
fi

# Step 3: Confirm
echo "🔖 Next version to tag: $VERSION"
read -p "👉 Create and push Git tag '$VERSION'? [y/N]: " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  git tag "$VERSION"
  git push origin "$VERSION"
  echo "✅ Git tag '$VERSION' created and pushed!"
else
  echo "❌ Aborted. No tag was created."
fi
