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
		$url = $this->config->item("api_root_full")."/users/$login?filter=active=1&include=groups";

		$data = json_decode(file_get_contents($url));
//		print_r($data);

		if(!$data->data) {
			HttpResp::not_found();
		}

		$record = $data->data;
		if(!password_verify($loginData["password"],$record->attributes->password)) {
			HttpResp::not_found("Username or password do no match");
		}
		$grps = [];
		foreach ($record->relationships->groups->data as $grp) {
			$grps[] = $grp->id;
		}
		$this->load->config("jwt");
		$jwtPayload = [
			"sub"=>$login,
			"unm"=>$record->attributes->fname,
			"grps"=>$grps,
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
