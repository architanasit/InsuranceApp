<?php
include_once("alerts.php");
include_once("claims.php");
include_once("dbio.php");
include_once("location.php");
include_once("log.php");
include_once("policy.php");
include_once("quotes.php");
include_once("usr.php");
include_once("misc.php");

function encode($rsp, $method = NULL, $data = NULL)
{
    if ($rsp == 1) {
        $method_rsp = array(
            'retval' => 'ok',
            'method' => $method,
            'valuersp' => $data
        );
        $op         = json_encode($method_rsp);
        echo $op;
    } else {
        $method_rsp = array(
            'retval' => 'error'
        );
        $op         = json_encode($method_rsp);
        echo $op;
    }
}

$obj_alerts   = new alerts();
$obj_claims   = new claims();
$obj_dbio     = new dbio();
$obj_location = new location();
$obj_log      = new logger();
$obj_policy   = new policy();
$obj_quotes   = new quotes();
$obj_usr      = new usr();
$obj_misc     = new misc();

switch ($_REQUEST['oper']) {
    case "log":
        $data = $_REQUEST['cusid'] . " " . $_REQUEST['error'];
        $obj_logger->clienterror($data);
        break;
    
    case "addUser":
        $data = $obj_usr->addUser($_REQUEST['id'], $_REQUEST['name'], $_REQUEST['email'], $_REQUEST['pass'], $_REQUEST['dob'], $_REQUEST['isRem'], $_REQUEST['secans']);
        if ($data != 0) {
            encode(1, "addUser", $data);
        } else {
            encode(0);
        }
        break;
    
    case "authenticate":
        $data = $obj_usr->authenticate($_REQUEST['user_id'], $_REQUEST['user_pass'], $_REQUEST['user_ssnkey']);
        if (is_string($data)) {
            encode(1, "authenticate", $data);
        } else {
            encode(0);
        }
        break;
        
        
        break;
    
    case "getCoupons":
        $data = $obj_alerts->getCoupons($_REQUEST['date']);
        if ($data != 0) {
            encode(1, "getCoupons", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getOffers":
        $data = $obj_alerts->getOffers($_REQUEST['date']);
        if ($data != 0) {
            encode(1, "getOffers", $data);
        } else {
            encode(0);
        }
        break;
    
    case "makeClaim":
        $data = $obj_claims->makeClaim($_REQUEST['cust_id'], $_REQUEST['DT'], $_REQUEST['location'], $_REQUEST['police'], $_REQUEST['desc'], $_REQUEST['injury'], $_REQUEST['extrainfo']);
        if ($data != 0) {
            encode(1, "makeClaim", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getClaims":
        $data = $obj_claims->getClaims($_REQUEST['cust_id']);
        if ($data != 0) {
            encode(1, "getClaims", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getLocationZip":
        $data = $obj_location->getLocationZip($_REQUEST['zip']);
        if ($data != 0) {
            encode(1, "getLocationZip", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getLocationName":
        $data = $obj_location->getLocationName($_REQUEST['name']);
        if ($data != 0) {
            encode(1, "getLocationName", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getLocationPhoneNum":
        $data = $obj_location->getLocationPhoneNum($_REQUEST['phoneNum']);
        if ($data != 0) {
            encode(1, "getLocationPhoneNum", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getLocationAddress":
        $data = $obj_location->getLocationAddress($_REQUEST['add']);
        if ($data != 0) {
            encode(1, "getLocationAddress", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getLocationGeoCode":
        $data = $obj_location->getLocationGeoCode($_REQUEST['long'], $_REQUEST['lat']);
        if ($data != 0) {
            encode(1, "getLocationGeoCode", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getPolicies":
        $data = $obj_policy->getPolicies($_REQUEST['cust_id']);
        if ($data != 0) {
            encode(1, "getPolicies", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getPolicy":
        $data = $obj_policy->getPolicy($_REQUEST['pol_num']);
        if ($data != 0) {
            encode(1, "getPolicy", $data);
        } else {
            encode(0);
        }
        break;
    
    case "getQuotes":
        $data = $obj_quotes->getQuotes($_REQUEST['cust_id']);
        if ($data != 0) {
            encode(1, "getQuotes", $data);
        } else {
            encode(0);
        }
        break;
    
    case "makeQuote":
        $data = $obj_quotes->makeQuote($_REQUEST['cust_id'], $_REQUEST['date'], $_REQUEST['type'], $_REQUEST['premium'], $_REQUEST['desc']);
        if ($data != 0) {
            encode(1, "makeQuote", $data);
        } else {
            encode(0);
        }
        break;
    
    case "user_exists":
        $data = $obj_misc->user_exists($_REQUEST['cust_id']);
        
        if (is_string($data)) {
            encode(1, "user_exists", $data);
        } else {
            encode(0);
        }
        break;
    
    case "get_ssnkey":
        $data = $obj_misc->get_ssnkey($_REQUEST['id'], $_REQUEST['secans'], $_REQUEST['pass'], $_REQUEST['dob']);
        if (is_string($data)) {
            encode(1, "get_ssnkey", $data);
        } else {
            encode(0);
        }
        break;
    
    case "get_cust_from_cust_id":
        $data = $obj_misc->get_cust_from_cust_id($_REQUEST['cust_id']);
        if (is_string($data)) {
            encode(1, "get_cust_from_cust_id", $data);
        } else {
            encode(0);
        }
        break;
}

?>