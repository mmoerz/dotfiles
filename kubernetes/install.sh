#/bin/bash

# Set this to, for example, KUBESEAL_VERSION='0.23.0'
KUBESEAL_VERSION='0.28'

# Fetch the latest sealed-secrets version using GitHub API
KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)

# Check if the version was fetched successfully
if [ -z "$KUBESEAL_VERSION" ]; then
    echo "Failed to fetch the latest KUBESEAL_VERSION"
    exit 1
fi

KUBESEAL=`which kubeseal`
if [ "X$KUBESEAL" == "X" ] ; then
  # fetch a kubeseal version
  FETCH=1
else
  VERSION=`$KUBESEAL --version | cut -d ' ' -f 3`
  if [ "X$VERSION" != "X$KUBESEAL_VERSION" ] ; then
    echo "installed version:$VERSION, upgrading to $KUBESEAL_VERSION"
    FETCH=1
  fi
fi

if [ "X$FETCH" == "X1" ] ; then 
  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
  tar -xvzf kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz kubeseal
  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  rm kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz kubeseal
fi
