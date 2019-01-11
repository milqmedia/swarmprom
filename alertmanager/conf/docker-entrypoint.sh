#!/bin/sh -e

cat /etc/alertmanager/alertmanager.yml |\
    sed "s@#smtp_smarthost: <host>#@smtp_smarthost: '$SMTP_HOST'@g" |\
    sed "s@#smtp_from: <from>#@smtp_from: '#$SMTP_FROM'@g" |\
    sed "s@#smtp_auth_username: <user>#@smtp_auth_username: '#$SMTP_USER'@g" |\
    sed "s@#smtp_auth_password: <password>#@smtp_auth_password: '$SMTP_PASSWORD'@g" |\
    sed "s@#to: <emails>#@to: '$ALERT_EMAILS'@g" > /tmp/alertmanager.yml

mv /tmp/alertmanager.yml /etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
