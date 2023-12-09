# Usar la imagen oficial de Node.js con la versión 18
FROM node:18-buster-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos de configuración del proyecto
COPY package*.json ./
COPY tsconfig.json ./
COPY astro.config.mjs ./

# Instalar las dependencias del proyecto
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Construir la aplicación
RUN npm run build

# Exponer el puerto que Astro utilizará
EXPOSE 4321

# Comando para iniciar la aplicación
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]

