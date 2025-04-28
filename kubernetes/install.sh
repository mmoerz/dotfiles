#/bin/bash

# set talos version
TALOS_VERSION="v1.10.0-beta.1"

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

TALOSCTL=`which talosctl`
if [ "X$TALOSCTL" == "X" ] ; then
  FETCH=1
else
  VERSION=`$TALOSCTL --version`
  if [ "X$VERSION" != "X$TALOS_VERSION" ] ; then
    echo "installed verson:$VERSION, changin to $TALOS_VERSION"
    FETCH=1
  fi
fi

if [ "X$FETCH" == "X1" ] ; then

  if [ -e ~/Downloads/metal-amd64-${TALOS_VERSION}.iso ] ; then
    echo "iso downloaded already, skipping"
  else
    curl -OL "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/metal-amd64.iso"
  fi
  curl -OL "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64"
  curl -OL "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/sha256sum.txt"

  sha256sum --ignore-missing -c sha256sum.txt
  if [ $? -ne 0 ]; then
    echo sha256sum check failed exiting
    exit 128
  fi
  rm sha256sum.txt

  [ -e metal-amd64.iso ] && \
    mv metal-amd64.iso ~/Downloads/metal-amd64-${TALOS_VERSION}.iso
  chmod +x talosctl-linux-amd64
  sudo mv talosctl-linux-amd64 /usr/local/bin/talosctl
  sudo chown root:root /usr/local/bin/talosctl

fi
