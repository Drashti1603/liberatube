FROM php:8.0-fpm
WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nginx \
        libpng-dev \
    && docker-php-ext-install pdo pdo_mysql gd \
    && rm -rf /var/lib/apt/lists/*
COPY . .
COPY nginx/default.conf /etc/nginx/sites-available/default
EXPOSE 80
CMD service php8.0-fpm start && nginx -g "daemon off;"
