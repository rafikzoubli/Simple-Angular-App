# Stage 1: Build the angular img
FROM node:current-alpine3.20 as build

RUN mkdir -p /app 

WORKDIR /app

COPY package.json /app/

RUN npm install

COPY . /app/

RUN npm run build --prod

# Stage 2: Build Stage

FROM nginx:1.27.0-alpine

COPY --from=build /app/dist/my-angular-app /usr/share/nginx/html


