## Requirements:

1. Server with [caprover](https://caprover.com/) installed and ready to go
2. Postgres database on that server (one-click apps rock!)
3. Firebase account

## Usage

1. 
```
git clone https://github.com/dara-network/caprover-postgres-backup.git 
```
2. Create a caprover app (✅ Has Persistent Data)
3. Specify the environment variables from [`.env.example`](.env.example) in your caprover app
4. `caprover deploy`
5. IMPORTANT: Enable basic HTTP auth for your caprover app
