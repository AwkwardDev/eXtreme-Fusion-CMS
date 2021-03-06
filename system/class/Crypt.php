<?php
/***********************************************************
| eXtreme-Fusion 5.0 Beta 5
| Content Management System       
|
| Copyright (c) 2005-2012 eXtreme-Fusion Crew                	 
| http://extreme-fusion.org/                               		 
|
| This product is licensed under the BSD License.				 
| http://extreme-fusion.org/ef5/license/						 
***********************************************************/

/**
 * Przyk�ad dzia�ania:
 *
	// Drugi parametr koniecznie 8 znak�w.
	$c = new Crypt('klucz szyfruj�cy', '=thn<.?!');

	echo $e = $c->encrypt('test');
	echo $c->decrypt($e);
 *
 */
class Crypt
{
	protected $_key;
	protected $_cipher;
	protected $_mode;
	protected $_source;
	protected $_iv;

	/**
	 * Przy pomini�ciu drugiego parametru, kodowanie udbywa si� w jedn� stron�.
	 * Wektor inicjuj�cy `iv` jest zmienny z prze�adowaniem strony.

	 * Je�li dane maj� by� rozkodowane w przysz�o�ci, nale�y posiada� sta�y wektor inicjuj�cy i poda� go drugim parametrem.
	 * Niezmienny musi by� te� `key` - klucz szyfruj�cy.
	 */
	public function __construct($key, $iv = NULL, $cipher = MCRYPT_BLOWFISH, $mode = MCRYPT_MODE_CBC, $source = MCRYPT_DEV_URANDOM)
	{
		$this->_key = $key;
		$this->_cipher = $cipher;
		$this->_mode = $mode;
		$this->_source = $source;

		$this->setIv($iv);
	}

	public function setIv($iv = NULL)
	{
		if ($iv !== NULL)
		{
			$this->_iv = $iv;
		}
		else
		{
			$this->_iv = mcrypt_create_iv(mcrypt_get_iv_size($this->_cipher, $this->_mode), $this->_source);
		}
	}

	public function encrypt($data)
	{
		return base64_encode(mcrypt_encrypt($this->_cipher, $this->_key, $data, $this->_mode, $this->_iv));
	}

	public function decrypt($data)
	{
		return mcrypt_decrypt($this->_cipher, $this->_key, base64_decode($data), $this->_mode, $this->_iv);
	}
	
	public function correctAnswer($user_answer, $answer)
	{
		return trim($user_answer) === trim($this->decrypt($answer));
	}
}