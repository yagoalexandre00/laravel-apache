FROM php:8-apache

## Atualizando e instalando pacotes necessários
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg git

## Instalando composer
RUN cd ~ && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

## Instalando NodeJS, npm
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install nodejs -y

## Instalando PDO MySQL extension PHP
RUN docker-php-ext-install pdo_mysql

## Criando user Ubuntu
# RUN useradd ubuntu

# RUN chown ubuntu -R /var/www/html

WORKDIR /var/www/html

# USER ubuntu

EXPOSE 8000