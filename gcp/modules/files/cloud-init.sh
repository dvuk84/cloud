#!/usr/bin/env bash

# local vars
LOCAL_USER="fspace"

# create local user
useradd -m $LOCAL_USER

# add ssh key
cat <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCx+/9WTw4+OA+2zbXY36MU+LogbxDBBzU79LWEJthk9FkBAVIEly0C5IRLXJ+7EpHgMrg+FPzUosi8nRiLUuEzsIZdTCaJwzNsr9KBUm+P1bp1H/LblCPBQtHApfoH6ftKmQ7EE3fTLN2NOScC+DHYg+McClA1ragHUMEhNZyU3B5S2OU1FyAYVCC17Xmw3EkYaL8wU/hmcrj2s6ggN6b/vwnfaXXV9KIATxXY0Gjqq1E0+e64Y0/b64H6IMQzKguZWew2Y4C/Yd6DyKbp6Cj4hmH3jTBqZXRKJ0nvw+FnERpcD97JrGzfjKQRMJoj5xLVZUzAdxtCmJ1MxL5ovDU15eSiZPWY1JxNPUJnfWxOOCgP5HfYGaBL9D5uKS0OR+tvBX1aLc6/nsTs47xgEtoAnBxv26O1rYdXZ2a/hDs7f51tTTog2BbrgebJXvtxI4+1o1+TFQQVsPgjl2OriuwO6KVNeyYY/0RwWa8L7Hf1DCYuDblaHsebJS59QI3957hm5Mim3gmB3pJCjMwJF/3PTwGWDiy4dHzKI21nVSClP2mNynbaaZPEjETrTxD8ZYAJ33L22VlB0yZdZAPRXrjxM0BisPbfwL/6Rna5uUcSZRSi2tgjPnH369IQ0RkYz2ZPIVi71J7K4gttRTtzP3V+USxSOsMIB2KnsmmpllTXDQ== bsirius@bsirius
EOF >> /home/$LOCAL_USER/.ssh/authorized_keys

# ensure correct permission
chmod 600 /home/$LOCAL_USER/.ssh/authorized_keys

# sudo
echo "$LOCAL_USER	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers.d/$LOCAL_USER
