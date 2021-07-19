<?php

require_once BASEPATH."../application/libraries/HttpResp.php";

/**
 * @property  CI_Upload upload
 * @property  CI_Config config
 * @property  FileApiLibs $fileapilibs
 */
class FileApi extends CI_Controller
{

	private ?string $path;

	public function __construct()
	{
		parent::__construct();
		$this->load->config("FileApi");
		$this->path = $this->config->item("upload_path");
	}

	public function index()
	{
		if ($_SERVER["REQUEST_METHOD"]!=="POST") {
			die("Invalid HTTP Req Method");
		}
	}

	public function upload()
	{

		if (!is_callable('curl_init')) {
			HttpResp::quick(500,null,"Curl not available.");
		}

		// load libraries
		$this->load->library('upload');
		$this->load->library('image_lib');
		$this->load->library('FileApiLibs');

		// set header
		header("Content-type: text/plain");

		// save obj
		$data = [];

		$count = count($_FILES['files']['name']);
		for ($i = 0; $i < $count; $i++) {
			if (!empty($_FILES['files']['name'][$i])) {

				// check if file already exists in DB
				$file_hash = "";
				$jsonData = "";
				if (($_FILES['files']['size'][$i] / 1000)  < 15000) {
					try {
						$fileContent = file_get_contents($_FILES['files']['tmp_name'][$i]);
						$file_hash = hash("sha256", $fileContent);

						$url = $this->config->item("api_root_full") . "/media/?filter=hash=" . $file_hash;
						$jsonData = json_decode(file_get_contents($url));
					} catch (Exception $exception) {
						HttpResp::quick(500,null, $exception->getMessage());
					}
				}

				// if filee does not exist
				if ($jsonData && count($jsonData->data) == 0) {
					// generate fileName
					$filename = "";
					try {
						$filename = $this->fileapilibs->uniqidReal();
					} catch (Exception $exception) {
						HttpResp::quick(500,null, $exception->getMessage());
					}

					// prepare data for saving
					$_FILES['userfile']['name'] = $_FILES['files']['name'][$i];
					$_FILES['userfile']['type'] = $_FILES['files']['type'][$i];
					$_FILES['userfile']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
					$_FILES['userfile']['error'] = $_FILES['files']['error'][$i];
					$_FILES['userfile']['size'] = $_FILES['files']['size'][$i];

					print_r($this->path);
					// check path
					$filePathPart = $this->path . "/" . $filename[0];
					if (!file_exists($filePathPart)) {
						mkdir($filePathPart, 0777, true);
					}
					$filePath = $filePathPart . "/" . $filename[1];
					if (!file_exists($filePath)) {
						mkdir($filePath, 0777, true);
					}

					// save config
					$config['upload_path'] = $filePath;
					$config['allowed_types'] = 'jpg|jpeg|png|gif|html';
					$config['max_size'] = '25000';
					$config['file_name'] = $filename;

					$this->upload->initialize($config);

					// save
					if ($this->upload->do_upload('userfile')) {
						$uploadData = $this->upload->data();

						// create thumbnail
						$thumbnail_path = "";
						if (strpos($_FILES['userfile']['type'], "image") !== false) {
							try {
								$thumbnail_path = $this->fileapilibs->resizeImage($this, $uploadData['file_path'], $uploadData['file_name']);
							} catch (Exception $exception) {
								HttpResp::quick(500,null, $exception->getMessage());
							}
						}

						// add return data
						$data['data'][$i]['attributes']['uuid'] = $uploadData['raw_name'];
						$data['data'][$i]['attributes']['original_name'] = $_FILES['userfile']['name'];
						$data['data'][$i]['attributes']['path'] = $uploadData['full_path'];
						$data['data'][$i]['attributes']['thumbnail_path'] = $thumbnail_path;
						$data['data'][$i]['attributes']['hash'] = $file_hash;
						$data['data'][$i]['attributes']['size'] = round($uploadData['file_size'], 0);
						$data['data'][$i]['attributes']['mime_type'] = $_FILES['userfile']['type'];

					} else {
						$error = array('error' => $this->upload->display_errors());
						HttpResp::quick(500,null, $error);
					}
				}
			}
		}

		if ($data) {
			$url = $this->config->item("api_root_full"). "/media";
			$ch = curl_init($url);
			$payload = json_encode($data);

			curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
			curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/vnd.api+json'));
			curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );

			$result = "";
			try {
				$result = curl_exec($ch);
			} catch (Exception $exception) {
				HttpResp::quick(500,null, $exception->getMessage());
			}

			curl_close($ch);
		}
		print_r($data);
		HttpResp::quick(200,null, "ok");

	}

	public function delete() {
		print_r($_GET["id"]);
	}

}
