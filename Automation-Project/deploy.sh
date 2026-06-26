#!/bin/bash

APP="myapp"
APP_DIR="/tmp/myapp"
BACKUP_DIR="/tmp/backup_myapp"
LOGFILE="deployment.log"
DRY_RUN=false
MAX_RETRIES=3
USER=$(whoami)
START_TIME=$(date +%s)

log() {
  echo "$(date '+%H:%M:%S') | $1" | tee -a $LOGFILE
}

# DRY RUN MODE
if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  log "Running in DRY RUN mode"
fi

log "Deployment started by $USER"

# ✅ Idempotency Check
if [ -f "$APP_DIR/deployed.flag" ]; then
  log "Deployment already completed. Nothing to do ✅"
  exit 0
fi

# ✅ Check if app running (simulate)
if pgrep -f $APP > /dev/null; then
  log "Application is running ❌ - stopping deployment"
  exit 1
fi

# ✅ Dry Run Preview
if [ "$DRY_RUN" = true ]; then
  log "Preview:"
  log "Would take backup"
  log "Would deploy new version"
  log "Would restart app"
  exit 0
fi

# ✅ Backup
log "Taking backup..."
mkdir -p $BACKUP_DIR
cp -r $APP_DIR/* $BACKUP_DIR 2>/dev/null

if [ $? -ne 0 ]; then
  log "Backup failed ❌"
  exit 1
fi

# ✅ Deploy
log "Deploying new version..."
echo "version2" > $APP_DIR/app.txt || { log "Deployment failed ❌"; exit 1; }

# ✅ Restart App (simulate)
log "Restarting application..."
sleep 1

# ✅ Health Check with Retry
SUCCESS=false

for i in $(seq 1 $MAX_RETRIES)
do
  log "Health check attempt $i..."

  curl -s http://localhost:8080 > /dev/null

  if [ $? -eq 0 ]; then
    log "Health check passed ✅"
    SUCCESS=true
    break
  else
    log "Health check failed ❌"
    sleep $((2**i))
  fi
done

# ✅ If Failed → Rollback
if [ "$SUCCESS" = false ]; then
  log "Deployment failed after retries. Starting rollback..."

  rm -rf $APP_DIR/*
  cp -r $BACKUP_DIR/* $APP_DIR

  log "Rollback completed ✅"

  echo "Deployment Failed & Rolled Back"
  exit 1
fi

# ✅ Mark as deployed (Idempotency)
touch $APP_DIR/deployed.flag

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

log "Deployment Successful ✅"
log "Duration: $DURATION seconds"

echo "Deployment Completed Successfully"