FROM nginx:1.27.0-alpine

COPY nginx.conf /etc/nginx/nginx.conf



COPY ./dist/my-angular-app/browser /usr/share/nginx/html
