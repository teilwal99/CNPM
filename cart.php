<div style="display: none;">
    <?php
    include('session.php');
    if($role!=1){
        header("location: index.php");
    }
    ?>
</div>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Website nhà hàng- Cart</title>
     <!--<link rel="icon" href="./img/logo.jpg" sizes="75x42" />-->
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div id="navbar">
        <a href="index.php" class="home button">
            Nhà hàng <b>Website</b>
        </a>
        <?php
        if (!isset($_SESSION['login_user'])) {
            echo "<a href='#' id='myBtnMobile' class='button' onclick='openModal()'> Đăng nhập</a>";
        } else {
            echo "<a href='#' id='myBtnInfo' class='button' onclick='openModalInfo()'> Hello:" . $login_session . "</a>";
        }
        ?>
        <a href="index.php#contact" class="button">
            Liên hệ
        </a>
        <a href="index.php##about" class="button">
            Giới thiệu
        </a>
        <a href="index.php#projects" class="button">
            Sản phẩm
        </a>
        <?php
            $result = mysqli_query($db, 'select count(user_id) as total from cart where user_id ='.$_GET['id'].'');
            $row = mysqli_fetch_assoc($result);
            $total_records = $row["total"];
            echo "<a href='cart.php' id='myBtnMobile' class='button'> Cart Details ".$total_records." </a>";
        ?>
    
    </div>
    <div id="navbar_mobile">
        <div id="unactive_navbar">
            <a href="index.php" class="home button" onclick="myFunctionForHome()">
                <b>Website</b> Nhà hàng
            </a>
            <a href="javascript:void(0);" class="button" onclick="myFunction()">
                <i id="fa-bars" class="fa fa-bars"></i>
                <i id="fa-times" class="fa fa-times" style="display: none;"></i>
            </a>
        </div>
        <div id="active_navbar">
            <a href="#users" class="button" onclick="myFunction()">
                Người dùng
            </a>
            <a href="#products" class="button" onclick="myFunction()">
                Sản phẩm
            </a>
            
            <?php
            if (!isset($_SESSION['login_user'])) {
                echo "<a href='#' id='myBtnMobile' class='button' onclick='openModal()'> Đăng nhập</a>";
            } else {
                echo "<a href='#' id='myBtnInfoMobile' class='button' onclick='openModalInfo()'> " . $login_session . "</a>";
            }
            ?>
        </div>
    </div>
    <div class="main_content">
        <div id="users">
            <div class="sub_title">
                <h2>Cart</h2>
            </div>
            <div class="projects_content">
                <table id="admin">
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng</th>
                    </tr>
                    <?php
                    $user = mysqli_query($db, 'select count(id) as total from cart');
                    $row = mysqli_fetch_assoc($user);
                    $total_users = $row['total'];
                    $limit_user = 10;
                    $total_page_user = ceil($total_users / $limit_user);

                    // Giới hạn current_page_user trong khoảng 1 đến total_page_user
                    if ($current_page_user > $total_page_user) {
                        $current_page_user = $total_page_user;
                    } else if ($current_page_user < 1) {
                        $current_page_user = 1;
                    }

                    // Tìm Start
                    $start1 = ($current_page_user - 1) * $limit_user;
                    $sql1 = "SELECT * FROM cart ORDER BY id LIMIT " . $limit_user . " OFFSET " . $start1;
                    $result1 = mysqli_query($db, $sql1);
                    if ($result1->num_rows > 0) {
                        while ($row = $result1->fetch_assoc()) {
                            echo "
                                <tr>
                                    <td>" . $row['username'] . "</td>
                                    <td>" . $row['birthday'] . "</td>
                                    <td>" . $row['gender'] . "</td>
                                    <td>" . $row['email'] . "</td>
                                    <td>" . $row['phone'] . "</td>
                                    <td style='text-align: center;'>
                                        <button class='button_edit' onclick='deleteCart(".$row['id'].")'>Delete</button>
                                    </td>
                                </tr>";
                        }
                    }
                    ?>
                </table>
                <!-- pagination -->
                <?php
                if ($current_page_user > 1 && $total_page_user > 1) {
                    echo '<a href="admin.php?page_user=' . ($current_page_user - 1) . '&page_post=' . $current_page_post . '">Prev</a> | ';
                }

                for ($i = 1; $i <= $total_page_user; $i++) {
                    if ($i == $current_page_user) {
                        echo '<span>' . $i . '</span> | ';
                    } else {
                        echo '<a href="admin.php?page_user=' . $i . '&page_post=' . $current_page_post . '">' . $i . '</a> | ';
                    }
                }
                if ($current_page_user < $total_page_user && $total_page_user > 1) {
                    echo '<a href="admin.php?page_user=' . ($current_page_user + 1) . '&page_post=' . $current_page_post . '">Next</a> | ';
                }
                ?>
            </div>
        </div>
    </div>
    <script>
        function myFunction() {
            var x = document.getElementById("active_navbar");
            if (x.style.height === "157px") {
                document.getElementById("fa-bars").style.display = "unset";
                document.getElementById("fa-times").style.display = "none";
                x.style.height = "0px";
            } else {
                x.style.height = "157px";
                document.getElementById("fa-bars").style.display = "none";
                document.getElementById("fa-times").style.display = "unset";
            }
        }

        function myFunctionForHome() {
            var x = document.getElementById("active_navbar");
            if (x.style.height === "157px") {
                document.getElementById("fa-bars").style.display = "unset";
                document.getElementById("fa-times").style.display = "none";
                x.style.height = "0px";
            }
        }

        deleteCart = function(id) {
            $.ajax({
                url: "deleteCart.php",
                    
                type: "get",
                    
                dataType: "html",
                data : {id : id},
                success: function( strData ){
                    window.location.reload();
                }
            });
        }
    </script>
    <footer style="width: 100%;">
        <div class="footer">Copyright © 2021 Powered by <a style="color: gray; text-decoration: none; margin-left: 5px;" href="#" target="_blank">1713093</a>
        </div>
    </footer>
</body>

</html>