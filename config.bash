# Repositories will be checked every 20 minutes for changes.
# This variable is passed to sleep(1)
export GIT_FILE_BACKUP_TOOL_CHECK_FREQUENCY="20m"

# A list of all repositories that will be backed up.
export GIT_FILE_BACKUP_TOOL_REPOS=()

# This variable is passed to date(1)
export GIT_FILE_BACKUP_TOOL_COMMIT_MSG_FORMAT="%d/%m/%Y-%Hh%M"
