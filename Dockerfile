# Stage 1: Build Stage
FROM node:latest AS build-stage

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Stage 2: Deployment Stage
FROM nginx:alpine

COPY --from=build-stage /app/dist/my-angular-app /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
