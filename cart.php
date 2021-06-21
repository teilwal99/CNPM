<div style="display: none;">
    <?php
    include('session.php');
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
        <a href="index.php#menu" class="button">
            Sản phẩm
        </a>
        <?php
            $result = mysqli_query($db, 'select count(id) as total from cart where user_id ='.$userid_session.'');
            $row = mysqli_fetch_assoc($result);
            $total_records = $row["total"];
            echo "<a href='cart.php' id='button' class='button'> Cart Details ".$total_records." </a>";
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
            $result = mysqli_query($db, 'select count(id) as total from cart where user_id ='.$userid_session.'');
            $row = mysqli_fetch_assoc($result);
            $total_records = $row["total"];
            echo "<a href='cart.php' id='myBtnMobile' class='button'> Cart Details ".$total_records." </a>";
            ?>
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
        <div id="products">
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
                        <th>Thao tác </th>
                    </tr>
                    <?php
                    $cart = mysqli_query($db, 'select count(id) as total from cart');
                    $row = mysqli_fetch_assoc($cart);
                    $total_carts = $row['total'];
                    $limit_cart = 10;
                    $total_page_cart = ceil($total_carts / $limit_cart);
                    $current_page_cart = 1;
                    // Giới hạn current_page_user trong khoảng 1 đến total_page_user
                    if ($current_page_cart > $total_page_cart) {
                        $current_page_cart = $total_page_cart;
                    } else if ($current_page_cart < 1) {
                        $current_page_cart = 1;
                    }

                    // Tìm Start
                    $start1 = ($current_page_cart - 1) * $limit_cart;
                    $sql1 = "SELECT cart.id AS cartid, post.id AS postid, post.content AS prodname, post.cost AS prodcost, cart.quantity FROM cart LEFT JOIN post 
                    ON post.id=cart.product_id WHERE user_id=$userid_session ORDER BY cartid LIMIT " . $limit_cart . " OFFSET " . $start1;
                    $result1 = mysqli_query($db, $sql1);
                    $sum = 0;
                    if ($result1->num_rows > 0) {
                        while ($row = $result1->fetch_assoc()) {
                            echo "
                                <tr>
                                    <td>" . $row['prodname'] . "</td>
                                    <td>" . $row['prodcost'] . "</td>
                                    <td>" . $row['quantity'] . "</td>
                                    <td>" . $row['quantity'] * $row['prodcost'] . "</td>
                                    <td style='text-align: center;'>
                                        <button class='button_edit' onclick='deleteCart(".$row['cartid'].")'>Delete</button>
                                    </td>
                                </tr>";
                                $sum = $sum + $row['quantity'] * $row['prodcost'];
                        }; 
                    }
                    
                    ?>
                    <?php
                    echo"
                    <form action='order.php' method='POST' enctype='multipart/form-data'>
                        <input type='text' style='display:none;' value=".$userid_session." name='userid'>
                        <input type='number' style='display:none;' value=".$sum."  name='sum'>
                        <input type='date' style='display:none;' value=".date("Y-m-d")."  name='date'>
                        <button type='submit' class = 'button'>Thanh toán</button>
                    </form>
                "; 
                    ?>
                </table>
                <!-- pagination -->
                
                <!-- payment-->
                
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