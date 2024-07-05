FROM nginx:1.27.0-alpine

COPY ./dist/my-angular-app /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
