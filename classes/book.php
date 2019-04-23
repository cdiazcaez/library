<?php

require(__DIR__ . '/../connection.php');

class Book {

	public $conn = null;

	public function __construct() {
		$this->conn = Database::getConnection();		
	}

