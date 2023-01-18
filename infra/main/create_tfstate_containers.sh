#!/bin/bash -e

RESOURCE_GROUP_NAME='ephemeralenv-tfstate'
LOCATION='uksouth'
STORAGE_ACCOUNT_NAME='ephemeralenvtfstatesa'
MAIN_STATE_CONTAINER_NAME='ephemeralenv-main-tfstate'
APP_STATE_CONTAINER_NAME='ephemeralenv-app-tfstate'

# Create resource group
az group create --name "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION"

# Create storage account
az storage account create \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --name "$STORAGE_ACCOUNT_NAME" \
  --sku Standard_LRS \
  --encryption-services blob

# Create blob containers
az storage container create \
  --name "$MAIN_STATE_CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME"

az storage container create \
  --name "$APP_STATE_CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME"