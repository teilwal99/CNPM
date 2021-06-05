<?php
include("config.php");
include("images_helper.php");
include("session.php");
session_start();
    $id = addslashes($_POST['id']);
    $content = addslashes($_POST['content']);
    $category = addslashes($_POST['category']);
    $author = addslashes($_POST['author']);
    $cost = addslashes($_POST['cost']);
    $img = addslashes($_POST['img']);

    if($_FILES["img"]["name"]==''){
        $avatar="sach.jpg";
    }
    else
    {	
        $avatar = $_FILES["img"]["name"];
        $link_img='img/'.$_FILES["img"]["name"];
        move_uploaded_file($_FILES["img"]["tmp_name"],$link_img);														
    }

    $addproduct = mysqli_query($db,"
    INSERT INTO post (
		content,
		category,
		author,
		cost,
		img,
		poster
	)
	VALUE (
	'{$content}',
	'{$category}',
	'{$author}',
	'{$cost}',
	'{$img}',
	'{$userid_session}'
	)
    ");
    header("Location: {$_SERVER['HTTP_REFERER']}");
?>