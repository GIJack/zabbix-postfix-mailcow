ZABBIX_BASE="etc/zabbix/"
install:
	install -Dm 750 zabbix_postfix.sh "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	install -Dm 644 zabbix-postfix.service "$(DESTDIR)/usr/lib/systemd/system/zabbix-postfix.service"
	install -Dm 644 zabbix-postfix.timer "$(DESTDIR)/usr/lib/systemd/system/zabbix-postfix.timer"
remove:
	rm "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
	rm "$(DESTDIR)/usr/lib/systemd/system/zabbix-postfix.service"
	rm "$(DESTDIR)/usr/lib/systemd/system/zabbix-postfix.timer"
