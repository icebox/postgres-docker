# 🐘 PostgreSQL + pgAdmin Boilerplate (Dockerized)

Turn-key local PostgreSQL environment with **persistent storage**, **pgAdmin UI**, and helper scripts for **reset, backup, and restore**.  
Perfect for rapid prototyping, dev, and QA environments. 🚀

---

## 📂 File Structure

```
.
├── .env
├── docker-compose.yml
├── postgres/
│ └── init/ # Optional SQL seed scripts (auto-run on first boot)
├── scripts/
│ ├── reset-postgres.sh # Reset containers & volumes
│ ├── backup-postgres.sh # Backup DB to ./backups
│ └── restore-postgres.sh # Restore DB from SQL dump
└── backups/ # Auto-created by backup script
```


---

## ⚙️ Configuration

All environment variables live in `.env`:

```ini
# Postgres
POSTGRES_CONTAINER_NAME=postgres-dev
POSTGRES_VERSION=16
POSTGRES_DB=appdb
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgrespassword
POSTGRES_PORT=5432

# pgAdmin
PGADMIN_CONTAINER_NAME=pgadmin-dev
PGADMIN_DEFAULT_EMAIL=admin@example.com
PGADMIN_DEFAULT_PASSWORD=pgadminpassword
PGADMIN_PORT=8080
```

---

## 🐳 Usage

### Start
```
docker compose up -d
```

### Stop
```
docker compose down
```

### Build fresh container 
```
docker compose down -v

docker compose up --build -d
```

---

## 💾 Backup & Restore

### Backup

```
./scripts/backup-postgres.sh
```

### Restore

```
./scripts/restore-postgres.sh ./backups/postgres_dump_YYYYMMDD_HHMMSS.sql
```

___

## 🔑 Access

### Postgres CLI (psql)

```
psql -h localhost -p 5432 -U postgres -d appdb
```

### pgAdmin (Web UI)
👉 http://localhost:8080
Login with:

`Email`: PGADMIN_DEFAULT_EMAIL

`Password`: PGADMIN_DEFAULT_PASSWORD

Then add a new server:
- `Host`: postgres
- `Port`: 5432
- `Username`: POSTGRES_USER
- `Password`: POSTGRES_PASSWORD

---

graph TD
  subgraph Docker Network
    A[pgAdmin<br/>:8080] <--> B[Postgres<br/>:5432]
  end
  C[Host Machine] -->|browser| A
  C -->|psql / apps| B


---

## 🧩 Extending

- Add .sql files to ./postgres/init/ to auto-seed on first boot.
- Use in a monorepo by cloning this boilerplate into services/postgres.

