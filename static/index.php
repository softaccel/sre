<?php

$tmp = @file_get_contents(__DIR__."/../environments.json");
if(!$tmp) {
    http_response_code(500);
    die("No environments file found");
}
$envs = json_decode($tmp);
if(json_last_error()) {
    http_response_code(500);
    die("Invalid environments file");
}

$tmp = @file_get_contents(__DIR__."/../active_env.json");
if(!$tmp) {
    http_response_code(500);
    die("No active env file found");
}
$tmp = json_decode($tmp);
if(json_last_error()) {
    http_response_code(500);
    die("Invalid active env file");
}
$active = $tmp->active;
if(!@$envs->$active) {
    http_response_code(500);
    die("Invalid environment selection from index");
}


$path = parse_url($envs->$active->baseUrl."/static/")["path"];
$tmp = explode($path,$_SERVER["REQUEST_URI"]);

if(!empty($tmp[0])) {
    http_response_code(500);
    die("Invalid call path");
}

//print_r($tmp);
$file = empty($tmp[1]) ? "index.html" : explode("?",$tmp[1])[0];
//echo $file;
if(file_exists($file)) {
    echo file_get_contents($file);
}

