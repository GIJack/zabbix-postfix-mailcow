# zabbix-postfix
Postfix template for Zabbix. Forked and ported to work with mailcow's dockerized
postfix container

On Server:
 * Import **template_postfix.xml** template
    
On client: 

    # Install the following packages (Assuming, Zabbix is already working)
    
    # Debian/Ubuntu
    apt install pflogsumm bc zabbix-sender
    
    # RHEL/Centos (replace the zabbix version with the one your using)
    yum install https://repo.zabbix.com/zabbix/4.2/rhel/6/x86_64/zabbix-release-4.2-1.el6.noarch.rpm
    yum install postfix-perl-scripts bc zabbix-sender

    mkdir -p /etc/zabbix/scripts/
    
    cp zabbix_postfix.sh /etc/zabbix/scripts/
    chmod 750 /etc/zabbix/scripts/zabbix_postfix.sh
    chgrp zabbix /etc/zabbix/scripts/zabbix_postfix.sh
    
    systemctl restart zabbix-agent
    
 * Add crontab entry
 
    ```
    # Zabbix check
    */5 * * * * /etc/zabbix/scripts/zabbix_postfix.sh 1>/dev/null 2>/dev/null
    ```
 
 * **make remove** will remove the files
 
