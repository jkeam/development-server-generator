#!/bin/bash

APP_NAME=drstrange
doctl compute droplet delete ${APP_NAME}

# verify
# doctl compute droplet list
