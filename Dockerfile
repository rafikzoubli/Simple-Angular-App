FROM node:current-alpine3.20 AS build

RUN mkdir -p /app 

WORKDIR /app

COPY package.json /app/

RUN npm install

COPY . /app/

RUN npm run build --prod

RUN ls -l /app/ > /app/ls.txt
