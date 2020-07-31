## Requirements:

1. Server with [caprover](https://caprover.com/) installed and ready to go
2. Postgres database on that server (one-click apps rock!)
3. Firebase account

## Usage

1. Clone this repository
```
git clone https://github.com/dara-network/caprover-postgres-backup.git 
```
2. Create a caprover app (✅ Has Persistent Data)
3. Force HTTPS, Enable basic auth in the caprover app - Allowing prying eyes to use this app is dangerous! 
4. Specify environment variables in the caprover app, using [`.env.example`](.env.example) as a template
5. Add a persistent directory in caprover. Path in App: `/volumes/crontab-ui` (same as `CRON_DB_PATH` environment variable)
6. Deploy!
```
caprover deploy
```
