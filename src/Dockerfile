FROM node:10-alpine

RUN npm install -g solid-server

ENV SOLID_HOME=/opt/solid
ENV PROCESS_USER=node

WORKDIR ${SOLID_HOME}
RUN chown ${PROCESS_USER}:${PROCESS_USER} ${SOLID_HOME}

USER ${PROCESS_USER}

# solid configuration
ENV SOLID_ROOT=${SOLID_HOME}/data
ENV SOLID_PORT=8443

CMD ["solid", "start"]