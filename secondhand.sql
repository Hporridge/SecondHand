/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : secondhand

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 17/01/2020 17:54:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `c_id` int(10) NULL DEFAULT NULL,
  `s_id` int(10) NULL DEFAULT NULL,
  `state` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES (19, 15, 13, 0);
INSERT INTO `buy` VALUES (47, 3, 1, 0);
INSERT INTO `buy` VALUES (48, 3, 14, 0);
INSERT INTO `buy` VALUES (49, 3, 22, 0);
INSERT INTO `buy` VALUES (70, 2, 14, 0);
INSERT INTO `buy` VALUES (71, 2, 16, 0);
INSERT INTO `buy` VALUES (72, 2, 17, 0);
INSERT INTO `buy` VALUES (73, 2, 2, 0);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'admin', 'root', 'admin@126.com', '15576653941', '老校区4舍407');
INSERT INTO `customer` VALUES (2, '华凌', '123', 'ahualy@qq.com', '15576653941', '老校区4舍407');
INSERT INTO `customer` VALUES (3, '谷雨', '123', 'rain@163.com', '15545467877', '新校区12舍603');
INSERT INTO `customer` VALUES (4, '我是小妖怪', '123', 'xyg@sss.com', '13867565678', '老校区8舍105');
INSERT INTO `customer` VALUES (5, '单排上王者', '123', 'adf@163.com', '13745678976', '老校区3舍617');
INSERT INTO `customer` VALUES (6, '花间一壶酒', '123', 'hjyhj@dfgt.com', '12345676543', '研究生3舍404');
INSERT INTO `customer` VALUES (15, '衣蛾', '123', '1213@qq.com', '15636264598', '新校区二舍203');

-- ----------------------------
-- Table structure for shopping
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_id` int(10) NULL DEFAULT NULL,
  `shopping_type` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping
-- ----------------------------
INSERT INTO `shopping` VALUES (1, '外套（女）', '外套', NULL, 'http://localhost:8080/Second/imgupload/1_160x160.jpg', '144.00', 1, 6);
INSERT INTO `shopping` VALUES (2, '钢笔', '钢笔', NULL, 'http://localhost:8080/Second/imgupload/钢笔.jpg', '0.01', 2, 5);
INSERT INTO `shopping` VALUES (11, '钢笔', '钢笔', NULL, 'http://localhost:8080/Second/imgupload/timg.jpeg', '45.00', 2, 5);
INSERT INTO `shopping` VALUES (14, '高数课本', '高数课本', NULL, 'http://localhost:8080/Second/imgupload/Unknown-1.jpeg', '15.00', 2, 1);
INSERT INTO `shopping` VALUES (16, '钱包', '男士钱包', NULL, 'http://localhost:8080/Second/imgupload/钱包.jpg', '26.00', 2, 3);
INSERT INTO `shopping` VALUES (17, '女士背包', '女士背包', NULL, 'http://localhost:8080/Second/imgupload/迷你包.jpg', '30.00', 2, 3);
INSERT INTO `shopping` VALUES (18, '羽毛球拍', '羽毛球拍', NULL, 'http://localhost:8080/Second/imgupload/羽毛球拍.jpg', '20.00', 2, 7);
INSERT INTO `shopping` VALUES (19, '篮球', '篮球', NULL, 'http://localhost:8080/Second/imgupload/篮球.jpg', '24.00', 2, 7);
INSERT INTO `shopping` VALUES (20, 'spring源码解析', 'spring源码解析', NULL, 'http://localhost:8080/Second/imgupload/spring.jpg', '36.00', 2, 1);
INSERT INTO `shopping` VALUES (21, 'java虚拟机', '深入理解java虚拟机', NULL, 'http://localhost:8080/Second/imgupload/java虚拟机.jpg', '45.00', 2, 1);
INSERT INTO `shopping` VALUES (22, 'Spring企业开发', 'Spring企业开发', NULL, 'http://localhost:8080/Second/imgupload/spring企业.jpg', '42.00', 2, 1);

-- ----------------------------
-- Table structure for shoppingclass
-- ----------------------------
DROP TABLE IF EXISTS `shoppingclass`;
CREATE TABLE `shoppingclass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoppingclass_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shoppingclass_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingclass
-- ----------------------------
INSERT INTO `shoppingclass` VALUES (1, '书籍', '新书，旧书');
INSERT INTO `shoppingclass` VALUES (2, '电子产品', '请真实的描述电子产品的性能');
INSERT INTO `shoppingclass` VALUES (3, '生活用品', '请真实描述生活用品的新旧程度');
INSERT INTO `shoppingclass` VALUES (4, '车辆', '请真实描述车辆的新旧程度');
INSERT INTO `shoppingclass` VALUES (5, '文具', '请真实描述文具的新旧程度');
INSERT INTO `shoppingclass` VALUES (6, '服饰', '请真实描述服饰的新旧程度');
INSERT INTO `shoppingclass` VALUES (7, '体育用品', '体育用品');
INSERT INTO `shoppingclass` VALUES (8, 'ewew', 'ewe');

-- ----------------------------
-- Table structure for shoppingorder
-- ----------------------------
DROP TABLE IF EXISTS `shoppingorder`;
CREATE TABLE `shoppingorder`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `revceiving_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `revceiving_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `revceiving_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
