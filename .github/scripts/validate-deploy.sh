#!/usr/bin/env bash

BIN_DIR=$(cat .bin_dir)

export PATH="${BIN_DIR}:${PATH}"

SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)

echo "terraform.tfvars"
cat terraform.tfvars

PREFIX_NAME=$(cat terraform.tfvars | grep name_prefix | sed "s/name_prefix=//g" | sed 's/"//g' | sed "s/_/-/g")
REGION=$(cat terraform.tfvars | grep -E "^region" | sed "s/region=//g" | sed 's/"//g')
RESOURCE_GROUP_NAME=$(cat terraform.tfvars | grep -E "^resource_group_name" | sed "s/^resource_group_name=//g" | sed 's/"//g')

echo "PREFIX_NAME: ${PREFIX_NAME}"
echo "REGION: ${REGION}"
echo "RESOURCE_GROUP_NAME: ${RESOURCE_GROUP_NAME}"
echo "IBMCLOUD_API_KEY: ${IBMCLOUD_API_KEY}"

VPC_NAME="${PREFIX_NAME}-vpc"

ibmcloud login -r "${REGION}" -g "${RESOURCE_GROUP_NAME}" --apikey "${IBMCLOUD_API_KEY}"

echo "Retrieving VPC_ID for name: ${VPC_NAME}"
VPC_ID=$(ibmcloud is vpcs | grep "${VPC_NAME}" | sed -E "s/^([A-Za-z0-9-]+).*/\1/g")

if [[ -z "${VPC_ID}" ]]; then
  echo "VPC id not found: ${VPC_NAME}"
  exit 1
fi

echo "Retrieving VPC info for id: ${VPC_ID}"
ibmcloud is vpc "${VPC_ID}"
if ! ibmcloud is vpc "${VPC_ID}"; then
  echo "Unable to find vpc for id: ${VPC_ID}"
  exit 1
fi

exit 0
