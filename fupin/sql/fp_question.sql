-- ----------------------------
-- Table structure for `fp_question1`
-- ----------------------------
DROP TABLE IF EXISTS `fp_question1`;
CREATE TABLE `fp_question1` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `cun_id` bigint(20) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `item1` double DEFAULT NULL,
  `item2` double DEFAULT NULL,
  `item3` double DEFAULT NULL,
  `item4` double DEFAULT NULL,
  `item5` double DEFAULT NULL,
  `item6` double DEFAULT NULL,
  `item7` double DEFAULT NULL,
  `item8` double DEFAULT NULL,
  `item9` double DEFAULT NULL,
  `item10` double DEFAULT NULL,
  `item11` double DEFAULT NULL,
  `item12` double DEFAULT NULL,
  `item13` double DEFAULT NULL,
  `item14` double DEFAULT NULL,
  `item15` double DEFAULT NULL,
  `item16` double DEFAULT NULL,
  `item17` double DEFAULT NULL,
  `item18` double DEFAULT NULL,
  `item19` double DEFAULT NULL,
  `item20` double DEFAULT NULL,
  `item21` double DEFAULT NULL,
  `item22` double DEFAULT NULL,
  `item23` double DEFAULT NULL,
  `item24` double DEFAULT NULL,
  `item25` double DEFAULT NULL,
  `item26` double DEFAULT NULL,
  `item27` double DEFAULT NULL,
  `item28` double DEFAULT NULL,
  `item29` double DEFAULT NULL,
  `item30` double DEFAULT NULL,
  `item31` double DEFAULT NULL,
  `item32` double DEFAULT NULL,
  `item33` double DEFAULT NULL,
  `item34` double DEFAULT NULL,
  `item35` double DEFAULT NULL,
  `item36` double DEFAULT NULL,
  `item37` double DEFAULT NULL,
  `item38` double DEFAULT NULL,
  `item39` double DEFAULT NULL,
  `item40` double DEFAULT NULL,
  `item41` double DEFAULT NULL,
  `item42` double DEFAULT NULL,
  `item43` double DEFAULT NULL,
  `item44` double DEFAULT NULL,
  `item45` double DEFAULT NULL,
  `item46` double DEFAULT NULL,
  `item47` double DEFAULT NULL,
  `item48` double DEFAULT NULL,
  `item49` double DEFAULT NULL,
  `item50` double DEFAULT NULL,
  `item51` double DEFAULT NULL,
  `item52` double DEFAULT NULL,
  `item53` double DEFAULT NULL,
  `item54` double DEFAULT NULL,
  `item55` double DEFAULT NULL,
  `item56` double DEFAULT NULL,
  `item57` double DEFAULT NULL,
  `item58` double DEFAULT NULL,
  `item59` double DEFAULT NULL,
  `item60` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK71DC53D65396EBE8` (`org_id`),
  KEY `FK71DC53D63F4A0CE8` (`cun_id`),
  CONSTRAINT `FK71DC53D63F4A0CE8` FOREIGN KEY (`cun_id`) REFERENCES `fp_diqu` (`id`),
  CONSTRAINT `FK71DC53D65396EBE8` FOREIGN KEY (`org_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_question1
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_question1_ext`
-- ----------------------------
DROP TABLE IF EXISTS `fp_question1_ext`;
CREATE TABLE `fp_question1_ext` (
  `qid` bigint(20) NOT NULL,
  `item61` double DEFAULT NULL,
  `item62` double DEFAULT NULL,
  `item63` double DEFAULT NULL,
  `item64` double DEFAULT NULL,
  `item65` double DEFAULT NULL,
  `item66` double DEFAULT NULL,
  `item67` double DEFAULT NULL,
  `item68` double DEFAULT NULL,
  `item69` double DEFAULT NULL,
  `item70` double DEFAULT NULL,
  `item71` double DEFAULT NULL,
  `item72` double DEFAULT NULL,
  `item73` double DEFAULT NULL,
  `item74` double DEFAULT NULL,
  `item75` double DEFAULT NULL,
  `item76` double DEFAULT NULL,
  `item77` double DEFAULT NULL,
  `item78` double DEFAULT NULL,
  `item79` double DEFAULT NULL,
  `item80` double DEFAULT NULL,
  `item81` double DEFAULT NULL,
  `item82` double DEFAULT NULL,
  `item83` double DEFAULT NULL,
  `item84` double DEFAULT NULL,
  `item85` double DEFAULT NULL,
  `item86` double DEFAULT NULL,
  `item87` double DEFAULT NULL,
  `item88` double DEFAULT NULL,
  `item89` double DEFAULT NULL,
  `item90` double DEFAULT NULL,
  `item91` double DEFAULT NULL,
  `item92` double DEFAULT NULL,
  `item93` double DEFAULT NULL,
  `item94` double DEFAULT NULL,
  `item95` double DEFAULT NULL,
  `item96` double DEFAULT NULL,
  `item97` double DEFAULT NULL,
  `item98` double DEFAULT NULL,
  `item99` double DEFAULT NULL,
  `item100` double DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `FKC16F32389D38D085` (`qid`),
  CONSTRAINT `FKC16F32389D38D085` FOREIGN KEY (`qid`) REFERENCES `fp_question1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_question1_ext
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_question2`
-- ----------------------------
DROP TABLE IF EXISTS `fp_question2`;
CREATE TABLE `fp_question2` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `segment1` varchar(255) DEFAULT NULL,
  `segment2` varchar(255) DEFAULT NULL,
  `segment3` varchar(255) DEFAULT NULL,
  `segment4` varchar(255) DEFAULT NULL,
  `segment5` varchar(255) DEFAULT NULL,
  `item1` double DEFAULT NULL,
  `item2` double DEFAULT NULL,
  `item3` double DEFAULT NULL,
  `item4` double DEFAULT NULL,
  `item5` double DEFAULT NULL,
  `item6` double DEFAULT NULL,
  `item7` double DEFAULT NULL,
  `item8` double DEFAULT NULL,
  `item9` double DEFAULT NULL,
  `item10` double DEFAULT NULL,
  `item11` double DEFAULT NULL,
  `item12` double DEFAULT NULL,
  `item13` double DEFAULT NULL,
  `item14` double DEFAULT NULL,
  `item15` double DEFAULT NULL,
  `item16` double DEFAULT NULL,
  `item17` double DEFAULT NULL,
  `item18` double DEFAULT NULL,
  `item19` double DEFAULT NULL,
  `item20` double DEFAULT NULL,
  `item21` double DEFAULT NULL,
  `item22` double DEFAULT NULL,
  `item23` double DEFAULT NULL,
  `item24` double DEFAULT NULL,
  `item25` double DEFAULT NULL,
  `item26` double DEFAULT NULL,
  `item27` double DEFAULT NULL,
  `item28` double DEFAULT NULL,
  `item29` double DEFAULT NULL,
  `item30` double DEFAULT NULL,
  `item31` double DEFAULT NULL,
  `item32` double DEFAULT NULL,
  `item33` double DEFAULT NULL,
  `item34` double DEFAULT NULL,
  `item35` double DEFAULT NULL,
  `item36` double DEFAULT NULL,
  `item37` double DEFAULT NULL,
  `item38` double DEFAULT NULL,
  `item39` double DEFAULT NULL,
  `item40` double DEFAULT NULL,
  `item41` double DEFAULT NULL,
  `item42` double DEFAULT NULL,
  `item43` double DEFAULT NULL,
  `item44` double DEFAULT NULL,
  `item45` double DEFAULT NULL,
  `item46` double DEFAULT NULL,
  `item47` double DEFAULT NULL,
  `item48` double DEFAULT NULL,
  `item49` double DEFAULT NULL,
  `item50` double DEFAULT NULL,
  `item51` double DEFAULT NULL,
  `item52` double DEFAULT NULL,
  `item53` double DEFAULT NULL,
  `item54` double DEFAULT NULL,
  `item55` double DEFAULT NULL,
  `item56` double DEFAULT NULL,
  `item57` double DEFAULT NULL,
  `item58` double DEFAULT NULL,
  `item59` double DEFAULT NULL,
  `item60` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK71DC53D75396EBE8` (`org_id`),
  CONSTRAINT `FK71DC53D75396EBE8` FOREIGN KEY (`org_id`) REFERENCES `fp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_question2
-- ----------------------------
