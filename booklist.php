<?php

require(__DIR__ . '/classes/book.php');

$book = new Book();

function array_to_xml( $data, $key, &$xml_data ) {
    foreach( $data as $field => $value ) {
    	$tag = $key === null ? $field : $key;
        if( is_array($value) ) {
            $subnode = $xml_data->addChild($tag);
            array_to_xml($value, null, $subnode);
        } else {
            $xml_data->addChild("$tag",htmlspecialchars("$value"));
        }
     }
}


if(!isset($_GET["type"]) || $_GET["type"] == 'categories') {

	$data = $book->listCategories();
	if($_GET["format"] === "json") {
		header('Content-Type: application/json');
		echo json_encode($data);
	} else {
		header('Content-Type: text/xml');
		$xml_data = new SimpleXMLElement('<?xml version="1.0"?><categories></categories>');
		array_to_xml($data, "category", $xml_data);
		echo $xml_data->asXML();
	}
	exit;
}


if($_GET["type"] === "filter" && !empty($_GET["category"])) {

	$data = $book->fetchByCategory($_GET["category"]);

