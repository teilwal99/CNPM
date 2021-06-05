<?php
    include('session.php');
    if($role!=1){
        header("location: index.php");
    }
    $userid=$_GET['id'];
    $userid = mysqli_real_escape_string($db,$_GET['id']);
    $sql = "DELETE FROM user WHERE id = '$userid';";
    $result = mysqli_query($db, $sql);
    header("Location: {$_SERVER['HTTP_REFERER']}");
?>