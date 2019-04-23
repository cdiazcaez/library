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
