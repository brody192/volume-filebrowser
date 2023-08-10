# FROM caddy:2.6.4-alpine

# RUN apk add --no-cache pwgen

# WORKDIR /app

# COPY template.caddyfile ./

# COPY start.sh ./

# RUN chmod +x start.sh

# CMD ["sh", "start.sh"]

FROM alpine:3.18.3

ARG CADDY_VERSION=2.7.3

RUN apk add --no-cache pwgen curl

RUN which pwgen

RUN which curl

WORKDIR /app

RUN curl "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz" --location --silent --show-error --output caddy.tar.gz \
    && tar -zxvf caddy.tar.gz caddy \
    && chmod +x caddy

COPY template.caddyfile ./

COPY start.sh ./

RUN chmod +x start.sh

CMD ["sh", "start.sh"]