# Custom Systemd Service

## Create Service
sudo nano /etc/systemd/system/myapp.service

[Unit]
Description=My App
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /opt/myapp/app.jar
Restart=on-failure

[Install]
WantedBy=multi-user.target

## Enable & Start
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp
