#!/bin/sh -e

cat /etc/alertmanager/alertmanager.yml |\
    sed "s@#smarthost: <host>#@smarthost: '$SMTP_HOST'@g" |\
    sed "s@#from: <from>#@from: '$SMTP_FROM'@g" |\
    sed "s@#auth_username: <user>#@auth_username: '$SMTP_USER'@g" |\
    sed "s@#auth_password: <password>#@auth_password: '$SMTP_PASSWORD'@g" |\
    sed "s@#to: <emails>#@to: '$ALERT_EMAILS'@g" > /tmp/alertmanager.yml

mv /tmp/alertmanager.yml /etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
