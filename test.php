<?php


function groupByOwners(array $files) : array
{
    $owners = [];
    foreach($files as $file=>$owner) {
        echo $file."-".$owner;
        if(!isset($owners[$owner])) {
            $owners[$owner] = [];
        }
        $owners[$owner][] = $file;
    }
    return $owners;
}

$files = array
(
    "Input.txt" => "Randy",
    "Code.py" => "Stan",
    "Output.txt" => "Randy"
);
var_dump(groupByOwners($files));