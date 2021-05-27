<?php
require_once __DIR__."/../../vendor/autoload.php";

use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;

require_once __DIR__."/../../vendor/softaccel/epd/Document.php";
use Softaccel\Epd\Document;

/**
 * @param $printer Printer
 */
function shutdown($printer) {
//	$printer->close();
}

/**
 * @property  CI_Config config
 */
class POS extends CI_Controller
{
	private $printer;

	function __construct()
	{
		parent::__construct();
		$this->load->config("pos",true);


	}

	private function connect2printer($printerUri=null)
	{
		$this->load->config("pos",true);
		$printerUri = $printerUri?$printerUri:$this->config->item("pos")["printer_uri"];
		try {

			$connector = new FilePrintConnector($printerUri);
		} catch (Exception $e) {
			print_r($e);
		}
		if(!$connector) {
			die("Cannot connect to printer");
		}
		$this->printer = new Printer($connector);
		register_shutdown_function('shutdown',$this->printer);
	}

	function print($printerUri=null)
	{
		$this->connect2printer($printerUri?urldecode($printerUri):null);

		if($_SERVER["REQUEST_METHOD"]!=="POST")
		{
			die("Invalid method");
		}
		$input = file_get_contents('php://input');

		Document::load($input)->set_printer($this->printer)->print();
//		$this->printer -> text("Hello World!\n");
//		$this->printer -> cut();
		$this->printer -> close();

	}
}
