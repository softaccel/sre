<?php
require __DIR__ . '/vendor/autoload.php';
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;
$connector = new FilePrintConnector("/dev/usb/lp2");
$printer = new Printer($connector);
$code = 112233112233;

//$printer -> cut();
//$printer -> barcode($code,Printer::BARCODE_UPCA);
//$printer -> text("UPCA\n");
//$printer -> barcode($code,Printer::BARCODE_UPCE);
//$printer -> text("UPCE\n");
//$code = "A111A";
//$printer -> barcode($code,Printer::BARCODE_CODABAR);
//$printer -> text("CODABAR\n");
//$printer -> barcode($code,Printer::BARCODE_CODE39);
//$printer -> text("CODE39\n");
//$printer -> barcode($code,Printer::BARCODE_CODE93);
//$printer -> text("CODE93\n");
//$code = "{A1155A";
//$printer -> barcode($code,Printer::BARCODE_CODE128);
//$printer -> text("CODE128\n");
//
//$code = "1234567";
//$printer -> barcode($code,Printer::BARCODE_JAN8);
//$printer -> text("JAN8\n");
//
//$code = "000001234567";
//$printer -> barcode($code,Printer::BARCODE_JAN13);
//$printer -> text("JAN13\n");
//$printer -> barcode($code,Printer::BARCODE_ITF);
//$printer -> text("ITF\n");

$printer->qrCode("https://softaccel.net",Printer::QR_ECLEVEL_H,5,Printer::QR_MODEL_1);
//$printer->qrCode("https://softaccel.net",Printer::QR_ECLEVEL_M,5);
//$printer->qrCode("https://softaccel.net",Printer::QR_ECLEVEL_Q,5);
//$printer->qrCode("https://softaccel.net",Printer::QR_ECLEVEL_H,5);
//
//$printer->qrCode("https://softaccel.net",Printer::QR_MODEL_1);
//$printer->qrCode("https://softaccel.net",Printer::QR_MODEL_2);
$printer -> close();

