<?php
include_once("dbio.php");
class claims
{
    function makeClaim($cust_id, $DT, $location, $police, $desc, $injury, $extraInfo)
    {
        $db    = new dbio();
        $query = "INSERT INTO claims (claims_user_id, claims_DT, claims_location, 
		claims_police_response, claims_desc, claims_injury, claims_otherInfo) 
		VALUES('$cust_id', '$DT', '$location', '$police', '$desc', '$injury', '$extraInfo')";
        $data  = $db->insertquery($query);
        
        if (!$data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
        
    }
    
    function getClaims($cust_id)
    {
        $db    = new dbio();
        $query = "SELECT * from claims WHERE claims_user_id = '$cust_id'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
}

/*$cl = new claims();
$a = $cl->makeClaim(1, '20110606', "ME", false, "serious accident", 
"multiple party physicle injury", "a flood of ambulance came");
var_dump($a);
?>*/

/*$cl = new claims();
$a = $cl->getClaims(2);
var_dump($a);
?>*/
