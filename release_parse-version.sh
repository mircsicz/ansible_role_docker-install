#!/bin/bash

LOGFILE="dryrun.log"

if [[ ! -f "$LOGFILE" ]]; then
  echo "❌ File $LOGFILE not found. Run ./release.sh --dry-run first."
  exit 1
fi

# Try to extract version using semantic-release log pattern
VERSION=$(grep -Eo "The next release version is [v0-9]+\.[0-9]+\.[0-9]+" "$LOGFILE" | tail -1 | awk '{ print $6 }')

if [[ -n "$VERSION" ]]; then
  echo "✅ Next release version would be: $VERSION"
else
  echo "⚠️ Could not determine next version from $LOGFILE"
fi
