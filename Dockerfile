FROM node:22.12.0 AS build
WORKDIR /app
COPY . . 
RUN npm install
RUN npm run build -- --configuration production
FROM nginx:alpine
COPY --from=build /app/dist/gestion-employes-frontend /usr/share/nginx/html
EXPOSE 80
