FROM caddy:2.6.4-alpine

RUN apk add --no-cache pwgen

WORKDIR /app

COPY template.caddyfile ./

COPY start.sh ./

RUN chmod +x start.sh

CMD ["sh", "start.sh"]