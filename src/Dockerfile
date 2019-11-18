FROM node:10-alpine

RUN apk add --no-cache openssl

RUN npm install -g solid-server@5.2.2

# image configuration
ENV SOLID_HOME=/opt/solid
ENV PROCESS_USER=node
ENV TEMPORARY_CERT_NAME=solid-temporary

WORKDIR ${SOLID_HOME}
COPY ./src/entrypoint.sh ./entrypoint.sh
COPY ./src/checks.sh ./checks.sh
COPY ./src/create-temporary-cert.sh ./create-temporary-cert.sh
RUN chown --recursive ${PROCESS_USER}:${PROCESS_USER} ${SOLID_HOME}

USER ${PROCESS_USER}

# solid configuration
ENV SOLID_ROOT=${SOLID_HOME}/data
ENV SOLID_SSL_KEY=${SOLID_HOME}/${TEMPORARY_CERT_NAME}.key
ENV SOLID_SSL_CERT=${SOLID_HOME}/${TEMPORARY_CERT_NAME}.crt
ENV SOLID_PORT=8443
ENV SOLID_CORS_PROXY=/xss
ENV DEBUG=solid:*

VOLUME $SOLID_HOME

ENTRYPOINT ["./entrypoint.sh"]

CMD ["start"]
