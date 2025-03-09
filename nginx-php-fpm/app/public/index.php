<?php

$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);
$query = $_SERVER['QUERY_STRING'];
$method = $_SERVER['REQUEST_METHOD'];
print($method . PHP_EOL);
print($path . PHP_EOL);
print_r($query. PHP_EOL);

