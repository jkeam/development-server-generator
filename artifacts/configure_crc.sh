#!/bin/bash

crc config set skip-check-daemon-systemd-unit true
crc config set skip-check-daemon-systemd-sockets true
crc config set consent-telemetry no
crc config set cpus 4
crc config set memory 16384
