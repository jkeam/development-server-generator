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

## Destruction

```shell
./destroy.sh
```
