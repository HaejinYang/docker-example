<?php

//include __DIR__ . '/../src/app.php';
//echo phpinfo();

$user = "user";
$password = "password";

try {
    // from contaienr to host
    $dbh = new PDO('mysql:host=host.docker.internal;dbname=laravel;', $user, $password);
} catch (PDOException $e) {
    echo $e->getMessage() .PHP_EOL;
}

echo "success";