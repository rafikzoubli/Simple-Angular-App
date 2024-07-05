# Stage 1: Build Stage
FROM node:latest AS node

WORKDIR /app

# COPY package*.json ./
COPY . .

RUN npm install

# COPY . .
RUN npm run build --prod

FROM nginx:alpine

COPY --from=node /app/dist/my-angular-app /usr/share/nginx/html

# EXPOSE 80
# CMD //["nginx", "-g", "daemon off;"]
