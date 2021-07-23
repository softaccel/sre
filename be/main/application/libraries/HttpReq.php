<?php
class HttpReq {
	/**
	 * @var false|CurlHandle
	 */
	private $ch;

	function __construct()
	{

	}

	function init($url)
	{
		$this->ch = curl_init();
		$this->return_transfer(true);
		if($url) {
			$this->set_url($url);
		}

		return $this;
	}

	function set_url($url)
	{
		curl_setopt($this->ch, CURLOPT_URL,$url);

	}
	function set_headers($header)
	{
		curl_setopt($this->ch, CURLOPT_HTTPHEADER, $header);
		return $this;
	}

	function set_method($method)
	{
		curl_setopt($this->ch, CURLOPT_CUSTOMREQUEST, $method);
		return $this;
	}

	function set_data($data)
	{
		curl_setopt($this->ch, CURLOPT_POSTFIELDS, $data);
		return $this;
	}
	function set_opts($opts)
	{
		curl_setopt_array($this->ch,$opts);
		return $this;
	}

	function set_opt($opt,$value)
	{
		curl_setopt($this->ch,$opt,$value);
		return $this;
	}

	function return_transfer($rt)
	{
		$this->set_opt(CURLOPT_RETURNTRANSFER,$rt);
		return $this;
	}

	function get_info()
	{
		return curl_getinfo($this->ch);
	}

	function send($callback=null)
	{
		$res = curl_exec($this->ch);
		if($callback && is_callable($callback)) {
			return $callback($res);
		}
		return  $res;
	}

	function close()
	{
		curl_close($this->ch);
	}
}
