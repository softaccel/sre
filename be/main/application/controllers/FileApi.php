<?php

/**
 * @property  CI_Upload upload
 */
class FileApi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		if ($_SERVER["REQUEST_METHOD"]!=="POST") {
			die("Invalid HTTP Req Method");
		}
	}

	public function upload()
	{
		header("Content-type: text/plain");
		$config['upload_path']          = '/tmp';
		$config['allowed_types']        = 'gif|jpg|png|html';
		$config['max_size']             = 100;
		$config['max_width']            = 1024;
		$config['max_height']           = 768;

		$this->load->library('upload', $config);

		$url = $this->config->item("api_root_full")."/inventory_meta/?";

		$data = json_decode(file_get_contents($url));
		//print_r($data);
		print_r($data->data[0]);
		if ($data && $data->data[0]) {
			$jsonData = json_decode($data->data[0]->attributes->meta_val);
		}

		if (!$this->upload->do_upload('file'))
		{
			$error = array('error' => $this->upload->display_errors());
			//print_r($error);
		}
		else
		{
			$data = array('upload_data' => $this->upload->data());
			//print_r($data);
		}
	}

}
