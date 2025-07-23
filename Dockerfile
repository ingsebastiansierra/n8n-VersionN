# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Cambia al usuario root
USER root

# Instala pnpm (Corepack maneja pnpm y yarn en Node.js 16+)
RUN corepack enable && corepack prepare pnpm@8.15.4 --activate

# Instala el nodo comunitario con pnpm
RUN pnpm add -g n8n-nodes-tesseractjs

# Crea el directorio /data y asigna permisos
RUN mkdir -p /data && chown -R node:node /data

# Cambia a usuario node
USER node

VOLUME /data
EXPOSE 8080
