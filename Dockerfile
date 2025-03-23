# Étape 1: Utilisation de Node.js pour construire l'application Angular
FROM node:22.12.0 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Étape 2: Utilisation de Nginx pour servir l'application Angular
FROM nginx:alpine
COPY --from=build /app/dist/mon-app /usr/share/nginx/html

# Exposer le port 80 pour servir l'application
EXPOSE 80
