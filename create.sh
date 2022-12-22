#!/bin/bash

# Types of Droplets
# s-1vcpu-512mb-10gb     1vcpu, 512mb ram, 10gb storage ($4/mo)
# s-1vcpu-1gb            1vcpu, 1gb ram, 25gb storage ($6/mo)
# s-1vcpu-2gb            1vcpu, 2gb ram, 50gb storage ($12/mo)
# s-2vcpu-2gb            2vcpu, 2gb ram, 60tb storage ($18/mo)
# s-2vcpu-4gb            2vcpu, 4gb ram, 80gb storage ($24/mo)
# s-4vcpu-8gb            4cpu, 8gb ram, 160gb storage ($48/mo)
#
# Creation Params
# doctl compute ssh-key list
# doctl compute droplet list
#
# List Droplet
# doctl compute droplet list
# doctl compute droplet list --format PublicIPv4
#
# Destroy
# doctl compute droplet delete drstrange

APP_NAME=drstrange
doctl compute droplet create \
    --image fedora-37-x64 \
    --size s-1vcpu-1gb \
    --region nyc1 \
    --vpc-uuid fdec7e9d-df4b-4a45-8e11-08d907ff9924 \
    --tag-names 'working,awesome' \
    --ssh-keys 51714245 \
    --wait \
    ${APP_NAME}
