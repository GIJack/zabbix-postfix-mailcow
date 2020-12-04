ZABBIX_BASE="etc/zabbix/"
install:
	install -Dm 640 zabbix_postfix.conf "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	install -Dm 750 zabbix_postfix.sh "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	install -Dm 750 mailq_docker.sh "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
	chgrp zabbix "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
remove:
	rm "$(DESTDIR)/$(ZABBIX_BASE)/zabbix_agentd.d/zabbix_postfix.conf"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/zabbix_postfix.sh"
	rm "$(DESTDIR)/$(ZABBIX_BASE)/scripts/mailq_docker.sh"
