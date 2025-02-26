#!/bin/bash
set -e

DB_PATH="/var/app/database/eccube.db"

echo "Checking EC-Cube Database..."

# DB ファイルがない場合は新規作成
if [ ! -f "$DB_PATH" ]; then
    echo "Creating new SQLite database..."
    touch "$DB_PATH"
    chown webapp:webapp "$DB_PATH"
    chmod 660 "$DB_PATH"
fi

# シンボリックリンクを作成
ln -sf "$DB_PATH" /var/app/current/var/eccube.db

# `dtb_page` テーブルがない場合のみ `eccube:install` を実行
if ! sqlite3 "$DB_PATH" "SELECT name FROM sqlite_master WHERE type='table' AND name='dtb_page';" | grep -q "dtb_page"; then
    echo "Running ECCube installation..."
    sudo -u webapp bin/console eccube:install
else
    echo "Database already initialized. Running migrations instead..."
    sudo -u webapp bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
fi
