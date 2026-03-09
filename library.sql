/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80041
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 80041
File Encoding         : 65001

Date: 2026-03-09 21:02:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123456', 'ypl');
INSERT INTO `admin` VALUES ('2', '123', '111');
INSERT INTO `admin` VALUES ('3', '', '');
INSERT INTO `admin` VALUES ('4', '', '');
INSERT INTO `admin` VALUES ('5', '', '');
INSERT INTO `admin` VALUES ('6', '123', '111');
INSERT INTO `admin` VALUES ('7', '123', '111');
INSERT INTO `admin` VALUES ('8', '112', '111');
INSERT INTO `admin` VALUES ('9', '123', '111');
INSERT INTO `admin` VALUES ('10', '123', '111');
INSERT INTO `admin` VALUES ('11', '123', '111');
INSERT INTO `admin` VALUES ('12', '123', '111');
INSERT INTO `admin` VALUES ('13', '123', '111');
INSERT INTO `admin` VALUES ('14', '123', '123');
INSERT INTO `admin` VALUES ('15', '123', '111');
INSERT INTO `admin` VALUES ('16', '123', '111');
INSERT INTO `admin` VALUES ('17', '123', '111');
INSERT INTO `admin` VALUES ('18', '123456', '123456');
INSERT INTO `admin` VALUES ('19', '111', '123');
INSERT INTO `admin` VALUES ('20', '123456', '123');
INSERT INTO `admin` VALUES ('21', '123456', '123');
INSERT INTO `admin` VALUES ('22', '123456', '11111');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE,
  KEY `idx_book_name` (`name`) USING BTREE,
  KEY `idx_book_author` (`author`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('11', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('12', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('123456', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('2', '很好', '123.00', '122', '非常好');
INSERT INTO `book` VALUES ('23', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('232', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('232222', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('2322222', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('2323', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('2332', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('3', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('6', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('9999991', 'Java编程思想', '100.00', '6', 'wby');
INSERT INTO `book` VALUES ('9999992', 'Java编程思想', '35.00', '7', '余华');
INSERT INTO `book` VALUES ('9999993', 'MySQL必学', '149.00', '3', 'wby');
INSERT INTO `book` VALUES ('9999996', '很好', '123.00', '123', '非常好');
INSERT INTO `book` VALUES ('9999997', '很好', '123.00', '123', '非常好');

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE KEY `category_name` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO `book_category` VALUES ('1', '计算机科学', '编程、网络相关书籍');
INSERT INTO `book_category` VALUES ('2', '文学小说', '经典小说、散文');

-- ----------------------------
-- Table structure for book_detail
-- ----------------------------
DROP TABLE IF EXISTS `book_detail`;
CREATE TABLE `book_detail` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `publish_date` date DEFAULT NULL,
  `book_intro` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `page_count` int DEFAULT '0',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `idx_book_isbn` (`book_isbn`) USING BTREE,
  CONSTRAINT `book_detail_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_detail
-- ----------------------------
INSERT INTO `book_detail` VALUES ('4', '9999991', 'wby出版社', '2025-01-15', 'Java领域经典书籍，值得一看', '880');
INSERT INTO `book_detail` VALUES ('5', '9999992', 'wby出版社', '2025-08-01', '中国当代经典小说，非常好看', '191');
INSERT INTO `book_detail` VALUES ('6', '9999993', 'wby出版社', '2025-05-20', 'MySQL入门经典，适合零基础学习哈', '256');
INSERT INTO `book_detail` VALUES ('9', '9999996', 'verygood', '2025-12-03', '你猜', '123');
INSERT INTO `book_detail` VALUES ('10', '9999997', 'verygood', '2025-12-03', '111', '123');
INSERT INTO `book_detail` VALUES ('11', '123456', 'verygood', '2025-12-03', '111', '123');
INSERT INTO `book_detail` VALUES ('12', '12', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('20', '11', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('21', '11', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('22', '11', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('23', '2', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('24', '2', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('25', '3', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('26', '6', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('27', '6', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('28', '23', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('29', '232', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('32', '2332', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('33', '2323', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('35', '232222', 'verygood', '2025-12-03', '1', '123');
INSERT INTO `book_detail` VALUES ('36', '2322222', 'verygood', '2025-12-03', '1', '123');

-- ----------------------------
-- Table structure for book_new
-- ----------------------------
DROP TABLE IF EXISTS `book_new`;
CREATE TABLE `book_new` (
  `new_id` int NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_stock_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recommend_flag` tinyint NOT NULL DEFAULT '1',
  `new_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`new_id`) USING BTREE,
  KEY `idx_book_isbn` (`book_isbn`) USING BTREE,
  KEY `idx_recommend_flag` (`recommend_flag`) USING BTREE,
  CONSTRAINT `book_new_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_new
-- ----------------------------
INSERT INTO `book_new` VALUES ('4', '9999991', '2025-12-01 20:21:38', '1', 'Java超绝书，wby推荐');
INSERT INTO `book_new` VALUES ('5', '9999992', '2025-12-01 20:21:38', '1', '余华代表作，wby推荐');
INSERT INTO `book_new` VALUES ('6', '9999993', '2025-12-01 20:21:38', '1', '数据库入门必备，wby推荐');
INSERT INTO `book_new` VALUES ('9', '2332', '2025-12-05 00:00:00', '2', '123');
INSERT INTO `book_new` VALUES ('10', '2323', '2025-12-05 00:00:00', '2', '123');
INSERT INTO `book_new` VALUES ('12', '232222', '2025-12-01 04:12:00', '2', '20250102');
INSERT INTO `book_new` VALUES ('13', '2322222', '2025-12-05 08:21:40', '2', '20250102');

-- ----------------------------
-- Table structure for book_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `book_stock_detail`;
CREATE TABLE `book_stock_detail` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` int NOT NULL,
  `stock_count` int NOT NULL DEFAULT '0',
  `available_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`) USING BTREE,
  UNIQUE KEY `uk_book_storage` (`book_isbn`,`storage_id`) USING BTREE,
  KEY `idx_book_isbn` (`book_isbn`) USING BTREE,
  KEY `idx_storage_id` (`storage_id`) USING BTREE,
  CONSTRAINT `book_stock_detail_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `book_stock_detail_ibfk_2` FOREIGN KEY (`storage_id`) REFERENCES `book_storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_stock_detail
-- ----------------------------
INSERT INTO `book_stock_detail` VALUES ('1', '9999991', '1', '5', '4');
INSERT INTO `book_stock_detail` VALUES ('2', '9999992', '2', '6', '5');
INSERT INTO `book_stock_detail` VALUES ('3', '9999993', '1', '3', '3');

-- ----------------------------
-- Table structure for book_storage
-- ----------------------------
DROP TABLE IF EXISTS `book_storage`;
CREATE TABLE `book_storage` (
  `storage_id` int NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`storage_id`) USING BTREE,
  UNIQUE KEY `storage_name` (`storage_name`) USING BTREE,
  KEY `manager_id` (`manager_id`) USING BTREE,
  CONSTRAINT `book_storage_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_storage
-- ----------------------------
INSERT INTO `book_storage` VALUES ('1', '1楼科技书库', '图书馆1楼A区', '1');
INSERT INTO `book_storage` VALUES ('2', '2楼文学书库', '图书馆2楼A区', '1');

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('1', '1234', 'wby');
INSERT INTO `reader` VALUES ('2', '12345', 'dyq');
INSERT INTO `reader` VALUES ('3', '123456', '123');
INSERT INTO `reader` VALUES ('4', '1234567', '1234567');

-- ----------------------------
-- Table structure for reader_book
-- ----------------------------
DROP TABLE IF EXISTS `reader_book`;
CREATE TABLE `reader_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int NOT NULL,
  `book_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_reader_id` (`reader_id`) USING BTREE,
  KEY `idx_book_isbn` (`book_isbn`) USING BTREE,
  CONSTRAINT `reader_book_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `reader_book_ibfk_2` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reader_book
-- ----------------------------
INSERT INTO `reader_book` VALUES ('3', '1', '9999991', '2025-12-01 20:23:26', '2025-12-06 12:26:34');
INSERT INTO `reader_book` VALUES ('4', '2', '9999992', '2025-12-01 20:23:26', '2025-12-06 12:26:47');
INSERT INTO `reader_book` VALUES ('5', '1', '2', '2025-12-05 15:43:48', '2025-12-05 15:53:39');
INSERT INTO `reader_book` VALUES ('6', '1', '2', '2025-12-05 19:36:24', '2025-12-05 19:40:57');
INSERT INTO `reader_book` VALUES ('7', '1', '23', '2025-12-05 19:48:06', '2025-12-05 19:48:15');
INSERT INTO `reader_book` VALUES ('8', '1', '23', '2025-12-05 19:48:35', '2025-12-05 19:49:28');
INSERT INTO `reader_book` VALUES ('9', '1', '23', '2025-12-05 21:49:49', '2025-12-05 21:50:08');
INSERT INTO `reader_book` VALUES ('10', '1', '23', '2025-12-05 21:57:43', '2025-12-05 22:10:13');
INSERT INTO `reader_book` VALUES ('11', '1', '23', '2025-12-05 22:12:58', '2025-12-05 22:13:04');
INSERT INTO `reader_book` VALUES ('12', '1', '23', '2025-12-05 23:12:00', '2025-12-06 12:27:45');
INSERT INTO `reader_book` VALUES ('13', '1', '11', '2025-12-29 11:44:37', '2025-12-29 11:46:07');
