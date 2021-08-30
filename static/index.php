<?php
$path = "/spaleck/static/";
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