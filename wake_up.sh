#!/bin/bash
# wake_up.sh
# run with bash wake_up.sh

echo "🛠️  Starting PostgreSQL Database..."
service postgresql start

echo "👤  Creating 'root' database user..."
# This command creates the user 'root' as a superuser so you have full permission
su - postgres -c "createuser -s root" 2>/dev/null
su - postgres -c "psql -c \"ALTER USER root WITH PASSWORD '1234';\"" >/dev/null

echo "📦  Checking Gems..."
bundle check || bundle install

echo "🔄  Preparing Database (Create & Migrate)..."
# db:prepare is a smart command: it creates the DB if missing, or just runs migrations if it exists
rails db:prepare

echo "✅  READY TO CODE! Run 'rails s -b 0.0.0.0' to start the server."