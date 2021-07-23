<?php


class XMLtoJSON extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if($_SERVER["REQUEST_METHOD"]!=="POST") {
            die("Invalid HTTP Req Method");
        }

        $tmp = explode(".",$_FILES["file"]["name"]);
        $ext = array_pop($tmp);

        if(strtolower($ext)!=="xml") {
            die("Invalid file");
        }

        $xml = new SimpleXMLElement(file_get_contents($_FILES["file"]["tmp_name"]));
        header("Content-type: application/json");

        $report = (object) get_object_vars($xml->ttXMLReport);
//        print_r($report);
//        die();
        $report->sections = (object)[];

        foreach ($xml->ttXMLSection as $section) {
            $sectionId = (string) $section->SectionId;
            $report->sections->$sectionId = (object) get_object_vars($section);
            $report->sections->$sectionId->fields = [];
        }

        foreach ($xml->ttXMLText as $text) {
            $sectionId = (string) $text->SectionId;
            $report->sections->$sectionId->fields[(string) $text->FieldKey] = ["type"=>"Text","data"=>(string) $text->FieldText];
        }

        foreach ($xml->ttXMLData as $data) {
            $sectionId = (string) $data->SectionId;
            $report->sections->$sectionId->fields[(string) $data->FieldKey] = ["type"=>"data","data"=>(string) $data->FieldData];
        }

        echo json_encode($report,JSON_OBJECT_AS_ARRAY);

    }

}
