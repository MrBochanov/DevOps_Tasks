root@mymint:~/project/HomeWork# molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
WARNING  Computed fully qualified role name of HomeWork does not follow current galaxy requirements.
Please edit meta/main.yml and assure we can correctly determine full role name:

galaxy_info:
role_name: my_name  # if absent directory name hosting role is used instead
namespace: my_galaxy_namespace  # if absent, author is used instead

Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names

As an alternative, you can add 'role-name' to either skip_list or warn_list.

INFO     Using ../../.cache/roles/HomeWork symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:../../.cache/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] ***************************************************************************************************************************************************************************

TASK [Destroy molecule instance(s)] ******************************************************************************************************************************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *****************************************************************************************************************************************
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '401149079085.370097', 'results_file': '/root/.ansible_async/401149079085.370097', 'changed': True, 'failed': False, 'item': {'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] **********************************************************************************************************************************************************

PLAY RECAP *******************************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /root/project/HomeWork/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ****************************************************************************************************************************************************************************

TASK [Log into a Docker registry] ********************************************************************************************************************************************************
skipping: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True})

TASK [Check presence of custom Dockerfiles] **********************************************************************************************************************************************
ok: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True})

TASK [Create Dockerfiles from image names] ***********************************************************************************************************************************************
changed: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True})

TASK [Discover local Docker images] ******************************************************************************************************************************************************
ok: [localhost] => (item={'diff': [], 'dest': '/root/.cache/molecule/HomeWork/default/Dockerfile_ubuntu_20_04', 'src': '/root/.ansible/tmp/ansible-tmp-1620225255.2664554-74389682189181/source', 'md5sum': '84dd365820fd171639eec1118e3ebda4', 'checksum': '703571a5a8af2e857377f142d22875dc25d33b5a', 'changed': True, 'uid': 0, 'gid': 0, 'owner': 'root', 'group': 'root', 'mode': '0600', 'state': 'file', 'size': 1041, 'invocation': {'module_args': {'src': '/root/.ansible/tmp/ansible-tmp-1620225255.2664554-74389682189181/source', 'dest': '/root/.cache/molecule/HomeWork/default/Dockerfile_ubuntu_20_04', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '703571a5a8af2e857377f142d22875dc25d33b5a', 'backup': False, 'force': True, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None, 'regexp': None, 'delimiter': None, 'unsafe_writes': None}}, 'failed': False, 'item': {'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *******************************************************************************************************************************************
ok: [localhost] => (item=molecule_local/ubuntu:20.04)

TASK [Create docker network(s)] **********************************************************************************************************************************************************

TASK [Determine the CMD directives] ******************************************************************************************************************************************************
ok: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True})

TASK [Create molecule instance(s)] *******************************************************************************************************************************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) creation to complete] *****************************************************************************************************************************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '749017443178.370355', 'results_file': '/root/.ansible_async/749017443178.370355', 'changed': True, 'failed': False, 'item': {'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *******************************************************************************************************************************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] **************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************
ok: [instance]

TASK [Include HomeWork] ******************************************************************************************************************************************************************

TASK [HomeWork : Apt Update and Upgrade] *************************************************************************************************************************************************
[WARNING]: The value True (type bool) in a string field was converted to 'True' (type string). If this does not look like what you expect, quote the entire value to ensure it does not
change.
ok: [instance]

TASK [HomeWork : Install tzdata] *********************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Update Timezone] ********************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Install locales] ********************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Update Locale] **********************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Install Openssh-server] *************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Enable ssh-server] ******************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Configure Secure sshd] **************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : This should be in a vault in real playbook of course] *******************************************************************************************************************
ok: [instance]

TASK [HomeWork : Add serviceuser + Grant sudo] *******************************************************************************************************************************************
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this module to work properly.
changed: [instance]

TASK [HomeWork : Copy sudoers config] ****************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Install_Nginx_server] ***************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Start Nginx and Enable it] **********************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Install_Monit_server] ***************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Start Monit and Enable it] **********************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Copy Monit Config] ******************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Copy Nginx Config] ******************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Install_UFW] ************************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Bring UFW config] *******************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Bring UFW user.rules] ***************************************************************************************************************************************************
changed: [instance]

TASK [HomeWork : Start UFW and Enable it] ************************************************************************************************************************************************
ok: [instance]

RUNNING HANDLER [HomeWork : Restart sshd service] ****************************************************************************************************************************************
changed: [instance]

RUNNING HANDLER [HomeWork : Restart nginx service] ***************************************************************************************************************************************
changed: [instance]

RUNNING HANDLER [HomeWork : Restart monit service] ***************************************************************************************************************************************
changed: [instance]

PLAY RECAP *******************************************************************************************************************************************************************************
instance                   : ok=25   changed=21   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


INFO     Running default > idempotence

PLAY [Converge] **************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************
ok: [instance]

TASK [Include HomeWork] ******************************************************************************************************************************************************************

TASK [HomeWork : Apt Update and Upgrade] *************************************************************************************************************************************************
[WARNING]: The value True (type bool) in a string field was converted to 'True' (type string). If this does not look like what you expect, quote the entire value to ensure it does not
change.
ok: [instance]

TASK [HomeWork : Install tzdata] *********************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Update Timezone] ********************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Install locales] ********************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Update Locale] **********************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Install Openssh-server] *************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Enable ssh-server] ******************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Configure Secure sshd] **************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : This should be in a vault in real playbook of course] *******************************************************************************************************************
ok: [instance]

TASK [HomeWork : Add serviceuser + Grant sudo] *******************************************************************************************************************************************
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this module to work properly.
ok: [instance]

TASK [HomeWork : Copy sudoers config] ****************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Install_Nginx_server] ***************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Start Nginx and Enable it] **********************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Install_Monit_server] ***************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Start Monit and Enable it] **********************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Copy Monit Config] ******************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Copy Nginx Config] ******************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Install_UFW] ************************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Bring UFW config] *******************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Bring UFW user.rules] ***************************************************************************************************************************************************
ok: [instance]

TASK [HomeWork : Start UFW and Enable it] ************************************************************************************************************************************************
ok: [instance]

PLAY RECAP *******************************************************************************************************************************************************************************
instance                   : ok=22   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ****************************************************************************************************************************************************************************

TASK [Example assertion] *****************************************************************************************************************************************************************
ok: [instance] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *******************************************************************************************************************************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] ***************************************************************************************************************************************************************************

TASK [Destroy molecule instance(s)] ******************************************************************************************************************************************************
changed: [localhost] => (item=instance)

TASK [Wait for instance(s) deletion to complete] *****************************************************************************************************************************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '701348151310.386084', 'results_file': '/root/.ansible_async/701348151310.386084', 'changed': True, 'failed': False, 'item': {'image': 'ubuntu:20.04', 'name': 'instance', 'privileged': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] **********************************************************************************************************************************************************

PLAY RECAP *******************************************************************************************************************************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
