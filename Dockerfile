FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git bash tini unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

ENV BUN_INSTALL=/opt/bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="${BUN_INSTALL}/bin:${PATH}"

RUN pip install --no-cache-dir uv

WORKDIR /app
COPY . .

RUN bun install
RUN uv sync --directory apps/api
RUN bun run build

RUN chmod +x /app/docker/start.sh \
    && ln -s /app/docker/start.sh /usr/local/bin/start-micracode \
    && mkdir -p /data/opener-apps

ENV NODE_ENV=production \
    APP_WEB_ORIGIN=http://localhost:3000 \
    NEXT_PUBLIC_API_BASE_URL=http://localhost:8000 \
    OPENER_APPS_DIR=/data/opener-apps

EXPOSE 3000 8000

ENTRYPOINT ["tini", "--"]
CMD ["start-micracode"]
