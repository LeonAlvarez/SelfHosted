echo "  Creating user '$BITWARDEN_DB_USER' and database '$BITWARDEN_DB_DATABASE'"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER $BITWARDEN_DB_USER WITH ENCRYPTED PASSWORD '$BITWARDEN_DB_PASSWORD';
    CREATE DATABASE $BITWARDEN_DB_DATABASE;
    GRANT ALL PRIVILEGES ON DATABASE $BITWARDEN_DB_DATABASE TO $BITWARDEN_DB_USER;
EOSQL