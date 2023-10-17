#!/bin/bash

# Variables
DRUPAL_ROOT="C:\xampp\htdocs\drupal"
GITHUB_REPO="https://github.com/nishantbuktare/space-pages.git"
BRANCH="gh-pages"
TEMP_DIR="/tmp/webhelp_tmp"

rm -rf "$TEMP_DIR"

# Clone the GitHub repository
git clone --branch "$BRANCH" "$GITHUB_REPO" "$TEMP_DIR"

# Assuming your webhelp responsive content is located in a specific subfolder (e.g., "webhelp")
WEBHELP_DIR="$TEMP_DIR/webhelp-responsive"

# Check if the repository was cloned successfully
if [ -d "$WEBHELP_DIR" ]; then
    # Clear Drupal cache
    php "$DRUPAL_ROOT/web/core/scripts/drupal" cache:rebuild

    # Copy webhelp files to Drupal
    cp -r "$WEBHELP_DIR/" "$DRUPAL_ROOT/sites/default/files/webhelp/"

    echo "WebHelp content deployed successfully to your local Drupal instance."
else
    echo "Failed to clone the GitHub repository or webhelp content not found."
    exit 1
fi

# Clean up temporary directory
rm -rf "$TEMP_DIR"