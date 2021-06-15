<?php
include("config.php");
include("images_helper.php");
include("session.php");
session_start();
    $id = addslashes($_POST['id']);
    $content = addslashes($_POST['content']);
    $category = addslashes($_POST['category']);
    $description = addslashes($_POST['description']);
    $cost = addslashes($_POST['cost']);
    $img =  addslashes($_POST['img']);
    $inmenu = 1;

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
		desciption,
		cost,
		img,
		inmenu
	)
	VALUE (
	'{$content}',
	'{$category}',
	'{$description}',
	'{$cost}',
	'{$img}',
	'{$inmenu}'
	)
    ");
    header("Location: {$_SERVER['HTTP_REFERER']}");
?>