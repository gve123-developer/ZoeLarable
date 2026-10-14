# Stage 1: Build React Frontend
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve React frontend and PHP API using PHP-Apache
FROM php:8.2-apache

# Install PostgreSQL PDO extension and dependencies required for database connection
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite for React SPA client-side routing
RUN a2enmod rewrite \
    && sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

# Copy Apache virtual host configuration
COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Copy built React static assets to Apache web root
COPY --from=build /app/dist /var/www/html

# Copy PHP APIs, includes, and dependencies
COPY --from=build /app/api /var/www/html/api
COPY --from=build /app/includes /var/www/html/includes
COPY --from=build /app/PHPMailer /var/www/html/PHPMailer

# Copy SPA .htaccess to web root
COPY docker/.htaccess /var/www/html/.htaccess

# Ensure proper permissions for Apache
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
