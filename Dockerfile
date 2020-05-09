FROM node:12.16.3-alpine as build-step
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
FROM nginx:alpine as prod-stage
COPY --from=build-step /app/dist/angular-app /usr/share/nginx/html

