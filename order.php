<?php
include("config.php");
include("session.php");
session_start();
	if(!isset($_SESSION['login_user'])){
		$_SESSION['messages'] = "error";
      	header("location: cart.php");
	}else{
		session_start();
		$user_id = addslashes($_POST['userid']);
		$amount = addslashes($_POST['sum']);
        $date = addslashes($_POST['date']);
		$addorder = mysqli_query($db,"
		INSERT INTO orders (
			user_id,
			date,
			amount
		)
		VALUE (
		'{$user_id}',
		'{$date}',
		'{$quantity}'
		)");
		header("Location: index.php");
	}
?>