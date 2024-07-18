# # Use an official Nginx runtime as a parent image 
# FROM nginx:1.21.3
# # Copy custom configuration file from the current directory
# WORKDIR /DEMO-NGINX
# # Expose port 80 to allow outside access to Nginx 

# # Start Nginx when the container launches 
FROM nginx:alpine

COPY usr.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/