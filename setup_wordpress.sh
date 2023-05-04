#!/bin/bash

# Load environment variables from .env file
source .env

# Check if wp-cli is installed
if ! command -v wp &> /dev/null; then
    echo "Error: wp-cli is not installed. Please install wp-cli first."
    exit 1
fi

# Create the database
echo "Creating database..."
mysql -u$DB_USER -p$DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"

# Download the latest WordPress
echo "Downloading WordPress..."
wp core download

# Configure wp-config.php
echo "Configuring wp-config.php..."
wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST"

# Install WordPress
echo "Installing WordPress..."
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"

# Install custom theme
echo "Installing custom theme..."
wp theme install $WP_THEME --activate

# Install and activate plugins
IFS=' ' read -ra PLUGIN_ARRAY <<< "$WP_PLUGINS"
for plugin in "${PLUGIN_ARRAY[@]}"; do
    echo "Installing and activating plugin: $plugin"
    wp plugin install $plugin --activate
done

echo "WordPress site is now up and running!"
