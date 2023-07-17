FROM caddy:2.6.4-alpine

RUN apk add --no-cache pwgen

COPY ./Caddyfile /etc/caddy/Caddyfile

WORKDIR /app

COPY start.sh ./

RUN chmod +x start.sh

CMD ["sh", "start.sh"]