FROM quay.io/keycloak/keycloak:11.0.3 

ADD ./standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml