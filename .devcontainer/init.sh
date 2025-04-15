#!/bin/bash

# Try to fetch GitHub username from Codespaces metadata
USER_NAME=$(gh api user --jq .login 2>/dev/null)

# Fallback if GitHub CLI isn't authenticated
if [ -z "$USER_NAME" ]; then
    USER_NAME=${CODESPACE_NAME:-unknown}
fi

# Create a personalized student folder
mkdir -p "student/$USER_NAME"
touch "student/$USER_NAME/main.py"

echo "# Start coding here!" > "student/$USER_NAME/main.py"
