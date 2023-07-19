# Use the official PHP image as the base image
FROM php:latest
# Copy the application files into the container
COPY . /var/www/html
# Install application dependencies
#RUN composer install
RUN docker-php-ext-install mysqli
# Expose port 80 for HTTP
EXPOSE 40

# Command to start the PHP server
CMD ["php", "-S", "0.0.0.0:40", "-t", "/var/www/html"]
