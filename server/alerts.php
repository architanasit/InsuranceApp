<?php
include_once("dbio.php");
class alerts
{
    function getCoupons($curr_date)
    {
        $db    = new dbio();
        $query = "SELECT * from coupons WHERE exp_date >= '$curr_date'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
        
    }
    
    function getOffers($curr_date)
    {
        $db    = new dbio();
        $query = "SELECT * from offers WHERE exp_date >= '$curr_date'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
}

/*$off = new alerts();
$a = $off->getOffers(20110603);
var_dump($a);*/
?>