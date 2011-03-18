/*
MySQL Data Transfer
Source Host: localhost
Source Database: fupin
Target Host: localhost
Target Database: fupin
Date: 2011-3-18 11:11:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for fp_chengxiao
-- ----------------------------
CREATE TABLE `fp_chengxiao` (
  `id` bigint(20) NOT NULL,
  `chengxiao_type` varchar(255) NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `content` longtext,
  `status` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `zhen_id` bigint(20) DEFAULT NULL,
  `cun_id` bigint(20) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67647835409FF6C` (`zhen_id`),
  KEY `FK676478389EF0BCC` (`family_id`),
  KEY `FK67647833F4A0CE8` (`cun_id`),
  CONSTRAINT `FK67647833F4A0CE8` FOREIGN KEY (`cun_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FK67647835409FF6C` FOREIGN KEY (`zhen_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FK676478389EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_cuoshi
-- ----------------------------
CREATE TABLE `fp_cuoshi` (
  `id` bigint(20) NOT NULL,
  `cuoshi_type` varchar(255) NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `season` varchar(100) DEFAULT NULL,
  `content` longtext,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `zhen_id` bigint(20) DEFAULT NULL,
  `cun_id` bigint(20) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD6CC8E6C5409FF6C` (`zhen_id`),
  KEY `FKD6CC8E6C89EF0BCC` (`family_id`),
  KEY `FKD6CC8E6C3F4A0CE8` (`cun_id`),
  CONSTRAINT `FKD6CC8E6C3F4A0CE8` FOREIGN KEY (`cun_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD6CC8E6C5409FF6C` FOREIGN KEY (`zhen_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD6CC8E6C89EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_diqu
-- ----------------------------
CREATE TABLE `fp_diqu` (
  `id` bigint(20) NOT NULL,
  `diqu_type` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `remark` longtext,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `shi_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `shiWorkOrg_id` bigint(20) DEFAULT NULL,
  `areaWorkOrg_id` bigint(20) DEFAULT NULL,
  `zhen_id` bigint(20) DEFAULT NULL,
  `org` bigint(20) DEFAULT NULL,
  `dian` int(11) DEFAULT NULL,
  `dibaoFamily` int(11) DEFAULT NULL,
  `dibaoPerson` int(11) DEFAULT NULL,
  `familyNum` int(11) DEFAULT NULL,
  `house` int(11) DEFAULT NULL,
  `income` double DEFAULT NULL,
  `labor` int(11) DEFAULT NULL,
  `mianji` int(11) DEFAULT NULL,
  `needBanFamily` int(11) DEFAULT NULL,
  `needBanPerson` int(11) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `outLabor` int(11) DEFAULT NULL,
  `personNum` int(11) DEFAULT NULL,
  `poorFamilyNum` int(11) DEFAULT NULL,
  `poorPersonNum` int(11) DEFAULT NULL,
  `trainingNum` int(11) DEFAULT NULL,
  `transNum` int(11) DEFAULT NULL,
  `tv` int(11) DEFAULT NULL,
  `water` int(11) DEFAULT NULL,
  `weiHouse` int(11) DEFAULT NULL,
  `ying` varchar(255) DEFAULT NULL,
  `you` int(11) DEFAULT NULL,
  `item` longtext,
  `pinyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD84427BE5409FF6C` (`zhen_id`),
  KEY `FKD84427BE3A8D8BAC` (`area_id`),
  KEY `FKD84427BE8FB7F276` (`org`),
  KEY `FKD84427BE59DE59E8` (`shi_id`),
  KEY `FKD84427BEF883B268` (`areaWorkOrg_id`),
  KEY `FKD84427BE8A15A8AC` (`shiWorkOrg_id`),
  CONSTRAINT `FKD84427BE3A8D8BAC` FOREIGN KEY (`area_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84427BE5409FF6C` FOREIGN KEY (`zhen_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84427BE59DE59E8` FOREIGN KEY (`shi_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84427BE8A15A8AC` FOREIGN KEY (`shiWorkOrg_id`) REFERENCES `fp_user` (`id`),
  CONSTRAINT `FKD84427BE8FB7F276` FOREIGN KEY (`org`) REFERENCES `fp_user` (`id`),
  CONSTRAINT `FKD84427BEF883B268` FOREIGN KEY (`areaWorkOrg_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_family
-- ----------------------------
CREATE TABLE `fp_family` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cun_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `canji` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `dibao` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `gongkai` varchar(255) DEFAULT NULL,
  `handi` double DEFAULT NULL,
  `idNo` varchar(255) DEFAULT NULL,
  `income` double DEFAULT NULL,
  `jiegou` varchar(255) DEFAULT NULL,
  `linguodi` double DEFAULT NULL,
  `mianji` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `shuitian` double DEFAULT NULL,
  `tuopin` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `wenhua` varchar(255) DEFAULT NULL,
  `zu` varchar(255) DEFAULT NULL,
  `birthday1` datetime DEFAULT NULL,
  `gender1` varchar(255) DEFAULT NULL,
  `job1` varchar(255) DEFAULT NULL,
  `relate1` varchar(255) DEFAULT NULL,
  `wenhua1` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `birthday2` datetime DEFAULT NULL,
  `gender2` varchar(255) DEFAULT NULL,
  `job2` varchar(255) DEFAULT NULL,
  `relate2` varchar(255) DEFAULT NULL,
  `wenhua2` varchar(255) DEFAULT NULL,
  `name2` varchar(255) DEFAULT NULL,
  `birthday3` datetime DEFAULT NULL,
  `gender3` varchar(255) DEFAULT NULL,
  `job3` varchar(255) DEFAULT NULL,
  `relate3` varchar(255) DEFAULT NULL,
  `wenhua3` varchar(255) DEFAULT NULL,
  `name3` varchar(255) DEFAULT NULL,
  `birthday4` datetime DEFAULT NULL,
  `gender4` varchar(255) DEFAULT NULL,
  `job4` varchar(255) DEFAULT NULL,
  `relate4` varchar(255) DEFAULT NULL,
  `wenhua4` varchar(255) DEFAULT NULL,
  `name4` varchar(255) DEFAULT NULL,
  `birthday5` datetime DEFAULT NULL,
  `gender5` varchar(255) DEFAULT NULL,
  `job5` varchar(255) DEFAULT NULL,
  `relate5` varchar(255) DEFAULT NULL,
  `wenhua5` varchar(255) DEFAULT NULL,
  `name5` varchar(255) DEFAULT NULL,
  `birthday6` datetime DEFAULT NULL,
  `gender6` varchar(255) DEFAULT NULL,
  `job6` varchar(255) DEFAULT NULL,
  `relate6` varchar(255) DEFAULT NULL,
  `wenhua6` varchar(255) DEFAULT NULL,
  `name6` varchar(255) DEFAULT NULL,
  `birthday7` datetime DEFAULT NULL,
  `gender7` varchar(255) DEFAULT NULL,
  `job7` varchar(255) DEFAULT NULL,
  `relate7` varchar(255) DEFAULT NULL,
  `wenhua7` varchar(255) DEFAULT NULL,
  `name7` varchar(255) DEFAULT NULL,
  `birthday8` datetime DEFAULT NULL,
  `gender8` varchar(255) DEFAULT NULL,
  `job8` varchar(255) DEFAULT NULL,
  `relate8` varchar(255) DEFAULT NULL,
  `wenhua8` varchar(255) DEFAULT NULL,
  `name8` varchar(255) DEFAULT NULL,
  `birthday9` datetime DEFAULT NULL,
  `gender9` varchar(255) DEFAULT NULL,
  `job9` varchar(255) DEFAULT NULL,
  `relate9` varchar(255) DEFAULT NULL,
  `wenhua9` varchar(255) DEFAULT NULL,
  `name9` varchar(255) DEFAULT NULL,
  `birthday10` datetime DEFAULT NULL,
  `gender10` varchar(255) DEFAULT NULL,
  `job10` varchar(255) DEFAULT NULL,
  `relate10` varchar(255) DEFAULT NULL,
  `wenhua10` varchar(255) DEFAULT NULL,
  `name10` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDAD034793F4A0CE8` (`cun_id`),
  CONSTRAINT `FKDAD034793F4A0CE8` FOREIGN KEY (`cun_id`) REFERENCES `fp_diqu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_leader
-- ----------------------------
CREATE TABLE `fp_leader` (
  `id` bigint(20) NOT NULL,
  `leaderName` varchar(100) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE5401E1E5396EBE8` (`org_id`),
  KEY `FKE5401E1E89EF0BCC` (`family_id`),
  CONSTRAINT `FKE5401E1E89EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`),
  CONSTRAINT `FKE5401E1E5396EBE8` FOREIGN KEY (`org_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_permission
-- ----------------------------
CREATE TABLE `fp_permission` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_pic
-- ----------------------------
CREATE TABLE `fp_pic` (
  `id` bigint(20) NOT NULL,
  `pic_type` varchar(255) NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `path` longtext,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `zhen_id` bigint(20) DEFAULT NULL,
  `cun_id` bigint(20) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB46578955409FF6C` (`zhen_id`),
  KEY `FKB465789589EF0BCC` (`family_id`),
  KEY `FKB46578953F4A0CE8` (`cun_id`),
  CONSTRAINT `FKB46578953F4A0CE8` FOREIGN KEY (`cun_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKB46578955409FF6C` FOREIGN KEY (`zhen_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKB465789589EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_reason
-- ----------------------------
CREATE TABLE `fp_reason` (
  `id` bigint(20) NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `content` longtext,
  `cuoshiContent` longtext,
  `status` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF7D6B5989EF0BCC` (`family_id`),
  CONSTRAINT `FKEF7D6B5989EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_recheck
-- ----------------------------
CREATE TABLE `fp_recheck` (
  `id` bigint(20) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `reason` longtext,
  `recordId` bigint(20) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4708405396EBE8` (`org_id`),
  CONSTRAINT `FK4708405396EBE8` FOREIGN KEY (`org_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_record
-- ----------------------------
CREATE TABLE `fp_record` (
  `id` bigint(20) NOT NULL,
  `recordDate` datetime DEFAULT NULL,
  `content` longtext,
  `status` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF7E456689EF0BCC` (`family_id`),
  CONSTRAINT `FKEF7E456689EF0BCC` FOREIGN KEY (`family_id`) REFERENCES `fp_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fp_user
-- ----------------------------
CREATE TABLE `fp_user` (
  `id` bigint(20) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `loginName` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `shi_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `shiWorkOrg_id` bigint(20) DEFAULT NULL,
  `zhen_id` bigint(20) DEFAULT NULL,
  `areaWorkOrg_id` bigint(20) DEFAULT NULL,
  `cun` bigint(20) DEFAULT NULL,
  `orgName` varchar(100) DEFAULT NULL,
  `orgTel` varchar(255) DEFAULT NULL,
  `chargePersonName` longtext,
  `chargePersonTel` varchar(255) DEFAULT NULL,
  `orgAddr` varchar(255) DEFAULT NULL,
  `chargeDuty` varchar(255) DEFAULT NULL,
  `contactName` longtext,
  `contactDuty` varchar(255) DEFAULT NULL,
  `contactTel` varchar(100) DEFAULT NULL,
  `contactMobile` varchar(100) DEFAULT NULL,
  `contactFax` varchar(100) DEFAULT NULL,
  `contactAddr` varchar(100) DEFAULT NULL,
  `contactPost` varchar(100) DEFAULT NULL,
  `contactEmail` varchar(100) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`),
  KEY `FKD84C06205409FF6C` (`zhen_id`),
  KEY `FKD84C06203A8D8BAC` (`area_id`),
  KEY `FKD84C062059DE59E8` (`shi_id`),
  KEY `FKD84C06208FB79926` (`cun`),
  KEY `FKD84C0620F883B268` (`areaWorkOrg_id`),
  KEY `FKD84C06208A15A8AC` (`shiWorkOrg_id`),
  CONSTRAINT `FKD84C06203A8D8BAC` FOREIGN KEY (`area_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84C06205409FF6C` FOREIGN KEY (`zhen_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84C062059DE59E8` FOREIGN KEY (`shi_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84C06208A15A8AC` FOREIGN KEY (`shiWorkOrg_id`) REFERENCES `fp_user` (`id`),
  CONSTRAINT `FKD84C06208FB79926` FOREIGN KEY (`cun`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FKD84C0620F883B268` FOREIGN KEY (`areaWorkOrg_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `fp_diqu` VALUES ('6', 'shi', '广州市', null, '2011-03-12 20:41:30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('7', 'area', '白云区', null, '2011-03-12 20:42:09', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('40', 'area', '从化市', null, '2011-03-14 16:07:41', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('41', 'area', '增城市', null, '2011-03-14 16:07:55', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('42', 'area', '花都区', null, '2011-03-14 16:08:09', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('43', 'zhen', '鳌头镇', null, '2011-03-14 16:08:52', null, null, null, null, null, null, null, '40', null, '202', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('44', 'zhen', '良口镇', null, '2011-03-14 16:09:21', null, null, null, null, null, null, null, '40', null, '197', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('45', 'zhen', '温泉镇', null, '2011-03-14 16:09:40', null, null, null, null, null, null, null, '40', null, '196', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('46', 'zhen', '吕田镇', null, '2011-03-14 16:10:24', null, null, null, null, null, null, null, '40', null, '199', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('47', 'zhen', '派潭镇', null, '2011-03-14 16:10:54', null, null, null, null, null, null, null, '41', null, '201', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('48', 'zhen', '小楼镇', null, '2011-03-14 16:11:15', null, null, null, null, null, null, null, '41', null, '200', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('49', 'zhen', '正果镇', null, '2011-03-14 16:11:44', null, null, null, null, null, null, null, '41', null, '198', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('50', 'zhen', '梯面镇', null, '2011-03-14 16:12:14', null, null, null, null, null, null, null, '42', null, '50', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('51', 'cun', '密石村', null, '2011-03-15 10:23:55', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'msc');
INSERT INTO `fp_diqu` VALUES ('52', 'cun', '乌土村', null, '2011-03-15 10:24:11', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wtc');
INSERT INTO `fp_diqu` VALUES ('53', 'cun', '南平村', null, '2011-03-15 10:24:30', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'npc');
INSERT INTO `fp_diqu` VALUES ('54', 'cun', '乌石村', null, '2011-03-15 10:24:49', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wsc');
INSERT INTO `fp_diqu` VALUES ('55', 'cun', '源湖村', null, '2011-03-15 10:25:10', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yhc');
INSERT INTO `fp_diqu` VALUES ('56', 'cun', '龙桥村', null, '2011-03-15 10:25:26', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lqc');
INSERT INTO `fp_diqu` VALUES ('57', 'cun', '石南村', null, '2011-03-15 10:25:43', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'snc');
INSERT INTO `fp_diqu` VALUES ('58', 'cun', '卫东村', null, '2011-03-15 10:25:57', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wdc');
INSERT INTO `fp_diqu` VALUES ('59', 'cun', '宣星村', null, '2011-03-15 10:26:14', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('60', 'cun', '石海村', null, '2011-03-15 10:26:29', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'shc');
INSERT INTO `fp_diqu` VALUES ('61', 'cun', '新田村', null, '2011-03-15 10:26:43', null, null, null, null, null, null, null, null, null, null, '45', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xtc');
INSERT INTO `fp_diqu` VALUES ('62', 'cun', '新南村', null, '2011-03-15 10:27:00', null, null, null, null, null, null, null, null, null, null, '45', '55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xnc');
INSERT INTO `fp_diqu` VALUES ('63', 'cun', '平岗村', null, '2011-03-15 10:27:17', null, null, null, null, null, null, null, null, null, null, '45', '56', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'pgc');
INSERT INTO `fp_diqu` VALUES ('64', 'cun', '南星村', null, '2011-03-15 10:27:33', null, null, null, null, null, null, null, null, null, null, '45', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'nxc');
INSERT INTO `fp_diqu` VALUES ('65', 'cun', '云星村', null, '2011-03-15 10:27:48', null, null, null, null, null, null, null, null, null, null, '45', '58', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yxc');
INSERT INTO `fp_diqu` VALUES ('66', 'cun', '中田村', null, '2011-03-15 10:28:06', null, null, null, null, null, null, null, null, null, null, '45', '59', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ztc');
INSERT INTO `fp_diqu` VALUES ('67', 'cun', '石坑村', null, '2011-03-15 10:28:21', null, null, null, null, null, null, null, null, null, null, '45', '60', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'skc');
INSERT INTO `fp_diqu` VALUES ('68', 'cun', '龙新村', null, '2011-03-15 10:28:39', null, null, null, null, null, null, null, null, null, null, '45', '61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('69', 'cun', '龙岗村', null, '2011-03-15 10:28:54', null, null, null, null, null, null, null, null, null, null, '45', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lgc');
INSERT INTO `fp_diqu` VALUES ('70', 'cun', '水埔村', null, '2011-03-15 10:29:36', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'spc');
INSERT INTO `fp_diqu` VALUES ('71', 'cun', '吕中村', null, '2011-03-15 10:29:57', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lzc');
INSERT INTO `fp_diqu` VALUES ('72', 'cun', '联丰村', null, '2011-03-15 10:30:57', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lfc');
INSERT INTO `fp_diqu` VALUES ('73', 'cun', '东联村', null, '2011-03-15 10:31:18', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dlc');
INSERT INTO `fp_diqu` VALUES ('74', 'cun', '五和村', null, '2011-03-15 10:31:35', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'whc');
INSERT INTO `fp_diqu` VALUES ('75', 'cun', '桂峰村', null, '2011-03-15 10:32:13', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gfc');
INSERT INTO `fp_diqu` VALUES ('76', 'cun', '草埔村', null, '2011-03-15 10:32:30', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'cpc');
INSERT INTO `fp_diqu` VALUES ('77', 'cun', '坪地村', null, '2011-03-15 11:01:31', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'pdc');
INSERT INTO `fp_diqu` VALUES ('78', 'cun', '莲麻村', null, '2011-03-15 11:01:49', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lmc');
INSERT INTO `fp_diqu` VALUES ('79', 'cun', '新联村', null, '2011-03-15 11:02:05', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xlc');
INSERT INTO `fp_diqu` VALUES ('80', 'cun', '东坑村', null, '2011-03-15 11:02:27', null, null, null, null, null, null, null, null, null, null, '46', '204', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dkc');
INSERT INTO `fp_diqu` VALUES ('81', 'cun', '吕新村', null, '2011-03-15 11:02:44', null, null, null, null, null, null, null, null, null, null, '46', '65', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('82', 'cun', '狮象村', null, '2011-03-15 11:03:00', null, null, null, null, null, null, null, null, null, null, '46', '66', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxc');
INSERT INTO `fp_diqu` VALUES ('83', 'cun', '份田村', null, '2011-03-15 11:03:17', null, null, null, null, null, null, null, null, null, null, '46', '67', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ftc');
INSERT INTO `fp_diqu` VALUES ('84', 'cun', '三村村', null, '2011-03-15 11:03:34', null, null, null, null, null, null, null, null, null, null, '46', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'scc');
INSERT INTO `fp_diqu` VALUES ('85', 'cun', '塘基村', null, '2011-03-15 11:03:56', null, null, null, null, null, null, null, null, null, null, '46', '69', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tjc');
INSERT INTO `fp_diqu` VALUES ('86', 'cun', '鱼洞村', null, '2011-03-15 11:04:14', null, null, null, null, null, null, null, null, null, null, '46', '70', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ydc');
INSERT INTO `fp_diqu` VALUES ('87', 'cun', '竹坑村', null, '2011-03-15 11:04:31', null, null, null, null, null, null, null, null, null, null, '46', '71', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zkc');
INSERT INTO `fp_diqu` VALUES ('88', 'cun', '小杉村', null, '2011-03-15 11:05:12', null, null, null, null, null, null, null, null, null, null, '46', '72', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xsc');
INSERT INTO `fp_diqu` VALUES ('89', 'cun', '北溪村', null, '2011-03-15 11:05:40', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'bxc');
INSERT INTO `fp_diqu` VALUES ('90', 'cun', '塘尾村', null, '2011-03-15 11:05:56', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'twc');
INSERT INTO `fp_diqu` VALUES ('91', 'cun', '达溪村', null, '2011-03-15 11:06:24', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dxc');
INSERT INTO `fp_diqu` VALUES ('92', 'cun', '高沙村', null, '2011-03-15 11:06:44', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gsc');
INSERT INTO `fp_diqu` VALUES ('93', 'cun', '乐明村', null, '2011-03-15 11:07:05', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lmc');
INSERT INTO `fp_diqu` VALUES ('94', 'cun', '联平村', null, '2011-03-15 11:07:21', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lpc');
INSERT INTO `fp_diqu` VALUES ('95', 'cun', '仙溪村', null, '2011-03-15 11:07:38', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('96', 'cun', '锦村村', null, '2011-03-15 11:07:57', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'jcc');
INSERT INTO `fp_diqu` VALUES ('97', 'cun', '下溪村', null, '2011-03-15 11:08:15', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('98', 'cun', '联群村', null, '2011-03-15 11:08:31', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lqc');
INSERT INTO `fp_diqu` VALUES ('99', 'cun', '溪头村', null, '2011-03-15 11:09:32', null, null, null, null, null, null, null, null, null, null, '44', '206', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xtc');
INSERT INTO `fp_diqu` VALUES ('100', 'cun', '石岭村', null, '2011-03-15 11:09:47', null, null, null, null, null, null, null, null, null, null, '44', '74', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'slc');
INSERT INTO `fp_diqu` VALUES ('101', 'cun', '米埔村', null, '2011-03-15 11:10:05', null, null, null, null, null, null, null, null, null, null, '44', '75', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mpc');
INSERT INTO `fp_diqu` VALUES ('102', 'cun', '良平村', null, '2011-03-15 11:10:22', null, null, null, null, null, null, null, null, null, null, '44', '76', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lpc');
INSERT INTO `fp_diqu` VALUES ('103', 'cun', '石明村', null, '2011-03-15 11:10:38', null, null, null, null, null, null, null, null, null, null, '44', '77', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'smc');
INSERT INTO `fp_diqu` VALUES ('104', 'cun', '长流村', null, '2011-03-15 11:10:57', null, null, null, null, null, null, null, null, null, null, '44', '78', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'clc');
INSERT INTO `fp_diqu` VALUES ('105', 'cun', '合群村', null, '2011-03-15 11:11:18', null, null, null, null, null, null, null, null, null, null, '44', '79', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hqc');
INSERT INTO `fp_diqu` VALUES ('106', 'cun', '塘料村', null, '2011-03-15 11:11:41', null, null, null, null, null, null, null, null, null, null, '44', '84', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tlc');
INSERT INTO `fp_diqu` VALUES ('107', 'cun', '磻溪村', null, '2011-03-15 11:12:07', null, null, null, null, null, null, null, null, null, null, '44', '85', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '磻xc');
INSERT INTO `fp_diqu` VALUES ('108', 'cun', '和丰村', null, '2011-03-15 11:12:25', null, null, null, null, null, null, null, null, null, null, '44', '86', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hfc');
INSERT INTO `fp_diqu` VALUES ('109', 'cun', '赤树村', null, '2011-03-15 11:12:45', null, null, null, null, null, null, null, null, null, null, '44', '87', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'csc');
INSERT INTO `fp_diqu` VALUES ('110', 'cun', '胜塘村', null, '2011-03-15 11:12:58', null, null, null, null, null, null, null, null, null, null, '44', '88', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'stc');
INSERT INTO `fp_diqu` VALUES ('111', 'cun', '少沙村', null, '2011-03-15 11:13:14', null, null, null, null, null, null, null, null, null, null, '44', '89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ssc');
INSERT INTO `fp_diqu` VALUES ('112', 'cun', '团丰村', null, '2011-03-15 11:13:29', null, null, null, null, null, null, null, null, null, null, '44', '90', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tfc');
INSERT INTO `fp_diqu` VALUES ('113', 'cun', '梅树村', null, '2011-03-15 11:13:45', null, null, null, null, null, null, null, null, null, null, '44', '91', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'msc');
INSERT INTO `fp_diqu` VALUES ('114', 'cun', '白兔村', null, '2011-03-15 11:16:44', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'btc');
INSERT INTO `fp_diqu` VALUES ('115', 'cun', '潭口村', null, '2011-03-15 11:17:08', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tkc');
INSERT INTO `fp_diqu` VALUES ('116', 'cun', '横江村', null, '2011-03-15 11:17:24', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hjc');
INSERT INTO `fp_diqu` VALUES ('117', 'cun', '新隅村', null, '2011-03-15 11:17:53', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xyc');
INSERT INTO `fp_diqu` VALUES ('118', 'cun', '西湖村', null, '2011-03-15 11:18:12', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xhc');
INSERT INTO `fp_diqu` VALUES ('119', 'cun', '乌石村', null, '2011-03-15 11:18:29', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wsc');
INSERT INTO `fp_diqu` VALUES ('120', 'cun', '白石村', null, '2011-03-15 11:18:44', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'bsc');
INSERT INTO `fp_diqu` VALUES ('121', 'cun', '黄罗村', null, '2011-03-15 11:19:01', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hlc');
INSERT INTO `fp_diqu` VALUES ('122', 'cun', '高禾村', null, '2011-03-15 11:19:18', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ghc');
INSERT INTO `fp_diqu` VALUES ('123', 'cun', '中塘村', null, '2011-03-15 11:19:42', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ztc');
INSERT INTO `fp_diqu` VALUES ('124', 'cun', '下西村', null, '2011-03-15 11:20:03', null, null, null, null, null, null, null, null, null, null, '43', '207', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('125', 'cun', '务丰村', null, '2011-03-15 11:20:32', null, null, null, null, null, null, null, null, null, null, '43', '93', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wfc');
INSERT INTO `fp_diqu` VALUES ('126', 'cun', '小坑村', null, '2011-03-15 11:20:48', null, null, null, null, null, null, null, null, null, null, '43', '94', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xkc');
INSERT INTO `fp_diqu` VALUES ('127', 'area', '海珠区', null, '2011-03-15 11:30:11', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('128', 'area', '黄埔区', null, '2011-03-15 11:30:33', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('129', 'area', '天河区', null, '2011-03-15 11:30:48', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('130', 'area', '荔湾区', null, '2011-03-15 11:31:12', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('131', 'area', '越秀区', null, '2011-03-15 11:31:29', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('132', 'area', '番禺区', null, '2011-03-15 11:31:59', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('133', 'cun', '西向村', null, '2011-03-15 11:44:20', null, null, null, null, null, null, null, null, null, null, '43', '95', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('134', 'cun', '大氹村', null, '2011-03-15 11:44:48', null, null, null, null, null, null, null, null, null, null, '43', '96', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'd氹c');
INSERT INTO `fp_diqu` VALUES ('135', 'cun', '龙田村', null, '2011-03-15 11:45:21', null, null, null, null, null, null, null, null, null, null, '43', '97', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ltc');
INSERT INTO `fp_diqu` VALUES ('136', 'cun', '车头村', null, '2011-03-15 11:45:39', null, null, null, null, null, null, null, null, null, null, '43', '98', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ctc');
INSERT INTO `fp_diqu` VALUES ('137', 'cun', '官庄村', null, '2011-03-15 11:47:08', null, null, null, null, null, null, null, null, null, null, '43', '99', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzc');
INSERT INTO `fp_diqu` VALUES ('138', 'cun', '新围村', null, '2011-03-15 11:47:37', null, null, null, null, null, null, null, null, null, null, '43', '100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xwc');
INSERT INTO `fp_diqu` VALUES ('139', 'cun', '民乐村', null, '2011-03-15 11:48:07', null, null, null, null, null, null, null, null, null, null, '43', '101', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mlc');
INSERT INTO `fp_diqu` VALUES ('140', 'cun', '凤岐村', null, '2011-03-15 11:48:26', null, null, null, null, null, null, null, null, null, null, '43', '102', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'f岐c');
INSERT INTO `fp_diqu` VALUES ('141', 'cun', '鹿田村', null, '2011-03-15 11:48:50', null, null, null, null, null, null, null, null, null, null, '43', '103', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ltc');
INSERT INTO `fp_diqu` VALUES ('142', 'cun', '中心村', null, '2011-03-15 11:49:18', null, null, null, null, null, null, null, null, null, null, '43', '104', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zxc');
INSERT INTO `fp_diqu` VALUES ('143', 'cun', '上西村', null, '2011-03-15 11:49:38', null, null, null, null, null, null, null, null, null, null, '43', '105', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxc');
INSERT INTO `fp_diqu` VALUES ('144', 'cun', '岭南村', null, '2011-03-15 11:50:00', null, null, null, null, null, null, null, null, null, null, '43', '106', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lnc');
INSERT INTO `fp_diqu` VALUES ('145', 'cun', '爱群村', null, '2011-03-15 11:50:19', null, null, null, null, null, null, null, null, null, null, '43', '107', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'aqc');
INSERT INTO `fp_diqu` VALUES ('146', 'cun', '西山村', null, '2011-03-15 11:50:45', null, null, null, null, null, null, null, null, null, null, '43', '108', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xsc');
INSERT INTO `fp_diqu` VALUES ('147', 'cun', '龙角村', null, '2011-03-15 11:51:09', null, null, null, null, null, null, null, null, null, null, '43', '109', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ljc');
INSERT INTO `fp_diqu` VALUES ('148', 'cun', '横坑村', null, '2011-03-15 11:51:28', null, null, null, null, null, null, null, null, null, null, '43', '110', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hkc');
INSERT INTO `fp_diqu` VALUES ('149', 'cun', '象新村', null, '2011-03-15 11:54:09', null, null, null, null, null, null, null, null, null, null, '43', '111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xxc');
INSERT INTO `fp_diqu` VALUES ('150', 'cun', '横江村', null, '2011-03-15 11:54:28', null, null, null, null, null, null, null, null, null, null, '43', '112', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hjc');
INSERT INTO `fp_diqu` VALUES ('151', 'cun', '横岭村', null, '2011-03-15 11:54:49', null, null, null, null, null, null, null, null, null, null, '43', '113', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hlc');
INSERT INTO `fp_diqu` VALUES ('154', 'cun', '丁坑村', null, '2011-03-15 14:10:12', null, null, null, null, null, null, null, null, null, null, '43', '114', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dkc');
INSERT INTO `fp_diqu` VALUES ('155', 'cun', '帝田村', null, '2011-03-15 14:11:08', null, null, null, null, null, null, null, null, null, null, '43', '115', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dtc');
INSERT INTO `fp_diqu` VALUES ('156', 'cun', '新村村', null, '2011-03-15 14:11:32', null, null, null, null, null, null, null, null, null, null, '43', '116', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xcc');
INSERT INTO `fp_diqu` VALUES ('157', 'cun', '石联村', null, '2011-03-15 14:11:48', null, null, null, null, null, null, null, null, null, null, '43', '117', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'slc');
INSERT INTO `fp_diqu` VALUES ('158', 'cun', '桥头村', null, '2011-03-15 14:12:03', null, null, null, null, null, null, null, null, null, null, '43', '118', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'qtc');
INSERT INTO `fp_diqu` VALUES ('159', 'cun', '汾水村', null, '2011-03-15 14:12:21', null, null, null, null, null, null, null, null, null, null, '43', '119', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'fsc');
INSERT INTO `fp_diqu` VALUES ('160', 'cun', '五丰村', null, '2011-03-15 14:12:39', null, null, null, null, null, null, null, null, null, null, '43', '120', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wfc');
INSERT INTO `fp_diqu` VALUES ('161', 'cun', '新兔村', null, '2011-03-15 14:13:00', null, null, null, null, null, null, null, null, null, null, '43', '121', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xtc');
INSERT INTO `fp_diqu` VALUES ('162', 'cun', '龙聚村', null, '2011-03-15 14:13:17', null, null, null, null, null, null, null, null, null, null, '43', '122', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ljc');
INSERT INTO `fp_diqu` VALUES ('163', 'cun', '鳌山村', null, '2011-03-15 14:13:32', null, null, null, null, null, null, null, null, null, null, '43', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '鳌sc');
INSERT INTO `fp_diqu` VALUES ('164', 'cun', '洲洞村', null, '2011-03-15 14:13:49', null, null, null, null, null, null, null, null, null, null, '43', '124', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zdc');
INSERT INTO `fp_diqu` VALUES ('165', 'cun', '松园村', null, '2011-03-15 14:14:06', null, null, null, null, null, null, null, null, null, null, '43', '125', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'syc');
INSERT INTO `fp_diqu` VALUES ('166', 'cun', '塘贝村', null, '2011-03-15 14:14:24', null, null, null, null, null, null, null, null, null, null, '43', '126', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tbc');
INSERT INTO `fp_diqu` VALUES ('167', 'cun', '石咀村', null, '2011-03-15 14:14:38', null, null, null, null, null, null, null, null, null, null, '43', '127', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjc');
INSERT INTO `fp_diqu` VALUES ('168', 'cun', '沙迳村', null, '2011-03-15 14:14:55', null, null, null, null, null, null, null, null, null, null, '43', '128', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 's迳c');
INSERT INTO `fp_diqu` VALUES ('169', 'cun', '珊瑚村', null, '2011-03-15 14:15:08', null, null, null, null, null, null, null, null, null, null, '43', '129', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'shc');
INSERT INTO `fp_diqu` VALUES ('170', 'cun', '黄茅村', null, '2011-03-15 14:15:24', null, null, null, null, null, null, null, null, null, null, '43', '130', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hmc');
INSERT INTO `fp_diqu` VALUES ('171', 'cun', '龙星村', null, '2011-03-15 14:15:43', null, null, null, null, null, null, null, null, null, null, '43', '131', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('172', 'cun', '西塘村', null, '2011-03-15 14:15:58', null, null, null, null, null, null, null, null, null, null, '43', '132', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xtc');
INSERT INTO `fp_diqu` VALUES ('173', 'cun', '楼星村', null, '2011-03-15 14:16:16', null, null, null, null, null, null, null, null, null, null, '43', '133', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('174', 'cun', '山心村', null, '2011-03-15 14:16:30', null, null, null, null, null, null, null, null, null, null, '43', '134', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxc');
INSERT INTO `fp_diqu` VALUES ('175', 'cun', '铺锦村', null, '2011-03-15 14:16:49', null, null, null, null, null, null, null, null, null, null, '43', '135', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'pjc');
INSERT INTO `fp_diqu` VALUES ('176', 'cun', '宝溪村', null, '2011-03-15 14:17:06', null, null, null, null, null, null, null, null, null, null, '43', '136', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'bxc');
INSERT INTO `fp_diqu` VALUES ('177', 'cun', '岐田村', null, '2011-03-15 14:17:22', null, null, null, null, null, null, null, null, null, null, '43', '137', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '岐tc');
INSERT INTO `fp_diqu` VALUES ('178', 'cun', '月荣村', null, '2011-03-15 14:17:37', null, null, null, null, null, null, null, null, null, null, '43', '138', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yrc');
INSERT INTO `fp_diqu` VALUES ('179', 'cun', '大岭村', null, '2011-03-15 14:17:54', null, null, null, null, null, null, null, null, null, null, '43', '139', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dlc');
INSERT INTO `fp_diqu` VALUES ('180', 'cun', '南楼村', null, '2011-03-15 14:18:13', null, null, null, null, null, null, null, null, null, null, '43', '140', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'nlc');
INSERT INTO `fp_diqu` VALUES ('181', 'cun', '庙潭村', null, '2011-03-15 14:18:55', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mtc');
INSERT INTO `fp_diqu` VALUES ('182', 'cun', '二龙村', null, '2011-03-15 14:19:10', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'elc');
INSERT INTO `fp_diqu` VALUES ('183', 'cun', '秀水村', null, '2011-03-15 14:19:26', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xsc');
INSERT INTO `fp_diqu` VALUES ('184', 'cun', '江坳村', null, '2011-03-15 14:19:40', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'j坳c');
INSERT INTO `fp_diqu` VALUES ('185', 'cun', '竹坑村', null, '2011-03-15 14:19:57', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zkc');
INSERT INTO `fp_diqu` VALUES ('186', 'cun', '正隆村', null, '2011-03-15 14:20:16', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zlc');
INSERT INTO `fp_diqu` VALUES ('187', 'cun', '罗坑村', null, '2011-03-15 14:20:32', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lkc');
INSERT INTO `fp_diqu` VALUES ('188', 'cun', '长岭村', null, '2011-03-15 14:20:47', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'clc');
INSERT INTO `fp_diqu` VALUES ('189', 'cun', '东境村', null, '2011-03-15 14:21:05', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'djc');
INSERT INTO `fp_diqu` VALUES ('190', 'cun', '沙岗村', null, '2011-03-15 14:21:21', null, null, null, null, null, null, null, null, null, null, '48', '208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgc');
INSERT INTO `fp_diqu` VALUES ('191', 'cun', '约场村', null, '2011-03-15 14:21:37', null, null, null, null, null, null, null, null, null, null, '48', '142', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ycc');
INSERT INTO `fp_diqu` VALUES ('192', 'cun', '黄村村', null, '2011-03-15 14:22:15', null, null, null, null, null, null, null, null, null, null, '48', '143', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hcc');
INSERT INTO `fp_diqu` VALUES ('193', 'cun', '河洞村', null, '2011-03-15 14:22:36', null, null, null, null, null, null, null, null, null, null, '48', '144', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hdc');
INSERT INTO `fp_diqu` VALUES ('194', 'cun', '西元村', null, '2011-03-15 14:22:52', null, null, null, null, null, null, null, null, null, null, '48', '145', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xyc');
INSERT INTO `fp_diqu` VALUES ('195', 'cun', '邓山村', null, '2011-03-15 14:23:08', null, null, null, null, null, null, null, null, null, null, '48', '146', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dsc');
INSERT INTO `fp_diqu` VALUES ('196', 'cun', '青迳村', null, '2011-03-15 14:23:26', null, null, null, null, null, null, null, null, null, null, '48', '147', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'q迳c');
INSERT INTO `fp_diqu` VALUES ('197', 'cun', '九益村', null, '2011-03-15 14:23:42', null, null, null, null, null, null, null, null, null, null, '48', '148', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'jyc');
INSERT INTO `fp_diqu` VALUES ('198', 'cun', '和平村', null, '2011-03-15 14:24:37', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hpc');
INSERT INTO `fp_diqu` VALUES ('199', 'cun', '庙尾村', null, '2011-03-15 14:24:59', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mwc');
INSERT INTO `fp_diqu` VALUES ('200', 'cun', '麻窿村', null, '2011-03-15 14:25:14', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mlc');
INSERT INTO `fp_diqu` VALUES ('201', 'cun', '石溪村', null, '2011-03-15 14:25:32', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxc');
INSERT INTO `fp_diqu` VALUES ('202', 'cun', '水围村', null, '2011-03-15 14:25:48', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'swc');
INSERT INTO `fp_diqu` VALUES ('203', 'cun', '水口村', null, '2011-03-15 14:26:11', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'skc');
INSERT INTO `fp_diqu` VALUES ('204', 'cun', '大窿村', null, '2011-03-15 14:26:30', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dlc');
INSERT INTO `fp_diqu` VALUES ('205', 'cun', '到蔚村', null, '2011-03-15 14:26:51', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dwc');
INSERT INTO `fp_diqu` VALUES ('206', 'cun', '麦村村', null, '2011-03-15 14:27:31', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mcc');
INSERT INTO `fp_diqu` VALUES ('207', 'cun', '亮星村', null, '2011-03-15 14:28:20', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('208', 'cun', '番丰村', null, '2011-03-15 14:28:52', null, null, null, null, null, null, null, null, null, null, '49', '209', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ffc');
INSERT INTO `fp_diqu` VALUES ('209', 'cun', '浪拨村', null, '2011-03-15 14:29:25', null, null, null, null, null, null, null, null, null, null, '49', '150', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lbc');
INSERT INTO `fp_diqu` VALUES ('210', 'cun', '黄塘村', null, '2011-03-15 14:30:17', null, null, null, null, null, null, null, null, null, null, '49', '151', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'htc');
INSERT INTO `fp_diqu` VALUES ('211', 'cun', '合水店村', null, '2011-03-15 14:30:47', null, null, null, null, null, null, null, null, null, null, '49', '152', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hsdc');
INSERT INTO `fp_diqu` VALUES ('212', 'cun', '何屋村', null, '2011-03-15 14:31:17', null, null, null, null, null, null, null, null, null, null, '49', '153', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hwc');
INSERT INTO `fp_diqu` VALUES ('213', 'cun', '圭湖村', null, '2011-03-15 14:32:19', null, null, null, null, null, null, null, null, null, null, '49', '154', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ghc');
INSERT INTO `fp_diqu` VALUES ('214', 'cun', '畲族村', null, '2011-03-15 14:32:45', null, null, null, null, null, null, null, null, null, null, '49', '155', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '畲zc');
INSERT INTO `fp_diqu` VALUES ('215', 'cun', '东汾村', null, '2011-03-15 14:33:20', null, null, null, null, null, null, null, null, null, null, '49', '156', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dfc');
INSERT INTO `fp_diqu` VALUES ('216', 'cun', '兰溪村', null, '2011-03-15 14:34:41', null, null, null, null, null, null, null, null, null, null, '49', '157', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'lxc');
INSERT INTO `fp_diqu` VALUES ('217', 'cun', '花园村', null, '2011-03-15 14:35:05', null, null, null, null, null, null, null, null, null, null, '49', '158', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hyc');
INSERT INTO `fp_diqu` VALUES ('218', 'cun', '汀塘村', null, '2011-03-15 14:35:39', null, null, null, null, null, null, null, null, null, null, '49', '159', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ttc');
INSERT INTO `fp_diqu` VALUES ('219', 'cun', '黄屋村', null, '2011-03-15 14:36:02', null, null, null, null, null, null, null, null, null, null, '49', '160', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hwc');
INSERT INTO `fp_diqu` VALUES ('220', 'cun', '蒙花布村', null, '2011-03-15 14:36:21', null, null, null, null, null, null, null, null, null, null, '49', '161', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'mhbc');
INSERT INTO `fp_diqu` VALUES ('221', 'cun', '白面石村', null, '2011-03-15 14:36:39', null, null, null, null, null, null, null, null, null, null, '49', '162', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'bmsc');
INSERT INTO `fp_diqu` VALUES ('222', 'cun', '乌头石村', null, '2011-03-15 14:36:58', null, null, null, null, null, null, null, null, null, null, '49', '163', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wtsc');
INSERT INTO `fp_diqu` VALUES ('223', 'cun', '池田村', null, '2011-03-15 14:37:19', null, null, null, null, null, null, null, null, null, null, '49', '164', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ctc');
INSERT INTO `fp_diqu` VALUES ('224', 'cun', '西湖滩村', null, '2011-03-15 14:37:37', null, null, null, null, null, null, null, null, null, null, '49', '165', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'xhtc');
INSERT INTO `fp_diqu` VALUES ('225', 'cun', '银场村', null, '2011-03-15 14:37:57', null, null, null, null, null, null, null, null, null, null, '49', '166', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ycc');
INSERT INTO `fp_diqu` VALUES ('226', 'cun', '中西村', null, '2011-03-15 14:38:14', null, null, null, null, null, null, null, null, null, null, '49', '167', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zxc');
INSERT INTO `fp_diqu` VALUES ('227', 'cun', '岳村村', null, '2011-03-15 14:38:51', null, null, null, null, null, null, null, null, null, null, '49', '168', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ycc');
INSERT INTO `fp_diqu` VALUES ('228', 'cun', '正果洋村', null, '2011-03-15 14:39:11', null, null, null, null, null, null, null, null, null, null, '49', '169', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zgyc');
INSERT INTO `fp_diqu` VALUES ('229', 'cun', '刘家村', null, '2011-03-15 14:39:49', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ljc');
INSERT INTO `fp_diqu` VALUES ('230', 'cun', '邓村', null, '2011-03-15 14:40:06', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dc');
INSERT INTO `fp_diqu` VALUES ('231', 'cun', '湾吓村', null, '2011-03-15 14:40:21', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wxc');
INSERT INTO `fp_diqu` VALUES ('232', 'cun', '双合寮村', null, '2011-03-15 14:40:38', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sh寮c');
INSERT INTO `fp_diqu` VALUES ('233', 'cun', '汉湖村', null, '2011-03-15 14:40:53', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hhc');
INSERT INTO `fp_diqu` VALUES ('234', 'cun', '拖罗村', null, '2011-03-15 14:43:02', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'tlc');
INSERT INTO `fp_diqu` VALUES ('235', 'cun', '旧高埔村', null, '2011-03-15 14:43:17', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'jgpc');
INSERT INTO `fp_diqu` VALUES ('236', 'cun', '万能村', null, '2011-03-15 14:43:33', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wnc');
INSERT INTO `fp_diqu` VALUES ('237', 'cun', '佳松岭村', null, '2011-03-15 14:43:50', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'jslc');
INSERT INTO `fp_diqu` VALUES ('238', 'cun', '玉枕村', null, '2011-03-15 14:44:06', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yzc');
INSERT INTO `fp_diqu` VALUES ('239', 'cun', '大埔村', null, '2011-03-15 14:45:08', null, null, null, null, null, null, null, null, null, null, '47', '210', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dpc');
INSERT INTO `fp_diqu` VALUES ('240', 'cun', '高埔村', null, '2011-03-15 14:45:23', null, null, null, null, null, null, null, null, null, null, '47', '171', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gpc');
INSERT INTO `fp_diqu` VALUES ('241', 'cun', '派潭村', null, '2011-03-15 14:45:40', null, null, null, null, null, null, null, null, null, null, '47', '172', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ptc');
INSERT INTO `fp_diqu` VALUES ('242', 'cun', '大田围村', null, '2011-03-15 14:45:54', null, null, null, null, null, null, null, null, null, null, '47', '173', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dtwc');
INSERT INTO `fp_diqu` VALUES ('243', 'cun', '高滩村', null, '2011-03-15 14:46:09', null, null, null, null, null, null, null, null, null, null, '47', '174', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gtc');
INSERT INTO `fp_diqu` VALUES ('244', 'cun', '黄洞村', null, '2011-03-15 16:09:40', null, null, null, null, null, null, null, null, null, null, '47', '175', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'hdc');
INSERT INTO `fp_diqu` VALUES ('245', 'cun', '高村村', null, '2011-03-15 16:09:56', null, null, null, null, null, null, null, null, null, null, '47', '176', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gcc');
INSERT INTO `fp_diqu` VALUES ('246', 'cun', '背阴村', null, '2011-03-15 16:10:18', null, null, null, null, null, null, null, null, null, null, '47', '177', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'byc');
INSERT INTO `fp_diqu` VALUES ('247', 'cun', '利迳村', null, '2011-03-15 16:10:37', null, null, null, null, null, null, null, null, null, null, '47', '178', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'l迳c');
INSERT INTO `fp_diqu` VALUES ('248', 'cun', '七境村', null, '2011-03-15 16:10:53', null, null, null, null, null, null, null, null, null, null, '47', '179', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'qjc');
INSERT INTO `fp_diqu` VALUES ('249', 'cun', '亚口窿村', null, '2011-03-15 16:12:27', null, null, null, null, null, null, null, null, null, null, '47', '180', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yklc');
INSERT INTO `fp_diqu` VALUES ('250', 'cun', '湴汾村', null, '2011-03-15 16:12:47', null, null, null, null, null, null, null, null, null, null, '47', '184', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '湴fc');
INSERT INTO `fp_diqu` VALUES ('251', 'cun', '榕树吓村', null, '2011-03-15 16:13:07', null, null, null, null, null, null, null, null, null, null, '47', '181', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '榕sxc');
INSERT INTO `fp_diqu` VALUES ('252', 'cun', '亚如窿村', null, '2011-03-15 16:13:27', null, null, null, null, null, null, null, null, null, null, '47', '182', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'yrlc');
INSERT INTO `fp_diqu` VALUES ('253', 'cun', '小迳村', null, '2011-03-15 16:14:27', null, null, null, null, null, null, null, null, null, null, '47', '183', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'x迳c');
INSERT INTO `fp_diqu` VALUES ('254', 'cun', '东洞村', null, '2011-03-15 16:14:45', null, null, null, null, null, null, null, null, null, null, '47', '185', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'ddc');
INSERT INTO `fp_diqu` VALUES ('255', 'cun', '车洞村', null, '2011-03-15 16:15:01', null, null, null, null, null, null, null, null, null, null, '47', '186', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'cdc');
INSERT INTO `fp_diqu` VALUES ('256', 'cun', '密石村', null, '2011-03-15 16:15:17', null, null, null, null, null, null, null, null, null, null, '47', '187', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'msc');
INSERT INTO `fp_diqu` VALUES ('257', 'cun', '围园村', null, '2011-03-15 16:15:33', null, null, null, null, null, null, null, null, null, null, '47', '188', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wyc');
INSERT INTO `fp_diqu` VALUES ('258', 'cun', '水口窿村', null, '2011-03-15 16:15:53', null, null, null, null, null, null, null, null, null, null, '47', '189', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sklc');
INSERT INTO `fp_diqu` VALUES ('259', 'cun', '双头村', null, '2011-03-15 16:16:11', null, null, null, null, null, null, null, null, null, null, '47', '190', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'stc');
INSERT INTO `fp_diqu` VALUES ('260', 'cun', '上九陂村', null, '2011-03-15 16:16:28', null, null, null, null, null, null, null, null, null, null, '47', '191', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'sj陂c');
INSERT INTO `fp_diqu` VALUES ('261', 'cun', '樟洞坑村', null, '2011-03-15 16:16:47', null, null, null, null, null, null, null, null, null, null, '47', '192', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'zdkc');
INSERT INTO `fp_diqu` VALUES ('262', 'area', '萝岗区', null, '2011-03-15 16:26:26', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('263', 'zhen', '流溪河林场', null, '2011-03-16 10:45:46', null, null, null, null, null, null, null, '40', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_diqu` VALUES ('264', 'cun', '温塘肚村', null, '2011-03-16 10:46:22', null, null, null, null, null, null, null, null, null, null, '263', '193', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'wtdc');
INSERT INTO `fp_diqu` VALUES ('265', 'cun', '东星村', null, '2011-03-16 10:46:45', null, null, null, null, null, null, null, null, null, null, '46', '194', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dxc');
INSERT INTO `fp_diqu` VALUES ('266', 'cun', '谷星村', null, '2011-03-16 10:47:15', null, null, null, null, null, null, null, null, null, null, '263', '195', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'gxc');
INSERT INTO `fp_leader` VALUES ('2', '赵锡方', null, '208', null, '男', '', '流花街道办事处副调研员', '13922260272', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('3', '秦伟', null, '208', null, '男', '', '人民街道办事处城市管理科科长', '13112235683', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('4', '郑镇武', null, '208', null, '男', '', '北京街城管执法中队主任科员', '13316291899', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('5', '李志坚', null, '208', null, '男', '', '大新街道办事处社区服务中心主任', '13802768289', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('6', '欧阳阳', null, '208', null, '男', '', '市城市管理综合执法局越秀分局梅花村中队中队长', '13802951388', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('7', '罗海峰', null, '208', null, '男', '', '农林街道办事处计生办副主任', '13316100161', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('8', '叶荣怀', null, '208', null, '男', '', '黄花岗街道办事处社会事务科科长', '13928836866', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('9', '刘兴雷', null, '208', null, '男', '', '政府华乐街道办事处城管科副科长', '13699723649', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('10', '王剑声', null, '208', null, '男', '', '白云街出管中心职员', '13570128176', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('11', '李先荣', null, '208', null, '男', '', '光塔街综治维稳和信访科副主任科员', '13570278398', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('12', '黄冬源', null, '208', null, '男', '', '矿泉街综治维稳和信访科科长', '13711102316', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('13', '吴卫东', null, '205', null, '男', '', '赤岗街道办事处综治办主任', '13802762048', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('14', '肖迪', null, '205', null, '男', '', '赤岗街道出租屋管理服务中心十级职员', '13632269901', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('15', '张勇', null, '205', null, '男', '', '新港街道党政办科员', '13824488366', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('16', '梁振威', null, '205', null, '男', '', '新港街道出租屋管理服务中心九级职员', '13760779831', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('17', '伍伯辉', null, '205', null, '男', '', '昌岗街道办事处城管科科员', '13560456128', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('18', '林淡庆', null, '205', null, '男', '', '昌岗街道社区服务中心九级职员', '13380065368', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('19', '李健康', null, '205', null, '男', '', '市城市管理综合执法局海珠分局海珠区滨江街道执法队科员', '13924205776', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('20', '欧阳生', null, '205', null, '男', '', '滨江街道社区服务中心九级职员', '1892611381', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('21', '李启', null, '205', null, '男', '', '市城市管理综合执法局海珠分局江南中街道执法队科员', '13889907770', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('22', '李子庆', null, '205', null, '男', '', '江南中街道环境卫生监督检查所十级职员', '15811869858', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('23', '刁智辉', null, '205', null, '男', '', '市城市管理综合执法局海珠分局南华西街道执法队科员', '13725355517', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('24', '戴柱明', null, '205', null, '男', '', '南华西街道出租屋管理服务中心九级职员', '13602407750', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('25', '曾庆浩', null, '205', null, '男', '', '龙凤街道办事处社会事务管理科科员', '13570061234', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('26', '陈国冕', null, '205', null, '男', '', '龙凤街道出租屋管理服务中心九级职员', '13631381648', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('27', '李剑锋', null, '205', null, '男', '', '沙园街道办事处主任科员', '13602891880', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('28', '潘建明', null, '205', null, '男', '', '市城市管理综合执法局海珠分局沙园街道执法队科员', '13922185208', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('29', '李律', null, '205', null, '男', '', '市城市管理综合执法局海珠分局凤阳街道执法队科员', '13500035776', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('30', '胡光东', null, '205', null, '男', '', '海珠区凤阳街道社区服务中心九级职员', '13802966379', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('31', '梁炳赞', null, '205', null, '男', '', '市城市管理综合执法局海珠分局海幢街道执法队科员', '13929565619', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('32', '刘朝晖', null, '205', null, '男', '', '海幢街道社区服务中心九级职员', '13416300236', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('33', '刘海基', null, '205', null, '男', '', '市城市管理综合执法局海珠分局南石头街道执法队科员', '15918845084', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('34', '黄松茂', null, '205', null, '男', '', '南石头街道文化站九级职员', '13724842178', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('36', '黎伟斌', null, '204', null, '男', '', '金花街党政办主任', '13570130740', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('37', '崔峻峰', null, '204', null, '男', '', '海龙街道办事处城管科办事员', '15013051366', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('38', '周浩全', null, '204', null, '男', '', '岭南街道办事处城管科科长', '13728043782', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('39', '李桐发', null, '204', null, '男', '', '东沙街道办事处社会事务管理科副科长、残联理事长', '13725186512', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('40', '田中全', null, '204', null, '男', '', '冲口街纪工委副书记、监察室主任', '13711190654', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('41', '周涛', null, '204', null, '男', '', '南源街城管执法中队科员', '13535293515', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('42', '梁伟昌', null, '204', null, '男', '', '逢源街道办事处计生办主任', '13302273748', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('43', '黎斌', null, '204', null, '男', '', '东漖街道办事处经济社会事务管理科科长', '13902212188', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('44', '黄灿森', null, '204', null, '男', '', '花地街团工委书记、社区服务中心九级职员', '15013352888', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('45', '李才辉', null, '204', null, '男', '', '多宝街党政办科员', '13650966521', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('46', '应传考', null, '204', null, '男', '', '龙津街道办事处城管科科长', '13611401772', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('47', '魏达荣', null, '204', null, '男', '', '彩虹街道办事处社会事务管理科科员', '13560309148', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('48', '安锋', null, '204', null, '男', '', '昌华街道办事处城管科科长', '13725218396', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('49', '陈伯华', null, '204', null, '男', '', '茶滘街道办事处计生办主任', '13902408063', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('50', '何耀广', null, '204', null, '男', '', '桥中街道办事处城管科科长', '13538760994', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('51', '何容毅', null, '204', null, '男', '', '西村街道办事处副主任科员', '13711159578', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('52', '邹东', null, '204', null, '男', '', '华林街道办事处社会事务管理科副科长', '13676295255', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('53', '田伯奇', null, '204', null, '男', '', '中南街社区服务中心九级职员', '13711156774', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('54', '贺刚', null, '204', null, '男', '', '沙面街道办事处综治维稳和信访科科员', '13076872795', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('56', '谢纬国', null, '204', null, '男', '', '石围塘街道办事处社会事务管理科科员', '15920803500', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('57', '龙志祺', null, '204', null, '男', '', '白鹤洞街道办事处社会事务管理科主任科员', '13602858770', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('58', '龙腾', null, '204', null, '男', '', '站前街道办事处综治办副主任科员', '13119556469', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('59', '蔡洽武', null, '209', null, '男', '', '石牌街城管执法队科员', '13711450088', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('60', '刘志', null, '209', null, '男', '', '林和街城管执法队科员', '18602067819', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('61', '蔡春盛', null, '209', null, '男', '', '天河南街出租屋管理服务中心七级职员', '13078850589', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('62', '廖永浩', null, '209', null, '男', '', '猎德街综治办副主任', '13632269890', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('63', '邓校', null, '209', null, '男', '', '天园街党政办副主任', '13560021675', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('64', '蓝蓝', null, '209', null, '男', '', '车陂街民政科科长', '13302200118', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('65', '陈武波', null, '209', null, '男', '', '棠下街党政办副主任', '13600485929', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('66', '陈东红', null, '209', null, '男', '', '沙河街总工会副主席', '18675893838', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('67', '陈新彬', null, '209', null, '男', '', '元岗街城管执法队副主任科员', '13829761088', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('68', '席道盛', null, '209', null, '男', '', '长兴街城管执法队主任科员', '13903058175', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('69', '毛凯华', null, '209', null, '男', '', '兴华街社区服务中心八级职员', '13265112759', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('70', '孙文海', null, '206', null, '男', '', '黄埔区鱼珠街计生服务所副所长', '13570397998', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('71', '邓祖绪', null, '206', null, '男', '', '黄埔区大沙街城管执法队副主任科员', '15322375757', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('72', '曾祥东', null, '206', null, '男', '', '黄埔区穗东街城管执法队科员', '13128622833', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('73', '叶志鹏', null, '206', null, '男', '', '黄埔区长洲街党工委委员、党政办主任', '13711133137', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('74', '黄培倬', null, '206', null, '男', '', '黄埔区城管局直属一中队副主任科员', '13660271318', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('75', '吴文俊', null, '206', null, '男', '', '黄埔区文化广电新闻出版局旅游科科员', '13660359125', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('76', '李鸣华', null, '206', null, '男', '', '黄埔区南岗街城管执法队副主任科员', '13725493071', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('77', '李致德', null, '206', null, '男', '', '黄埔区红山街计生办主任', '13688898197', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('78', '马炳安', null, '206', null, '男', '', '黄埔区荔联街城管执法队副主任科员', '13119526688', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('79', '郑鑫浩', null, '206', null, '男', '', '黄埔区文冲街城管执法队科员', '13533944663', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('80', '孙林', null, '206', null, '男', '', '黄埔区黄埔街主任科员', '13632354991', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('81', '苏炳辉', null, '210', null, '男', '', '番禺区东涌镇经济发展、农业办公室副主任', '13922338801', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('82', '郭东旗', null, '210', null, '男', '', '番禺区钟村街党政办公室主任', '13501480222', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('83', '邝高伟', null, '210', null, '男', '', '番禺区洛浦街团工委书记', '13928878393', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('84', '杜楚生', null, '210', null, '男', '', '番禺区大龙街农业技术服务中心主任', '13902389379', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('85', '何俊', null, '210', null, '男', '', '番禺区石碁镇房地产管理所副所长、镇团委副书记', '13928782282', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('86', '刘照佳', null, '210', null, '男', '', '番禺区东环街党政办公室主任、团工委书记', '13928711888', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('87', '陈进', null, '210', null, '男', '', '番禺区南村镇财政所副所长', '13640677422', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('88', '梁福荣', null, '210', null, '男', '', '番禺区石楼镇纪委副书记、纪检监察室主任', '13923098098', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('89', '王海波', null, '210', null, '男', '', '番禺区沙湾镇侨联副主席', '13928881093', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('90', '郭带胜', null, '210', null, '男', '', '番禺区大石街主任科员', '13501471890', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('91', '柳长青', null, '210', null, '男', '', '番禺区市桥街副主任科员', '13642738186', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('92', '刘景勇', null, '207', null, '男', '', '夏港街社区综合管理服务中心交通部兼服务部部长', '13580395622', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('93', '任东波', null, '207', null, '男', '', '夏港街城管执法队科员', '13538805875', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('94', '邓运辉', null, '207', null, '男', '', '萝岗街道办事处党政办公室主任', '13802980004', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('95', '莫兴', null, '207', null, '男', '', '萝岗街道社区综合管理服务中心社区服务部部长', '13503044002', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('96', '谭培基', null, '207', null, '男', '', '联和街维稳综治办主任', '13802756329', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('97', '钟伟林', null, '207', null, '男', '', '联和街社区综合管理服务中心副主任', '13802510373', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('98', '钟志辉', null, '207', null, '男', '', '东区街道工会常务副主席', '13602832981', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('99', '钟柏钊', null, '207', null, '男', '', '东区街道社区综合管理服务中心九级职员', '13580558968', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('100', '魏菊良', null, '207', null, '男', '', '永和街主任科员', '13512778818', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('101', '胡国强', null, '207', null, '男', '', '永和街道社区综合管理服务中心副主任', '13060920161', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('102', '陈镜祥', null, '207', null, '男', '', '九龙镇农业办副主任科员', '13802503703', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('103', '陈晓东', null, '62', null, '男', '', '市政设施收费处次票科鹤洞大桥收费站站长', '13580313392', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('104', '蔡乐艺', null, '58', null, '男', '', '广州有色金属集团有限公司总经理办公室主任助理', '13925003409', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('105', '巫俊宏', null, '60', null, '男', '', '广州昊天化学（集团）有限公司', '13602700905', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('106', '温志光', null, '56', null, '男', '', '市台湾同胞联谊会副主任科员', '从化市温泉镇平岗村', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('107', '温志光', null, '56', null, '男', '', '市台湾同胞联谊会副主任科员', '从化市温泉镇平岗村', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('108', '黄飚', null, '61', null, '男', '', '广州摩托集团公司党委工作部副部长、纪检监察室副主任', '13570002118', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('109', '朱世娥', null, '57', null, '女', '', '广州万宝集团冰箱有限公司总务部、党群工作部干部', '13926188662', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('110', '赖胜军', null, '55', null, '男', '', '省渔政总队广州支队、渔业船舶检验处、副主任科员', '13128215577', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('111', '林翰雄', null, '59', null, '男', '', '广州番禺职业技术学院工商系讲师', '13602293184', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('112', '童朝阳', null, '65', null, '男', '', '市直机关工委信息办公室主任科员', '13794388071', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('113', '王德根', null, '71', null, '男', '', '市委老干部局市老干部休养所办公室副主任', '18688208917', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('114', '贺立峰', null, '66', null, '男', '', '市编办机构编制一处副处长', '13924063999', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('115', '余高德', null, '68', null, '男', '', '市民政局办公室、党委办公室主任科员', '15820251498', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('116', '邓卫东', null, '67', null, '男', '', '市财政局财政监督分局主任科员', '13699745922', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('117', '樊金鹏', null, '72', null, '男', '', '市政府侨务办公室侨政处副调研员', '13710033380', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('119', '曾伟煊', null, '69', null, '男', '', '市贸促委办公室科员', '13829744474', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('121', '周福洪', null, '70', null, '男', '', '市档案局科教处主任科员', '13802570659', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('122', '黄文胜', null, '74', null, '男', '', '市城市管理综合执法局直属三分局副主任科员', '13922401020', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('123', '肖俭明', null, '84', null, '男', '', '市发展和改革委员会国民经济综合处副主任科员', '13560258500', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('124', '邓勇', null, '89', null, '男', '', '市经贸委商贸服务业处副调研员', '13322806001', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('125', '林继洪', null, '76', null, '男', '', '广州东川新街市有限公司光扬分场党支部书记', '13728013234', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('126', '林旺东', null, '86', null, '男', '', '市公用事业高级技工学校机电系副主任', '13826019411', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('127', '邓振寰', null, '85', null, '男', '', '市余泥渣土排放管理处业务科主任科员', '13719433689', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('128', '刘玩强', null, '87', null, '男', '', '市水上运动管理中心干部', '13527847480', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('129', '高浩文', null, '79', null, '男', '', '市工商行政管理局从化分局良口工商所副所长', '13902326909', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('130', '孙伟', null, '88', null, '男', '', '市知识产权局规划发展处主任科员', '13560055773', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('131', '文宇', null, '90', null, '男', '', '市政府金融工作办公室综合处科员', '13889903655', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('132', '夏亦斌', null, '78', null, '男', '', '广州大学后勤服务与科技产业集团主任科员', '13728043743', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('133', '吴罡', null, '75', null, '男', '', '广州城市职业学院团委副书记', '13450395960', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('134', '暨永杰', null, '91', null, '男', '', '市委党校分校协调处主任科员', '13924080382', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('135', '黄海镜', null, '77', null, '男', '', '市设计院新誉物业管理有限公司副总经理', '13600083609', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('136', '杨少滨', null, '134', null, '男', '', '市委政法委禁毒办调研员', '13902297205', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('137', '李皑峰', null, '133', null, '男', '', '市保密局法规督查处副主任科员', '13570288188', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('138', '刘晓明', null, '135', null, '男', '', '市信访局督查处主任科员', '13600066648', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('139', '梁伟忠', null, '137', null, '男', '', '市人大常委会办公厅秘书处副处长', '13922298289', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('140', '徐锦超', null, '136', null, '男', '', '市政府采购中心信息部部长', '13922120821', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('141', '方良洪', null, '118', null, '男', '', '市建筑工程职业学校团委书记兼学生科副科长', '13502412880', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('142', '秦海鸥', null, '120', null, '男', '', '市科技和信息化局办公室副主任科员', '13580392327', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('143', '叶建洪', null, '117', null, '男', '', '市第一劳教所五大队副教导员', '13609608232', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('144', '郭剑晖', null, '123', null, '男', '', '市公安局装备财务处秘书科科长', '13602887780', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('145', '张强', null, '124', null, '男', '', '市交通委员会综合行政执法局副主任科员', '15820230181', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('146', '朱科冲', null, '127', null, '男', '', '市外经贸局办公室副主任科员', '13632202336', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('147', '李滋波', null, '116', null, '男', '', '市国资委人事处主任科员', '13570035000', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('148', '曾伟彬', null, '121', null, '男', '', '花都区城市建设档案馆科员', '13632238811', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('149', '李书凯', null, '126', null, '男', '', '广州市坑道管理所、安全监督部科员', '13556038859', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('150', '王建丰', null, '132', null, '男', '', '市政府政务管理办公室综合处副处长', '13527860018', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('151', '谭朝熙', null, '138', null, '男', '', '市政协办公厅研究室主任科员', '13535113566', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('152', '张力军', null, '122', null, '男', '', '市妇女干部学校培训一科科长', '13802509772', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('153', '柳春光', null, '139', null, '男', '', '广州市科学技术中心保卫科职员', '13889904787', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('154', '郭友谊', null, '140', null, '男', '', '市侨联直属企业侨达经济发展有限公司董事长', '13903005371', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('155', '方土福', null, '130', null, '男', '', '市文学艺术界联合会办公室副主任', '13710888309', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('156', '李钧', null, '131', null, '男', '', '广州市社会科学界联合会城市观察杂志社编辑', '13824823959', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('157', '李直建', null, '107', null, '男', '', '广州日报社经济新闻中心编辑', '13631367807', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('158', '谢仁晓', null, '108', null, '男', '', '广州电视台英语频道编辑', '13728043743', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('159', '张式汶', null, '93', null, '男', '', '铁路职业技术学院轨道交通系、政治辅导员（副主任科员）', '13302266522  13711011719', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('160', '朱书平', null, '129', null, '男', '', '广州仲裁委员会仲裁发展部调研员', '13798104819', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('161', '戚国忠', null, '128', null, '男', '', '广州港务局五各分局神山管理所所长', '13602233235', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('162', '马如涛', null, '102', null, '男', '', '广州市人民政府驻珠海办事处办事员', '13570220377', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('163', '刘念', null, '100', null, '男', '', '广州市供销合作总社主任科员', '13076871299', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('164', '何国坚', null, '109', null, '男', '', '广州农村商业银行从化支行综合部安全保卫专管员', '13926155066', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('165', '董嘉贤', null, '114', null, '男', '', '广州市新光快速路有限公司运营部副部长', '13602284119', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('166', '邝钜清', null, '96', null, '男', '', '广州白云山明兴制药有限公司保卫部主管', '15813363393', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('167', '吴仁磊', null, '113', null, '男', '', '广州港集团有限公司黄埔港务分公司生产业务部商务室副经理', '13902257368', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('168', '李文东', null, '110', null, '男', '', '广州市城市建设开发有限公司景城会所经理', '13922729123', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('169', '梁锦荣', null, '115', null, '男', '', '广州友谊集团股份有限公司营业主任', '13610356913', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('170', '范景超', null, '98', null, '男', '', '广州珠江工程建设监理有限公司设计技术部副经理', '13189010879', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('171', '叶佑坤', null, '95', null, '男', '', '广州酒家集团利口福食品有限公司质检员', '13560344593', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('172', '丘通强', null, '112', null, '男', '', '广州风行牛奶有限公司生产部部长助理', '15913196580', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('173', '陈伟杰', null, '101', null, '男', '', '广州二运集团有限公司经营发展部经理助理', '13798010611', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('174', '刘佳强', null, '106', null, '男', '', '广州珠江啤酒股份有限公司党群工作部文体宣传专员', '13560379817', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('175', '吴凯祥', null, '105', null, '男', '', '广州广重企业集团有限公司管理人员', '15360656567', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('176', '李辉', null, '94', null, '男', '', '市建筑集团广州市第四建筑工程有限公司科员', '13640649201', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('177', '杨锦标', null, '125', null, '男', '', '广州市农业机械总公司办公室副科', '13609736065', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('178', '陈愿', null, '103', null, '男', '', '广州水产集团有限公司广州鱼市场物管综治部部长', '15918596888', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('179', '高国华', null, '111', null, '男', '', '广州银行番禺支行高级客户经理', '13902385300', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('180', '林靖', null, '97', null, '男', '', '广州珠江钢琴集团股份有限公司保卫部副科长', '13533937119', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('181', '陈伟明', null, '99', null, '男', '', '广州纺织工贸企业集团有限公司企业发展部主办科员', '13650894836', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('182', '陈学杨', null, '104', null, '男', '', '广州丰力橡胶轮胎有限公司人力资源主管', '13922397277', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('183', '曾超雄', null, '119', null, '男', '', '市安全生产宣传教育中心技术开发部部长', '13682271631', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('184', '阮达贤', null, '148', null, '男', '', '市委办公厅顾问联络处、离退休干部管理处副调研员', '13610008346', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('185', '陈树博', null, '147', null, '男', '', '共青团广州市委员会青少年发展基金会科员', '13751828648', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('186', '陈天可', null, '144', null, '男', '', '市广播电视大学宿管科科长', '13711380331', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('187', '李际卫', null, '146', null, '男', '', '市社会主义学院教务处教学管理人员', '15913185415', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('188', '王少伟', null, '145', null, '男', '', '市地方志编纂委员会办公室秘书处主任科员', '13502459289', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('189', '郑仕权', null, '142', null, '男', '', '市“三旧”改造工作办公室综合处副主任科员', '13889903170', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('190', '黄标梁', null, '167', null, '男', '', '市委统战部港澳台海外联络处调研员', '18602059017', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('191', '聂伟风', null, '161', null, '男', '', '市委政研室秘书人事处调研员', '13535168080', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('192', '何文生', null, '168', null, '男', '', '市委台湾工作办公室宣传交流处副调研员', '13622283412', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('193', '黄永聪', null, '155', null, '男', '', '市民族宗教事务局民族工作处副主任科员', '13903072295', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('194', '徐建强', null, '151', null, '男', '', '市畜牧科学研究所人事行政部副主任（副科级）', '13602751145', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('195', '王庆钦', null, '153', null, '男', '', '市危改所办公室主任', '13622746527', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('196', '陈宁', null, '152', null, '男', '', '广州市白云湖水利工程管理处科员', '13580384441', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('197', '庄允锦', null, '169', null, '男', '', '广州图书馆科员', '13480230212', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('198', '麦卫东', null, '156', null, '男', '', '市计划生育协会主任科员', '13802528582', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('199', '黄明', null, '162', null, '男', '', '市审计局外资与农业资源审计处副主任科员', '13929540525', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('200', '魏承文', null, '157', null, '男', '', '广州市统计普查中心副主任科员', '13318712424', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('201', '李伟杰', null, '159', null, '男', '', '市物价局价格认证中心鉴证二部部长', '13435622248', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('202', '宋任翔', null, '163', null, '男', '', '越秀区质监局食品科主任科员', '13903075956', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('203', '刘正军', null, '154', null, '男', '', '市旅游局旅行社管理处副主任科员', '13650760016', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('204', '马火生', null, '166', null, '男', '', '市政府法制办公室规范性文件审查处副主任科员', '15918575565', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('205', '向新辉', null, '165', null, '男', '', '市政府研究室城市发展处主任科员', '13889900966', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('206', '王文聪', null, '160', null, '男', '', '广州市康纳学校十级职员', '13610023845', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('207', '佘远柱', null, '164', null, '男', '', '广州市社会科学院办公室副主任', '13060924089', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('208', '王小明', null, '158', null, '男', '', '市重点公共建设项目管理办公室质安验评部助理工程师', '13889905205', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('209', '梁仲俊', null, '150', null, '男', '', '市自来水公司西江引水工程项目办公室东部水厂改造分部副部长', '13926267898', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('210', '刘创光', null, '191', null, '男', '', '市纪委执法监察室副处级纪检监察员', '13808842068', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('212', '李永恒', null, '185', null, '男', '', '市委宣传部外宣办主任科员', '13902204297', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('213', '胡君城', null, '182', null, '男', '', '市环境信息中心', '13760818796', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('214', '陈至龙', null, '184', null, '男', '', '市城乡建设委员会综合调研处副处长', '13808883968', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('215', '蔡雄飞', null, '183', null, '男', '', '市委组织部办公室副主任科员', '13711695304', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('216', '吴耀明', null, '172', null, '男', '', '广州电缆厂有限公司成品车间生产管理职员', '13632447355', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('217', '刘小康', null, '181', null, '男', '', '市农业局农产品质量安全监管处副处长', '13318862503', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('218', '李大鹏', null, '189', null, '男', '', '市中医医院门诊部副主任', '13650838555', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('219', '吕伟', null, '192', null, '男', '', '市外办副主任科员', '13560044858', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('220', '欧阳清华', null, '188', null, '男', '', '市食品药品监督管理局稽查分局副调研员', '13802419622', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('221', '吴春宏', null, '180', null, '男', '', '市中级人民法院正科级法警', '13688876868', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('222', '黄永胜', null, '179', null, '男', '', '市检察院反渎职侵权局办案一组副组长', '18922259111', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('223', '徐斌', null, '186', null, '男', '', '市工商业联合会办公室科员', '13609798607', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('224', '陈卫行', null, '187', null, '男', '', '市总工会办公室主任科员', '13632198816  13902208022', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('225', '曹沛华', null, '178', null, '男', '', '广州新华书店集团有限公司科技书店门市部副主任', '13688875983', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('226', '谭承伟', null, '177', null, '男', '', '广州金桥酒店有限公司采购部经理', '13729820048', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('227', '梁承辉', null, '171', null, '男', '', '广百集团广州市南方大厦集团有限公司工会委员、办公室科员', '13660606188', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('228', '陈锦铨', null, '173', null, '男', '', '轻工工贸集团广州市金威龙实业股份公司销售部经理助理', '13310884727', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('229', '刘海奇', null, '174', null, '男', '', '广州国际控股集团辖属广州有林投资管理有限公司', '13826020664', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('230', '肖立军', null, '176', null, '男', '', '广州广电物业管理有限公司行政经理助理', '15989050060', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('231', '罗志龙', null, '175', null, '男', '', '餐饮服务部食堂管理助理', '13725163691', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('232', '钱树清', null, '190', null, '男', '', '广州广日物流有限公司管理部科员', '13798172133', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('233', '麦艺通', null, '193', null, '男', '', '市公安局森林分局流溪河派出所教导员', '13380010933', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('234', '赖章文', null, '194', null, '男', '', '广州医学院第一附属医院总务科副主任科员', '13318732612', null, null, null, null, null, null, null);
INSERT INTO `fp_leader` VALUES ('235', '张桂东', null, '195', null, '男', '', '市委党史研究室征集研究处副主任科员', '13632378895', null, null, null, null, null, null, null);
INSERT INTO `fp_permission` VALUES ('2', 'test', '123');
INSERT INTO `fp_permission` VALUES ('3', 'jun', '123');
INSERT INTO `fp_user` VALUES ('1', 'admin', 'sa', '202cb962ac59075b964b07152d234b70', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('47', 'shiworkorg', 'gzs_admin', '888888', '', '2011-03-14 16:13:34', null, null, null, null, null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('48', 'areaworkorg', 'chs_admin', '888888', '', '2011-03-14 16:15:07', null, null, null, null, null, null, null, '40', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('49', 'areaworkorg', 'zcs_admin', '888888', '', '2011-03-14 16:15:32', null, null, null, null, null, null, null, '41', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('50', 'areaworkorg', 'hdq_admin', '888888', '', '2011-03-14 16:16:03', null, null, null, null, null, null, null, '42', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('51', 'zhenworkorg', 'atz_admin', '888888', '', '2011-03-14 16:17:44', null, null, null, null, null, null, null, null, null, '43', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('52', 'zhenworkorg', 'lkz_admin', '888888', '', '2011-03-14 16:18:36', null, null, null, null, null, null, null, null, null, '44', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('53', 'zhenworkorg', 'wqz_admin', '888888', '', '2011-03-14 16:18:58', null, null, null, null, null, null, null, null, null, '45', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('54', 'zhenworkorg', 'ltz_admin', '888888', '', '2011-03-14 16:19:53', null, null, null, null, null, null, null, null, null, '46', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('55', 'org', '2011000012', '888888', '', '2011-03-14 16:40:03', null, null, null, null, null, null, null, null, null, null, null, null, '省渔政总队 广州支队', null, null, null, null, null, null, null, null, null, null, null, null, null, 'syzzd gzzd');
INSERT INTO `fp_user` VALUES ('56', 'org', '2011000013', '888888', '', '2011-03-14 16:40:46', null, null, null, null, null, null, null, null, null, null, null, null, '市台联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'stl');
INSERT INTO `fp_user` VALUES ('57', 'org', '2011000014', '888888', '', '2011-03-14 16:41:04', null, null, null, null, null, null, null, null, null, null, null, null, '万宝集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'wbjt');
INSERT INTO `fp_user` VALUES ('58', 'org', '2011000015', '888888', '', '2011-03-14 16:41:24', null, null, null, null, null, null, null, null, null, null, null, null, '广钢集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'ggjt');
INSERT INTO `fp_user` VALUES ('59', 'org', '2011000016', '888888', '', '2011-03-14 16:41:46', null, null, null, null, null, null, null, null, null, null, null, null, '广州番禺职业技术学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzf禺zyjsxy');
INSERT INTO `fp_user` VALUES ('60', 'org', '2011000017', '888888', '', '2011-03-14 16:42:15', null, null, null, null, null, null, null, null, null, null, null, null, '市化工集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'shgjt');
INSERT INTO `fp_user` VALUES ('61', 'org', '2011000018', '888888', '', '2011-03-14 16:42:36', null, null, null, null, null, null, null, null, null, null, null, null, '市汽车工业集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sqcgyjt');
INSERT INTO `fp_user` VALUES ('62', 'org', '2011000019', '888888', '', '2011-03-14 16:43:10', null, null, null, null, null, null, null, null, null, null, null, null, '市交通投资集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjttzjt');
INSERT INTO `fp_user` VALUES ('65', 'org', '2011000031', '888888', '', '2011-03-14 16:46:49', null, null, null, null, null, null, null, null, null, null, null, null, '市直机关工委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szjggw');
INSERT INTO `fp_user` VALUES ('66', 'org', '2011000032', '888888', '', '2011-03-14 16:47:13', null, null, null, null, null, null, null, null, null, null, null, null, '市编办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sbb');
INSERT INTO `fp_user` VALUES ('67', 'org', '2011000033', '888888', '', '2011-03-14 16:47:34', null, null, null, null, null, null, null, null, null, null, null, null, '市财政局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sczj');
INSERT INTO `fp_user` VALUES ('68', 'org', '2011000034', '888888', '', '2011-03-14 16:48:01', null, null, null, null, null, null, null, null, null, null, null, null, '市民政局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'smzj');
INSERT INTO `fp_user` VALUES ('69', 'org', '2011000035', '888888', '', '2011-03-14 16:48:30', null, null, null, null, null, null, null, null, null, null, null, null, '市贸促会', null, null, null, null, null, null, null, null, null, null, null, null, null, 'smch');
INSERT INTO `fp_user` VALUES ('70', 'org', '2011000036', '888888', '', '2011-03-14 16:49:23', null, null, null, null, null, null, null, null, null, null, null, null, '市档案局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sdaj');
INSERT INTO `fp_user` VALUES ('71', 'org', '2011000037', '888888', '', '2011-03-14 16:49:53', null, null, null, null, null, null, null, null, null, null, null, null, '市老干局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'slgj');
INSERT INTO `fp_user` VALUES ('72', 'org', '2011000038', '888888', '', '2011-03-14 16:50:21', null, null, null, null, null, null, null, null, null, null, null, null, '市侨办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sqb');
INSERT INTO `fp_user` VALUES ('74', 'org', '2011000050', '888888', '', '2011-03-14 16:52:52', null, null, null, null, null, null, null, null, null, null, null, null, '市邮政局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'syzj');
INSERT INTO `fp_user` VALUES ('75', 'org', '2011000051', '888888', '', '2011-03-14 16:53:26', null, null, null, null, null, null, null, null, null, null, null, null, '广州城市职业学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzcszyxy');
INSERT INTO `fp_user` VALUES ('76', 'org', '2011000052', '888888', '', '2011-03-14 16:53:55', null, null, null, null, null, null, null, null, null, null, null, null, '岭南集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'lnjt');
INSERT INTO `fp_user` VALUES ('77', 'org', '2011000053', '888888', '', '2011-03-14 16:54:31', null, null, null, null, null, null, null, null, null, null, null, null, '市设计院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'ssjy');
INSERT INTO `fp_user` VALUES ('78', 'org', '2011000054', '888888', '', '2011-03-14 16:55:07', null, null, null, null, null, null, null, null, null, null, null, null, '广州大学', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzdx');
INSERT INTO `fp_user` VALUES ('79', 'org', '2011000055', '888888', '', '2011-03-14 16:55:39', null, null, null, null, null, null, null, null, null, null, null, null, '市工商局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgsj');
INSERT INTO `fp_user` VALUES ('84', 'org', '2011000056', '888888', '', '2011-03-14 16:56:37', null, null, null, null, null, null, null, null, null, null, null, null, '市发改委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfgw');
INSERT INTO `fp_user` VALUES ('85', 'org', '2011000057', '888888', '', '2011-03-14 16:57:21', null, null, null, null, null, null, null, null, null, null, null, null, '市城管委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'scgw');
INSERT INTO `fp_user` VALUES ('86', 'org', '2011000058', '888888', '', '2011-03-14 16:57:59', null, null, null, null, null, null, null, null, null, null, null, null, '市人保局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'srbj');
INSERT INTO `fp_user` VALUES ('87', 'org', '2011000059', '888888', '', '2011-03-14 16:58:39', null, null, null, null, null, null, null, null, null, null, null, null, '市体育局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'styj');
INSERT INTO `fp_user` VALUES ('88', 'org', '2011000060', '888888', '', '2011-03-14 16:59:13', null, null, null, null, null, null, null, null, null, null, null, null, '市知识产权局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szscqj');
INSERT INTO `fp_user` VALUES ('89', 'org', '2011000061', '888888', '', '2011-03-14 16:59:38', null, null, null, null, null, null, null, null, null, null, null, null, '市经贸委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjmw');
INSERT INTO `fp_user` VALUES ('90', 'org', '2011000062', '888888', '', '2011-03-14 17:00:08', null, null, null, null, null, null, null, null, null, null, null, null, '市金融办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjrb');
INSERT INTO `fp_user` VALUES ('91', 'org', '2011000063', '888888', '', '2011-03-14 17:01:25', null, null, null, null, null, null, null, null, null, null, null, null, '市委党校', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swdx');
INSERT INTO `fp_user` VALUES ('93', 'org', '2011000075', '888888', '', '2011-03-14 17:04:30', null, null, null, null, null, null, null, null, null, null, null, null, '广州市铁路职业技术学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzstlzyjsxy');
INSERT INTO `fp_user` VALUES ('94', 'org', '2011000076', '888888', '', '2011-03-14 17:05:00', null, null, null, null, null, null, null, null, null, null, null, null, '市建筑集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjzjt');
INSERT INTO `fp_user` VALUES ('95', 'org', '2011000077', '888888', '', '2011-03-14 17:05:27', null, null, null, null, null, null, null, null, null, null, null, null, '广州酒家集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzjjjt');
INSERT INTO `fp_user` VALUES ('96', 'org', '2011000078', '888888', '', '2011-03-14 17:05:55', null, null, null, null, null, null, null, null, null, null, null, null, '医药集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'yyjt');
INSERT INTO `fp_user` VALUES ('97', 'org', '2011000079', '888888', '', '2011-03-14 17:06:21', null, null, null, null, null, null, null, null, null, null, null, null, '珠江钢琴集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'zjgqjt');
INSERT INTO `fp_user` VALUES ('98', 'org', '2011000080', '888888', '', '2011-03-14 17:06:47', null, null, null, null, null, null, null, null, null, null, null, '136', '珠江实业集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'zjsyjt');
INSERT INTO `fp_user` VALUES ('99', 'org', '2011000081', '888888', '', '2011-03-14 17:07:32', null, null, null, null, null, null, null, null, null, null, null, '137', '纺织工贸集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'fzgmjt');
INSERT INTO `fp_user` VALUES ('100', 'org', '2011000082', '888888', '', '2011-03-14 17:08:10', null, null, null, null, null, null, null, null, null, null, null, '138', '市供销总社', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgxzs');
INSERT INTO `fp_user` VALUES ('101', 'org', '2011000083', '888888', '', '2011-03-14 17:08:35', null, null, null, null, null, null, null, null, null, null, null, '139', '广州交通集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzjtjt');
INSERT INTO `fp_user` VALUES ('102', 'org', '2011000084', '888888', '', '2011-03-14 17:09:01', null, null, null, null, null, null, null, null, null, null, null, '140', '市协作办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxzb');
INSERT INTO `fp_user` VALUES ('103', 'org', '2011000085', '888888', '', '2011-03-14 17:09:28', null, null, null, null, null, null, null, null, null, null, null, '141', '水产集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'scjt');
INSERT INTO `fp_user` VALUES ('104', 'org', '2011000086', '888888', '', '2011-03-14 17:09:56', null, null, null, null, null, null, null, null, null, null, null, '142', '国际集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gjjt');
INSERT INTO `fp_user` VALUES ('105', 'org', '2011000087', '888888', '', '2011-03-14 17:10:23', null, null, null, null, null, null, null, null, null, null, null, '143', '广重企业集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzqyjt');
INSERT INTO `fp_user` VALUES ('106', 'org', '2011000088', '888888', '', '2011-03-14 17:10:48', null, null, null, null, null, null, null, null, null, null, null, '144', '珠啤集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'zpjt');
INSERT INTO `fp_user` VALUES ('107', 'org', '2011000089', '888888', '', '2011-03-14 17:11:26', null, null, null, null, null, null, null, null, null, null, null, '145', '广州日报', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzrb');
INSERT INTO `fp_user` VALUES ('108', 'org', '2011000090', '888888', '', '2011-03-14 17:11:55', null, null, null, null, null, null, null, null, null, null, null, '146', '广州电视台', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzdst');
INSERT INTO `fp_user` VALUES ('109', 'org', '2011000091', '888888', '', '2011-03-14 17:12:18', null, null, null, null, null, null, null, null, null, null, null, '147', '市农村商业银行', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sncsyyx');
INSERT INTO `fp_user` VALUES ('110', 'org', '2011000092', '888888', '', '2011-03-14 17:12:39', null, null, null, null, null, null, null, null, null, null, null, '148', '越秀企业集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'yxqyjt');
INSERT INTO `fp_user` VALUES ('111', 'org', '2011000093', '888888', '', '2011-03-14 17:13:04', null, null, null, null, null, null, null, null, null, null, null, '149', '广州银行', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzyx');
INSERT INTO `fp_user` VALUES ('112', 'org', '2011000094', '888888', '', '2011-03-14 17:13:27', null, null, null, null, null, null, null, null, null, null, null, '150', '市风行集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfxjt');
INSERT INTO `fp_user` VALUES ('113', 'org', '2011000095', '888888', '', '2011-03-14 17:13:52', null, null, null, null, null, null, null, null, null, null, null, '151', '广州港集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzgjt');
INSERT INTO `fp_user` VALUES ('114', 'org', '2011000096', '888888', '', '2011-03-14 17:14:29', null, null, null, null, null, null, null, null, null, null, null, '154', '市城投集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sctjt');
INSERT INTO `fp_user` VALUES ('115', 'org', '2011000097', '888888', '', '2011-03-14 17:14:52', null, null, null, null, null, null, null, null, null, null, null, '155', '友谊商店集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'yysdjt');
INSERT INTO `fp_user` VALUES ('116', 'org', '2011000098', '888888', '', '2011-03-14 17:20:19', null, null, null, null, null, null, null, null, null, null, null, '156', '市国资委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgzw');
INSERT INTO `fp_user` VALUES ('117', 'org', '2011000099', '888888', '', '2011-03-14 17:20:55', null, null, null, null, null, null, null, null, null, null, null, '157', '市司法局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'ssfj');
INSERT INTO `fp_user` VALUES ('118', 'org', '2011000100', '888888', '', '2011-03-14 17:21:41', null, null, null, null, null, null, null, null, null, null, null, '158', '市教育局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjyj');
INSERT INTO `fp_user` VALUES ('119', 'org', '2011000101', '888888', '', '2011-03-14 17:22:05', null, null, null, null, null, null, null, null, null, null, null, '159', '市安监局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sajj');
INSERT INTO `fp_user` VALUES ('120', 'org', '2011000102', '888888', '', '2011-03-14 17:22:27', null, null, null, null, null, null, null, null, null, null, null, '160', '市科技信息局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'skjxxj');
INSERT INTO `fp_user` VALUES ('121', 'org', '2011000103', '888888', '', '2011-03-14 17:22:54', null, null, null, null, null, null, null, null, null, null, null, '161', '市规划局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sghj');
INSERT INTO `fp_user` VALUES ('122', 'org', '2011000104', '888888', '', '2011-03-14 17:23:24', null, null, null, null, null, null, null, null, null, null, null, '162', '市妇联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfl');
INSERT INTO `fp_user` VALUES ('123', 'org', '2011000105', '888888', '', '2011-03-14 17:24:01', null, null, null, null, null, null, null, null, null, null, null, '163', '市公安局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgaj');
INSERT INTO `fp_user` VALUES ('124', 'org', '2011000106', '888888', '', '2011-03-14 17:24:34', null, null, null, null, null, null, null, null, null, null, null, '164', '市交委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjw');
INSERT INTO `fp_user` VALUES ('125', 'org', '2011000107', '888888', '', '2011-03-14 17:24:57', null, null, null, null, null, null, null, null, null, null, null, '165', '市农机总公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 'snjzgs');
INSERT INTO `fp_user` VALUES ('126', 'org', '2011000108', '888888', '', '2011-03-14 17:25:20', null, null, null, null, null, null, null, null, null, null, null, '166', '市民防办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'smfb');
INSERT INTO `fp_user` VALUES ('127', 'org', '2011000109', '888888', '', '2011-03-14 17:25:50', null, null, null, null, null, null, null, null, null, null, null, '167', '市外经贸局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swjmj');
INSERT INTO `fp_user` VALUES ('128', 'org', '2011000110', '888888', '', '2011-03-15 09:34:45', null, null, null, null, null, null, null, null, null, null, null, '168', '市港务局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgwj');
INSERT INTO `fp_user` VALUES ('129', 'org', '2011000111', '888888', '', '2011-03-15 09:35:09', null, null, null, null, null, null, null, null, null, null, null, '169', '市仲裁委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szcw');
INSERT INTO `fp_user` VALUES ('130', 'org', '2011000112', '888888', '', '2011-03-15 09:35:31', null, null, null, null, null, null, null, null, null, null, null, '170', '市文联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swl');
INSERT INTO `fp_user` VALUES ('131', 'org', '2011000113', '888888', '', '2011-03-15 09:36:08', null, null, null, null, null, null, null, null, null, null, null, '171', '市社科联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sskl');
INSERT INTO `fp_user` VALUES ('132', 'org', '2011000114', '888888', '', '2011-03-15 09:36:29', null, null, null, null, null, null, null, null, null, null, null, '172', '市政府政务办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szfzwb');
INSERT INTO `fp_user` VALUES ('133', 'org', '2011000115', '888888', '', '2011-03-15 09:36:46', null, null, null, null, null, null, null, null, null, null, null, '173', '市保密局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sbmj');
INSERT INTO `fp_user` VALUES ('134', 'org', '2011000116', '888888', '', '2011-03-15 09:37:07', null, null, null, null, null, null, null, null, null, null, null, '174', '市委政法委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swzfw');
INSERT INTO `fp_user` VALUES ('135', 'org', '2011000117', '888888', '', '2011-03-15 09:37:29', null, null, null, null, null, null, null, null, null, null, null, '175', '市信访局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxfj');
INSERT INTO `fp_user` VALUES ('136', 'org', '2011000118', '888888', '', '2011-03-15 09:37:50', null, null, null, null, null, null, null, null, null, null, null, '176', '市府办公厅', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfbgt');
INSERT INTO `fp_user` VALUES ('137', 'org', '2011000119', '888888', '', '2011-03-15 09:38:20', null, null, null, null, null, null, null, null, null, null, null, '177', '市人大办公厅', null, null, null, null, null, null, null, null, null, null, null, null, null, 'srdbgt');
INSERT INTO `fp_user` VALUES ('138', 'org', '2011000120', '888888', '', '2011-03-15 09:38:44', null, null, null, null, null, null, null, null, null, null, null, '178', '市政协办公厅', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szxbgt');
INSERT INTO `fp_user` VALUES ('139', 'org', '2011000121', '888888', '', '2011-03-15 09:39:08', null, null, null, null, null, null, null, null, null, null, null, '179', '市科协', null, null, null, null, null, null, null, null, null, null, null, null, null, 'skx');
INSERT INTO `fp_user` VALUES ('140', 'org', '2011000122', '888888', '', '2011-03-15 09:39:28', null, null, null, null, null, null, null, null, null, null, null, '180', '市侨联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sql');
INSERT INTO `fp_user` VALUES ('142', 'org', '2011000133', '888888', '', '2011-03-15 09:41:04', null, null, null, null, null, null, null, null, null, null, null, '191', '市“三旧”改造工作办公室', null, null, null, null, null, null, null, null, null, null, null, null, null, 's“sj”gzgzbgs');
INSERT INTO `fp_user` VALUES ('143', 'org', '2011000134', '888888', '', '2011-03-15 09:41:35', null, null, null, null, null, null, null, null, null, null, null, '192', '越秀区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'yxq');
INSERT INTO `fp_user` VALUES ('144', 'org', '2011000135', '888888', '', '2011-03-15 09:41:52', null, null, null, null, null, null, null, null, null, null, null, '193', '市广播电视大学', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgbdsdx');
INSERT INTO `fp_user` VALUES ('145', 'org', '2011000136', '888888', '', '2011-03-15 09:42:09', null, null, null, null, null, null, null, null, null, null, null, '194', '市地方志办公室', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sdfzbgs');
INSERT INTO `fp_user` VALUES ('146', 'org', '2011000137', '888888', '', '2011-03-15 09:42:28', null, null, null, null, null, null, null, null, null, null, null, '195', '市社会主义学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sshzyxy');
INSERT INTO `fp_user` VALUES ('147', 'org', '2011000138', '888888', '', '2011-03-15 09:42:46', null, null, null, null, null, null, null, null, null, null, null, '196', '团市委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'tsw');
INSERT INTO `fp_user` VALUES ('148', 'org', '2011000139', '888888', '', '2011-03-15 09:43:06', null, null, null, null, null, null, null, null, null, null, null, '197', '市委办公厅', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swbgt');
INSERT INTO `fp_user` VALUES ('150', 'org', '2011000151', '888888', '', '2011-03-15 09:44:19', null, null, null, null, null, null, null, null, null, null, null, '209', '市水务投资集团公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sswtzjtgs');
INSERT INTO `fp_user` VALUES ('151', 'org', '2011000152', '888888', '', '2011-03-15 09:44:46', null, null, null, null, null, null, null, null, null, null, null, '210', '市畜牧总公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sxmzgs');
INSERT INTO `fp_user` VALUES ('152', 'org', '2011000153', '888888', '', '2011-03-15 09:45:04', null, null, null, null, null, null, null, null, null, null, null, '211', '市水务局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sswj');
INSERT INTO `fp_user` VALUES ('153', 'org', '2011000154', '888888', '', '2011-03-15 09:45:31', null, null, null, null, null, null, null, null, null, null, null, '212', '市国土房管局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgtfgj');
INSERT INTO `fp_user` VALUES ('154', 'org', '2011000155', '888888', '', '2011-03-15 09:45:50', null, null, null, null, null, null, null, null, null, null, null, '213', '市旅游局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'slyj');
INSERT INTO `fp_user` VALUES ('155', 'org', '2011000156', '888888', '', '2011-03-15 09:46:11', null, null, null, null, null, null, null, null, null, null, null, '214', '市民族宗教局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'smzzjj');
INSERT INTO `fp_user` VALUES ('156', 'org', '2011000157', '888888', '', '2011-03-15 09:46:29', null, null, null, null, null, null, null, null, null, null, null, '215', '市计生局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjsj');
INSERT INTO `fp_user` VALUES ('157', 'org', '2011000158', '888888', '', '2011-03-15 09:51:38', null, null, null, null, null, null, null, null, null, null, null, '216', '市统计局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'stjj');
INSERT INTO `fp_user` VALUES ('158', 'org', '2011000159', '888888', '', '2011-03-15 09:52:51', null, null, null, null, null, null, null, null, null, null, null, '217', '市重点办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szdb');
INSERT INTO `fp_user` VALUES ('159', 'org', '2011000160', '888888', '', '2011-03-15 09:53:29', null, null, null, null, null, null, null, null, null, null, null, '218', '市物价局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swjj');
INSERT INTO `fp_user` VALUES ('160', 'org', '2011000161', '888888', '', '2011-03-15 09:53:51', null, null, null, null, null, null, null, null, null, null, null, '219', '市残联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'scl');
INSERT INTO `fp_user` VALUES ('161', 'org', '2011000162', '888888', '', '2011-03-15 09:54:16', null, null, null, null, null, null, null, null, null, null, null, '220', '市委政研室', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swzys');
INSERT INTO `fp_user` VALUES ('162', 'org', '2011000163', '888888', '', '2011-03-15 09:54:43', null, null, null, null, null, null, null, null, null, null, null, '221', '市审计局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'ssjj');
INSERT INTO `fp_user` VALUES ('163', 'org', '2011000164', '888888', '', '2011-03-15 09:55:18', null, null, null, null, null, null, null, null, null, null, null, '222', '市质监局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szjj');
INSERT INTO `fp_user` VALUES ('164', 'org', '2011000165', '888888', '', '2011-03-15 09:56:01', null, null, null, null, null, null, null, null, null, null, null, '223', '市社科院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'ssky');
INSERT INTO `fp_user` VALUES ('165', 'org', '2011000166', '888888', '', '2011-03-15 09:56:35', null, null, null, null, null, null, null, null, null, null, null, '224', '市府研究室', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfyjs');
INSERT INTO `fp_user` VALUES ('166', 'org', '2011000167', '888888', '', '2011-03-15 09:57:42', null, null, null, null, null, null, null, null, null, null, null, '225', '市法制办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfzb');
INSERT INTO `fp_user` VALUES ('167', 'org', '2011000168', '888888', '', '2011-03-15 09:58:19', null, null, null, null, null, null, null, null, null, null, null, '226', '市委统战部', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swtzb');
INSERT INTO `fp_user` VALUES ('168', 'org', '2011000169', '888888', '', '2011-03-15 09:58:39', null, null, null, null, null, null, null, null, null, null, null, '227', '市台办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'stb');
INSERT INTO `fp_user` VALUES ('169', 'org', '2011000170', '888888', '', '2011-03-15 09:59:03', null, null, null, null, null, null, null, null, null, null, null, '228', '市文广新局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swgxj');
INSERT INTO `fp_user` VALUES ('171', 'org', '2011000182', '888888', '', '2011-03-15 10:00:13', null, null, null, null, null, null, null, null, null, null, null, '240', '广百集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gbjt');
INSERT INTO `fp_user` VALUES ('172', 'org', '2011000183', '888888', '', '2011-03-15 10:00:37', null, null, null, null, null, null, null, null, null, null, null, '241', '市电气装备集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sdqzbjt');
INSERT INTO `fp_user` VALUES ('173', 'org', '2011000184', '888888', '', '2011-03-15 10:00:58', null, null, null, null, null, null, null, null, null, null, null, '242', '市轻工工贸集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sqggmjt');
INSERT INTO `fp_user` VALUES ('174', 'org', '2011000185', '888888', '', '2011-03-15 10:01:19', null, null, null, null, null, null, null, null, null, null, null, '243', '市国际控股集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgjkgjt');
INSERT INTO `fp_user` VALUES ('175', 'org', '2011000186', '888888', '', '2011-03-15 10:02:51', null, null, null, null, null, null, null, null, null, null, null, '244', '市地铁总公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sdtzgs');
INSERT INTO `fp_user` VALUES ('176', 'org', '2011000187', '888888', '', '2011-03-15 10:03:12', null, null, null, null, null, null, null, null, null, null, null, '245', '市无线电集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swxdjt');
INSERT INTO `fp_user` VALUES ('177', 'org', '2011000188', '888888', '', '2011-03-15 10:03:33', null, null, null, null, null, null, null, null, null, null, null, '246', '市发展集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sfzjt');
INSERT INTO `fp_user` VALUES ('178', 'org', '2011000189', '888888', '', '2011-03-15 10:03:54', null, null, null, null, null, null, null, null, null, null, null, '247', '广州出版社', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzcbs');
INSERT INTO `fp_user` VALUES ('179', 'org', '2011000190', '888888', '', '2011-03-15 10:04:14', null, null, null, null, null, null, null, null, null, null, null, '248', '市检察院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjcy');
INSERT INTO `fp_user` VALUES ('180', 'org', '2011000191', '888888', '', '2011-03-15 10:04:39', null, null, null, null, null, null, null, null, null, null, null, '249', '市中级人民法院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szjrmfy');
INSERT INTO `fp_user` VALUES ('181', 'org', '2011000193', '888888', '', '2011-03-15 10:05:02', null, null, null, null, null, null, null, null, null, null, null, '251', '市农业局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'snyj');
INSERT INTO `fp_user` VALUES ('182', 'org', '2011000194', '888888', '', '2011-03-15 10:05:24', null, null, null, null, null, null, null, null, null, null, null, '252', '市环保局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'shbj');
INSERT INTO `fp_user` VALUES ('183', 'org', '2011000195', '888888', '', '2011-03-15 10:06:05', null, null, null, null, null, null, null, null, null, null, null, '253', '市委组织部', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swzzb');
INSERT INTO `fp_user` VALUES ('184', 'org', '2011000192', '888888', '', '2011-03-15 10:07:09', null, null, null, null, null, null, null, null, null, null, null, '250', '市城乡建委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'scxjw');
INSERT INTO `fp_user` VALUES ('185', 'org', '2011000196', '888888', '', '2011-03-15 10:07:34', null, null, null, null, null, null, null, null, null, null, null, '254', '市委宣传部', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swxcb');
INSERT INTO `fp_user` VALUES ('186', 'org', '2011000197', '888888', '', '2011-03-15 10:07:55', null, null, null, null, null, null, null, null, null, null, null, '255', '市工商联', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sgsl');
INSERT INTO `fp_user` VALUES ('187', 'org', '2011000198', '888888', '', '2011-03-15 10:08:22', null, null, null, null, null, null, null, null, null, null, null, null, '市总工会', null, null, null, null, null, null, null, null, null, null, null, null, null, 'szgh');
INSERT INTO `fp_user` VALUES ('188', 'org', '2011000199', '888888', '', '2011-03-15 10:08:44', null, null, null, null, null, null, null, null, null, null, null, '257', '市食品药品监管局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sspypjgj');
INSERT INTO `fp_user` VALUES ('189', 'org', '2011000200', '888888', '', '2011-03-15 10:09:30', null, null, null, null, null, null, null, null, null, null, null, '258', '市卫生局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swsj');
INSERT INTO `fp_user` VALUES ('190', 'org', '2011000201', '888888', '', '2011-03-15 10:09:56', null, null, null, null, null, null, null, null, null, null, null, '259', '广日集团', null, null, null, null, null, null, null, null, null, null, null, null, null, 'grjt');
INSERT INTO `fp_user` VALUES ('191', 'org', '2011000202', '888888', '', '2011-03-15 10:10:27', null, null, null, null, null, null, null, null, null, null, null, '260', '市纪委', null, null, null, null, null, null, null, null, null, null, null, null, null, 'sjw');
INSERT INTO `fp_user` VALUES ('192', 'org', '2011000203', '888888', '', '2011-03-15 10:10:47', null, null, null, null, null, null, null, null, null, null, null, '261', '市外事办', null, null, null, null, null, null, null, null, null, null, null, null, null, 'swsb');
INSERT INTO `fp_user` VALUES ('193', 'org', '2011000204', '888888', '', '2011-03-15 10:11:09', null, null, null, null, null, null, null, null, null, null, null, '264', '市林业园林局', null, null, null, null, null, null, null, null, null, null, null, null, null, 'slyylj');
INSERT INTO `fp_user` VALUES ('194', 'org', '2011000205', '888888', '', '2011-03-15 10:11:33', null, null, null, null, null, null, null, null, null, null, null, '265', '广州医学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'gzyxy');
INSERT INTO `fp_user` VALUES ('195', 'org', '2011000206', '888888', '', '2011-03-15 10:11:55', null, null, null, null, null, null, null, null, null, null, null, '266', '市体育技术学院', null, null, null, null, null, null, null, null, null, null, null, null, null, 'styjsxy');
INSERT INTO `fp_user` VALUES ('196', 'areaworkorg', 'hzq_admin', '888888', '', '2011-03-15 16:22:50', null, null, null, null, null, null, null, '127', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('197', 'areaworkorg', 'hpq_admin', '888888', '', '2011-03-15 16:23:08', null, null, null, null, null, null, null, '128', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('198', 'areaworkorg', 'thq_admin', '888888', '', '2011-03-15 16:23:36', null, null, null, null, null, null, null, '129', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('199', 'areaworkorg', 'lwq_admin', '888888', '', '2011-03-15 16:23:57', null, null, null, null, null, null, null, '130', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('200', 'areaworkorg', 'yxq_admin', '888888', '', '2011-03-15 16:24:15', null, null, null, null, null, null, null, '131', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('201', 'areaworkorg', 'pyq_admin', '888888', '', '2011-03-15 16:24:40', null, null, null, null, null, null, null, '132', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('202', 'areaworkorg', 'lgq_admin', '888888', '', '2011-03-15 16:27:10', null, null, null, null, null, null, null, '262', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `fp_user` VALUES ('204', 'org', '2011000020', '888888', '', '2011-03-15 16:29:33', null, null, null, null, null, null, null, null, null, null, null, null, '荔湾区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'lwq');
INSERT INTO `fp_user` VALUES ('205', 'org', '2011000001', '888888', '', '2011-03-15 16:30:26', null, null, null, null, null, null, null, null, null, null, null, null, '海珠区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'hzq');
INSERT INTO `fp_user` VALUES ('206', 'org', '2011000040', '888888', '', '2011-03-15 16:31:00', null, null, null, null, null, null, null, null, null, null, null, null, '黄埔区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'hpq');
INSERT INTO `fp_user` VALUES ('207', 'org', '2011000070', '888888', '', '2011-03-15 16:31:56', null, null, null, null, null, null, null, null, null, null, null, null, '萝岗区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'lgq');
INSERT INTO `fp_user` VALUES ('208', 'org', '2011000130', '888888', '', '2011-03-15 16:32:52', null, null, null, null, null, null, null, null, null, null, null, null, '越秀区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'yxq');
INSERT INTO `fp_user` VALUES ('209', 'org', '2011000140', '888888', '', '2011-03-15 16:33:30', null, null, null, null, null, null, null, null, null, null, null, null, '天河区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'thq');
INSERT INTO `fp_user` VALUES ('210', 'org', '2011000180', '888888', '', '2011-03-15 16:34:25', null, null, null, null, null, null, null, null, null, null, null, null, '番禺区', null, null, null, null, null, null, null, null, null, null, null, null, null, 'f禺q');
