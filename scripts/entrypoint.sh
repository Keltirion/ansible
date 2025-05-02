#!/bin/bash
# Activate venv if it exists
if [ -f "/opt/ansible-venv/bin/activate" ]; then
  source /opt/ansible-venv/bin/activate
fi
# Run the command passed to the entrypoint (or the default CMD)
exec "$@"
