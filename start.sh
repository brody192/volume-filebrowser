#!/bin/sh

if test -n "${RAILWAY_VOLUME_MOUNT_PATH-}"; then
  echo volume mount point is set to $RAILWAY_VOLUME_MOUNT_PATH
else
  echo no volume attached, please attach a volume.
  echo upon attaching a volume let this service rebuild
  echo and then login credentials will be available.
  exit 0
fi

FILEBROWSER_USRNAME=$(pwgen -s -0 -a 12 1)
FILEBROWSER_PSSWD=$(pwgen -s -a 24 1)

FILEBROWSER_PSSWD_HASH=$(caddy hash-password --plaintext $FILEBROWSER_PSSWD)

sed -i "s~{{FILEBROWSER_USRNAME}}~$FILEBROWSER_USRNAME~g" /etc/caddy/Caddyfile
sed -i "s~{{FILEBROWSER_PSSWD_HASH}}~$FILEBROWSER_PSSWD_HASH~g" /etc/caddy/Caddyfile

echo username: $FILEBROWSER_USRNAME
echo password: $FILEBROWSER_PSSWD

caddy fmt --overwrite /etc/caddy/Caddyfile

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile 2>&1