FROM  sonatype/nexus3:3.13.0
LABEL maintainer "Erwin Mueller <erwin.mueller@deventm.com>"

ARG APT_CACHE

USER root

RUN set -x \
  && yum update --assumeyes --skip-broken \
  && yum install --assumeyes rsync wget \
  && yum clean all

ADD rootfs/ /

ADD docker-run-utils/docker-entrypoint-utils.sh /

RUN set -x \
  && chmod +x /*.sh

RUN set -x \
  && export PLUGIN_VERSION="0.2.1-SNAPSHOT" \
  && export PLUGIN_DIR="org/github/flytreeleft/nexus3-keycloak-plugin/${PLUGIN_VERSION}" \
  && export PLUGIN_JAR="nexus3-keycloak-plugin-${PLUGIN_VERSION}.jar" \
  && export PLUGIN_URL="https://github.com/flytreeleft/nexus3-keycloak-plugin/releases/download/${PLUGIN_VERSION}/nexus3-keycloak-plugin-${PLUGIN_VERSION}.jar" \
  && export PLUGIN_KARAF_ENTRY="mvn\\:org.github.flytreeleft/nexus3-keycloak-plugin/${PLUGIN_VERSION} = 200" \
  && /install_plugin.sh nexus3-keycloak-plugin

USER nexus

WORKDIR ${NEXUS_DATA}

CMD ["/opt/sonatype/start-nexus-repository-manager.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]
