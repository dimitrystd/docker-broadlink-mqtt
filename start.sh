#!/usr/bin/env bash

eval "echo \"$(cat mqtt.conf.template)\"" > mqtt.conf
python mqtt.py
