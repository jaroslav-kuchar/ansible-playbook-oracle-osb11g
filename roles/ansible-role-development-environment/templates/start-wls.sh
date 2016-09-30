#!/bin/sh
x-terminal-emulator -e {{ user_home.stdout }}/mimdw/domains/base_domain/startWebLogic.sh && wait $!