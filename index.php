<?php

require_once __DIR__ . '/vendor/autoload.php';

use OOP\App\TrxHeaderController;

$controller = new TrxHeaderController;

// require_once 'TrxHeaderController.php';
// $controller = new TrxHeaderController;

// if (@$_GET['page]==null){
    // $controller->index();
// }

switch(@$_GET['page']){
    case 'show':
        $controller->show($_GET['id']);
    break;

    case 'delete':
        $controller->delete($_GET['id']);
        echo '<script>alert("Data Deleted")</script>';
    break;

    case 'update':
        $controller->update($_GET['id']);
        echo '<script>alert("Data Updated")</script>';
        echo "<h1> Data where id= " .$_GET['id']." updated</h1>";
    break;

    default:
        $controller->index();
    break;
}