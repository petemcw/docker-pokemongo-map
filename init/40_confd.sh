#!/bin/sh

# Set required defaults
export AUTH_SERVICE=${AUTH_SERVICE:-ptc}
export USERNAME=${USERNAME:-}
export PASSWORD=${PASSWORD:-}
export LOCATION=${LOCATION:-55425}
export SCAN_DELAY=${SCAN_DELAY:-5}
export STEP_LIMIT=${STEP_LIMIT:-12}
export GMAPS_KEY=${GMAPS_KEY:-}
export HOST=${HOST:-0.0.0.0}
export PORT=${PORT:-5000}
export MYSQL_HOST=${MYSQL_HOST:-}
export MYSQL_NAME=${MYSQL_NAME:-}
export MYSQL_USER=${MYSQL_USER:-}
export MYSQL_PASS=${MYSQL_PASS:-}

# Render configuration files
/usr/local/bin/confd -onetime -backend env
