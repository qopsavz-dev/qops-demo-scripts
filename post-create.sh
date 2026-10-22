#!/usr/bin/env bash
exec > >(tee -a /workspaces/qops-postcreate.log) 2>&1
set -x
echo "postCreate: $(date -u) user=$(whoami) HOME=$HOME XDG_DATA_HOME=${XDG_DATA_HOME:-}"
pwsh -NoProfile -c 'QOps-SetUpdateChannel staging -PassThru | Format-List; QOps-Update -Force; QOps-Version'
if [ -n "$QOPS_LICENSE_KEY" ]; then pwsh -NoProfile -c "QOps-Activate -Value \$env:QOPS_LICENSE_KEY -Force"; fi
echo "postCreate: done rc=$?"
