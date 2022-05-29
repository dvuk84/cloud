#!/usr/bin/env bash

# local vars
LOCAL_USER="user"

# create local user
useradd -m $LOCAL_USER

# create ssh dir
mkdir /home/$LOCAL_USER/.ssh

# ensure correct permission
chown $LOCAL_USER:$LOCAL_USER /home/$LOCAL_USER/.ssh

# add ssh key
cat <<EOF >>/home/$LOCAL_USER/.ssh/authorized_keys
...
EOF

# ensure correct permission
chmod 600 /home/$LOCAL_USER/.ssh/authorized_keys

# ensure correct ownership
chown -R $LOCAL_USER:$LOCAL_USER /home/$LOCAL_USER/.ssh

# sudo
echo "$LOCAL_USER	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers.d/$LOCAL_USER
