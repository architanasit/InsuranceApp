<?php

include_once("config.php");
include_once("log.php");
class dbio
{
    function __construct()
    {
        $masterobj = new config();
        $host      = $masterobj->host;
        $username  = $masterobj->id;
        $password  = $masterobj->password;
        $db        = $masterobj->db;
        
        $con = mysql_connect($host, $username, $password);
        if (!$con) {
            $errobj = new logger();
            $errobj->sqlerror(mysql_error());
            die("couldn't establist connection to database" . mysql_error());
            
            
        }
        mysql_select_db($db, $con);
    }
    
    
    
    
    public function selectquery($query)
    {
        
        
        $data = mysql_query($query);
        if ($data == FALSE) {
            $errobj2 = new logger();
            $errobj2->sqlerror(mysql_error());
            return 0;
        } else {
            $arr = array();
            
            while ($row = mysql_fetch_assoc($data)) {
                
                array_push($arr, $row);
            }
            return $arr;
        }
        
    }
    public function insertquery($query)
    {
        $data = mysql_query($query);
        if ($data == FALSE) {
            $errobj2 = new logger();
            $errobj2->sqlerror(mysql_error());
            return 0;
        } else {
            return 1;
        }
    }
    public function deletequery($query)
    {
        $data = mysql_query($query);
        if ($data == FALSE) {
            $errobj2 = new logger();
            $errobj2->sqlerror(mysql_error());
        } else {
            return 1;
        }
    }
    
    /*function __destruct()
    {
    mysql_close();
    }*/
    
}
/*
$myObj = new dbio();
$a=$myObj->selectquery("SELECT * FROM menu");
var_dump($a);
*/

?>