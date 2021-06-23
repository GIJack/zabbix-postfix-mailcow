ZABBIX_BASE="etc/zabbix/"
install:
	install -Dm 640 zabbix_postfix.conf "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	install -Dm 750 zabbix_postfix.sh "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	install -Dm 750 mailq_docker.sh "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
	install -Dm 644 zabbix-postfix.cron "$(DESTDIR)/etc/cron.d/zabbix-postfix"
remove:
	rm "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
	rm "$(DESTDIR)/etc/cron.d/zabbix-postfix"
