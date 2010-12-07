/*
MySQL Data Transfer
Source Host: localhost
Source Database: tg
Target Host: localhost
Target Database: tg
Date: 2010-12-7 20:56:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tg_component
-- ----------------------------
CREATE TABLE `tg_component` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `com_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tg_site
-- ----------------------------
CREATE TABLE `tg_site` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `list_order` int(11) DEFAULT NULL,
  `site_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tg_teams
-- ----------------------------
CREATE TABLE `tg_teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `is_top` bit(1) DEFAULT NULL,
  `cate_id` bigint(20) DEFAULT NULL,
  `summary` varchar(10240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tg_user
-- ----------------------------
CREATE TABLE `tg_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL,
  `loginName` varchar(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tg_component` VALUES ('1', '美食天地', null, null, '', null, null, null, 'meishi', 'team_cate');
INSERT INTO `tg_component` VALUES ('2', '休闲娱乐', null, null, '', null, null, null, 'xiuxian', 'team_cate');
INSERT INTO `tg_component` VALUES ('3', '美容健身', null, null, '', null, null, null, 'meirong', 'team_cate');
INSERT INTO `tg_component` VALUES ('4', '精品购物', null, null, '', null, null, null, 'gouwu', 'team_cate');
INSERT INTO `tg_component` VALUES ('5', '其它', null, null, '', null, null, null, 'other', 'team_cate');
INSERT INTO `tg_teams` VALUES ('2', '成都', '章鱼团', '正天影城打折电影票', 'http://tg.chengdu.cn', '1', '100', '0', '1291622756937.jpg', '0', '1', '0', '0', '2010-12-06 00:00:00', '', '2', 'we');
INSERT INTO `tg_user` VALUES ('1', 'admin', 'admin', '123456', 'admin@tuan.com', '2010-12-05 21:14:44', '123', '123');
INSERT INTO `tg_user` VALUES ('2', null, 'test001', 'e10adc3949ba59abbe56e057f20f883e', 'wef@12.com2', '2010-12-07 00:00:00', null, null);
