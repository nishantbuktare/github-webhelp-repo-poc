#!/bin/sh

# Define the Drupal CMS URL and authentication credentials
DRUPAL_URL="http://localhost/drupal/"
DRUPAL_USERNAME="root"
DRUPAL_PASSWORD="*#Nishant1995"

# Change to the directory where your WebHelp Responsive content is located
cd sample/out/webhelp-responsive

# Get the short hash of the latest commit
rev=$(git rev-parse --short HEAD)

# Example using 'curl' to create a new node in Drupal
# Replace "your_content_type" with the machine name of your content type
# You might need to customize the JSON data to match your Drupal content type fields
curl -X POST -H "Content-Type: application/json" -d '{
  "title": "New WebHelp Responsive Content",
  "type": "cms_content",
  "field_description": "This is a description for your content."
}' -u "${DRUPAL_USERNAME}:${DRUPAL_PASSWORD}" "${DRUPAL_URL}/entity/node?_format=json"

# Handle any additional data or formatting as needed.

# Display a message indicating the content has been published to Drupal
echo "WebHelp Responsive content published to Drupal at ${DRUPAL_URL}"