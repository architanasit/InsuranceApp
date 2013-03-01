<?php
include_once("dbio.php");
class location
{
    function getLocationZip($zip)
    {
        $db    = new dbio();
        $query = "SELECT * from masterinfo WHERE city_id_key = '$zip'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function getLocationName($name)
    {
        $db    = new dbio();
        $query = "SELECT * from masterinfo WHERE location_name = '$name'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function getLocationPhoneNum($num)
    {
        $db    = new dbio();
        $query = "SELECT * from masterinfo WHERE num = '$num'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function getLocationAddress($add)
    {
        $db    = new dbio();
        $query = "SELECT * from masterinfo WHERE address = '$add'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function getLocationGeoCode($longitude, $latitude)
    {
        $db    = new dbio();
        $query = "SELECT * from masterinfo WHERE longitude = '$longitude' AND 
		latitude = '$latitude'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
        
    }
}

/*$loc = new location();
$a = $loc->getLocationZip(8901);
echo $a;
var_dump($a);
?>*/