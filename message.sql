/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : message

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/08/2020 10:15:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `senduser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiveuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendtime` date NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES (1, 'aa', 'bb', 'a2b yidu hello world', 'yidu hello this world !', '2020-06-04', 0);
INSERT INTO `msg` VALUES (2, 'aa', 'bb', 'a2b weidu', 'weidu hello this world !', '2020-06-03', 1);
INSERT INTO `msg` VALUES (8, 'aa', 'bb', 'test send03', '3333333333333', '2020-06-04', 1);
INSERT INTO `msg` VALUES (15, 'cc', 'zs', '张三你好', '你好！', '2020-06-05', 0);
INSERT INTO `msg` VALUES (17, 'cc', 'aa', 'reply', '你好 aaaa', '2020-06-05', 0);
INSERT INTO `msg` VALUES (19, 'wang', 'aa', '文字测试长度', 'jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互。\r\njQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。jQuery兼容各种主流浏览器，如IE 6.0+、FF 1.5+、Safari 2.0+、Opera 9.0+等。 [1] \r\n', '2020-06-05', 1);
INSERT INTO `msg` VALUES (20, 'aa', '2', 'test send01', '123', '2020-06-08', 1);
INSERT INTO `msg` VALUES (21, 'aa', 'wang', 'ssm', 'ssm测试！', '2020-06-12', 0);
INSERT INTO `msg` VALUES (26, 'wang', 'aa', '回复测试', '回复', '2020-06-12', 1);
INSERT INTO `msg` VALUES (27, 'aa', 'wang', 'a2wang', 'lanjie', '2020-06-12', 1);
INSERT INTO `msg` VALUES (28, 'aa', 'qq', '回复测试', '13651616', '2020-06-12', 1);
INSERT INTO `msg` VALUES (29, 'aa', 'wang', 'afdadaf', 'afdagadaaaaaaaaaaaa', '2020-06-12', 1);
INSERT INTO `msg` VALUES (30, 'aa', 'bb', '回复测试', '12312313', '2020-06-12', 1);
INSERT INTO `msg` VALUES (31, 'aa', 'bb', '7.1', '7.1', '2020-07-01', 1);
INSERT INTO `msg` VALUES (32, 'aa', 'bb', '7.11', 'aaaaaaaaaa', '2020-07-01', 0);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'aa', '202CB962AC59075B964B07152D234B70', 'aa@qq.com', 1);
INSERT INTO `userinfo` VALUES (2, 'bb', '202CB962AC59075B964B07152D234B70', 'bb@qq.com', 1);
INSERT INTO `userinfo` VALUES (3, 'cc', '202CB962AC59075B964B07152D234B70', 'cc@qq.com', 1);
INSERT INTO `userinfo` VALUES (4, 'dd', '202CB962AC59075B964B07152D234B70', 'dd@qq.com', 1);
INSERT INTO `userinfo` VALUES (5, 'ee', '202CB962AC59075B964B07152D234B70', 'ee@qq.com', 1);
INSERT INTO `userinfo` VALUES (7, 'zs', '202CB962AC59075B964B07152D234B70', 'za@qq.com', 1);
INSERT INTO `userinfo` VALUES (8, 'ls', '202CB962AC59075B964B07152D234B70', '', 1);
INSERT INTO `userinfo` VALUES (9, 'wang', '202CB962AC59075B964B07152D234B70', '', 1);
INSERT INTO `userinfo` VALUES (10, 'wang2', '202CB962AC59075B964B07152D234B70', '', 1);
INSERT INTO `userinfo` VALUES (11, 'asd', '123', '123@qq.com', 1);
INSERT INTO `userinfo` VALUES (12, 'qq', '202CB962AC59075B964B07152D234B70', 'qq@qq.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
