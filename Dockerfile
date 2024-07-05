# Stage 1: Build the Angular app
FROM node:current-alpine3.20 AS build

RUN mkdir -p /app 
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app/
RUN npm install

# Copy the rest of the application and build
COPY . /app/
RUN npm run build --prod

# Add a command to verify files in /app/dist/my-angular-app
RUN ls -l /app/dist/my-angular-app

# Stage 2: Final Stage
FROM nginx:1.27.0-alpine

# Copy built Angular app from previous stage
COPY --from=build /app/dist/my-angular-app /usr/share/nginx/html

# Add a command to verify files in /usr/share/nginx/html
RUN ls -l /usr/share/nginx/html

# Optionally, you can add other configuration or checks here

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
