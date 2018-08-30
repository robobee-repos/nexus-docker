#!/bin/bash
set -ex

if [[ -z "$1" ]]; then
  echo "Argument #1 is mandatory."
  exit 1
fi

PLUGIN_NAME="$1"; shift

if [[ -z "$PLUGIN_VERSION" ]]; then
  echo "PLUGIN_VERSION is mandatory."
  exit 1
fi

if [[ -z "$PLUGIN_DIR" ]]; then
  echo "PLUGIN_DIR is mandatory."
  exit 1
fi

if [[ -z "$PLUGIN_JAR" ]]; then
  echo "PLUGIN_JAR is mandatory."
  exit 1
fi

if [[ -z "$PLUGIN_URL" ]]; then
  echo "PLUGIN_URL is mandatory."
  exit 1
fi

if [[ -z "$PLUGIN_KARAF_ENTRY" ]]; then
  echo "PLUGIN_KARAF_ENTRY is mandatory."
  exit 1
fi

cd /tmp

PLUGIN_TARGET="${SONATYPE_DIR}/nexus/system/${PLUGIN_DIR}"

wget -O ${PLUGIN_JAR} -nv ${PLUGIN_URL}
mkdir -p ${PLUGIN_TARGET}
mv ${PLUGIN_JAR} ${PLUGIN_TARGET}/${PLUGIN_JAR}
echo "${PLUGIN_KARAF_ENTRY}" >> ${SONATYPE_DIR}/nexus/etc/karaf/startup.properties

echo "$PLUGIN_NAME installed."
