FROM alpine:3.18.3 as base

FROM base as download

ARG CADDY_VERSION=2.7.4

RUN apk add --no-cache pwgen curl

WORKDIR /download

RUN curl "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz" --location --silent --show-error --output caddy.tar.gz \
    && tar -zxvf caddy.tar.gz caddy \
    && chmod +x caddy 

FROM base as run

COPY --from=download /usr/bin/pwgen /usr/bin/pwgen
COPY --from=download /download/caddy /usr/bin/caddy

WORKDIR /app

COPY template.caddyfile ./

COPY start.sh ./

RUN chmod +x start.sh

CMD ["sh", "start.sh"]