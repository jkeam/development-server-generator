# Development Server Generator
I'll often need to standup a server to run a few commands on a remote linux machine.
This project does this.

To use this, you'll have to replace my dummy values with your real values:

1. In `create.sh`, `vpc-uuid`
2. In `create.sh`, `ssh-keys`
3. In `inventory.ini` replace the IP with the value you get back from `create.sh`

## Prerequisite

1. `doctl` (1.91.0-release)
2. `ansible-playbook` (core 2.13.6)

## Creation

```shell
./create.sh
./configure.sh
```

### CRC

If you want to run CRC, then ssh into the machine
and do the following:

```shell
su - crcuser
crc setup
crc start -p ./pull-secret.txt
crc ip
sudo nvim /etc/haproxy/haproxy.conf  # update the ip at the bottom with crc ip
sudo systemctl start haproxy
# haproxy -f /etc/haproxy/haproxy.cfg -db to view logs to troubleshoot
```

Locally make sure to update your `/etc/hosts` file to be able to resolve
the `.testing` domain.

```shell
# /etc/hosts
<digital_ocean_droplet_ip> api.crc.testing oauth-openshift.apps-crc.testing console-openshift-console.apps-crc.testing default-route-openshift-image-registry.apps-crc.testing
```

## Destruction

```shell
./destroy.sh
```
