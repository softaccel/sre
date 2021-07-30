<?php

require_once BASEPATH."../application/libraries/HttpResp.php";

/**
 * @property  CI_Upload upload
 * @property  CI_Config config
 * @property  FileApiLibs $fileapilibs
 * @property  HttpReq httpreq
 * @property  CI_Image_lib image_lib
 */
class FileApi extends CI_Controller
{

	private ?string $path;

	public function __construct()
	{

		parent::__construct();
		$this->load->library('HttpReq');
		header("Content-type: text/plain");
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

		// send to DB
		$data = [
			"data"=>[]
		];

		// response to client
		$uploadedFiles = [];

		// save config
		$config = [
			'allowed_types' => 'jpg|jpeg|png|gif|html',
			'max_size' => '25000'
		];
		$errors = [];

		$count = count($_FILES['files']['name']);
		for ($i = 0; $i < $count; $i++) {
			if (empty($_FILES['files']['name'][$i])) {
				continue;
			}
			// check if file already exists in DB
			$file_hash = null;
			if (($_FILES['files']['size'][$i] / 1000)  < 15000) {
				$fileContent = file_get_contents($_FILES['files']['tmp_name'][$i]);
				$file_hash = hash("sha256", $fileContent);

				$url = $this->config->item("api_root_full") . "/media/?filter=hash=" . $file_hash;
				$response = $this->httpreq->init($url)->send(@json_decode);
				if(!$response) {
					HttpResp::quick(500,null,"DBAPI error: ".print_r($this->httpreq->get_info(),1));
				}

				if($response && $response->data && $response->data[0]->id) {
					$uploadedFiles[] = $response->data;
					continue;
				}
			}

			// generate fileName
			$filename = "";
			try {
				$filename = $this->fileapilibs->uniqidReal();
			} catch (Exception $exception) {
				HttpResp::quick(500,null, $exception->getMessage());
			}

			// prepare data for saving
			$_FILES['userfile'] = [
				'name' => $_FILES['files']['name'][$i],
				'type' => $_FILES['files']['type'][$i],
				'tmp_name' => $_FILES['files']['tmp_name'][$i],
				'error' => $_FILES['files']['error'][$i],
				'size' => $_FILES['files']['size'][$i]
			];

//			print_r($this->path);
			// check and create path
			$filePathPart = $this->path . "/" . $filename[0];
			if (!file_exists($filePathPart)) {
				mkdir($filePathPart, 0755, true);
			}

			$filePath = $filePathPart . "/" . $filename[1];
			if (!file_exists($filePath)) {
				mkdir($filePath, 0755, true);
			}


			$config['upload_path'] = $filePath;
			$config['file_name'] = $filename;
			$this->upload->initialize($config);

			// save
			if (!$this->upload->do_upload('userfile')) {
				$error = array('error' => $this->upload->display_errors());
				HttpResp::json_out(500, $error);
			}
			$uploadData = $this->upload->data();
//			print_r($uploadData);

			// create thumbnail
			$thumbnail_path = "";
			if (strpos($_FILES['userfile']['type'], "image") !== false) {
				try {
					$thumbnail_path = $this->fileapilibs->resizeImage($this->image_lib, $uploadData['file_path'], $uploadData['file_name']);
				} catch (Exception $exception) {
					HttpResp::quick(500,null, $exception->getMessage());
				}
			}

			// add return data
			$item= [
				"attributes" => [
					'original_name' => $_FILES['userfile']['name'],
					'path' => $uploadData['full_path'],
					'thumbnail_path' => $thumbnail_path,
					'uuid' => $uploadData['raw_name'],
					'hash' => $file_hash,
					'size' => round($uploadData['file_size'], 0),
					'mime_type' => $_FILES['userfile']['type']
				]
			];
			$data['data'][] = $item;

		}
		$encoded = json_encode($data);

		if ($data["data"]) {

			$result = $this->httpreq->init($this->config->item("api_root_full"). "/media")
				->set_method("POST")
				->set_headers(['Content-Type:application/vnd.api+json'])
				->set_data($encoded)
				->send(@json_decode);

			if(!$result || !$result->data) {
				$errors[] = [
					[
						"error"=>json_encode($this->httpreq->get_info())
					]
				];
			}
			else {
//				$result = json_decode($result);
				array_splice($uploadedFiles,0,0,$result->data);
			}

		}
//		print_r($data);
		$resp = [
			"data"=>$uploadedFiles,
			"meta"=>[
				"total" => count($uploadedFiles)
			]
		];
		if($errors) {
			$resp["errors"] = $errors;
		}
		HttpResp::json_out(200,json_encode($resp));

	}

	public function delete() {
		print_r($_GET["id"]);
	}

	function get($id,$tn=false)
	{
		$result = $this->httpreq->init($this->config->item("api_root_full"). "/media/$id")
			->set_method("GET")
			->set_headers(['Content-Type:application/vnd.api+json'])
			->send(@json_decode);
//		print_r($result);
		header("Content-type: {$result->data->attributes->mime_type}");
		if(!$tn) {
			header("Content-Disposition: attachment; filename={$result->data->attributes->original_name}");
			echo file_get_contents($result->data->attributes->path);
		}
		header("Content-Disposition: attachment; filename=tn_{$result->data->attributes->original_name}");
		echo file_get_contents($result->data->attributes->thumbnail_path);
	}

}
