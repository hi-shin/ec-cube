#!/bin/bash
set -e

DB_PATH="/var/app/database/eccube.db"

# DB がない場合、新規作成
if [ ! -f "$DB_PATH" ]; then
    echo "Creating new SQLite database..."
    touch "$DB_PATH"
    chown webapp:webapp "$DB_PATH"
    chmod 660 "$DB_PATH"
fi

# シンボリックリンクを作成（EC-Cube から正しく参照するため）
ln -sf "$DB_PATH" /var/app/current/var/eccube.db

# マイグレーションを実行
echo "Running migrations..."
cd /var/app/current
sudo -u webapp bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
