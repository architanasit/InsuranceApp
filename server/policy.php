<?php
include_once("dbio.php");
class policy
{
    function getPolicies($cust_id)
    {
        $db    = new dbio();
        $query = "SELECT * from policy WHERE cust_id = '$cust_id'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function getPolicy($pol_num)
    {
        $db    = new dbio();
        $query = "SELECT * from policy WHERE policy_number = '$pol_num'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
}

/*$pol = new policy();
$a = $pol->getPolicy(1);
var_dump($a);
?>*/