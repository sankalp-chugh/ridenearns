<?php 
	class DB_Functions{
		private $db;
		function __construct(){
			require_once("db_connect.php");
			$this->db = new DB_Connect();
			$this->db->connect();			
		}

		function __destruct(){

		}

		/**
	     * Storing new user
	     * Return status
	     */
	    public function storeUser($name, $email,$avatar,$gender) {
	    	include_once("config.php");
	    	$avatar = (empty($avatar))? "avatar" : "$avatar";
	        $result = mysql_query("INSERT INTO ".PREFIX."users(f_name, l_name, email, avatar_url, gender, rate) VALUES('$name[0]','$name[1]', '$email', '$avatar', '$gender', '')");
	        //if successful get id of user and insert vehicle details
	        // check for successful store
	        return $result;
	    }
	 
	    /**
	     * Get user by email and password
	     */
	    public function getUserByEmailAndPassword($email, $password) {
	        $result = mysql_query("SELECT * FROM users WHERE email = '$email'") or die(mysql_error());
	        // check for result 
	        $no_of_rows = mysql_num_rows($result);
	        if ($no_of_rows > 0) {
	            $result = mysql_fetch_array($result);
	            $salt = $result['salt'];
	            $encrypted_password = $result['encrypted_password'];
	            $hash = $this->checkhashSSHA($salt, $password);
	            // check for password equality
	            if ($encrypted_password == $hash) {
	                // user authentication details are correct
	                return $result;
	            }
	        } else {
	            // user not found
	            return false;
	        }
	    }
	 
	    /**
	     * Check user is existed or not
	     */
	    public function isUserExisted($email) {
	        $result = mysql_query("SELECT email from users WHERE email = '$email'");
	        $no_of_rows = mysql_num_rows($result);
	        if ($no_of_rows > 0) {
	            // user existed 
	            return true;
	        } else {
	            // user not existed
	            return false;
	        }
	    }
	 
	    /**
	     * Get username from email
	     * returns username
	     */
	    public function emailToUsername($email) {
	 
	        $mixed_name = substr($email,0,strpos($email,"@"));
			$mixed_name_array = explode(".",$mixed_name);
			return $mixed_name_array;
	    }		
	}
?>