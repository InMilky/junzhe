/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : junzhe

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 11/06/2022 22:11:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员邮箱',
  `encrypt_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '经过加密的用户密码储存',
  `created_time` datetime(0) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`ID`, `email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_table
-- ----------------------------
INSERT INTO `admin_table` VALUES (1, '13333333333', 'admin@163.com', 'de4aa6c7fdec8cd6f2662dd0f9774824', '2021-05-04 05:11:29');
INSERT INTO `admin_table` VALUES (6, '15555555555', 'fqzhou@163.com', '39d83b1e554810f76ced350198b080d0', '2022-02-11 11:50:53');

-- ----------------------------
-- Table structure for auto_increment
-- ----------------------------
DROP TABLE IF EXISTS `auto_increment`;
CREATE TABLE `auto_increment`  (
  `ID` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '//订单编号自增序列的步长表',
  `currentValue` int(6) UNSIGNED ZEROFILL NOT NULL COMMENT '//自增序列的当前值',
  `step` int(2) NOT NULL DEFAULT 1 COMMENT '//步长',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auto_increment
-- ----------------------------
INSERT INTO `auto_increment` VALUES (0, 'order_No', 000123, 1);

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//品牌名称',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '//品牌中文名',
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'upload/' COMMENT '//品牌logo',
  `level` int(5) NOT NULL DEFAULT 1 COMMENT '//等级',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, 'CHANEL', '', 'upload/2ed4fe448c92f9253a441d25cc4ed415.webp', 4);
INSERT INTO `brand` VALUES (2, 'GUCCI', '', 'upload/66b0bb35b801ae96be2e61d1e5a636a3.webp', 5);
INSERT INTO `brand` VALUES (3, 'LV', '', 'upload/ad083d7e88bf9ab6df139bc4c46e77a5.webp', 4);
INSERT INTO `brand` VALUES (4, 'Dior', '迪奥', 'upload/06e24ea982238450976fee15023d9a23.webp', 5);
INSERT INTO `brand` VALUES (5, 'MUJOSH', '木九十', 'upload/a5f976818b8cd2a91f423aab81c5994f.jpg', 4);
INSERT INTO `brand` VALUES (6, 'NYX', '', 'upload/52d8a11c415d7450570912ddeec434f3.webp', 5);
INSERT INTO `brand` VALUES (7, 'ROSDN', '劳士顿', 'upload/84684fa6f0bd2f00cd3382a3a54d926d.webp', 5);
INSERT INTO `brand` VALUES (8, 'NUANCE', '', 'upload/4ec7523be090487acb136bff59b00508.webp', 3);
INSERT INTO `brand` VALUES (9, 'JIMMY', '', 'upload/835f74b3457d70eb36e466918140875c.webp', 5);
INSERT INTO `brand` VALUES (10, 'SMOOKY', '', 'upload/68dcd6e8bb489849c06dee9637d419ef.webp', 5);
INSERT INTO `brand` VALUES (11, 'NUCELLE', '纽芝兰', 'upload/9993b495df36880fffd0c61761c3f0cd.jpg', 4);
INSERT INTO `brand` VALUES (12, 'Estee Lauder', '雅诗兰黛', 'upload/', 3);
INSERT INTO `brand` VALUES (13, 'Baolini', '宝丽妮', 'upload/', 1);
INSERT INTO `brand` VALUES (14, 'ARMANI', '阿玛尼', 'upload/', 1);
INSERT INTO `brand` VALUES (15, 'MAX', '魅可', 'upload/', 1);
INSERT INTO `brand` VALUES (16, 'YSL', '', 'upload/', 1);

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '焦点图ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'banner名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'banner描述',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '/item/' COMMENT 'banner链接',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '/upload/' COMMENT 'banner图片地址',
  `links` int(11) NOT NULL DEFAULT 0 COMMENT '点击率',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('07343c17-4598-47d8-be7b-b4687008dbe4', '春季焕新潮满减活动', 'NEW SPRING 2022春季焕新潮满减活动，立即参加', '/item/', 'upload/72e5721d30a983ee4045967af71c532e.jpg', 0);
INSERT INTO `carousel` VALUES ('5708d587-7183-42db-8303-3fba978e6ee1', '家具品质日满减上不封顶', '家具品质日，满减活动，上不封顶', '/item/', 'upload/929c2f8b32427f20f02609bd51e59ccf.jpg', 0);
INSERT INTO `carousel` VALUES ('5bb493f1-f6e7-4466-a5fe-b46f8bd43102', '荣耀60系列手机', '参与活动获取荣耀60系列手机，送20元京东E卡', '/item/', 'upload/ccf4e7f4932a2a6f971ce358ef5d2bff.jpg', 0);
INSERT INTO `carousel` VALUES ('cb9fea66-d1e3-4bdf-8def-5b7a5d088117', '阿玛尼手表', '阿玛尼手表钜惠来袭，限时三天', '/item/', 'upload/02d9151cf3812c9911f326d48c68c8e5.jpg', 0);
INSERT INTO `carousel` VALUES ('f708e852-b9b4-4c89-a5b5-b8d4545bb871', 'Cohnim Kevin轻奢包包', 'Cohnim Kevin轻奢包包，经典百搭，优雅典范', '/item/', 'upload/7f19144732e6e82d3a46e89c0bbf8721.jpg', 0);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '//用户编号',
  `item_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '//商品编号',
  `quantity` int(11) NOT NULL DEFAULT 1 COMMENT '//数量',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (56, 17, 'dcec346e-8bef-4182-b2e3-e0a88ea22247', 3);
INSERT INTO `cart` VALUES (66, 17, '229de4ff-19d4-4317-9c82-6b258aed2010', 1);
INSERT INTO `cart` VALUES (67, 17, 'd13e3729-d4d5-42e3-b634-1df872f46cb3', 1);
INSERT INTO `cart` VALUES (68, 17, '3ab39a18-3581-4f49-abd9-7f8a5f702283', 1);
INSERT INTO `cart` VALUES (70, 19, '229de4ff-19d4-4317-9c82-6b258aed2010', 1);
INSERT INTO `cart` VALUES (71, 19, 'd13e3729-d4d5-42e3-b634-1df872f46cb3', 2);
INSERT INTO `cart` VALUES (74, 21, 'eef6e731-56bb-4d2e-8ead-459cb792bb81', 1);
INSERT INTO `cart` VALUES (75, 21, 'f3ac9336-6447-47b4-81bb-cb7bef2bd437', 1);
INSERT INTO `cart` VALUES (77, 22, 'eef6e731-56bb-4d2e-8ead-459cb792bb81', 1);
INSERT INTO `cart` VALUES (78, 22, 'ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', 1);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '//商品编号',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//商品名称',
  `category` int(11) NOT NULL DEFAULT 1 COMMENT '//商品类型',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '//用于购物车显示颜色分类',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '//品牌',
  `m_price` double(10, 2) NULL DEFAULT NULL COMMENT '//优惠价',
  `price` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '//商品价格',
  `sold_num` int(10) NOT NULL DEFAULT 0 COMMENT '//商品销量',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//商品图片地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//商品描述',
  `isMiaoSha` int(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 00 COMMENT '0-不是秒杀商品，1-是秒杀商品',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('03297dc9-38d1-4c8d-b696-53e5adedda1f', '雅诗兰黛Double Wear持妆粉底液 油皮亲妈遮瑕控油防晒', 5, '自然色', '雅诗兰黛Estee Lauder', 399.00, 419.00, 40000, 'upload/0c0f4c5ecaa8e5824e60ef3f05b4ef67.png', '雅诗兰黛Double Wear持妆粉底液  遮瑕控油防晒持妆透气不暗沉', 00);
INSERT INTO `item` VALUES ('0d57fd50-6a06-4160-a86b-ff7010cec8ce', 'Baolini999足银耳环女耳钉潮小众高级感轻奢耳饰耳坠', 7, '999足银 免费刻字', '宝丽妮Baolini', 51.00, 71.00, 222, 'upload/e29e53b32aa55091553c1fa4248eb78f.png', '宝丽妮(Baolini)999足银耳环女耳钉潮小众高级感轻奢耳饰耳坠老婆情人节生日礼物送女朋友刻字', 00);
INSERT INTO `item` VALUES ('12af7ee1-aaed-4f63-aaa8-a9c277e06d39', '玛丽黛佳先锋微雕眉笔持久防水防汗', 5, '1.5mm笔触', '玛丽黛佳', 32.00, 35.00, 3000, 'upload/25a39e2b3cfaa347a27e91019dff0cc7.png', '玛丽黛佳先锋微雕眉笔持久防水防汗 立体自然不晕染 根根分明 1.5mm笔触 笔芯长达5厘米 不易断', 00);
INSERT INTO `item` VALUES ('1a7c3649-74a7-4824-91cf-f5dd3871bdda', 'NUCELLE时尚单肩包', 6, '湖蓝色', '纽芝兰NUCELLE', 195.00, 215.00, 210, 'upload/b4087ec937c600d1e4b755b351380374.png', '包包女包时尚单肩手提包休闲百搭女士斜挎包女包小方包', 00);
INSERT INTO `item` VALUES ('1ca398ab-d12b-4f3f-91ea-0d1c4fed042c', 'ECCO爱步单鞋新款t字带尖头小牛皮鞋女', 6, '米白色#36', 'ECCO', 1299.00, 1499.00, 1640, 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg', 'ECCO爱步单鞋新款尖头小牛皮鞋女玛丽珍鞋休闲商务正装鞋 型塑269453 裸粉色/米白色269453-51963', 01);
INSERT INTO `item` VALUES ('2047e08b-0afd-4d5a-8b59-3f37009cf436', 'nyx眼影16色眼影盘大地色彩妆盘日常美妆眼妆眼影盒暖色盘03', 5, '暖色盘03#13.28g', 'NYX', 108.00, 132.00, 2146, 'upload/c9967370be1d110c6ee8bfe75bcc17a2.jpg', 'nyx眼影16色眼影盘大地色彩妆盘哑光珠光闪粉高光日常美妆眼妆眼影盒暖色盘03新年情人节礼物送女友13.28g/盒 ', 00);
INSERT INTO `item` VALUES ('229de4ff-19d4-4317-9c82-6b258aed2010', '美国nyx/NYX4色铆钉眼影南瓜色大地色眼影盘 ', 5, '大地色FTSP04', 'NYX', 98.00, 108.00, 1655, 'upload/42fc59fb8fc77910ba66907a7aa18178.png', 'NYX眼影  美国nyx/NYX4色铆钉眼影南瓜色大地色眼影盘 FTSP04', 01);
INSERT INTO `item` VALUES ('2ad0d041-8c5f-4b70-a0ef-1ca2fd476dba', '阿玛尼ARMANI红管唇膏口红哑光405唇釉礼盒4G', 5, '红管哑光#405烂番茄色', '阿玛尼ARMANI', 199.00, 189.00, 100, 'upload/0270d9dc3901a53a6257ade450b5762d.png', '阿玛尼ARMANI红管哑光405烂番茄色雾面云绒，磁石设计，浓郁出色丝滑润泽加购送唇釉礼盒4G', 00);
INSERT INTO `item` VALUES ('2b4c3bbb-793d-4314-bb12-845b8f1ded2a', 'mini&yaya 925银珍珠耳环女士款气质长款时尚耳坠', 7, '珍珠白足银', 'mini&yaya', 218.00, 238.00, 1129, 'upload/92fe182f296b07f84430f7e05eb9acfd.png', 'mini&yaya 925银珍珠耳环女士款气质长款时尚耳坠', 01);
INSERT INTO `item` VALUES ('345ab966-4cd2-460c-bf0b-0221d644e8f0', 'Maybelline新款腮红三色可选FITME系列', 5, '胭脂红#4.5g', '美宝莲Maybelline', 59.00, 79.00, 1711, 'upload/b739b110a1e7fb5dc732809d69ccebf3.png', 'Maybelline美宝莲新款NEW YORK腮红，三色可选送刷子，4.5g', 00);
INSERT INTO `item` VALUES ('39a15298-7b55-41de-970b-fdcfe06d9ec2', 'Viney头层牛皮单肩包女时尚包包', 6, '珍珠蓝小容量', 'Viney', 259.00, 269.00, 504, 'upload/64791b608a1993e1516d06794ec54abf.png', 'Viney头层牛皮单肩包女时尚包包女包百搭手提小方包休闲简约品牌斜挎包女 珍珠蓝', 00);
INSERT INTO `item` VALUES ('39cacf9d-4b73-43ab-b3bf-11cb42bd5f80', 'CainKenna女包菱格链条包小包单肩斜挎大容量软皮腋下包', 6, '黑色菱格', 'CainKenna', NULL, 209.00, 1010, 'upload/852b701d6ec6fc7f73f232c66f8dce9b.png', 'CainKenna女包菱格链条包小包单肩斜挎大容量软皮腋下包', 00);
INSERT INTO `item` VALUES ('3ab39a18-3581-4f49-abd9-7f8a5f702283', 'coco口红套盒炫亮魅力口红58丝绒系列58豆沙红', 5, '丝绒系列#58豆沙红', '香奈儿Chanel', 208.00, 338.00, 1028, 'upload/8fee2d47ffc38bc84d18a777b30b018a.png', '香奈儿（Chanel）炫亮魅力口红58丝绒系列58豆沙红 coco口红套盒', 01);
INSERT INTO `item` VALUES ('3d3d0cad-59f1-44c8-89a3-c1434027efbc', '小水滴葫芦粉扑美妆蛋干湿两用3个装', 5, '3个装', '小水滴', 16.80, 19.80, 200, 'upload/94c1f8c3071d9146f0294ff1a8b0806b.png', '小水滴葫芦粉扑美妆蛋干湿两用3个装 送粉扑支架 亲肤无刺激柔软细腻延展性好 进口VE海绵', 00);
INSERT INTO `item` VALUES ('6932a6ea-cb93-4518-a4d3-aeabba5bea90', '艾诺系列手表女全自动璀璨机械表轻奢女表时尚简约', 7, '魅力红', '劳士顿ROSDN', 1511.00, 1730.00, 601, 'upload/df965180ad398c821ff77164e1f754f1.png', '艾诺系列手表女全自动璀璨机械表轻奢女表时尚简约防水情侣女士手表魅力红', 00);
INSERT INTO `item` VALUES ('69d1b800-13a2-4e21-9cea-352502be4f48', '简约大气黑白灰搭配自然绿植可定制', 3, '自然绿植', '橘栀', NULL, 333333.00, 0, 'upload/3b2ded2d12158ef7aa11e9c8961c27d3.jpg', '简约大气黑白灰搭配自然绿植可定制', 00);
INSERT INTO `item` VALUES ('878be278-0bf7-476b-afab-3cd33f5b18a1', '罗衿女装毛妮外套女中长款', 4, '黑色M', '罗衿', 128.00, 158.00, 164, 'upload/8b9fef0977375469321dd75f822adb8d.png', '毛妮外套女中长款2021秋冬新品女装呢子大衣宽松显瘦赫本风西装领小个子黑色毛呢大衣潮', 00);
INSERT INTO `item` VALUES ('8c1d0ee0-0d5f-4723-897b-db90a242dac6', 'RayBan雷朋太阳镜男女款金属框单片式潮流渐变镜片墨镜', 6, '彩虹渐变', 'RayBan', NULL, 88.00, 2329, 'upload/c2c36162beb2ef5fb2e3a461a2a2be5d.png', 'RayBan雷朋太阳镜男女款金属框单片式潮流渐变镜片墨镜0RB3597 001/X0金色镜框透明蓝色渐变红镜片 尺寸33', 00);
INSERT INTO `item` VALUES ('9992f072-6256-437e-b15e-571bcd38684d', 'PEDIDNRO凉鞋女夏季欧美铆钉水钻性感一字扣带猫跟中跟女鞋', 6, '白色+铆钉水钻', 'PEDIDNRO', 88.00, 128.00, 330, 'upload/76fc45ef48f0c83c491d5ed0df0d7783.png', 'PEDIDNRO品牌凉鞋女夏季欧美铆钉水钻2021新款性感一字扣带猫跟中跟女鞋', 00);
INSERT INTO `item` VALUES ('9b84e4e5-f8b6-4def-a246-27fe9b3ff654', '温璞春季夏季大帽檐草帽女百搭可折叠沙滩帽子女 咖色', 6, '咖色 均码', '温璞', 39.00, 59.00, 324, 'upload/e432ea35d9560dec082e72d17d5d9a87.png', '温璞春季夏季大帽檐草帽女夏天小清新出游防晒遮阳帽女韩版百搭可折叠沙滩帽子女 咖色', 00);
INSERT INTO `item` VALUES ('9f0502c3-81c7-4b74-a5bc-d0847ff1dc32', 'Chanel香奈儿口红可可小姐#440亚瑟 丝绒黑管', 5, 'coco#440亚瑟', '香奈儿Chanel', NULL, 360.00, 1000, 'upload/803ecf67c9d8819dd5276a7601a239aa.png', 'Chanel香奈儿口红可可小姐#440亚瑟 丝绒黑管滋润保湿 持久服帖', 00);
INSERT INTO `item` VALUES ('a171d2e6-ec7f-42d9-8574-c35f7c40628b', '沧海系列皮带石英手表女学生情侣表白色', 7, '白色LS3886S/D-A', '天王表TIANWANG', 188.00, 199.00, 100, 'upload/c431100491e19b64cddbc7c9a6ad9a99.png', '天王表(TIANWANG)手表 【三八节礼物】沧海系列皮带石英手表女学生情侣表白色LS3886S/D-A', 00);
INSERT INTO `item` VALUES ('a800592e-3987-41ae-a51d-af171cc40565', 'APDISHU女包新款牛皮单肩包百搭', 6, '黑色大容量', 'APDISHU', 408.00, 428.00, 1100, 'upload/c36fc92b16219098b65902dc0f998de1.png', 'APDISHU女包新款牛皮大容量包包女包百搭撞色女士手提单肩包时尚女式通勤包包', 00);
INSERT INTO `item` VALUES ('a8687c9a-1876-4856-a79c-7133e338463f', '简约北欧风大气美观蓝白搭配两房一厅', 3, '主调天蓝色', '橘栀', NULL, 66666.00, 1, 'upload/35e664d6aec7b70d43941756208f13c8.jpg', '简约北欧风大气美观蓝白搭配', 00);
INSERT INTO `item` VALUES ('b271d092-6bf4-428f-832b-c7c1e58e8b9a', 'MAX魅可尤舞弹哑光口红#922苹果红', 5, '#922苹果红', 'MAX魅可', NULL, 185.00, 200, 'upload/75ebed48784e8289546af7a05e58faff.png', 'MAX魅可尤舞弹口红#922苹果红唇膏哑光 柔雾丝滑浓郁持色', 00);
INSERT INTO `item` VALUES ('bac0476a-57f9-494b-8533-8a87861be678', '简约大气自然设计房可定制三房一厅', 3, '两房一厅', '橘栀', NULL, 190000.00, 0, 'upload/a414949f4f8e8dd5057c1d33ae5f2839.jpg', '简约大气自然设计房可定制两房一厅', 00);
INSERT INTO `item` VALUES ('c0f56023-79d1-4eaa-bf75-ff4ae52d6742', '北美黑胡桃木椅现代简约布艺可定制', 3, '黑胡桃木', '方迪', 844.00, 1044.00, 21, 'upload/407add87c1345200ffdabfba4adb1cd6.png', '北美黑胡桃木椅，FAS级北美黑胡桃木纹理清晰，纯实木稳固，天然美观', 00);
INSERT INTO `item` VALUES ('c530b72b-121a-44a3-aac2-ed2d9c5f454c', 'JUST STAR欧时纳单肩斜挎包百搭简约时尚', 6, '米白色', '欧时纳', NULL, 187.00, 71, 'upload/1fece662586b26e073e9a8a435833c5f.png', '欧时纳（JUST STAR）包包女包时尚单肩斜挎包女士挎包小方包链条包38女神节生日礼物送女友', 00);
INSERT INTO `item` VALUES ('d13e3729-d4d5-42e3-b634-1df872f46cb3', '木九十新品太阳镜百搭黑超偏光男女墨镜MJ102SH519', 6, 'BKC1曜石黑+单灰偏光片', '木九十MUJOSH', 599.00, 699.00, 51129, 'upload/ef1916f13a4bb31f309cf0bb36b39016.jpg', 'MUJOSH/木九十2021年春季前卫简约舒适时尚，男女通用，适合各种脸型，功能: 防UVA、防UVB、偏光、遮阳。尼龙镜片，配送高清尼龙镜片/双面防油污/内渡减反射膜BKC1曜石黑+单灰偏光片', 01);
INSERT INTO `item` VALUES ('d2330207-1263-40f6-a2d8-40c869253356', '木耳边大檐帽花朵波浪边遮阳帽大沿帽米色', 6, '米色 +均码', '木耳边', 259.00, 39.00, 330, 'upload/b8894a6c89c6baa0c11cf6f408c9c6b8.png', '木耳边大檐帽 夏天韩版女士草帽子木耳边花朵波浪边遮阳帽大沿帽沙滩防晒帽子遮阳帽防晒帽子户外旅行女生帽 米色 ', 00);
INSERT INTO `item` VALUES ('dcec346e-8bef-4182-b2e3-e0a88ea22247', '海尔空气净化器卧室厨房智能家电KJ660F-QH', 2, '适用面积46-80平方米', '海尔', NULL, 5999.00, 51, 'upload/ac43446fe7c2c66c7cb4d3bd768532b9.png', '海尔空气净化器卧室厨房智能家电 适用面积46-80平方米', 00);
INSERT INTO `item` VALUES ('dd409f43-0508-4fde-ac6e-1a8b28ffcbb1', '北欧简约拼色美观独居房两层一房一厅', 3, '樱花粉+浅蓝色', '橘栀', 51129.00, 51640.00, 3, 'upload/5ffdd16027a134566479892220b19502.jpg', '北欧简约拼色美观独居房双层', 00);
INSERT INTO `item` VALUES ('eef6e731-56bb-4d2e-8ead-459cb792bb81', '迪奥眼镜太阳镜DIRECTI0N女款黑色镜框紫罗兰色镜片眼镜', 6, '紫罗兰渐变', '迪奥Dior', 1299.00, 1369.00, 8023, 'upload/d55a8daf4f00aaa09edc5c55cef02630.png', '迪奥 Dior 女款黑色镜框紫罗兰色镜片眼镜太阳镜 Dior DIRECTI0N-26S0D-56mm', 00);
INSERT INTO `item` VALUES ('ef71b3ab-21d6-4ab8-b9b9-8e5651b40f76', '迪奥全新烈艳蓝金单色腮红6.7G 新品', 5, '烈艳蓝金#6.7G', '迪奥Dior', 268.00, 279.00, 2900, 'upload/dd3027f1c63c05160cd2dd705a380d2c.png', '迪奥全新烈艳蓝金单色腮红6.7G 新品', 01);
INSERT INTO `item` VALUES ('f31b9420-7a0a-48a8-a383-929dfb2c6e24', 'YSL圣罗兰方管口红专柜大牌36#珊瑚雪纺', 5, '#36珊瑚雪纺+3.8G', 'YSL', 209.00, 219.00, 200, 'upload/d4a193dd0cbdbec860831531d018db08.png', 'YSL圣罗兰方管口红专柜大牌36#珊瑚雪纺，滋润哑光持久保湿，3.8G', 00);
INSERT INTO `item` VALUES ('f3ac9336-6447-47b4-81bb-cb7bef2bd437', '卡姿兰(Carslan)蜗牛气垫调控霜礼盒装', 5, '#03裸肤色+12.5g*2', '卡姿兰Carslan', 199.00, 229.00, 5129, 'upload/563a1b018100f135be647bab075ba497.png', '卡姿兰微雾光气垫粉底液控油持久遮瑕微哑光不油光沾腻不脱隔离霜易上妆自然薄透雾光宝盒情人节年货礼物 03#裸肤色【12.5g*2】', 01);
INSERT INTO `item` VALUES ('f79a79df-6b2d-41f5-b401-091005f5c77e', '北欧伊姆斯椅家用现代简约休闲座椅', 3, '天然榉木', '伊姆斯', 124.00, 129.00, 300, 'upload/ea88a71e21a54513d9cf8c95a442e44f.jpg', '北欧伊姆斯椅家用现代简约休闲座椅，环保椅身材质高密度聚丙烯PP，天然榉木椅腿，稳固钢筋构架', 00);
INSERT INTO `item` VALUES ('fcf421ea-dbdc-4b55-a533-5aca27289874', '恒源祥彩羊特价百搭减龄棉衣女短款', 4, '宝蓝色短款', '彩羊Fazeya', 199.00, 99.00, 511, 'upload/f189cbed23758b3cdb9cc5982197881e.png', '恒源祥彩羊特价捡漏反季百搭减龄棉衣女短款2021年新款女装反季冬季棉服棉袄韩版宽松冬季外套', 00);
INSERT INTO `item` VALUES ('fd5e9175-14bd-4082-bdbc-cd38b7f01e4d', '玛丽黛佳先锋微雕眉笔持久防水防汗，买一送一', 5, '买一送一', '玛丽黛佳', 29.00, 34.00, 3000, 'upload/275d4d40c16d9d47e46677b42aad9bc2.png', '玛丽黛佳先锋微雕眉笔持久防水防汗 双头立体自然不晕染 买一送一', 00);
INSERT INTO `item` VALUES ('ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', '卡诗顿新款手表潮流石英表夜光表薄款双日历男士手表腕表', 7, 'S001格调金黑', '卡诗顿', 1288.00, 1388.00, 8023, 'upload/c92973ce7e9f7b4e05adc50eb8bce0e2.png', '卡诗顿新款手表男手表防水时尚简约潮流石英表夜光表薄款双日历男士手表腕表 S001-玫瑰金黑面皮带(石英表)', 01);

-- ----------------------------
-- Table structure for item_category
-- ----------------------------
DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品类型名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品类型描述',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_category
-- ----------------------------
INSERT INTO `item_category` VALUES (1, '手机数码', '手机数码');
INSERT INTO `item_category` VALUES (2, '厨具电器', '厨具电器');
INSERT INTO `item_category` VALUES (3, '家居配饰', '家居配饰');
INSERT INTO `item_category` VALUES (4, '服装服饰', '服装服饰');
INSERT INTO `item_category` VALUES (5, '个护美妆', '个护美妆');
INSERT INTO `item_category` VALUES (6, '鞋包户外', '鞋包户外');
INSERT INTO `item_category` VALUES (7, '手表饰品', '手表饰品');
INSERT INTO `item_category` VALUES (8, '医药百货', '医药百货');
INSERT INTO `item_category` VALUES (9, '图书杂志', '图书杂志');
INSERT INTO `item_category` VALUES (10, '礼品绿植', '礼品绿植');
INSERT INTO `item_category` VALUES (11, '手表饰品', '手表饰品');

-- ----------------------------
-- Table structure for item_detail
-- ----------------------------
DROP TABLE IF EXISTS `item_detail`;
CREATE TABLE `item_detail`  (
  `ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `publish_date` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2022年春季' COMMENT '//上市时间',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '//主要用于购物车显示',
  `feature` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//特性',
  `size` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//尺寸',
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//详情图',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_detail
-- ----------------------------
INSERT INTO `item_detail` VALUES ('1ca398ab-d12b-4f3f-91ea-0d1c4fed042c', 'cfdab3c8d25418b0a1479a3b01678e9a', 'ECCO', '2022年春季', '米白色', '羊皮膛底，牛筋底鞋底，超纤里内里', '库存有33~39码女鞋', 'upload/cdf0976a4031ddd809e2400f9d47aa30.jpg;upload/87b9c44abd630a84e6c5f6f32492b7b3.jpg;upload/e3e3e75b72ad9c3515efa7ec2393bbad.jpg;upload/8cd728d3b660aba8160386edf50ea770.jpg', '头层牛皮材质，烫钻工艺细带设计，简洁大气。舒适牛皮膛底透气性强，9cm性感高跟，拉长双腿比例，加上防滑耐滑牛筋底，呵护双脚');
INSERT INTO `item_detail` VALUES ('229de4ff-19d4-4317-9c82-6b258aed2010', '42fc59fb8fc77910ba66907a7aa18178', 'NYX', '2022年春季', '', '', '', 'upload/2e7f55c9e4450a5258487ac7db0438ea.jpg;upload/4de6a22aba316fcb11f8e3351e0060b0.jpg;upload/fdbfd10262a1715b1f82524d7c1970e1.jpg', NULL);
INSERT INTO `item_detail` VALUES ('2b4c3bbb-793d-4314-bb12-845b8f1ded2a', '92fe182f296b07f84430f7e05eb9acfd', 'mini&yaya', '2022年春季', '珍珠白', '细腻抛光/镶嵌工艺', '长约30mm，贝珠直径10mm', 'upload/193eb95f3e19044ec7c3f05ae11bc8be.jpg;upload/cafd60e5a8b053fed34030b1c8600aa0.jpg;upload/12352efd5ec3e594dcc92cd3e5c9c47a.jpg;upload/441d6457c5d24d632a7351151ffc0cc9.jpg', '材质S925银锆石贝珠');
INSERT INTO `item_detail` VALUES ('3ab39a18-3581-4f49-abd9-7f8a5f702283', '8fee2d47ffc38bc84d18a777b30b018a', '香奈儿Chanel', '2022年春季', '豆沙红', '', '58丝绒系列豆沙红', 'upload/3eaeef288b1cd3a5bc08f2882a5f6393.jpg;upload/3a377d3f2a2db9e1c5a4655ef0ede530.jpg;upload/6a99dbcc63f868410769feffd9869747.jpg;upload/8d35e5f26fac2585a0cc9a6c504c74dc.jpg;upload/2c39bc239f373cedd5c07c97fa3cec0e.jpg', NULL);
INSERT INTO `item_detail` VALUES ('d13e3729-d4d5-42e3-b634-1df872f46cb3', 'ef1916f13a4bb31f309cf0bb36b39016', '木九十MUJOSH', '2021年春季', 'BKC1曜石黑+单灰偏光片', '尼龙镜架', '64mm及以上', 'upload/31f7fb215f38f7052dc4711dff8e690b.jpg;upload/d4609ce4957f092122619beb4bcc460b.jpg;upload/a133ce412e8cce4480f7209e013edf7a.jpg;upload/78663fed7a0815a64d6a4b39a3796dda.jpg', '前卫简约舒适时尚，男女通用，适合各种脸型，功能: 防UVA、防UVB、偏光、遮阳。尼龙镜片，配送高清尼龙镜片/双面防油污/内渡减反射膜');
INSERT INTO `item_detail` VALUES ('d2330207-1263-40f6-a2d8-40c869253356', 'b8894a6c89c6baa0c11cf6f408c9c6b', '木耳边', '2022年春季', '米白色', '', '适合所有头围头型', 'upload/e578c971358b948a0fbfdcffef5a5190.jpg;upload/60f13880918fe3125e0533353ebcab2f.jpg', NULL);
INSERT INTO `item_detail` VALUES ('ef71b3ab-21d6-4ab8-b9b9-8e5651b40f76', 'dd3027f1c63c05160cd2dd705a380d2c', '迪奥Dior', '2018年春季', '哑光#999', '哑光，腮红色彩浓郁，妆效持久', '6.7g轻盈方便携带', 'upload/bc0c7794a0e206be63728fa117c9d13f.jpg;upload/d885f38de4621100b97c47b364a7f368.jpg;upload/bacbd320a242c800d4aba0a04d21d409.jpg;upload/46488c3a816ae8f027795ab0c3c21726.jpg', '三年持久保质期，内含27种色号任你选择，粉质细腻，刷子轻盈易上色，呈现哑光，锻光或亮光妆感');
INSERT INTO `item_detail` VALUES ('f3ac9336-6447-47b4-81bb-cb7bef2bd437', '563a1b018100f135be647bab075ba497', '卡姿兰Carslan', '2022年春季', '自然色', '无暇更贴合肤肌', '12寸大小，方便携带', 'upload/a6f71225a2c6eef105783f5628463fed.jpg;upload/9e942d9a6c797a5d11fd0742cbb491ff.jpg;upload/4b59236e9826e85264b4b792581514c4.jpg;upload/485c8c7b747cc6e357e1cf8e058a8cfa.jpg;upload/194e9fe0c36655a7dceedd7a54d2a6f0.jpg', '买一送一替换芯，超值装，便于更换使用，密封保险粉盒，更安全卫生。取粉均匀，上妆更精致');
INSERT INTO `item_detail` VALUES ('ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', 'c92973ce7e9f7b4e05adc50eb8bce0e2', '卡诗顿', '2022年春季', '格调金黑', '小牛皮表带舒适，高级优雅自信，掌控全局', '适合所有男士手腕大小，表带可调节', 'upload/bf3a28c956bcdee4c8b21620e5897b20.jpg;upload/ec50601113ebcafdb4474e86edef007b.jpg;upload/4ac5c95edf2a705d2ed4fbe81fbff48c.jpg;upload/cfb2f3dba9e3101f1844fd828a503032.jpg', '颜值爆表，小牛皮表带舒适更贴合手腕，高级优雅自信，掌控全局的感觉，更有四款颜色，两种表带任你选择');

-- ----------------------------
-- Table structure for item_stock
-- ----------------------------
DROP TABLE IF EXISTS `item_stock`;
CREATE TABLE `item_stock`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 10000 COMMENT '商品库存数量',
  `item_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`ID`, `item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_stock
-- ----------------------------
INSERT INTO `item_stock` VALUES (1, 10000, 'fcf421ea-dbdc-4b55-a533-5aca27289874');
INSERT INTO `item_stock` VALUES (2, 10000, '878be278-0bf7-476b-afab-3cd33f5b18a1');
INSERT INTO `item_stock` VALUES (3, 10000, '9992f072-6256-437e-b15e-571bcd38684d');
INSERT INTO `item_stock` VALUES (4, 10000, '2b4c3bbb-793d-4314-bb12-845b8f1ded2a');
INSERT INTO `item_stock` VALUES (5, 10000, '1ca398ab-d12b-4f3f-91ea-0d1c4fed042c');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `item_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品编号',
  `quantity` int(11) NOT NULL DEFAULT 0 COMMENT '购买数量',
  PRIMARY KEY (`ID`, `order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, '2022020205112933', 'd13e3729-d4d5-42e3-b634-1df872f46cb3', 1);
INSERT INTO `order_detail` VALUES (9, '2022033000001523', '03297dc9-38d1-4c8d-b696-53e5adedda1f', 1);
INSERT INTO `order_detail` VALUES (10, '2022033000001523', '345ab966-4cd2-460c-bf0b-0221d644e8f0', 1);
INSERT INTO `order_detail` VALUES (12, '2022033100002557', '2ad0d041-8c5f-4b70-a0ef-1ca2fd476dba', 3);
INSERT INTO `order_detail` VALUES (14, '2022033100003084', '345ab966-4cd2-460c-bf0b-0221d644e8f0', 2);
INSERT INTO `order_detail` VALUES (17, '2022040300004692', '39cacf9d-4b73-43ab-b3bf-11cb42bd5f80', 1);
INSERT INTO `order_detail` VALUES (18, '2022040300004864', 'c0f56023-79d1-4eaa-bf75-ff4ae52d6742', 1);
INSERT INTO `order_detail` VALUES (19, '2022040300005194', 'dcec346e-8bef-4182-b2e3-e0a88ea22247', 1);
INSERT INTO `order_detail` VALUES (20, '202204030000532', '03297dc9-38d1-4c8d-b696-53e5adedda1f', 1);
INSERT INTO `order_detail` VALUES (21, '202204040000561', '3d3d0cad-59f1-44c8-89a3-c1434027efbc', 3);
INSERT INTO `order_detail` VALUES (23, '2022040400005914', 'c530b72b-121a-44a3-aac2-ed2d9c5f454c', 1);
INSERT INTO `order_detail` VALUES (24, '2022040400006284', 'c0f56023-79d1-4eaa-bf75-ff4ae52d6742', 1);
INSERT INTO `order_detail` VALUES (25, '2022040400006478', 'dcec346e-8bef-4182-b2e3-e0a88ea22247', 1);
INSERT INTO `order_detail` VALUES (28, '2022040800007242', 'ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', 1);
INSERT INTO `order_detail` VALUES (29, '2022040800007349', 'd13e3729-d4d5-42e3-b634-1df872f46cb3', 1);
INSERT INTO `order_detail` VALUES (30, '2022041200007469', 'f3ac9336-6447-47b4-81bb-cb7bef2bd437', 1);
INSERT INTO `order_detail` VALUES (31, '2022041200007521', '229de4ff-19d4-4317-9c82-6b258aed2010', 1);
INSERT INTO `order_detail` VALUES (32, '2022041300008376', '3d3d0cad-59f1-44c8-89a3-c1434027efbc', 1);
INSERT INTO `order_detail` VALUES (33, '2022041300008376', '2ad0d041-8c5f-4b70-a0ef-1ca2fd476dba', 2);
INSERT INTO `order_detail` VALUES (34, '2022041300008376', 'b271d092-6bf4-428f-832b-c7c1e58e8b9a', 1);
INSERT INTO `order_detail` VALUES (36, '2022042600009254', '229de4ff-19d4-4317-9c82-6b258aed2010', 4);
INSERT INTO `order_detail` VALUES (37, '2022042600009598', 'ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', 1);
INSERT INTO `order_detail` VALUES (38, '2022042600009826', '229de4ff-19d4-4317-9c82-6b258aed2010', 1);
INSERT INTO `order_detail` VALUES (39, '2022042600010096', 'f3ac9336-6447-47b4-81bb-cb7bef2bd437', 1);
INSERT INTO `order_detail` VALUES (40, '2022042600010341', '229de4ff-19d4-4317-9c82-6b258aed2010', 1);
INSERT INTO `order_detail` VALUES (41, '202204260001063', 'f3ac9336-6447-47b4-81bb-cb7bef2bd437', 2);
INSERT INTO `order_detail` VALUES (43, '202204270001157', 'f3ac9336-6447-47b4-81bb-cb7bef2bd437', 4);
INSERT INTO `order_detail` VALUES (47, '2022042700012112', 'ff8f1a89-5e86-46bd-9f99-4d6b3eaaa9f4', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `account` double(10, 2) NOT NULL COMMENT '订单金额',
  `receiver_id` int(11) NOT NULL DEFAULT 1 COMMENT '收货人信息，默认为该用户的默认地址ID-1',
  `pay_state` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态0-已取消 1-等待付款  2-等待发货  3-运输中  4-已签收  5-已评价\r\n',
  `ordertime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '下单时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2022020205112933', 16, 599.00, 1, 1, '2022-02-02 05:11:29');
INSERT INTO `orders` VALUES ('2022033000001523', 17, 498.00, 1, 1, '2022-03-30 22:43:29');
INSERT INTO `orders` VALUES ('2022033100002557', 17, 567.00, 1, 2, '2022-03-31 21:55:56');
INSERT INTO `orders` VALUES ('2022033100003084', 17, 158.00, 1, 1, '2022-03-31 00:22:11');
INSERT INTO `orders` VALUES ('2022040300004692', 18, 209.00, 1, 1, '2022-04-03 21:55:44');
INSERT INTO `orders` VALUES ('2022040300004864', 18, 1044.00, 1, 1, '2022-04-03 22:21:06');
INSERT INTO `orders` VALUES ('2022040300005194', 18, 5999.00, 1, 2, '2022-04-03 22:23:54');
INSERT INTO `orders` VALUES ('202204030000532', 18, 419.00, 1, 2, '2022-04-03 22:29:23');
INSERT INTO `orders` VALUES ('202204040000561', 17, 59.40, 1, 1, '2022-04-04 10:50:32');
INSERT INTO `orders` VALUES ('2022040400005914', 17, 187.00, 1, 1, '2022-04-04 11:32:03');
INSERT INTO `orders` VALUES ('2022040400006284', 17, 1044.00, 1, 2, '2022-04-04 11:35:31');
INSERT INTO `orders` VALUES ('2022040800007242', 16, 1288.00, 1, 1, '2022-04-08 00:20:32');
INSERT INTO `orders` VALUES ('2022040800007349', 17, 599.00, 1, 1, '2022-04-08 00:39:04');
INSERT INTO `orders` VALUES ('2022041200007469', 1, 229.00, 1, 2, '2022-04-12 01:25:53');
INSERT INTO `orders` VALUES ('2022041200007521', 1, 108.00, 1, 2, '2022-04-12 01:27:50');
INSERT INTO `orders` VALUES ('2022041300008376', 16, 582.80, 1, 2, '2022-04-13 00:43:51');
INSERT INTO `orders` VALUES ('2022042600009254', 17, 432.00, 1, 2, '2022-04-26 12:37:15');
INSERT INTO `orders` VALUES ('2022042600009598', 17, 1388.00, 1, 2, '2022-04-26 13:30:18');
INSERT INTO `orders` VALUES ('2022042600009826', 19, 108.00, 1, 1, '2022-04-26 21:04:42');
INSERT INTO `orders` VALUES ('2022042600010096', 19, 229.00, 1, 2, '2022-04-26 21:12:43');
INSERT INTO `orders` VALUES ('2022042600010341', 20, 108.00, 1, 2, '2022-04-26 21:34:29');
INSERT INTO `orders` VALUES ('202204260001063', 20, 458.00, 1, 2, '2022-04-26 21:34:48');
INSERT INTO `orders` VALUES ('202204270001157', 22, 916.00, 1, 2, '2022-04-27 08:42:13');
INSERT INTO `orders` VALUES ('2022042700012112', 22, 1288.00, 1, 1, '2022-04-27 08:55:04');

-- ----------------------------
-- Table structure for receiver_info
-- ----------------------------
DROP TABLE IF EXISTS `receiver_info`;
CREATE TABLE `receiver_info`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '收货人ID',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收货人姓名',
  `telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收货人联系电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收货地址',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为当前用户的默认收货地址，0-不是，1-是',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver_info
-- ----------------------------
INSERT INTO `receiver_info` VALUES (1, 17, '小橘子', '13333333333', '广东省佛山市南海区狮山镇华南师范大学南海校区(菜鸟驿站)', 1);
INSERT INTO `receiver_info` VALUES (2, 18, '山蛋蛋', '15555555555', '广东省佛山市南海区狮山镇华南师范大学南海校区(菜鸟驿站)', 1);
INSERT INTO `receiver_info` VALUES (4, 16, '小橘子jzp', '13222222222', '广东省佛山市南海区狮山镇华南师范大学南海校区(菜鸟驿站)', 1);
INSERT INTO `receiver_info` VALUES (5, 17, '小水果', '13333333333', '不重要的城市不重要的街道233号', 1);
INSERT INTO `receiver_info` VALUES (6, 19, '最可爱的小水果', '13222222222', '不重要的城市不重要的街道233号', 1);
INSERT INTO `receiver_info` VALUES (7, 20, 'jzp', '13555555555', '不重要的城市街道233号', 1);
INSERT INTO `receiver_info` VALUES (8, 21, 'xiaojuzi', '13533333333', '不重要的街道233号', 1);
INSERT INTO `receiver_info` VALUES (9, 22, '小橘子', '13522222222', '不重要的街道233号', 1);

-- ----------------------------
-- Table structure for user_password
-- ----------------------------
DROP TABLE IF EXISTS `user_password`;
CREATE TABLE `user_password`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户手机号',
  `encrypt_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '经过加密的用户密码储存',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`, `telphone`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_password
-- ----------------------------
INSERT INTO `user_password` VALUES (1, '18305112933', '31fc65599c732cc1a8ca636a211b7659', 1);
INSERT INTO `user_password` VALUES (6, '16405112933', '65f1bb62f701040ba8ec430daa9637f6', 16);
INSERT INTO `user_password` VALUES (7, '13333333333', 'c28672cfcae2baa9bd7a71516d892de1', 17);
INSERT INTO `user_password` VALUES (8, '15555555555', 'be68f36be89ecc62b9bbbd2d8ae6f6f4', 18);
INSERT INTO `user_password` VALUES (9, '13222222222', 'c28672cfcae2baa9bd7a71516d892de1', 19);
INSERT INTO `user_password` VALUES (10, '13555555555', 'c28672cfcae2baa9bd7a71516d892de1', 20);
INSERT INTO `user_password` VALUES (11, '13533333333', 'c28672cfcae2baa9bd7a71516d892de1', 21);
INSERT INTO `user_password` VALUES (12, '13522222222', 'c28672cfcae2baa9bd7a71516d892de1', 22);

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` tinyint(2) UNSIGNED ZEROFILL NULL DEFAULT 01 COMMENT '// 01代表男性，02代表女性',
  `age` int(11) NULL DEFAULT NULL,
  `telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '2312345678' COMMENT '// 主键',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '//用户邮箱，可填',
  `signature` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '//个性签名',
  `register_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '//用户注册时间',
  PRIMARY KEY (`ID`, `telphone`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES (1, 'Milky', 02, 21, '18305112933', 'jzp@51129.cn', 'jzp', '2021-05-04 05:11:29');
INSERT INTO `user_table` VALUES (16, '小橘子', 01, NULL, '16405112933', 'real1640@love.cn', NULL, '2022-03-12 16:29:30');
INSERT INTO `user_table` VALUES (17, 'testuser', 01, NULL, '13333333333', 'testuser@163.cn', NULL, '2022-03-17 16:18:57');
INSERT INTO `user_table` VALUES (18, '山蛋蛋', 01, NULL, '15555555555', 'shandandan@jz.cn', NULL, '2022-04-03 21:46:19');
INSERT INTO `user_table` VALUES (19, '小水果', 01, NULL, '13222222222', '小水果@jz.love', NULL, '2022-04-26 20:17:03');
INSERT INTO `user_table` VALUES (20, '小橘子jzp', 01, NULL, '13555555555', '小橘子@jzp.com', NULL, '2022-04-26 21:33:39');
INSERT INTO `user_table` VALUES (21, '小水果jzp', 01, NULL, '13533333333', '小水果jzp@qq.com', NULL, '2022-04-26 21:58:21');
INSERT INTO `user_table` VALUES (22, '小橘子', 01, NULL, '13522222222', '小橘子@jzp.com', NULL, '2022-04-27 08:41:08');

SET FOREIGN_KEY_CHECKS = 1;
