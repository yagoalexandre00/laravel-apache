FROM php:8-apache

COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg git

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && \
    apt-get install nodejs -y

RUN docker-php-ext-install pdo_mysql

RUN useradd ubuntu

RUN chown ubuntu -R /var/www/html

WORKDIR /var/www/html

USER ubuntu

EXPOSE 80