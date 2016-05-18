<?php

require("ftp2http.inc");


$ftpObj=new FTP2Http();

$action=$_REQUEST['action'];

function listFiles($ftpObj)
{
	
	
	if($ftpObj->pwd()!="/")
		echo "<a href='/pages/ftp2http_v1?action=cd&ndir=..'>Previous Dir</a><BR>";
	
	echo "<BR>Directorio Actual Fisico: ".$_SESSION['dir_fisico_actual']."</BR>";
	
	$files=$ftpObj->fileList();
	foreach($files as $file)
	{
	if($ftpObj->isDir($file)){
		echo "<a href='/pages/ftp2http_v1?action=cd&ndir=$file'>$file</a><BR>";
	}else
		echo "<a href='/pages/ftp2http_v1?action=download&file=$file'>$file</a><BR>";
	}
?>
    <form name='newdirform' method='post' action='<? echo "/pages/ftp2http_v1"; ?>' >
    <input type='text' name='newdir'>
    <input type='hidden' name='action' value='mkdir'>
    <input type='submit' value='Create Dir'>
    </form>

    <form name="tmodeform" method='post' action='<? echo "/pages/ftp2http_v1"; ?>' >
    	<input type="radio" name="action" value="binary" <? if ($ftpObj->isbinary()) echo "checked"; ?> onclick="tmodeform.submit();">binary
    	<input type="radio" name="action" value="ascii" <? if ($ftpObj->isascii()) echo "checked"; ?> onclick="tmodeform.submit();">ascii
    </form>
    
<?
}

if($ftpObj->isLoggedIn())
{
	if($action=='logout')
	{
	  $ftpObj->logout();
	  header('Location: '."/pages/ftp2http_v1");
	  exit;
	}
//already logged in.

	if($action=='cd')
	{
		
	  $ndir=$_REQUEST['ndir'];
	  
	  /*if($ndir=="..")
	  {
		$dir_anterior = dirname($ndir);
		$_SESSION['dir_fisico_actual'] = $dir_anterior;
	  }
 	  else
		$_SESSION['dir_fisico_actual'] = $_SESSION['dir_fisico_actual']."/".$ndir;  
	  */
	  $ftpObj->cd($ndir);
	  listFiles($ftpObj);
	}
	elseif($action=='download')
	{
		$file_name=$_REQUEST['file'];
		$tmp_file=$ftpObj->get($file_name);
		header("Content-Disposition: attachment; filename=".$file_name);
		readfile($tmp_file);
		$ftpObj->clean($tmp_file);
		exit;
	}
	elseif($action=='mkdir')
	{
		$newdir=$_REQUEST['newdir'];
		$ftpObj->mkdir($newdir);
	        listFiles($ftpObj);
	}
	elseif($action=='binary')
	{
		$ftpObj->binary();
	        listFiles($ftpObj);
	}
	elseif($action=='ascii')
	{
		$ftpObj->ascii();
	        listFiles($ftpObj);
	}
	elseif($action=='upload')
	{
		echo "<BR>Directorio Fisico: ".$_SESSION['dir_fisico_actual']."</BR>";
    ?>
      <form action="" method="post" enctype="multipart/form-data">
      <p>Files:
    <?
      for($i=0;$i<3;$i++)
      {
        echo "<input type=\"file\" name=\"uploadfile[]\" />";
      }
    ?>
      <input type="submit" value="Upload" />
      </p>
      <input type='hidden' name='action' value='save'>
      </form>
    <?
	}
	elseif($action=='save')
	{
        foreach ($_FILES["uploadfile"]["error"] as $key => $error)
        {
           if ($error == UPLOAD_ERR_OK)
           {
                $tmp_name = $_FILES["uploadfile"]["tmp_name"][$key];
                $name = $_FILES["uploadfile"]["name"][$key];
        		// comentada por Elises $sess_tmp_dir=$temp_dir."/".session_id();
				// $sess_tmp_dir = $ndir; // grabara el archivo donde se este situado
        		$sess_tmp_dir = $dir_fisico_actual;
				
				if(!file_exists($sess_tmp_dir))
        		{
        			mkdir($sess_tmp_dir);
        		}
                move_uploaded_file($tmp_name, "$sess_tmp_dir/$name");
                $ftpObj->put($name);
           }
        }

    }

	if(!isset($action))
	{
	  listFiles($ftpObj);
	}
    echo "<br><a href='/pages/ftp2http_v1?action=logout'>logout</a>";
}
else
{
    if($action=='login')
    {
    	$server=$_REQUEST['server'];
    	$port=$_REQUEST['port'];
    	$username=$_REQUEST['username'];
    	$password=$_REQUEST['password'];
      	$ftpObj->login($server, $port, $username, $password);
    	listFiles($ftpObj);
    }
    else
    {
    ?>
    	<form name='ftpform' method='post' action='<?php echo "/pages/ftp2http_v1"; ?>'>
    		Server <input type='text' name='server'><br><br>
    		Port <input type='text' name='port' value='21'><br><br>
    		User <input type='text' name='username'><br><br>
    		Password <input type='password' name='password'><br><br>
    		<input type='submit' value='login'>
    		<input name="anoncheck" type="checkbox" onclick="" value="Anonymous login">
    		<input type='hidden' name='action' value='login'>
    	</form>
    <?
    }
}
?>