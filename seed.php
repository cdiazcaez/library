<?php

require(__DIR__ . '/classes/book.php');

$categories = ["Children", "Computers", "Finance"];

$books = [
	[
		"title" => "Goodnight Moon",
		"category" => "Children",
		"year" => 1999,
		"author" => "Mark",
		"price" => 22.43
	],

	[
		"title" => "Web Programming II",
		"category" => "Computers",
		"year" => 1998,
		"author" => "Jose",
		"price" => 122.43
	],
        [
		"title" => "Million",
		"category" => "Finance",
		"year" => 2003,
		"author" => "Andres",
		"price" => 99.99
	],

	[
		"title" => "Database II",
		"category" => "Computers",
		"year" => 2002,
		"author" => "Anderson",
		"price" => 272.43
	],
	[
		"title" => "Madeline",
		"category" => "Children",
		"year" => 1998,
		"author" => "Ludwig",
		"price" => 22.43
	],

	[
		"title" => "Trump",
		"category" => "Finance",
		"year" => 2005,
		"author" => "Bemelmans",
		"price" => 22.43
	],
        [
		"title" => "The Rainbow Fish",
		"category" => "Children",
		"year" => 1989,
		"author" => "Mark",
		"price" => 14.88
	],

	[
		"title" => "Microprocessors",
		"category" => "Computers",
		"year" => 2004,
		"author" => "Mark",
		"price" => 234.99
	],
        [
		"title" => "Bankrupt",
		"category" => "Finance",
		"year" => 2013,
		"author" => "Mark",
		"price" => 300.00
	],

	[
		"title" => "Hardware",
		"category" => "Computers",
		"year" => 1996,
		"author" => "Mark",
		"price" => 40.95
	],
    
    	[
		"title" => "Mickey Mouse ",
		"category" => "Children",
		"year" => 2005,
		"author" => "Disney",
		"price" => 15.95
	],

	[
		"title" => "Elements of Computing",
		"category" => "Computers",
		"year" => 2009,
		"author" => "Albert",
		"price" => 222.43
	],
        [
		"title" => "The Billion ",
		"category" => "Finance",
		"year" => 2004,
		"author" => "Smith",
		"price" => 44.99
	],

	[
		"title" => "Algorithms",
		"category" => "Computers",
		"year" => 1992,
		"author" => "Sastry",
		"price" => 200.00
	],
	[
		"title" => "Petter Rabbit",
		"category" => "Children",
		"year" => 2007,
		"author" => "Joe",
		"price" => 22.43
	],

	[
		"title" => "Investor",
		"category" => "Finance",
		"year" => 2006,
		"author" => "Jonathan",
		"price" => 134.60
	],
        [
		"title" => "Peter and Wendy",
		"category" => "Children",
		"year" => 1970,
		"author" => "Ferdinand",
		"price" => 16.97
	],

	[
		"title" => "Hackers",
		"category" => "Computers",
		"year" => 207,
		"author" => "Jintong",
		"price" => 300.99
	],
        [
		"title" => "The Best Seller",
		"category" => "Finance",
		"year" => 2017,
		"author" => "Gaudier",
		"price" => 85.00
	],

	[
		"title" => "Python",
		"category" => "Computers",
		"year" => 2016,
		"author" => "McCornick",
		"price" => 60.90
	]
    
    
];

$book = new Book();

foreach($categories as $category) {
	$book->addCategory($category);
}

foreach($books as $item) {
	$book->add($item);
}


