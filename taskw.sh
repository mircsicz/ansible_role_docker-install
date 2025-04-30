#!/bin/bash

# Wrapper for Taskfile + optional local extension
MAIN_FILE="taskfile.yml"
LOCAL_FILE="taskfile.local.yml"

if [ -f "$LOCAL_FILE" ]; then
  task --taskfile "$MAIN_FILE" --taskfile "$LOCAL_FILE" "$@"
else
  task --taskfile "$MAIN_FILE" "$@"
fi
