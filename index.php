<?php 
	if(isset($_POST['submit']) && !empty($_POST['submit'])){

	}else{
		require_once('db_functions.php');
		$db = new DB_Functions();
		$email = $_POST['email'];
		$gender = $_POST['gender'];

		$name = $db->emailToUsername($email);

		if($db->storeUser($name,$email,"",$gender)){
			echo "Success";
		}else{
			echo "Failure";
		}

 ?>
 <html>
 <head>
 	<title>tester</title>
 </head>
 <body>
 	<form action="" method="post">
 		<input type="email" name="email"></br>
 		<input type="text" name="gender"></br>
 		<input type="submit">
 	</form>
 
 </body>
 </html>
 <?php
}
 ?>