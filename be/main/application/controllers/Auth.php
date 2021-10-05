<?php

require_once BASEPATH."../application/libraries/HttpResp.php";

class Auth extends CI_Controller
{
	/**
	 * Generates a web token
	 * @param bool $outputToClient flag to be used
	 * @return string
	 */
	private function jwt($jwtPayload,$outputToClient=true)
	{
		$this->load->library("JWT");

		$jwt = JWT::encode($jwtPayload,
			$this->config->item("jwt_enc_key"),
			$this->config->item("jwt_enc_algo"));

		if($outputToClient) echo $jwt;

		return $jwt;
	}

	/**
	 * authenticate user
	 * returns 204 when user has been authenticated
	 * returns 405 when HTTP method != POST
	 * returns 400 where user ID or password not provided
	 * returns 404 when user not found
	 * @param bool $internalCall
	 * @param array|null $loginData
	 */
	function login($internalCall=false,$loginData=null)
	{
		if(!$internalCall && $_SERVER["REQUEST_METHOD"]!=="POST")
			HttpResp::quick(405,null,"Method not allowed");

		if(!$internalCall) {
			$loginData = $this->input->post();
		}

		if(empty($loginData["login"]))
			HttpResp::quick(400,null,"Please provide a valid login");
		$login = $loginData["login"];

		if(empty($loginData["password"]))
			HttpResp::quick(400,null,"Empty passwords not allowed. Please provide a password");

		/**
		 * @var CI_DB_driver
		 */
		$url = $this->config->item("dbapi_url")."/__call__/login";
//		$url = "http://localhost/dbapi/v2/spaleck/__call__/login";

		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_POST, 1);
		$reqParams = [
			[
				"name"=>"uid",
				"dir"=>"in",
				"value"=>$login
			],
			[
				"name"=>"pass",
				"dir"=>"in",
				"value"=>$loginData["password"]
			],
			[
				"name"=>"cnt",
				"dir"=>"out"
			]
		];
		curl_setopt($ch, CURLOPT_POSTFIELDS,json_encode($reqParams));
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$server_output = curl_exec($ch);
		curl_close ($ch);
		$res = json_decode($server_output);
		if($res->cnt!=="1") {
			log_message("debug",$server_output);
			log_message("debug",$url);
			log_message("debug",json_encode($reqParams));
			HttpResp::not_authorized();
		}

		// add include rights
		$data = json_decode(file_get_contents($this->config->item("dbapi_url")."/users/$login"));

		$record = $data->data;


		$this->load->config("jwt");
		$jwtPayload = [
			"sub"=>$login,
			"unm"=>$record->attributes->fname,
			"level"=>$record->attributes->level,
			"exp"=>time()+$this->config->item("jwt_exp")
		];


		$jwt = $this->jwt($jwtPayload,false);

		HttpResp::init()
			->header("Authorization","Bearer $jwt")
			->response_code(200)
			->content_type("application/json")
			->body(json_encode(["jwt"=>$jwt]))
			->output();
	}

//	/**
//	 *
//	 */
//	function logout()
//	{
//		$this->session->sess_destroy();
//		HttpResp::redirect($this->base_path,303);
//	}

}
