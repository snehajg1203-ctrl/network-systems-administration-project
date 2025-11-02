# Base image
FROM nginx:latest

# Copy your custom webpage into nginx's default html directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
