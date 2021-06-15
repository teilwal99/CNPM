<?php
include("config.php");
include("session.php");
session_start();
	if(!isset($_SESSION['login_user'])){
		$_SESSION['messages'] = "error";
      	header("location: product.php?id=".$_POST['post_id']);
	}else{
		session_start();
		$post_id = addslashes($_POST['post_id']);
		$quantity = addslashes($_POST['quantity']);
		$user_id = addslashes($userid_session);


		$addcart = mysqli_query($db,"
		INSERT INTO cart (
			user_id,
			product_id,
			quantity
		)
		VALUE (
		'{$user_id}',
		'{$post_id}',
		'{$quantity}'
		)");
		header("Location: {$_SERVER['HTTP_REFERER']}");
	}
?>