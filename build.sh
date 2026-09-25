#!/usr/bin/env bash
# Build the deployable Galaxer site into ./dist.
#
# dist/ is the webroot for BOTH hosting targets and is byte-identical between them:
#   - GitHub Pages : the deploy workflow runs this, then uploads ./dist
#   - november     : ./build.sh && rsync -a --delete dist/ november:/mnt/tank1/apps/galaxer-web/
#
# Only shipped files are copied here — source lives at the repo root and old/archived
# media under assets/archive/ is intentionally left out of the webroot.
set -euo pipefail
cd "$(dirname "$0")"

rm -rf dist
mkdir -p dist/assets
cp index.html dist/
cp -R assets/img dist/assets/img

echo "Built dist/ ($(find dist -type f | wc -l | tr -d ' ') files, $(du -sh dist | cut -f1))"
