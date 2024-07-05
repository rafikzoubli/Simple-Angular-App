FROM node:current-alpine3.20 AS build

RUN mkdir -p /app 

WORKDIR /app

COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run build --prod

FROM nginx:1.27.0-alpine

RUN mkdir -p /app

COPY --from=build /app/dist/my-angular-app /usr/share/nginx/html

RUN ls -l /usr/share/nginx/html > /app/nginx_ls_output.txt

CMD ["nginx", "-g", "daemon off;"]
