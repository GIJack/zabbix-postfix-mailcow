# zabbix-postfix
Postfix template for Zabbix. Forked and ported to work with mailcow's dockerized
postfix container

On Server:
 * Import **template_postfix.xml** template
    
On client: 

    # Install the following packages
    
    # Debian/Ubuntu
    apt install pflogsumm bc zabbix-agent
    
    # RHEL/Centos (replace the zabbix version with the one your using)
    yum install https://repo.zabbix.com/zabbix/4.2/rhel/6/x86_64/zabbix-release-4.2-1.el6.noarch.rpm
    yum install postfix-perl-scripts bc zabbix-agent zabbix-sender

    cp zabbix_postfix.sh /etc/zabbix/scripts/
    chmod 750 /etc/zabbix/scripts/zabbix_postfix.sh
    chgrp zabbix /etc/zabbix/scripts/zabbix_postfix.sh
    
    cp mailq_docker.sh /etc/zabbix/scripts/
    chmod 750 /etc/zabbix/scripts/mailq_docker.sh
    chgrp zabbix /etc/zabbix/scripts/mailq_docker.sh
    
    # Zabbix agent config dir may change, see https://github.com/rafael747/zabbix-postfix/issues/3#issuecomment-623629611

    cp zabbix_postfix.conf /etc/zabbix/zabbix_agentd.d/
    chgrp zabbix /etc/zabbix/zabbix_agentd.d/zabbix_postfix.conf
    chmod 640 /etc/zabbix/zabbix_agentd.d/zabbix_postfix.conf
    
    systemctl restart zabbix-agent
    
 * Add crontab entry
 
    ```
    # Zabbix check
    */5 * * * * /etc/zabbix/scripts/zabbix_postfix.sh 1>/dev/null 2>/dev/null
    ```

 ### or

 * Install **zabbix-agent**
 
 * Use **make install** (Requires GNU Make.)
 
 * **make remove** will remove the files
 
