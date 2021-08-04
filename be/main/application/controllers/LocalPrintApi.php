<?php

require_once BASEPATH."../application/libraries/HttpResp.php";

/**
 * @property HttpReq httpreq
 * @property  FileApiLibs $fileapilibs
 */
class LocalPrintApi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('HttpReq');
		$this->load->library('FileApiLibs');
	}

	public function print() {

		function create_label($title, $bn, $nc, $zn, $tn, $seqNo, $barcode): string
		{

			$titleSplit = [
				substr($title, 0, 38),
				substr($title,38, 38),
				substr($title,76, 38),
				substr($title,114, 38)
			];

			return "^XA
^FX Second section with recipient address and permit information.
^CFA,25
^FO75,25,0^FD$titleSplit[0]^FS
^FO75,50,0^FD$titleSplit[1]^FS
^FO75,75,0^FD$titleSplit[2]^FS
^FO75,100,0^FD$titleSplit[3]^FS

^CFA,30

^FO75,150,0^FDBN: ${bn}^FS
^FO75,175,0^FDNC: ${nc}^FS
^FO75,200,0^FDZN: ${zn}^FS
^FO75,225,0^FDTN: ${tn}^FS
^FO75,250,0^FDSEQ: ${seqNo}^FS


^BY2,3.0,150
^FO750,145,1^BCN,90,Y,N,N^FD${barcode}^FS
^XZ";

		}

		$testien = file_get_contents('php://input');
		var_dump($testien);
		$json = $testien;
		$data = "";
		try {
			$data = json_decode($json);
		} catch (Exception $exception) {
			HttpResp::quick(500,null, $exception->getMessage());
		}

		$dir = substr(getcwd(), 0, strlen(getcwd())  - 5);
		foreach ($data->labels as $label) {
			foreach ($label->seqs as $seq) {
				$labelText = create_label (
					$label->title,
					$label->belegNum,
					$label->docNum,
					$label->designId,
					$label->partId,
					$seq->seq . " / " . $label->itemTotal,
					$seq->barcode
				);

				try {
					file_put_contents($dir . "/label.zpl", $labelText);
					shell_exec("bash " . $dir . "/print_script.sh");
				} catch (Exception $exception) {
					HttpResp::quick(500,null, $exception->getMessage());
				}

			}

		}
	}
}
