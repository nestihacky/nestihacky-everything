#!/bin/bash -ex

ansible-galaxy install -f -r requirements.yml -p roles/ $@
