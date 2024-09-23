#!/bin/bash
curl https://support.catonetworks.com/hc/article_attachments/17820055377309 -o /tmp/eventsFeed.py
curl https://raw.githubusercontent.com/jrabinovitz-ideal/Graylog/refs/heads/main/filebeat.yml -o /tmp/filebeat.yml

mv /tmp/eventsFeed.py /root/
mv /tmp/filebeat.yml /etc/filebeat/

(crontab -l 2>/dev/null || true; echo "5 * * * * python3 /root/eventsFeed.py -I 4536 -K 25E6E509811F616D75819B2442406275 -t Security -p -r 1 2>&1 >> /var/log/cato.json") | crontab -

systemctl start filebeat
