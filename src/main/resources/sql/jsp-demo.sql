/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : jsp-demo

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-09-11 18:42:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `agentId` int(32) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '任务1', '1', '2020-09-07 15:31:03', '2020-09-10 15:31:07', '山东大学');

-- ----------------------------
-- Table structure for jobpack
-- ----------------------------
DROP TABLE IF EXISTS `jobpack`;
CREATE TABLE `jobpack` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `jobId` int(32) NOT NULL,
  `packId` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobpack
-- ----------------------------
INSERT INTO `jobpack` VALUES ('1', '1', '1');
INSERT INTO `jobpack` VALUES ('2', '1', '3');
INSERT INTO `jobpack` VALUES ('3', '1', '4');
INSERT INTO `jobpack` VALUES ('4', '1', '5');
INSERT INTO `jobpack` VALUES ('5', '1', '6');
INSERT INTO `jobpack` VALUES ('6', '1', '7');
INSERT INTO `jobpack` VALUES ('7', '1', '8');
INSERT INTO `jobpack` VALUES ('8', '1', '9');

-- ----------------------------
-- Table structure for pack
-- ----------------------------
DROP TABLE IF EXISTS `pack`;
CREATE TABLE `pack` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `goalName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pack
-- ----------------------------
INSERT INTO `pack` VALUES ('1', '活动一', '2020-09-07 14:12:33', '2020-09-10 14:12:40', '济南', '张三');
INSERT INTO `pack` VALUES ('3', '活动一', '2020-09-07 16:22:30', '2020-09-07 16:22:35', '济南', 'das');
INSERT INTO `pack` VALUES ('4', '活动一', '2020-09-07 16:52:55', '2020-09-16 16:53:00', '济南', '');
INSERT INTO `pack` VALUES ('5', '活动一', '2020-09-07 17:27:04', '2020-09-09 17:27:07', '济南', null);
INSERT INTO `pack` VALUES ('6', '活动一', '2020-09-07 17:27:21', '2020-09-16 17:27:25', '济南', null);
INSERT INTO `pack` VALUES ('7', '活动一', '2020-09-07 17:27:40', '2020-09-22 17:27:43', '济南', null);
INSERT INTO `pack` VALUES ('8', '活动一', '2020-09-07 17:27:52', '2020-09-21 17:27:55', '济南', null);
INSERT INTO `pack` VALUES ('9', '活动一', '2020-09-07 17:28:08', '2020-09-15 17:28:11', '济南', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `oa` varchar(255) NOT NULL,
  `prov` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18615650832', '123456', '任福恒', 'renfh8', 'sd', 'jn');
INSERT INTO `user` VALUES ('2', '1', '1', '任福恒2', '1', '1', '1');

-- ----------------------------
-- Table structure for websites
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `alexa` int(11) NOT NULL DEFAULT '0' COMMENT 'Alexa 排名',
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
INSERT INTO `websites` VALUES ('1', 'Google', 'https://www.google.cm/', '1', 'USA');
INSERT INTO `websites` VALUES ('2', '淘宝', 'https://www.taobao.com/', '13', 'CN');
INSERT INTO `websites` VALUES ('3', '菜鸟教程', 'http://www.runoob.com', '5892', '');
INSERT INTO `websites` VALUES ('4', '微博', 'http://weibo.com/', '20', 'CN');
INSERT INTO `websites` VALUES ('5', 'Facebook', 'https://www.facebook.com/', '3', 'USA');
