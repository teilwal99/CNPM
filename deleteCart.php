<?php
    include('session.php');
    $cartid=$_GET['id'];
    $cartid = mysqli_real_escape_string($db,$_GET['id']);
    $sql = "DELETE FROM cart WHERE id = '$cartid';";
    $result = mysqli_query($db, $sql);
    $sql1 = "SELECT count(id) from cart";
    $result1 = mysqli_query($db, $sql1);
    $sql = "ALTER TABLE cart AUTO_INCREMENT=".$result1;
    header("Location: {$_SERVER['HTTP_REFERER']}");
?>