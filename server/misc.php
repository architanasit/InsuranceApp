<?php
include_once("dbio.php");
class misc
{
    function user_exists($cust_id)
    {
        $db    = new dbio();
        $query = "SELECT * from user_info WHERE customer_user_id = " . "'$cust_id'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data[0]['customer_user_id'];
        }
        
    }
    
    function get_ssnkey($id, $secans, $pass, $dob)
    {
        $db    = new dbio();
        $query = "SELECT * from user_info WHERE customer_user_id = " . "'$id'" . " and customer_secans = " . "'$secans'" . " and customer_password = " . "'$pass'" . " and customer_dob = '$dob'";
        //var_dump($query);
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data[0]['customer_sessionkey'];
        }
    }
    
    function get_cust_from_cust_id($cust_id)
    {
        $db    = new dbio();
        $query = "SELECT * from user_info WHERE customer_id = '$cust_id'";
        //var_dump($query);
        
        $data = $db->selectquery($query);
        
        if (!data) {
            return 0;
        } else {
            return $data[0]['customer_name'];
        }
    }
}

/*$off = new alerts();
$a = $off->getOffers(20110603);
var_dump($a);*/
?>