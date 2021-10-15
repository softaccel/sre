<?php
$active = json_decode(file_get_contents(__DIR__."/../../active_env.json"));
$envs = json_decode(file_get_contents(__DIR__."/../../environments.json"));
$env = $envs->{$active->active};

$url = $env->beDBapiUrl."/__call__/stop_tt";
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL,$url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,[]);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec($ch);
curl_close ($ch);

