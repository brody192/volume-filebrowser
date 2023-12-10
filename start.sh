#!/bin/sh

set -e

if [ -n "$RAILWAY_VOLUME_MOUNT_PATH" ]; then
  echo volume mount point is set to $RAILWAY_VOLUME_MOUNT_PATH
else
  echo no volume attached, please attach a volume.
  echo upon attaching a volume let this service rebuild
  echo and then the login credentials will be available.
  exit 0
fi

if [ -z "$FILEBROWSER_USRNAME" ]; then
  echo no username provided, generating a username that will only be valid for this deployment
  FILEBROWSER_USRNAME=$(pwgen -s -0 -a 12 1)
  echo username: $FILEBROWSER_USRNAME
fi

if [ -z "$FILEBROWSER_PSSWD" ]; then
  echo no password provided, generating a password that will only be valid for this deployment
  FILEBROWSER_PSSWD=$(pwgen -s -a 24 1)
  echo password: $FILEBROWSER_PSSWD
fi

FILEBROWSER_PSSWD_HASH=$(caddy hash-password --plaintext $FILEBROWSER_PSSWD)

cp -f template.caddyfile Caddyfile

sed -i "s~{\$FILEBROWSER_USRNAME}~$FILEBROWSER_USRNAME~g" Caddyfile
sed -i "s~{\$FILEBROWSER_PSSWD_HASH}~$FILEBROWSER_PSSWD_HASH~g" Caddyfile

caddy fmt --overwrite Caddyfile

echo caddy version: $(caddy version | cut -d " " -f 1)

caddy run --config Caddyfile --adapter caddyfile 2>&1