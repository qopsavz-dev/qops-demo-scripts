pwsh -c "QOps-SetUpdateChannel staging; QOps-Update -Force"
if [ -n "$QOPS_LICENSE_KEY" ]; then pwsh -c "QOps-Activate -Value $QOPS_LICENSE_KEY -Force"; fi
