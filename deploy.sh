#!/bin/bash

# Variables
DRUPAL_ROOT="C:\xampp\htdocs\drupal"
GITHUB_REPO="https://github.com/nishantbuktare/space-pages.git"
BRANCH="gh-pages"
TEMP_DIR="/tmp/webhelp_tmp"

# Clean up any previous deployments
rm -rf "$TEMP_DIR"

# Clone the GitHub repository
git clone --branch "$BRANCH" "$GITHUB_REPO" "$TEMP_DIR"

# Assuming your webhelp responsive content is located in a specific subfolder (e.g., "webhelp")
WEBHELP_DIR="$TEMP_DIR/webhelp"

# Check if the repository was cloned successfully
if [ -d "$WEBHELP_DIR" ]; then
    # Clear Drupal cache (may vary depending on your Drupal version)
    drush --root="$DRUPAL_ROOT" cr

    # Copy webhelp files to Drupal
    rsync -av "$WEBHELP_DIR/" "$DRUPAL_ROOT/sites/default/files/webhelp/"

    # Optionally, you may need to update the database or perform other tasks specific to your deployment
    # drush --root="$DRUPAL_ROOT" updatedb

    # Clear Drupal cache again
    drush --root="$DRUPAL_ROOT" cr

    echo "WebHelp content deployed successfully."
else
    echo "Failed to clone the GitHub repository or webhelp content not found."
    exit 1
fi

# Clean up temporary directory
rm -rf "$TEMP_DIR"
