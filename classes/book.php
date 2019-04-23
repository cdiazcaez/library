<?php

require(__DIR__ . '/../connection.php');

class Book {

	public $conn = null;

	public function __construct() {
		$this->conn = Database::getConnection();		
	}

	public function listCategories() {

		$stmt = $this->conn->prepare("SELECT * FROM categories");

		$stmt->execute();

		$categories = $stmt->fetchAll();

		return $categories;
	}

	public function fetchByCategory($category) {
		$stmt = $this->conn->prepare("
			SELECT b.id, b.title, ba.author, bc.category, y.year, bp.price FROM book b
			INNER JOIN book_author ba ON ba.book = b.id
			INNER JOIN book_category bc ON bc.book = b.id
			INNER JOIN book_year y ON y.book = b.id
			INNER JOIN book_price bp ON bp.book = b.id
			WHERE bc.category = ?
		");

		$stmt->execute([$category]);

		$books = $stmt->fetchAll();

		return $books;
	}

	public function add($book) {

		try {

			$this->conn->beginTransaction();

			$stmt = $this->conn->prepare("INSERT INTO book (title) VALUES (:title)");
			$stmt->execute([
				$book["title"]		
			]);

			$stmt = $this->conn->prepare("SET @bookId = LAST_INSERT_ID();");
			$stmt->execute();

			$stmt = $this->conn->prepare("INSERT INTO book_category (book, category) VALUES (@bookId, :category)");
			$stmt->execute([ $book["category"] ]);

			$stmt = $this->conn->prepare("INSERT INTO book_year (book, year) VALUES (@bookId, :year)");
			$stmt->execute([ $book["year"] ]);

			$stmt = $this->conn->prepare("INSERT INTO book_author (book, author) VALUES (@bookId, :author)");
			$stmt->execute([ $book["author"] ]);

			$stmt = $this->conn->prepare("INSERT INTO book_price (book, price) VALUES (@bookId, :price)");
			$stmt->execute([ $book["price"] ]);


			return $this->conn->commit();

} catch(Exception $e) {
			//An exception has occured, which means that one of our database queries failed.
			//Print out the error message.
			echo $e->getMessage();



			//Rollback the transaction.
			$this->conn->rollBack();

			return false;
		}

	}

	public function addCategory($category) {

		$stmt = $this->conn->prepare("INSERT INTO categories (name) VALUES (?)");
		$stmt->execute([ $category ]);

	}

}