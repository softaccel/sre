<?php

$json = file_get_contents("php://input");
$data = json_decode($json);
print_r($data);