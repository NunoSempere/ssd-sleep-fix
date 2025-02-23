install:
	sudo cp ssd-activity.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable ssd-activity.service

start:
	sudo systemctl start ssd-activity.service

restart:
	sudo systemctl restart ssd-activity.service

status:
	sudo systemctl status ssd-activity.service

stop:
	sudo systemctl stop ssd-activity.service

watch:
	watch cat /var/tmp/ssd-activity.txt

