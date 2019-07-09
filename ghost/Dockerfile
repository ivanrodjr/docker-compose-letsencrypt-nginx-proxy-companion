FROM ghost:2.25.4-alpine

RUN apk update && \
apk add mysql-client

COPY ./wait-for-db.sh /usr/local/bin/wait-for-db.sh

ENTRYPOINT ["wait-for-db.sh", "mysql", "--", "docker-entrypoint.sh"]
CMD ["node", "current/index.js"]