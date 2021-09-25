/*
 Navicat Premium Data Transfer

 Source Server         : mysql_root
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 25/09/2021 13:33:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_student
-- ----------------------------
DROP TABLE IF EXISTS `d_student`;
CREATE TABLE `d_student`  (
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `educ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `happy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
