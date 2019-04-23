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
