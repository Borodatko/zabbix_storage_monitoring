Zabbix storage monitoring template
==================================

This template was originally made for monitoring NetApp E-Series Storages.

But it also suitable for monitoring:

 - DELL PowerVault MD38XXF
 - IBM DS35XX


Requirements
------------

Minimal Zabbix verion - 6.2.
 
SMCli utility must be installed on Zabbix server. Depends of vendor, it exists in NetApp Santricity, IBM DS Storage Manager or Dell Storage Manager.


Vars
----

Change variables in santricity.sh script.

| Name  | Description | Default Value |
|-------|-------------|---------------|
| login | username    | CHANGEME      |
| pass  | password    | CHANGEME      |


Installation
------------

 - Set path to external scripts in zabbix server config file, don't forget to restart service;
 - Add santricity.sh script to external scripts directory;
 - Change variables in santricity.sh script;
 - Import template. By default, minimal item polling interval is 2 hours.


Author Information
------------------

https://github.com/Borodatko
