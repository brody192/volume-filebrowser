FROM caddy:latest

RUN apk add --no-cache pwgen

WORKDIR /app

COPY template.caddyfile ./

COPY --chmod=755 start.sh ./

CMD ["sh", "start.sh"]