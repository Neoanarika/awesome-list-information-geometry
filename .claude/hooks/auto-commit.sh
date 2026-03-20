#!/bin/bash
INPUT=$(cat)

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path')

# Only trigger for readme.md
if [[ "$FILE_PATH" != *"readme.md" ]]; then
  exit 0
fi

cd "$(dirname "$FILE_PATH")" || exit 0

git add readme.md
git commit -m "Update readme.md" 2>/dev/null || exit 0
git push
