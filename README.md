## Requirements:

1. Server with [caprover](https://caprover.com/) installed and ready to go
2. Postgres database on that server (one-click apps rock!)
3. Firebase account & a firestore instance (google cloud storage also works)

## Usage

1. Clone this repository
```
git clone https://github.com/dara-network/caprover-postgres-backup.git 
```
2. Create a caprover app (✅ Has Persistent Data)
    
    1. Force HTTPS, Enable basic auth - Allowing prying eyes to use this app is dangerous! 
    
    2. Specify environment variables, using [`.env.example`](.env.example) as a template
    
    3. Add a persistent directory. Path in App: `/volumes/crontab-ui` (same as `CRON_DB_PATH` environment variable)
    
    4. Set Container HTTP Port: `8000`
    
3. Deploy! (using [caprover CLI](https://caprover.com/docs/get-started.html#step-3-install-caprover-cli))
```
caprover deploy
```
