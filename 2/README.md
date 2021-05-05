# 2nd task
Create an Ansible playbook consisted of several roles for setting up the following system properties on Ubuntu 20.04 server:

    Time zone
    Locale
	Run SSHD at port 2498 instead of 22
    Deny remote login as root user
	Add serviceuser account to the system
    Grant sudo permissions to the user serviceuserLimit sudo permissions of the user serviceuser to start|stop|restart services
	Install Nginx server and make it autostart after booting
	Install Monit server and make it autostart after booting
    Configure Nginx to proxy requests to Monit server with the basic auth using credentials "devops/test".
    Configure UFW

Roles must be developed with the help of Molecule
The playbook must be idempotent.

The playbook should be presented as a public GitHub repository.
The README.md file with the description of required steps for running everything is mandatory.

# Solution

At the beginnig I created several roles folowing Ansible best-practises, but then I decided to unit them all in one, for simplicity.

So the role called Homework and it was tested with molecule with driver : docker and with image ubuntu:20.04

The structure of folder:

        .
        ├── defaults
        │   └── main.yml
        ├── files
        │   ├── default
        │   ├── locale
        │   ├── monitrc
        │   ├── sshd_config
        │   ├── sudoers
        │   ├── timezone
        │   ├── ufw
        │   └── user.rules
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── molecule
        │   └── default
        │       ├── converge.yml
        │       ├── molecule.yml
        │       └── verify.yml
        ├── README.md
        ├── tasks
        │   └── main.yml
        ├── templates
        ├── tests
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml

First of all I tested it with VMs with normal ISO images in local environment, but for molecule docker tests many thing were changed because of very limited ubuntu image...

But everuthing works too.

I added the whole structure with all folserd and files, even if they are empty
And the special file (RESULTS) with output from molecule test

Everything is working, including idempotence tests.

PS I hate molecule for now