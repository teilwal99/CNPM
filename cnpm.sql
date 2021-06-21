-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 06:27 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cnpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(2, 12, 4, 1),
(3, 12, 3, 1),
(4, 12, 2, 5),
(5, 12, 8, 1),
(6, 12, 1, 1),
(7, 12, 5, 1),
(8, 12, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shift` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(800) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unnamed.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `shift`, `email`, `img`) VALUES
(1, 'Sett Williams', 1, 'williams@gmail.com', '001.jpg'),
(2, 'George Wilson', 2, 'GeorgeW@gmail.com', '002.jpg'),
(3, 'Robert Pattinson', 3, 'ROB@gmail.com', '003.jpg'),
(4, 'Noah Roberts', 4, 'Noah_12@gmail.com', '004.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `amount`, `date`) VALUES
(1, 12, 0, '0000-00-00'),
(2, 12, 0, '2021-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(5) NOT NULL,
  `cost` int(15) NOT NULL,
  `category` varchar(100) NOT NULL,
  `inmenu` int(11) NOT NULL,
  `content` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT 'house.png',
  `desciption` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `cost`, `category`, `inmenu`, `content`, `img`, `desciption`) VALUES
(1, 12000, 'Cơm', 1, 'Cơm Hến', 'images1.jpg', 'Cơm hến với nguyên liệu chính là hến nhưng phụ gia thì khá nhiều như tóp mỡ chiên giòn, mắm ruốc, rau sống, hoa chuối, giá đỗ, thân khoai môn trắng thái nhỏ, lạc rang… Tất cả trộn lẫn đem lại một hương vị đậm đà và cay nồng rất đặc trưng'),
(2, 102000, 'Bún ', 1, 'Bún Bò', 'images2.jpg', 'Bún bò mang một hương vị đặc trưng riêng mà không nơi nào có được, đó là vị ngọt thanh của gia vị cùng với mùi sả, ruốc, nước dùng, thịt luộc ăn kèm với rau thơm, chanh, tiêu, nước mắm… tạo nên sức hấp dẫn tới lạ lùng.'),
(3, 112000, 'Bánh', 1, 'Bánh khoái', 'images3.jpg', 'Bánh khoái Huế nhỏ dơn, dày hơn và cũng giòn hơn bánh xèo, và lý do là do cách pha bột rất độc đáo, chiên ở lửa vừa phải, thêm vào đó là nước chấm bánh là nước lèo béo ngậy, có vị đặc trưng, ăn mãi không quên.'),
(4, 202000, 'Cơm', 1, 'Cơm Âm Phủ', 'images4.jpg', 'Cơm Âm Phủ gây ấn tượng ngay từ tên gọi. Cơm được nấu từ gạo rất dẻo và thơm, sau đó được bày trí có đủ 7 màu rất đẹp mắt: xung quanh là chả lụa Huế, trứng rán, thịt ba chỉ, nem nướng, tôm, dưa leo và các loại rau thơm ăn kèm. Tưới một chút nước mắm lên trên và trộn đều rồi thưởng thức.'),
(5, 199999, 'Bún', 1, 'Bún thịt nướng', 'images5.jpg', ' Chúng đều được làm từ nguyên liệu chính là thịt nướng được tẩm ướp gia vị đậm đà và thơm ngon không nơi đâu có được. Khi thưởng thức trộn đều thịt nước cùng với bánh ướt và ăn kèm nước chấm, rau sống, đảm bảo ngon mê ly, càng ăn càng thèm.'),
(6, 150000, 'Bánh', 1, 'Bánh ướt thịt nướng', 'images6.jpg', 'được làm từ nguyên liệu chính là thịt nướng được tẩm ướp gia vị đậm đà và thơm ngon không nơi đâu có được. Khi thưởng thức trộn đều thịt nước cùng với bánh ướt và ăn kèm nước chấm, rau sống, đảm bảo ngon mê ly, càng ăn càng thèm.'),
(7, 999000, 'Bánh', 1, 'Bánh canh cua', 'images7.jpg', 'Bánh canh là môt trong những loại bánh hấp dẫn nhất ở Việt Nam.Bánh canh mang một hương vị đặc trưng riêng đó là nước lèo có màu đỏ của gạch cua và tôm, không lỏng cũng không quá đặc. Nguyên liệu nấu bánh canh rất đơn giản đó là tôm và thịt heo trộn đều, xay nhỏ và tẩm ướp gia vị.'),
(8, 99999, 'Cơm', 1, 'Cơm chay', 'images8.jpg', 'Khi thưởng thức cơm chay bạn sẽ cảm nhận được sự thanh tịnh và vô cùng thanh đạm. Cơm chay rất đa dạng được làm từ các loại rau củ, nấm và đậu phụ…, nguyên liệu không có gì có nổi trội nhưng lại hấp dẫn du khách'),
(9, 99900, 'Bánh', 1, 'Tré', 'images9.jpg', ' tré giống như nem chua, về hình dạng cũng giống nem chua nhưng khâu chế biến khác hoàn toàn. Nem chua dùng thịt bì, tai heo cùng thính gạo để lên men từ thịt sống, trong khí đó tré thì da và thịt đều phải luộc chín. Gia vị còn có nước mắm, mè rang, tỏi, ớt bột, riềng…'),
(10, 888000, 'Bánh', 1, 'Nem lụi ', 'images10.jpg', 'Nem lụi ăn cùng với bánh đa nem gói thịt viên nướng với rau thơm, khế, giá đỗ, chuối xanh thái mỏng và vài miếng vả sau đó lấy hành buộc lại chấm với nước lèo càng ăn càng “nghiện”.'),
(11, 777000, 'Bún', 2, 'Hủ tiếu', 'images11.jpg', 'món hủ tiếu do người Việt chế biến thêm tôm, cá và được bán dầu tiên ở Nam Vang. Bát hủ tiếu Nam Vang ngon với sợi hủ tiếu dai, nước dùng (nước lèo) ngọt từ xương heo ninh nhừ và ăn kèm với giá, hẹ, thịt bằm cùng lòng heo.'),
(12, 666000, 'Bún', 2, 'Bún mọc.', 'images12.jpg', 'Bát bún mọc Thanh Mai ngon, gồm có: bún, chả, sườn, các loại mọc,.... ăn cùng với chút rau sống. Điều đặc biệt ngon nhất của bát bún mọc Thanh Hoa là những viên mọc trắng tròn, ăn giòn sần sật và đậm vị, thịt hầm thì mềm vẫn ngọt thịt chứ không khô.'),
(13, 555000, 'Bánh', 2, ' Bánh mì chảo', 'images13.jpg', 'Một phần ăn bánh mì chảo Hòa Mã đầy đăn gòm có: trứng chiên lòng đào, chả bò, chả heo, pa tê mềm mịn ăn kèm với đồ chua và không thể thiếu bánh mì nóng hổi, giòn rụm.'),
(14, 999000, 'Bánh', 2, 'Há cảo', 'images14.jpg', 'Há cảo là một món ăn của ẩm thực Trung Hoa và trở thành một món ăn sáng ở Sài Gòn yêu thích bởi sự nhanh, gọn. Các món há cảo, bánh bao thích hợp với bạn thường không có nhiều thời gian cho bữa sáng. Với khoảng 4 chiếc bánh há cảo nhân thịt là bạn đã có một bữa sáng no bụng. Ngoài ra, há cảo Dương Tử Giang còn có các loại nhân khác, như: há cảo nhân tôm, há cảo nhân củ cải, há cảo nhân hẹ,... chấm cùng nước tương.'),
(15, 24900, 'Xôi', 2, 'Xôi', 'images15.jpg', 'Có thể nói xôi là món ngon ăn sáng rất quen thuộc, gần gũi với người Sài Gòn nói riêng và người Việt Nam nói chung. Chỉ với giá khoảng từ 12.000 – 25.000 đồng/suất (tùy loại), bạn đã có một bữa sáng no bụng, chắc dạ.'),
(16, 100000, 'Cơm', 2, 'Cơm Tấm', 'images16.jpg', 'Món cơm tấm Sài Gòn được rất nhiều người lựa chọn ăn trưa ở Sài Gòn, bởi hương vị ngon tuyệt của nó. Với sự kết hợp của cơm và sườn nướng có kèm theo ít nước mắm, cùng một chút rau khiến bạn ăn hoài không ngán. Mình thích ăn là ăn cơm tâm sườn bì chả, còn bạn thì sao?'),
(17, 99900, 'Phá lấu', 2, 'Phá lấu', 'images17.jpg', 'Món phá lấu mang nét đặc trưng của ẩm thực Sài Gòn, của người Sài Gòn thích ngồi ăn lai rai với nhau. Phá lấu ở Sài Gòn là món ngon Sài Gòn đặc biệt được giới trẻ yêu thích. Từng miếng phá lấu được ninh mềm vừa tới, vẫn còn độ sừng sực khi ăn. Lá sách giòn giòn, gan bùi, phèo béo thêm chút nước chấm, nước dừa càng tăng độ thơm ngon cho món ngon Sài Gòn này.'),
(18, 99900, 'Lẩu', 2, ' Lẩu gà lá giang ', 'images18.jpg', 'Lẩu gà lá giang là món ngon trong ẩm thực Sài Gòn mang hương vị chua lạ miệng, được khá nhiều người chọn ăn trưa Sài Gòn. Sử dụng gà ta được nuôi chạy vườn để chế biến kết hợp hoa chuối, rau muống và đặc biệt là lá giang tạo nên vị chua mới lạ, không giống như vị chua của quả me hay quả sấu'),
(19, 99900, 'Bánh', 2, 'Bánh canh cua Sài Gòn', 'images19.jpg', 'Bánh canh cua là món ngon Sài Gòn dễ ăn và có hương vị rất mới lạ. Khi bạn ăn tối Sài Gòn với món bánh canh cua thì sẽ được trải nghiệm hương vị đậm đà với những sợi bánh dai ngon khiến bạn không cưỡng lại được sức cuốn hút của món ngon Sài Gòn này. Sự kết hợp của nước ninh xương heo, tôm sú hay cua biển đã tạo ra món ăn ngon, bổ, rẻ mà ai cũng thích mê khi đi du lịch Sài Gòn.'),
(20, 99900, 'Bánh', 2, 'Bánh xèo miền Nam', 'images20.jpg', 'Ăn tối ở Sài Gòn bạn có thể cùng bạn bè, gia đình thưởng thức món bánh xèo miền Nam giòn rụm. Bánh xèo Sài Gòn là sự kết hợp hài hòa giữ vỏ bánh dai giòn với rau sống và nước chấm chua cay tạo hương vị ngon tuyệt, chỉ muốn ăn mãi.'),
(21, 99900, 'Bún', 3, 'Bún mắm miền Tây', 'images21.jpg', 'Bún mắm là món ngon đặc trưng của vùng đồng bằng sông Cửu Long, mắm được dùng để nấu bún là loại mắm cá linh ngon. Bát bún mắm Sài Gòn đầy đặn có thịt cá hấp, thịt ba rọi (hay lợn quay), tôm, mực, cà tím, chả nhồi ớt đỏ,... ăn kèm rau thơm, như: hoa chuối, giá, rau muống, hoa súng,...'),
(22, 99900, 'Lẩu', 3, 'Lẩu tôm 5 ri', 'images22.jpg', 'Bữa tối ở Sài Gòn cùng bạn bè làm vài ba chén với lẩu tôm 5 ri – món ngon Sài Gòn trứ danh thì còn gì tuyệt hơn. Đúng như cái tên gọi món lẩu tôm có rất nhiều tôm với thị tôm ngọt và chắc. Nước lẩu tôm 5 ri chua chua cay cay thêm chút ngòn ngọt đủ vị cả. Các bạn có thể chấm tôm với muối ớt xanh cũng rất tuyệt.'),
(23, 99900, 'Cơm ', 3, 'Cơm gà xối mỡ ', 'images23.jpg', 'Ngoài cơm tấm, Sài Gòn còn có cơm gà xối mỡ ngon béo ngậy. Hạt cơm được chiên vàng, tới xốp nhưng vẫn mềm, không bị khô. Cơm gà xối mỡ ngon ăn kèm với xà lách, cà chua, dưa leo,.... Đặc biệt các bạn có thể ăn vào bữa sáng bữa trưa hay bữa tối đều rất phù hợp.'),
(24, 99900, 'Bánh', 3, ' Bánh tráng nướng', 'images24.jpg', ' Những chiếc bánh tráng nướng nóng, giòn tan bên trong có trứng, hành và thịt chấm với mắm ruốc nhai rộp rộp thì “ngon chỉ muốn xỉu”.'),
(25, 99900, 'Bún', 3, ' Bánh canh gánh vỉa hè', 'images25.jpg', 'Một tô đầy đủ sẽ có xương, phèo, bò viên, da heo,... Tuy nửa đêm nhưng gánh bánh canh vẫn luôn đông nên có khi bạn phải chờ một chút thì mới có.'),
(26, 99900, 'Bánh', 3, 'Bánh ướt', 'images26.jpg', 'Bánh ướt có đủ các loại: chả lụa, chả Huế, chả cây, thịt nguội, thịt bao da,... ăn cứ gọi là ngon khỏi chê. Với những bạn đi làm hay đi chơi về khuya muốn mua chút đồ ăn về nhà chống đói thì bánh ướt là gợi ý lý tưởng.'),
(27, 99900, 'Bún', 3, 'Bún riêu', 'images27.jpg', 'Nồi nước lèo đầy ắp cà chua, huyết, đậu hủ, chả cua, nấu trong nồi liên tục để cho thấm gia vị và nước dùng hơn. Một bát đầy đủ có: giò thịt, chả cua, chả lụa, huyết dai, thịt heo, đậu hũ, mắm me, mắm ruốc, ớt xay, rau trụng trộn đều lên và thưởng thức'),
(28, 99900, 'Cháo', 3, 'Cháo lòng', 'images28.jpg', 'Cháo lòng là món cháo được nấu theo phương thức nấu cháo thông thường, trong sự kết hợp với nước dùng ngọt làm từ xương lợn hay nước luộc lòng lợn, và nguyên liệu chính cho bát cháo không thể thiếu các món phủ tạng lợn luộc, dồi.'),
(29, 99900, 'Lẩu', 3, 'Lẩu Cá', 'images29.jpg', 'Lẩu cá vô cùng ngon ngọt, hấp dẫn, lai rai cả buổi vẫn không ngán'),
(30, 99900, 'Bún', 3, 'Bún Đậu Mắm Tôm', 'images30.jpg', 'Điều đặc biệt của một đĩa bún đậu mắm tôm ngon chắc chắn nằm ở hương vị của mắm tôm. Một chút mùi đặc trưng tuy hơi đậm và khó ngửi với một số người, nhưng chẳng hiểu sao đó chính là điều khiến người ta muốn ăn hết miếng này đến miếng khác. Vắt thêm một chút chanh làm giảm vị mặn của mắm tôm, khuấy đến khi sủi bọt nhẹ là vừa ngon. Ngoài ra, món ăn còn ngon nhờ những miếng bún trắng nõn nà, không bị chua, đậu rán vừa tay, thịt heo luộc thái mỏng và phần chả cốm, lòng dồi hút mắt'),
(31, 99900, 'Đồ Uống', 4, 'Sữa tươi trân châu đường đen', 'images31.jpg', 'Trà sữa nướng – món trà sữa gây nhiều tò mò và cũng đã từng là “tâm bão” trà sữa trong năm 2019. Trà sữa nướng hot ngay từ cái tên: trà sữa được mang đi nướng? Nhưng thực chất, mà là trong quá trình pha chế trà sữa, người ta thay đường bằng caramen thơm nồng, làm điểm nhấn cho ly trà sữa.\n\nTheo nhận xét của nhiều người từng thử loại trà sữa này, thì hương vị trà sữa nướng thơm, ngon và béo ngậy hơn các loại trà sữa thông thường. Do đó, dự báo đây vẫn là đồ uống hot năm Cô Vy mà những người muốn '),
(32, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(33, 99900, 'Đồ Uống', 4, 'Trà trái cây', 'images33.jpg', ' Dưới cái nắng hè gay gắt, thời tiết oi nóng thì trà trái cây chính là loại đồ uống giải nhiệt mùa hè được chọn lựa và nhắc đến rất nhiều.Với sự kết hợp của các loại trà khác nhau cùng với các loại trái cây nhiệt đới quen thuộc của Việt Nam, bạn sẽ sáng tạo ra những ly trà cực hấp dẫn mà không bao giờ làm bạn cảm thấy nhàm chán.'),
(34, 99900, 'Đồ Uống', 4, 'Trà sữa', 'images34.jpg', 'Từ những cốc trà sữa vị nhẹ nhàng thanh mát như trà sữa vị nhài, hồng trà sữa, trà sữa ô long… đến những cốc trà sữa hokkaido với vị caramel ngọt béo không chỉ mê hoặc các bạn trẻ như học sinh, sinh viên mà cả những người trung tuổi như nhân viên văn phòng cũng đặc biệt ưa thích món đồ uống trà sữa.'),
(35, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(36, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(37, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(38, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(39, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(40, 99900, 'Đồ Uống', 4, 'Trà chanh', 'images32.jpg', 'Với hương vị mát mẻ, chua chua, dịu ngọt cùng với không gian thoải mái trò chuyện. Không gian quán trà chanh thường là ngoài trời, thoáng mát, thưởng thức những cốc trà mát lạnh, giá thành lại cực rẻ'),
(41, 100000, 'Cơm', 1, 'test', '', 'aaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `role` int(11) NOT NULL,
  `avatar` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unnamed.png',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `birthday`, `role`, `avatar`, `phone`, `gender`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', '2018-08-16', 1, 'unnamed.png', '0964410362', 'none'),
(2, 'user1', '25d55ad283aa400af464c76d713c07ad', 'user1@gmail.com', '2020-12-03', 0, 'user1.png', '0325482639', 'male'),
(3, 'user2', '25d55ad283aa400af464c76d713c07ad', 'user2@gmail.com', '2020-12-11', 0, 'user2.png', '0256461116', 'female'),
(4, 'user3', '25d55ad283aa400af464c76d713c07ad', 'user3@gmail.com', '1999-05-19', 0, 'user3.png', '0322652633', 'male'),
(5, 'user4', '25d55ad283aa400af464c76d713c07ad', 'user4@gmail.com', '2020-12-22', 0, 'user4.png', '0646345469', 'female'),
(6, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 'admin1@gmail.com', '2018-08-16', 1, 'unnamed.png', '0905345670', 'none'),
(7, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 'admin2@gmail.com', '2018-08-16', 1, 'unnamed.png', '0905346884', 'none'),
(8, 'tan', '25d55ad283aa400af464c76d713c07ad', 'tai@gmail.com', '2020-12-03', 0, 'user1.png', '0156856897', 'male'),
(12, 'tan', 'c4ca4238a0b923820dcc509a6f75849b', 'tan@gmail.com', '2021-06-30', 0, '010.jpg', '0123456789', 'Nam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
