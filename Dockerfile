# Use an official PHP image as the base image
FROM my-php-app

# Set the working directory 
WORKDIR /var/www/html

# Copy the PHP application files
COPY . /var/www/html

# Install PHP extensions and other dependencies required by Liberatube

RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install pdo pdo_mysql gd mysqli

# # Start the PHP built-in web server when the container starts
CMD ["php", "-S", "0.0.0.0:80"]
