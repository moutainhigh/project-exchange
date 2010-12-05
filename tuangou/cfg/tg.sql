/*
MySQL Data Transfer
Source Host: localhost
Source Database: tg
Target Host: localhost
Target Database: tg
Date: 2010-12-5 23:00:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tg_teams
-- ----------------------------
CREATE TABLE `tg_teams` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `city_name` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `team_price` float DEFAULT NULL,
  `market_price` float DEFAULT NULL,
  `now_number` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `left_day` int(11) DEFAULT NULL,
  `left_hour` int(11) DEFAULT NULL,
  `left_min` int(11) DEFAULT NULL,
  `left_sec` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tg_user
-- ----------------------------
CREATE TABLE `tg_user` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `user_type` varchar(255) DEFAULT NULL,
  `loginName` varchar(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tg_user` VALUES ('1', 'admin', 'admin', '123456', 'admin@tuan.com', '2010-12-05 21:14:44', '123', '123');
