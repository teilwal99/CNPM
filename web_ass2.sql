-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 28, 2020 lúc 02:57 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_ass2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(800) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unnamed.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `name`, `position`, `email`, `img`) VALUES
(1, 'Sett Williams', 'CEO & Founder', 'williams@gmail.com', 'team1.jpg'),
(2, 'George Wilson', 'Kiến trúc sư\r\n', 'GeorgeW@gmail.com', 'team2.jpg'),
(3, 'Robert Pattinson', 'Kiến trúc sư\r\n', 'ROB@gmail.com', 'team3.jpg'),
(4, 'Noah Roberts', 'Kiến trúc sư\r\n', 'Noah_12@gmail.com', 'team4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` int(5) NOT NULL,
  `cost` int(15) NOT NULL,
  `category` varchar(100) NOT NULL,
  `poster` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT 'house.png',
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id`, `cost`, `category`, `poster`, `content`, `img`, `author`) VALUES
(1, 123000, 'Philosophy', 1, 'Ikigai : The Japanese Secret To A Long And Happy Life', 'images1.jpg', 'Hector Garcia'),
(2, 102000, 'Biography', 2, 'Everything, everything', 'images2.jpg', 'Nicola Yoon'),
(3, 112000, 'Biography', 4, 'Becoming', 'images3.jpg', 'Michelle Obama'),
(4, 202000, 'Science', 1,  'The Selfish Gene 40th anniversary Edition', 'images4.jpg', 'Richard Dawkins'),
(5, 199999, 'Literature & Fiction', 1,  'The Choice', 'images5.jpg', 'Nicholas Sparks'),
(6, 150000, 'Science', 1,  'The Bestseller Code: Anatomy of the Blockbuster Novel', 'images6.jpg', 'Jodie Archer & Mathew L.Jockers'),
(7, 999000, 'Science Fiction & Fantasy', 2, 'The Testaments: The Sequel to The Handmaid"s Tale', 'images7.jpg', 'Margaret Atwood'),
(8, 99999, 'Science Fiction & Fantasy', 2, 'The Dutch House: A Novel', 'images8.jpg', 'Ann Patchett'),
(9, 99900, 'Literature & Fiction', 2, 'The Starless Sea: A Novel', 'images9.jpg', 'Erin Morgenstein'),
(10, 888000, 'Literature & Fiction', 3, 'The Water Dancer: A Novel', 'images10.jpg', 'Ta-nehisi Coates'),
(11, 777000, 'Mystery, Thriller & Suspense', 3, 'The Night Fire: A Renée Ballard and Harry Bosch Novel', 'images11.jpg', 'Michael Connelly'),
(12, 666000, 'Mystery, Thriller & Suspense', 4, 'The Institute: A Novel', 'images12.jpg', 'Stephen King'),
(13, 555000, 'Philosophy', 4, 'Stillness Is the Key', 'images13.jpg', 'Ryan Holiday'),
(14, 999000, 'Mystery, Thriller & Suspense', 2, 'The Silent Patient', 'images14.jpg', 'Alex Michaelides'),
(15, 99900, 'Biography', 2,"Maid: Hard Work, Low Pay, and a Mother's Will to Survive", 'images15.jpg', 'Michelle Obama'),
(16, 100000, 'Biography', 2,"The Unwinding of the Miracle: A Memoir of Life, Death, and Everything That Comes After", 'images16.jpg', 'Julie Yip-Williams'),
(17, 99900, 'Biography', 2, "Maybe You Should Talk to Someone: A Therapist, HER Therapist, and Our Lives Revealed", 'images17.jpg', 'Lori Gottlieb'),
(18, 99900, 'Literature & Fiction', 2, "The Nickel Boys: A Novel", 'images18.jpg', 'Colson Whitehead'),
(19, 99900, 'Political', 2, "How to Be an Antiracist", 'images19.jpg', 'Ibram X. Kendi'),
(20, 99900, 'Literature & Fiction', 2, "City of Girls: A Novel", 'images20.jpg', 'Penguin Random House'),
(21, 99900, 'Science', 2, "Three Women", 'images21.jpg', 'Lisa Taddeo'),
(22, 99900, 'Literature & Fiction', 2, "The Book of Dust: The Secret Commonwealth", 'images22.jpg', 'Phillip Pullman'),
(23, 99900, 'Literature & Fiction', 2, "On Earth We're Briefly Gorgeous: A Novel", 'images23.jpg', 'Ocean Vuong'),
(24, 99900, 'Biography', 2, "They Called Us Enemy", 'images24.jpg', 'George Takai'),
(25, 99900, 'Biography', 2, "She Said: Breaking the Sexual Harassment Story That Helped Ignite a Movement", 'images25.jpg', 'Jodi Kantor and Megan Twohey'),
(26, 99900, 'Literature & Fiction', 2, "Red at the Bone: A Novel", 'images26.jpg', 'Jacqueline Woodson'),
(27, 99900, 'Science', 2, "Say Nothing: A True Story of Murder and Memory in Northern Ireland", 'images27.jpg', 'Patrick Radden Keefe'),
(28, 99900, 'Science', 2, "A Woman of No Importance: The Untold Story of the American Spy Who Helped Win World War II", 'images28.jpg', 'Sonia Purnell'),
(29, 99900, 'Science', 2, "Super Pumped: The Battle for Uber", 'images29.jpg', 'W. W. Norton & Company'),
(30, 99900, 'Science', 2, "Furious Hours: Murder, Fraud, and the Last Trial of Harper Lee", 'images30.jpg', 'Knopf'),
(31, 99900, 'Science', 2, "The Ghosts of Eden Park: The Bootleg King, the Women Who Pursued Him, and the Murder That Shocked Jazz-Age America", 'images31.jpg', 'Crown'),
(32, 99900, 'Biography', 2, "Leonardo da Vinci", 'images32.jpg', 'Walter Isaacson');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
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
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `birthday`, `role`, `avatar`, `phone`, `gender`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', '2018-08-16', 1, 'unnamed.png', '0964410362', 'none'),
(2, 'user1', '25d55ad283aa400af464c76d713c07ad', 'user1@gmail.com', '2020-12-03', 0, 'user1.png', '0325482639', 'male'),
(3, 'user2', '25d55ad283aa400af464c76d713c07ad', 'user2@gmail.com', '2020-12-11', 0, 'user2.png', '0256461116', 'female'),
(4, 'user3', '25d55ad283aa400af464c76d713c07ad', 'user3@gmail.com', '1999-05-19', 0, 'user3.png', '0322652633', 'male'),
(5, 'user4', '25d55ad283aa400af464c76d713c07ad', 'user4@gmail.com', '2020-12-22', 0, 'user4.png', '0646345469', 'female'),
(6, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 'admin1@gmail.com', '2018-08-16', 1, 'unnamed.png', '0905345670', 'none'),
(7, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 'admin2@gmail.com', '2018-08-16', 1, 'unnamed.png', '0905346884', 'none'),
(8, 'tai', '25d55ad283aa400af464c76d713c07ad', 'tai@gmail.com', '2020-12-03', 0, 'user1.png', '0156856897', 'male'),
(9, 'quan', '25d55ad283aa400af464c76d713c07ad', 'quan@gmail.com', '2020-12-11', 0, 'user2.png', '056887663', 'female'),
(10, 'liem', '25d55ad283aa400af464c76d713c07ad', 'liem@gmail.com', '1999-05-19', 0, 'user3.png', '0322645868', 'male'),
(11, 'cong', '25d55ad283aa400af464c76d713c07ad', 'cong@gmail.com', '2020-12-22', 0, 'user4.png', '0833156876', 'female');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
