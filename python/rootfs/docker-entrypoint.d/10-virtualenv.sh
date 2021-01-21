#!/bin/sh
set -e

if [ -n "$VIRTUAL_ENV" ] && [ -f "$VIRTUAL_ENV/bin/activate" ]; then
  source "$VIRTUAL_ENV/bin/activate"
elif [ -n "$VENV_PATH" ] && [ -f "$VENV_PATH/bin/activate" ]; then
  source "$VENV_PATH/bin/activate"
fi
