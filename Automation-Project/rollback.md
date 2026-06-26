# Rollback Strategy

- Backup taken before deployment
- If health check fails:
  -> Restore backup
  -> Restart service
- If rollback fails:
  -> Alert team