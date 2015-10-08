<?php
	$mysql_server_name = "localhost";
	$mysql_username = "root";
	$mysql_password = "123456";
	$mysql_database = "auth"; 
	$username = @$_POST['username'];
	$password = @$_POST['password'];
	$ip=$_SERVER["REMOTE_ADDR"];
	echo $ip;	
	$conn=mysql_connect($mysql_server_name, $mysql_username,
                        $mysql_password);
	if ($conn) {
		$sql = "select * from user where username = '".$username."'";
		$result = mysql_fetch_array(mysql_db_query($mysql_database, $sql, $conn));
		if ($result) {
			if ($result['password'] == $password) {
				$status = -1;
				system("sudo ./bash/logout.sh $ip", $status);
				if ($status == 0) {
					echo "Login Successfully";				
				} else {
					echo "Login Failed";
				}
			} else {
				echo "Wrong Password";
			}	
		} else {
			echo "Not";
		}
	} else {
		die("Could Not Connect");
	}
?>
