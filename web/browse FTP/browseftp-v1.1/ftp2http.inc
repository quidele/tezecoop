<?php
/*****    ftp2http configuration   *****/
$temp_dir="/home/taxiez/public_ftp/incoming";
$_SESSION['dir_fisico_actual'] = "/home/taxiez/";
$root_dir = "/home/taxiez/";
$default_port="21";
/***** ftp2http configuration ends *****/

class FTP2Http
{
	var $_ftp;
	var $isloggedin;
	var $mode;
	
	function FTP2Http()
	{
		session_start();
		register_shutdown_function(array($this,"__destruct"));
		if($_SESSION['ISLOGGEDIN']==1)
		{
		  	$isloggedin=true;
			$server=$_SESSION['SERVER'];
			$port=$_SESSION['PORT'];
			$username=$_SESSION['USER'];
			$password=$_SESSION['PASSWD'];
			if(!$port)$port=$default_port;
			$this->_ftp = ftp_connect($server, $port);
			$login_result = ftp_login($this->_ftp, $username, $password);
			
			$this->mode=$_SESSION['MODE'];
			if(!$this->mode)
				$this->mode=FTP_ASCII;
		
			$pwd=$_SESSION['PWD'];
		//	if(!$pwd)$pwd="/";
			if($pwd)
				ftp_chdir($this->_ftp, $pwd);
			$this->isloggedin=true;
		}
		else
			$this->isloggedin=false;
	}

	function login($server, $port, $username, $password)
	{
		$this->_ftp = ftp_connect($server, $port);
		
		// login with username and password
		$login_result = ftp_login($this->_ftp, $username, $password);
		
		// check connection
		if ($this->_ftp && $login_result)
		{
			$_SESSION['ISLOGGEDIN']=1;
			$_SESSION['SERVER']=$server;
			$_SESSION['PORT']=$port;
			$_SESSION['USER']=$username;
			$_SESSION['PASSWD']=$password;
			$_SESSION['PWD']=ftp_pwd($this->_ftp);
			$_SESSION['MODE']=FTP_ASCII;
			return TRUE;
		}
		return FALSE;//failed
	}
	
	function isLoggedIn(){return $this->isloggedin;}
	
	function binary(){$this->mode=FTP_BINARY;$_SESSION['MODE']=FTP_BINARY;}
	function ascii(){$this->mode=FTP_ASCII;$_SESSION['MODE']=FTP_ASCII;}
	function isbinary(){return($this->mode==FTP_BINARY);}
	function isascii(){return($this->mode==FTP_ASCII);}
	
	function mkdir($dir)
	{
	  	return ftp_mkdir($this->_ftp, $dir);
	}

	function cd($dir)
	{
		ftp_chdir($this->_ftp, $dir);
		$_SESSION['PWD']=ftp_pwd($this->_ftp);
	}
	
	function pwd()
	{
	 	return ftp_pwd($this->_ftp);
	}

	function fileList()
	{
	 	return ftp_nlist($this->_ftp, ".");
	}

	function isDir($file)
	{
		return ftp_size($this->_ftp, $file)==-1?TRUE:FALSE;
	}

	function size($file)
	{
		return ftp_size($file);
	}

	function get($file)
	{
		global $temp_dir;
		$sess_tmp_dir=$temp_dir."/".session_id();
		if(!file_exists($sess_tmp_dir))
		{
			mkdir($sess_tmp_dir);
		}
	  	ftp_get($this->_ftp, "$sess_tmp_dir/$file", $file, $this->mode);
	  	return "$sess_tmp_dir/$file";
	}

	function put($file)
	{
		global $temp_dir;
		$sess_tmp_dir=$temp_dir."/".session_id();
		if(!file_exists($sess_tmp_dir))
		{
			mkdir($sess_tmp_dir);
		}
	  	return ftp_put($this->_ftp, $file, "$sess_tmp_dir/$file", $this->mode);
	}

	function clean($file)
	{
		if(file_exists($file))
		{
			unlink($file);
		}
	}

	function dirBreadCrumb()
	{
		$pathlist=Array();
		$curpath="";
		$dirlist=explode("/", ftp_pwd($this->_ftp));
		foreach($dirlist as $dir)
		{
			$curpath.="$dir/";
			$pathlist[$dir]=$curpath;
		}
		return $pathlist;
	}

	function logout()
	{
		global $temp_dir;
		$sess_tmp_dir=$temp_dir."/".session_id();
		if(file_exists($sess_tmp_dir) && is_dir($sess_tmp_dir))
		{
			rmdir($sess_tmp_dir);
		}

		// kill session variables
		$_SESSION = Array(); // reset session array
		session_destroy();   // destroy session.
	}
		
	function __destruct()
	{
		if($this->_ftp) ftp_close($this->_ftp);
	}
}

?>