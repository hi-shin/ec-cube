#!/bin/bash

DB_FILE="/var/app/current/var/eccube.db"

# SQLite DB ファイルがなければ作成
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
    chmod 777 "$DB_FILE"
    chown webapp:webapp "$DB_FILE"
fi
