# Stage 1: Build Stage
FROM node:latest AS build-stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Angular app in production mode
RUN npm run build --prod

# Debugging step to check the contents of the dist directory
RUN ls -al /app/dist
RUN ls -al /app/dist/angular-app

# Stage 2: Deployment Stage
FROM nginx:alpine

# Copy the built app from the build stage to the nginx server
COPY --from=build-stage /app/dist/angular-app /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the Angular app using nginx server
CMD ["nginx", "-g", "daemon off;"]
