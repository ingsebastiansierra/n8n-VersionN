# Usa la imagen oficial más reciente de n8n como base
FROM n8nio/n8n:latest

# Cambia temporalmente al usuario root para ejecutar comandos con permisos elevados
USER root

# Instala el nodo comunitario n8n-nodes-tesseractjs usando npm
# Se añade la variable npm_config_legacy_peer_deps para evitar errores de dependencias
RUN npm_config_legacy_peer_deps=true npm install -g n8n-nodes-tesseractjs

# Crea el directorio /data (si no existe) y asigna la propiedad al usuario `node`
RUN mkdir -p /data && chown -R node:node /data

# Vuelve al usuario `node`, recomendado para ejecutar la aplicación de forma segura
USER node

# Declara /data como un volumen persistente
VOLUME /data

# Expone el puerto 8080, que es donde n8n se ejecuta por defecto
EXPOSE 8080
