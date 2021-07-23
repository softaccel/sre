<?php

class FileApiLibs
{

	// random uid generator
	/**
	 * @param int $lenght
	 * @return false|string
	 * @throws Exception
	 */
	public function uniqidReal(int $lenght = 13) {
		// uniqid gives 13 chars, but you could adjust it to your needs.
		if (function_exists("random_bytes")) {
			$bytes = random_bytes(ceil($lenght / 2));
		} elseif (function_exists("openssl_random_pseudo_bytes")) {
			$bytes = openssl_random_pseudo_bytes(ceil($lenght / 2));
		} else {
			throw new Exception("No cryptographically secure random function available.");
		}
		return substr(bin2hex($bytes), 0, $lenght);
	}

	// thumbnail creator
	public function resizeImage($image_lib, $file_path, $file_name): string {

		// check extension
		if (!extension_loaded('gd')) {
			throw new Exception("GD extension not available.");
		}

		$target_directory = $file_path . "tn/";
		if (!file_exists($target_directory)) {
			mkdir($target_directory, 0777, true);
		}

		$target_path = $target_directory . "tn_" . $file_name;
		$config_manip = array(
			'image_library' => 'gd',
			'source_image' => $file_path . $file_name,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => TRUE,
			'thumb_marker' => '',
			'width' => 200,
			'height' => 200
		);

		$image_lib->initialize($config_manip);
		if (!$image_lib->resize()) {
			throw new Exception($image_lib->display_errors());
		}

		return $target_path;

	}

}
