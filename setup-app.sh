#!/bin/bash

composer install
composer update
php artisan key:generate
npm install
npm run build
php artisan migrate
php artisan db:seed --class=DBSeeder  
php artisan serve