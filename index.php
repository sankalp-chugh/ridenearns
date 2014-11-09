<?php 
	if(isset($_POST['tag']) && !empty($_POST['tag'])){
		require_once('db_functions.php');
		$tag = $_POST['tag'];
		$db = new DB_Functions();

		// response Array
    	$response = array("tag" => $tag, "success" => 0, "error" => 0, "msg" => "Hello");
    	
    	if($tag == 'register'){
			$email = $_POST['email'];
			$gender = $_POST['gender'];

			$name = $db->emailToUsername($email);

			if($db->storeUser($name,$email,"",$gender)){
				$response['success'] = 1;
				echo json_encode($response);
			}else{
				$response['error'] = 1;
				$response['error_msg'] = "Error occured in Registration";
				echo json_encode($response);
			}
		}else{
			echo "Invalid Request";
		}

	}else{
		echo "Access Denied";
	}
 ?>