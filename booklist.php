<?php

require(__DIR__ . '/classes/book.php');

$book = new Book();

function array_to_xml( $data, $key, &$xml_data ) {
    foreach( $data as $field => $value ) {
    	$tag = $key === null ? $field : $key;
        if( is_array($value) ) {