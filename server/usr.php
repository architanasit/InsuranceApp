<?php
include_once("dbio.php");
class usr
{
    function addUser($id, $name, $email, $pass, $dob, $isRem, $secans)
    {
        $db      = new dbio();
        $sesskey = md5(date("y-m-d") . time() . $name . $id . $email . $pass . $dob . $secans);
        $query   = "INSERT INTO user_info(customer_user_id, customer_name, 
		customer_email, customer_password, customer_dob, customer_isRemembered, 
		customer_sessionkey, customer_secans)VALUES('$id', '$name', '$email', 
		'$pass', '$dob', '$isRem', '$sesskey', '$secans')";
        $data    = $db->insertquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data[0]['customer_sessionkey'];
        }
    }
    
    public function authenticate($f_id, $f_password, $f_sessionkey)
    {
        $obj   = new dbio();
        $query = "SELECT customer_user_id, customer_password, customer_sessionkey FROM user_info WHERE customer_user_id='$f_id'
			AND customer_sessionkey = '$f_sessionkey'";
        //echo $query;
        $data  = $obj->selectquery($query);
        //var_dump($data);
        if ($data == 0) {
            //error
            //user not found or db error
            return 0;
        } else {
            if ($data[0]['customer_password'] == $f_password && $data[0]['customer_sessionkey'] == $f_sessionkey) {
                return $data[0]['customer_user_id'];
            } else {
                $op = "invalid";
            }
        }
    }
}
/*$usr = new usr();
$a = $usr->authenticate("tpatel", "1234", "27b5bda1b240121b88e344875e3b77aa");
echo $a;
var_dump($a);*/
?>