#!/bin/bash
curl https://raw.githubusercontent.com/jrabinovitz-ideal/Graylog/refs/heads/main/filebeat.yml -o /tmp/filebeat.yml
mv /tmp/filebeat.yml /etc/filebeat/

(crontab -l 2>/dev/null || true; echo "7 * * * * python3 /root/eventsFeed.py -I 4536 -K 25E6E509811F616D75819B2442406275 -t Connectivity -p -r 1 2>&1 >> /var/log/cato_conn.json") | crontab -
