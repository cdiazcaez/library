# Database .sql files

dump.sql contains the DB structure empty

books.sql contains both the DB structure and Data
##################
# Seed
If you are using the DB empty
There's a `seed.php` file in the root, that will seed the database with books.
After you have created the database, using `dump.sql` run the following command:
```
php seed.php
```
This command should be executed once. 

# Credentials 

Note: Credentials to reach DB are in connection.php file 

		$host = '127.0.0.1';
		$db   = 'books';
		$user = 'root';
		$pass = '';
		$charset = 'utf8mb4';
