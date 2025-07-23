FROM n8nio/n8n:latest

USER root

# Activa corepack y pnpm
RUN corepack enable && corepack prepare pnpm@8.15.4 --activate

# Instala el nodo comunitario en el contexto de n8n
RUN pnpm install n8n-nodes-tesseractjs --prefix /usr/local/lib/node_modules/n8n

# Ajusta permisos
RUN mkdir -p /data && chown -R node:node /data

USER node
VOLUME /data
EXPOSE 8080
