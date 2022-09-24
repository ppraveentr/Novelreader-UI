#!/bin/bash
GIT_DIR=$(git rev-parse --git-dir)
echo "Installing hooks…"
ln -s ../../scripts/pre-push.bash $GIT_DIR/hooks/pre-push.bash
echo “Done!”
