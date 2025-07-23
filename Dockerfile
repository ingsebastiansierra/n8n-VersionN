FROM n8nio/n8n:latest

USER root

# Deshabilitar el bloqueo de 'only-allow' para poder usar npm
RUN sed -i 's/"only-allow": ".*"//' /usr/local/lib/node_modules/n8n/package.json

# Instalar nodo comunitario con npm
RUN npm install --legacy-peer-deps -g n8n-nodes-tesseractjs

# Ajustar permisos
RUN mkdir -p /data && chown -R node:node /data

USER node
VOLUME /data
EXPOSE 8080
