FROM composer/composer as build

# Install composer
WORKDIR /app
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer
COPY composer.json /app
# COPY composer.lock ./
RUN composer install --no-scripts --no-autoloader
# COPY ./ /var/www/
RUN composer dump-autoload --optimize

FROM wordpress:5.1.1-fpm-alpine
# Set our environment variables for logging into wordpress
ENV WORDPRESS_DB_HOST db
ENV WORDPRESS_DB_USER wordpress
ENV WORDPRESS_DB_PASSWORD wordpress

COPY --from=build --chown=www-data /app/wp-content ./wp-content
COPY --chown=www-data ./wp-config.php ./
