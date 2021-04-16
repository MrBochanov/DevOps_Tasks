# 1st task
Create a Bash script that sets up the following system properties on Ubuntu 20.04 server:

    Time zone
	Locale
    Run SSHD at port 2498 instead of 22
	Deny remote login as root user
	Add serviceuser account to the system
	Grant sudo rights to the user serviceuser
	Limit sudo permissions of the user serviceuser to start|stop|restart services
	Install Nginx server and make it autostart after booting
    Install Monit server and make it autostart after booting
    Configure Nginx to proxy requests to Monit server with the basic auth using credentials "devops/test"
    Configure UFW

The script should be presented as a public GitHub repository.
The README.md file with the description of required steps for running everything is mandatory.

# Solution

Actually, I added each task as a command in my bash script, so I think there is not going to be problems with understanding, I hope.
There is some tricky parts, but I tested this script with clean version of ubuntu 20.04, also as nginx as monit and everything is working great, as I expected

Also this script expected to be run once, so there is no any checks if config changes already exists

PS Also I understand that its not realy a "script", its just a banch of commands, without cycles and conditions, and I hope its okay. Some changes take place only after reboot (sshd port. for example)   