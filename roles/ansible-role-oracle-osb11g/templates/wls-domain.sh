#!/bin/bash
MDWDOMAIN="$HOME/mimdw/domains/base_domain"
mkdir -p "$MDWDOMAIN"
{{ oracle_osb11g_middleware_home }}/wlserver/common/bin/unpack.sh \
        -log=/tmp/mimdw_domain_$USER.log \
        -template={{ oracle_osb11g_middleware_home }}/mi-mdw_10.3.6.0.jar \
        -domain="$MDWDOMAIN" \
        -java_home={{ oracle_osb11g_java_path }}