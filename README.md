# php-laravel-win

http://laravel.com/docs/5.1/migrations#introduction
php artisan make:migration create_users_table

cd test

# Edit to use sqlite instead of mysql config/database.php:

    'default' => env('DB_CONNECTION', 'sqlite'),

PATH=`pwd`/../phpwin/php:$PATH; PATH=`pwd`/../phpwin:$PATH
# http://laravel.com/docs/5.1/migrations#introduction
touch storage/database.sqlite
php artisan migrate --force
php artisan migrate:rollback --force
php artisan migrate:reset --force