/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : jeebbs_3

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2012-08-23 21:51:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `file_path` varchar(100) DEFAULT NULL COMMENT '路径',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_size` int(11) DEFAULT NULL COMMENT '大小',
  `is_pictrue` tinyint(1) DEFAULT '0' COMMENT '是否是图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`attachment_id`),
  KEY `FK_attachment_post` (`post_id`),
  CONSTRAINT `FK_attachment_post` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_category`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category`;
CREATE TABLE `bbs_category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(11) NOT NULL,
  `PATH` varchar(20) NOT NULL COMMENT '访问路径',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `PRIORITY` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `FORUM_COLS` int(11) NOT NULL DEFAULT '1' COMMENT '板块列数',
  `moderators` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK_BBS_CTG_SITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_CTG_SITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='论坛分区';

-- ----------------------------
-- Records of bbs_category
-- ----------------------------
INSERT INTO `bbs_category` VALUES ('1', '1', 'service', '扶贫综合讨论区', '0', '1', '');
INSERT INTO `bbs_category` VALUES ('2', '1', 'use', '206集中讨论区', '0', '1', '');
INSERT INTO `bbs_category` VALUES ('3', '1', 'zcfp', '增城扶贫', '0', '1', '');
INSERT INTO `bbs_category` VALUES ('4', '1', 'chfp', '从化扶贫', '0', '1', '');

-- ----------------------------
-- Table structure for `bbs_category_user`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category_user`;
CREATE TABLE `bbs_category_user` (
  `CATEGORY_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`user_id`),
  KEY `FK_BBS_CATEGORY_TO_USER` (`user_id`),
  CONSTRAINT `FK_BBS_CATEGORY_TO_USER` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_USER_TO_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `bbs_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分区版主';

-- ----------------------------
-- Records of bbs_category_user
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_common_magic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_common_magic`;
CREATE TABLE `bbs_common_magic` (
  `magicid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '道具id',
  `available` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `identifier` varchar(40) NOT NULL COMMENT '唯一标识',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  `credit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用的积分',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `salevolume` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  `supplytype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动补货类型',
  `supplynum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '自动补货数量',
  `useperoid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用周期',
  `usenum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '周期使用数量',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '重量',
  `useevent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:只在特定环境使用 1:可以在道具中心使用',
  PRIMARY KEY (`magicid`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `displayorder` (`available`,`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='道具数据表';

-- ----------------------------
-- Records of bbs_common_magic
-- ----------------------------
INSERT INTO `bbs_common_magic` VALUES ('1', '1', '喧嚣卡', 'open', '可以将主题开启，可以回复', '0', '1', '10', '0', '0', '2', '0', '2', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('2', '1', '悔悟卡', 'repent', '可以删除自己的帖子', '0', '2', '10', '2', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('3', '1', '照妖镜', 'namepost', '可以查看一次匿名用户的真实身份。', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('4', '1', '金钱卡', 'money', '可以随机获得一些金币', '0', '2', '10', '44', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('5', '1', '千斤顶', 'jack', '可以将主题顶起一段时间，重复使用可延长帖子被顶起的时间', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('6', '1', '窥视卡', 'showip', '可以查看指定用户的 IP', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('7', '1', '抢沙发', 'sofa', '可以抢夺指定主题的沙发', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('8', '1', '置顶卡', 'stick', '可以将主题置顶', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('9', '1', '变色卡', 'highlight', '可以将帖子或日志的标题高亮，变更颜色', '0', '1', '10', '2', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('10', '1', '雷达卡', 'checkonline', '查看某个用户是否在线', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('11', '1', '沉默卡', 'close', '可以将主题关闭，禁止回复', '0', '1', '10', '2', '100', '1', '0', '1', '2', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('12', '1', '提升卡', 'bump', '可以提升某个主题', '0', '1', '10', '0', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('13', '1', '匿名卡', 'anonymouspost', '在指定的地方，让自己的名字显示为匿名。', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');

-- ----------------------------
-- Table structure for `bbs_config`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config` (
  `CONFIG_ID` bigint(20) NOT NULL,
  `DEF_AVATAR` varchar(100) NOT NULL DEFAULT '' COMMENT '默认会员头像',
  `AVATAR_WIDTH` int(11) NOT NULL DEFAULT '160' COMMENT '头像最大宽度',
  `AVATAR_HEIGHT` int(11) NOT NULL DEFAULT '160' COMMENT '头像最大高度',
  `TOPIC_COUNT_PER_PAGE` int(11) NOT NULL DEFAULT '20' COMMENT '每页主题数',
  `POST_COUNT_PER_PAGE` int(11) NOT NULL DEFAULT '10' COMMENT '每页帖子数',
  `KEYWORDS` varchar(255) NOT NULL DEFAULT '' COMMENT '首页关键字',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '' COMMENT '首页描述',
  `REGISTER_STATUS` smallint(6) NOT NULL DEFAULT '1' COMMENT '注册状态（0：关闭，1：开放，2：邀请）',
  `REGISTER_GROUP_ID` int(11) NOT NULL DEFAULT '1' COMMENT '注册会员组',
  `REGISTER_RULE` longtext COMMENT '注册协议',
  `CACHE_POST_TODAY` int(11) NOT NULL DEFAULT '0' COMMENT '今日贴数',
  `CACHE_POST_YESTERDAY` int(11) NOT NULL DEFAULT '0' COMMENT '昨日帖数',
  `CACHE_POST_MAX` int(11) NOT NULL DEFAULT '0' COMMENT '最高帖数',
  `CACHE_POST_MAX_DATE` date NOT NULL COMMENT '最高帖数日',
  `CACHE_TOPIC_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总主题',
  `CACHE_POST_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总帖数',
  `CACHE_USER_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总会员',
  `last_user_id` int(11) DEFAULT NULL COMMENT '最新会员',
  `site_id` int(11) NOT NULL,
  `DEFAULT_GROUP_ID` bigint(20) NOT NULL DEFAULT '1' COMMENT '默认会员组',
  `TOPIC_HOT_COUNT` int(11) NOT NULL DEFAULT '10' COMMENT '热帖回复数量',
  `AUTO_REGISTER` tinyint(1) DEFAULT '1' COMMENT '是否自动注册',
  `EMAIL_VALIDATE` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  PRIMARY KEY (`CONFIG_ID`),
  KEY `FK_BBS_CONFIG_SITE` (`site_id`),
  CONSTRAINT `FK_BBS_CONFIG_SITE` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛配置';

-- ----------------------------
-- Records of bbs_config
-- ----------------------------
INSERT INTO `bbs_config` VALUES ('1', '1', '160', '160', '20', '10', '扶贫', '扶贫', '1', '1', '', '7', '0', '7', '2011-10-15', '7', '0', '1', '10', '1', '1', '10', '1', '0');

-- ----------------------------
-- Table structure for `bbs_credit_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_credit_exchange`;
CREATE TABLE `bbs_credit_exchange` (
  `eid` int(11) NOT NULL DEFAULT '0',
  `expoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率积分基数',
  `exprestige` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率威望基数',
  `pointoutavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分是否可以兑出',
  `pointinavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分是否允许兑入',
  `prestigeoutavailable` tinyint(3) NOT NULL DEFAULT '0' COMMENT '威望是否允许兑出',
  `prestigeinavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '威望是否允许兑入',
  `exchangetax` float(2,1) NOT NULL DEFAULT '0.0' COMMENT '兑换交易税',
  `mini_balance` int(11) NOT NULL DEFAULT '0' COMMENT '兑换最低余额',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分交易规则';

-- ----------------------------
-- Records of bbs_credit_exchange
-- ----------------------------
INSERT INTO `bbs_credit_exchange` VALUES ('1', '1', '10', '1', '1', '1', '1', '0.2', '0');

-- ----------------------------
-- Table structure for `bbs_credit_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_credit_rule`;
CREATE TABLE `bbs_credit_rule` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `rulename` varchar(20) NOT NULL DEFAULT '' COMMENT '规则名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '规则action唯一KEY',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励周期0:一次;1:每天;2:整点;3:间隔分钟;4:不限;',
  `cycletime` int(10) NOT NULL DEFAULT '0' COMMENT '间隔时间',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1' COMMENT '奖励次数',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '扩展1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '扩展2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '扩展3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '扩展4',
  `ext1name` varchar(20) DEFAULT NULL COMMENT '扩展1别名',
  `ext2name` varchar(20) DEFAULT NULL COMMENT '扩展2别名',
  `ext3name` varchar(20) DEFAULT NULL COMMENT '扩展3别名',
  `ext4name` varchar(20) DEFAULT NULL COMMENT '扩展4别名',
  `ext1avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext2avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext3avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext4avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext1exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext2exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext3exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext4exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext1exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext2exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext3exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext4exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `credittax` tinyint(2) DEFAULT NULL COMMENT '积分交易税',
  `minibalance` int(10) DEFAULT NULL COMMENT '兑换最低余额',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='积分规则表';

-- ----------------------------
-- Records of bbs_credit_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_forum`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum`;
CREATE TABLE `bbs_forum` (
  `FORUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(11) NOT NULL COMMENT '分区ID',
  `SITE_ID` int(11) NOT NULL COMMENT '站点ID',
  `POST_ID` int(11) DEFAULT NULL COMMENT '最后回帖',
  `replyer_id` int(11) DEFAULT NULL COMMENT '最后回帖会员',
  `PATH` varchar(20) NOT NULL COMMENT '访问路径',
  `TITLE` varchar(150) NOT NULL COMMENT '标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `KEYWORDS` varchar(255) DEFAULT NULL COMMENT 'meta-keywords',
  `FORUM_RULE` varchar(255) DEFAULT NULL COMMENT '版规',
  `PRIORITY` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `TOPIC_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '主题总数',
  `POST_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '帖子总数',
  `POST_TODAY` int(11) NOT NULL DEFAULT '0' COMMENT '今日新帖',
  `OUTER_URL` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `POINT_TOPIC` int(11) NOT NULL DEFAULT '0' COMMENT '发贴加分',
  `POINT_REPLY` int(11) NOT NULL DEFAULT '0' COMMENT '回帖加分',
  `POINT_PRIME` int(11) NOT NULL DEFAULT '0' COMMENT '精华加分',
  `LAST_TIME` datetime DEFAULT NULL COMMENT '最后发贴时间',
  `TOPIC_LOCK_LIMIT` int(11) NOT NULL DEFAULT '0' COMMENT '锁定主题（天）',
  `moderators` varchar(100) DEFAULT NULL COMMENT '版主',
  `group_views` varchar(100) DEFAULT NULL COMMENT '访问会员组',
  `group_topics` varchar(100) DEFAULT NULL COMMENT '发帖会员组',
  `group_replies` varchar(100) DEFAULT NULL COMMENT '回复会员组',
  `POINT_AVAILABLE` tinyint(1) DEFAULT NULL COMMENT '积分是否启用',
  `PRESTIGE_AVAILABLE` tinyint(1) DEFAULT NULL COMMENT '威望是否启用',
  `PRESTIGE_TOPIC` int(11) DEFAULT '0' COMMENT '发帖加威望',
  `PRESTIGE_REPLY` int(11) DEFAULT '0' COMMENT '回帖加威望',
  `PRESTIGE_PRIME1` int(11) DEFAULT '0' COMMENT '精华1加威望',
  `PRESTIGE_PRIME2` int(11) DEFAULT '0' COMMENT '精华2加威望',
  `PRESTIGE_PRIME3` int(11) DEFAULT '0' COMMENT '精华3加威望',
  `PRESTIGE_PRIME0` int(11) DEFAULT '0' COMMENT '解除精华扣除威望',
  PRIMARY KEY (`FORUM_ID`),
  KEY `FK_BBS_FORUM_CTG` (`CATEGORY_ID`),
  KEY `FK_BBS_FORUM_USER` (`replyer_id`),
  KEY `FK_BBS_FORUM_POST` (`POST_ID`),
  KEY `FK_BBS_FORUM_WEBSITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_FORUM_CTG` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `bbs_category` (`CATEGORY_ID`),
  CONSTRAINT `FK_BBS_FORUM_POST` FOREIGN KEY (`POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_FORUM_USER` FOREIGN KEY (`replyer_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_FORUM_WEBSITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='论坛板块';

-- ----------------------------
-- Records of bbs_forum
-- ----------------------------
INSERT INTO `bbs_forum` VALUES ('1', '1', '1', '2', '9', 'sqzx', '系统综合扶贫话题讨论', '提供JEECMS商业授权相关信息咨询', '集中，讨论', '如果您需要使用JEECMS进行商业建站等商业性活动，例如：政府单位、教育机构、协会团体、企业等，请您购买我们的商业授权。如有需要，欢迎与我们联系。 QQ：48955621         电话：0791-86538070、13576281815    E-mail:jeecms@126.com', '10', '1', '1', '0', '', '5', '0', '5', '2012-05-03 11:59:18', '0', 'test', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('2', '1', '1', '3', '10', 'bug', '扶贫系统问题反馈', '专门收集网友反馈的系统bug信息，及时提供bug解决方案。', 'jsp cms,站群,java,开源', '欢迎大家积极反馈JEECMS中存在的bug，请尽量清楚的描述您的问题以及您的环境信息,我们会核实后给大家提供bug解决方案，相信有大家的支持，JEECMS会越来越好~', '10', '1', '1', '0', '', '5', '0', '5', '2012-05-03 12:01:17', '0', 'test', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', '1', '1', '1', '0', '1', '2', '3', '0');

-- ----------------------------
-- Table structure for `bbs_forum_group_reply`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_reply`;
CREATE TABLE `bbs_forum_group_reply` (
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`GROUP_ID`),
  KEY `FK_BBS_FORUM_GROUP_REPLY` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_REPLY` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_REPLY` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回复权限';

-- ----------------------------
-- Records of bbs_forum_group_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_forum_group_topic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_topic`;
CREATE TABLE `bbs_forum_group_topic` (
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`GROUP_ID`),
  KEY `FK_BBS_FORUM_GROUP_TOPIC` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_TOPIC` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_TOPIC` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发贴权限';

-- ----------------------------
-- Records of bbs_forum_group_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_forum_group_view`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_view`;
CREATE TABLE `bbs_forum_group_view` (
  `GROUP_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`FORUM_ID`),
  KEY `FK_BBS_GROUP_FORUM_VIEW` (`FORUM_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_VIEW` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_VIEW` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览权限';

-- ----------------------------
-- Records of bbs_forum_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_forum_user`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_user`;
CREATE TABLE `bbs_forum_user` (
  `FORUM_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`user_id`),
  KEY `FK_BBS_FORUM_TO_USER` (`user_id`),
  CONSTRAINT `FK_BBS_FORUM_TO_USER` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_USER_TO_FORUM` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版块版主';

-- ----------------------------
-- Records of bbs_forum_user
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_grade`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_grade`;
CREATE TABLE `bbs_grade` (
  `GRADE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `GRADE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  KEY `FK_MEMBER_GRADE` (`user_id`),
  KEY `FK_POST_GRADE` (`POST_ID`),
  CONSTRAINT `FK_MEMBER_GRADE` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_POST_GRADE` FOREIGN KEY (`POST_ID`) REFERENCES `bbs_post` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_grade
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_group_type`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_group_type`;
CREATE TABLE `bbs_group_type` (
  `GROUP_ID` int(11) NOT NULL DEFAULT '0',
  `TYPE_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TYPE_ID`,`GROUP_ID`),
  KEY `FK_BBS_GROUP_TYPE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_TYPE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_TYPE_TYPE` FOREIGN KEY (`TYPE_ID`) REFERENCES `bbs_post_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组投票分类关联表';

-- ----------------------------
-- Records of bbs_group_type
-- ----------------------------
INSERT INTO `bbs_group_type` VALUES ('1', '2');
INSERT INTO `bbs_group_type` VALUES ('1', '3');
INSERT INTO `bbs_group_type` VALUES ('2', '2');
INSERT INTO `bbs_group_type` VALUES ('2', '3');
INSERT INTO `bbs_group_type` VALUES ('3', '2');
INSERT INTO `bbs_group_type` VALUES ('3', '3');
INSERT INTO `bbs_group_type` VALUES ('4', '2');
INSERT INTO `bbs_group_type` VALUES ('4', '3');
INSERT INTO `bbs_group_type` VALUES ('5', '2');
INSERT INTO `bbs_group_type` VALUES ('5', '3');
INSERT INTO `bbs_group_type` VALUES ('6', '2');
INSERT INTO `bbs_group_type` VALUES ('6', '3');
INSERT INTO `bbs_group_type` VALUES ('7', '2');
INSERT INTO `bbs_group_type` VALUES ('7', '3');
INSERT INTO `bbs_group_type` VALUES ('9', '2');
INSERT INTO `bbs_group_type` VALUES ('9', '3');
INSERT INTO `bbs_group_type` VALUES ('10', '2');
INSERT INTO `bbs_group_type` VALUES ('10', '3');
INSERT INTO `bbs_group_type` VALUES ('11', '2');
INSERT INTO `bbs_group_type` VALUES ('11', '3');
INSERT INTO `bbs_group_type` VALUES ('12', '2');
INSERT INTO `bbs_group_type` VALUES ('12', '3');
INSERT INTO `bbs_group_type` VALUES ('13', '2');
INSERT INTO `bbs_group_type` VALUES ('13', '3');
INSERT INTO `bbs_group_type` VALUES ('14', '2');
INSERT INTO `bbs_group_type` VALUES ('14', '3');

-- ----------------------------
-- Table structure for `bbs_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_login_log`;
CREATE TABLE `bbs_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '登录用户',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '退出时间',
  `ip` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_login_log_user` (`user_id`),
  CONSTRAINT `fk_bbs_login_log_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of bbs_login_log
-- ----------------------------
INSERT INTO `bbs_login_log` VALUES ('1', '9', '2012-04-14 11:16:03', '2012-04-14 11:21:12', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('2', '5', '2012-04-14 13:34:41', '2012-04-14 13:37:50', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('3', '5', '2012-04-14 14:02:55', '2012-04-14 14:02:55', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('4', '5', '2012-04-14 14:05:08', '2012-04-14 14:55:09', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('5', '5', '2012-04-14 14:59:49', '2012-04-14 14:59:50', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('6', '5', '2012-04-14 15:09:36', '2012-04-16 14:23:19', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('10', '5', '2012-04-16 14:46:07', '2012-04-16 14:46:09', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('11', '5', '2012-04-16 16:21:24', '2012-04-16 16:21:31', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('12', '5', '2012-04-16 16:52:11', '2012-04-16 18:05:51', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('14', '5', '2012-04-17 15:18:40', '2012-04-18 16:13:45', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('16', '5', '2012-04-19 09:46:23', '2012-04-19 10:09:18', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('18', '5', '2012-04-19 10:09:28', '2012-04-19 11:34:00', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('19', '5', '2012-04-19 13:36:14', '2012-04-19 17:55:43', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('21', '5', '2012-05-02 09:20:53', '2012-05-02 15:06:35', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('28', '5', '2012-05-03 10:55:56', '2012-08-23 00:56:50', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('29', '9', '2012-05-03 11:19:16', '2012-05-03 11:28:10', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('30', '9', '2012-05-03 11:58:56', '2012-05-03 12:00:01', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('31', '10', '2012-05-03 12:00:27', '2012-05-03 13:31:22', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('32', '5', '2012-08-23 11:10:41', '2012-08-23 16:58:47', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('33', '9', '2012-08-23 11:24:28', '2012-08-23 11:27:09', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('34', '9', '2012-08-23 14:55:27', '2012-08-23 15:01:27', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('35', '9', '2012-08-23 15:01:41', '2012-08-23 15:02:29', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('36', '9', '2012-08-23 15:02:40', '2012-08-23 15:12:41', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('37', '9', '2012-08-23 15:13:10', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('38', '9', '2012-08-23 15:19:43', '2012-08-23 15:19:45', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('39', '9', '2012-08-23 15:19:53', '2012-08-23 15:27:41', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('41', '29', '2012-08-23 16:22:18', '2012-08-23 16:22:19', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('42', '29', '2012-08-23 16:25:27', '2012-08-23 16:25:28', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('43', '29', '2012-08-23 16:25:54', '2012-08-23 16:55:57', '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('44', '29', '2012-08-23 16:59:10', '2012-08-23 16:59:29', '127.0.0.1');

-- ----------------------------
-- Table structure for `bbs_magic_config`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_config`;
CREATE TABLE `bbs_magic_config` (
  `id` int(11) NOT NULL DEFAULT '1' COMMENT '主键id',
  `magic_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启道具',
  `magic_discount` int(3) DEFAULT NULL COMMENT '道具回收折扣',
  `magic_sofa_lines` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '抢沙发台词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具配置表';

-- ----------------------------
-- Records of bbs_magic_config
-- ----------------------------
INSERT INTO `bbs_magic_config` VALUES ('1', '1', '80', 'O(∩_∩)O哈哈~，沙发是我的啦O(∩_∩)O');

-- ----------------------------
-- Table structure for `bbs_magic_log`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_log`;
CREATE TABLE `bbs_magic_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `magic_id` smallint(5) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `log_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `operator` tinyint(2) DEFAULT NULL COMMENT '操作(0出售道具1使用道具 2丢弃道具 3购买道具,4赠送)',
  `price` int(11) DEFAULT NULL COMMENT '购买价格',
  `num` int(11) DEFAULT NULL COMMENT '购买数量或者赠送数量',
  `targetuid` int(11) DEFAULT '0' COMMENT '赠送目标用户',
  PRIMARY KEY (`log_id`),
  KEY `fk_magic_log_magic` (`magic_id`),
  KEY `fk_magic_log_user` (`user_id`),
  CONSTRAINT `fk_magic_log_magic` FOREIGN KEY (`magic_id`) REFERENCES `bbs_common_magic` (`magicid`),
  CONSTRAINT `fk_magic_log_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具记录表';

-- ----------------------------
-- Records of bbs_magic_log
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_magic_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_usergroup`;
CREATE TABLE `bbs_magic_usergroup` (
  `magicid` smallint(6) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '有权限使用该道具的用户组id',
  PRIMARY KEY (`magicid`,`groupid`),
  KEY `fk_bbs_magic_usergroup_group` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具组权限';

-- ----------------------------
-- Records of bbs_magic_usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_magic_usergroup_to`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_usergroup_to`;
CREATE TABLE `bbs_magic_usergroup_to` (
  `magicid` smallint(6) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '允许被使用的用户组id',
  PRIMARY KEY (`magicid`,`groupid`),
  KEY `fk_bbs_magic_usergroup_group` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='允许被使用的用户组';

-- ----------------------------
-- Records of bbs_magic_usergroup_to
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_member_magic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_member_magic`;
CREATE TABLE `bbs_member_magic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `magicid` smallint(6) NOT NULL DEFAULT '0' COMMENT '道具id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '道具数量',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_member_magic_user` (`uid`),
  KEY `fk_bbs_member_magic_magic` (`magicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户道具表';

-- ----------------------------
-- Records of bbs_member_magic
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_operation`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_operation`;
CREATE TABLE `bbs_operation` (
  `OPERATOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(11) NOT NULL,
  `operater_id` int(11) NOT NULL COMMENT '操作会员',
  `REF_TYPE` char(4) NOT NULL COMMENT '引用类型',
  `REF_ID` int(11) NOT NULL DEFAULT '0' COMMENT '引用ID',
  `OPT_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPT_REASON` varchar(255) DEFAULT NULL COMMENT '操作原因',
  `OPT_TIME` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`OPERATOR_ID`),
  KEY `FK_BBS_OPEATTION` (`SITE_ID`),
  KEY `FK_BBS_OPERATION_USER` (`operater_id`),
  CONSTRAINT `FK_BBS_OPEATTION` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `FK_BBS_OPERATION_USER` FOREIGN KEY (`operater_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题、帖子操作记录';

-- ----------------------------
-- Records of bbs_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_permission`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_permission`;
CREATE TABLE `bbs_permission` (
  `GROUP_ID` int(11) NOT NULL,
  `PERM_KEY` varchar(20) NOT NULL COMMENT '权限key',
  `PERM_VALUE` varchar(255) DEFAULT NULL COMMENT '权限value',
  KEY `FK_BBS_PERMISSION_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_PERMISSION_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛权限';

-- ----------------------------
-- Records of bbs_permission
-- ----------------------------
INSERT INTO `bbs_permission` VALUES ('1', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('1', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_per_day', '100');
INSERT INTO `bbs_permission` VALUES ('1', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'post_per_day', '100');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('2', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('3', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('3', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('3', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('3', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('3', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('4', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('4', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('4', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('4', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('4', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('5', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('5', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('5', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('5', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('5', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('6', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('6', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('6', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('6', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('6', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('7', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('7', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('7', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('7', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('7', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('9', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('9', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('9', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'attach_type', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('9', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('10', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('10', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('10', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('10', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('10', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('11', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('11', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('11', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('11', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('11', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('12', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'member_prohibit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'post_limit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_delete', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_edit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_manage', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_shield', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_top', '3');
INSERT INTO `bbs_permission` VALUES ('12', 'view_ip', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_type', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('14', 'allow_attach', 'false');
INSERT INTO `bbs_permission` VALUES ('14', 'allow_reply', 'false');
INSERT INTO `bbs_permission` VALUES ('14', 'allow_topic', 'false');
INSERT INTO `bbs_permission` VALUES ('14', 'attach_max_size', '500');
INSERT INTO `bbs_permission` VALUES ('14', 'attach_per_day', '50');
INSERT INTO `bbs_permission` VALUES ('14', 'attach_type', 'jpg');
INSERT INTO `bbs_permission` VALUES ('14', 'edit_limit_minute', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'favorite_count', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'msg_count', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'msg_interval', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'msg_per_day', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'post_interval', '2');
INSERT INTO `bbs_permission` VALUES ('14', 'post_per_day', '2');

-- ----------------------------
-- Table structure for `bbs_post`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post`;
CREATE TABLE `bbs_post` (
  `POST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL COMMENT '主题',
  `SITE_ID` int(11) NOT NULL COMMENT '站点',
  `CONFIG_ID` int(11) NOT NULL,
  `EDITER_ID` int(11) DEFAULT NULL COMMENT '编辑器会员',
  `CREATER_ID` int(11) NOT NULL COMMENT '发贴会员',
  `CREATE_TIME` datetime NOT NULL COMMENT '发贴时间',
  `POSTER_IP` varchar(20) NOT NULL DEFAULT '' COMMENT '发贴IP',
  `EDIT_TIME` datetime DEFAULT NULL COMMENT '编辑时间',
  `EDITER_IP` varchar(20) DEFAULT '' COMMENT '编辑者IP',
  `EDIT_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '编辑次数',
  `INDEX_COUNT` int(11) NOT NULL DEFAULT '1' COMMENT '第几楼',
  `STATUS` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
  `IS_AFFIX` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传附件',
  `IS_HIDDEN` tinyint(1) DEFAULT '0' COMMENT '是否有隐藏内容',
  `TYPE_ID` int(11) NOT NULL COMMENT '帖子分类id',
  `ANONYMOUS` tinyint(1) DEFAULT NULL COMMENT '是否匿名',
  PRIMARY KEY (`POST_ID`),
  KEY `FK_BBS_POST_CREATER` (`CREATER_ID`),
  KEY `FK_BBS_POST_EDITOR` (`EDITER_ID`),
  KEY `FK_BBS_POST_TOPIC` (`TOPIC_ID`),
  KEY `FK_BBS_POST_WEBSITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_POST_CREATER` FOREIGN KEY (`CREATER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_POST_EDITOR` FOREIGN KEY (`EDITER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_POST_TOPIC` FOREIGN KEY (`TOPIC_ID`) REFERENCES `bbs_topic` (`TOPIC_ID`),
  CONSTRAINT `FK_BBS_POST_WEBSITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='论坛帖子';

-- ----------------------------
-- Records of bbs_post
-- ----------------------------
INSERT INTO `bbs_post` VALUES ('2', '2', '1', '1', null, '9', '2012-05-03 11:59:18', '127.0.0.1', null, null, '0', '1', '0', '0', '0', '2', '0');
INSERT INTO `bbs_post` VALUES ('3', '3', '1', '1', null, '10', '2012-05-03 12:01:17', '127.0.0.1', null, null, '0', '1', '0', '0', '0', '3', '0');

-- ----------------------------
-- Table structure for `bbs_post_text`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post_text`;
CREATE TABLE `bbs_post_text` (
  `POST_ID` bigint(20) NOT NULL,
  `POST_TITLE` varchar(100) DEFAULT NULL COMMENT '帖子标题',
  `POST_CONTENT` longtext COMMENT '帖子内容',
  PRIMARY KEY (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子内容';

-- ----------------------------
-- Records of bbs_post_text
-- ----------------------------
INSERT INTO `bbs_post_text` VALUES ('2', '版主帖子', '版主帖子[smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('3', 'bbs是不是有很多bug', 'bbs是不是有很多bug[smiley=7]');

-- ----------------------------
-- Table structure for `bbs_post_type`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post_type`;
CREATE TABLE `bbs_post_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '帖子分类名称',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `site_id` int(11) DEFAULT NULL COMMENT '站点id',
  `forum_id` int(11) NOT NULL DEFAULT '0' COMMENT '板块',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类id',
  PRIMARY KEY (`type_id`),
  KEY `fk_bbs_post_type_site` (`site_id`),
  KEY `fk_bbs_post_type_parent` (`parent_id`),
  KEY `fk_bbs_type_forum` (`forum_id`),
  CONSTRAINT `fk_bbs_post_type_parent` FOREIGN KEY (`parent_id`) REFERENCES `bbs_post_type` (`type_id`),
  CONSTRAINT `fk_bbs_post_type_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_bbs_type_forum` FOREIGN KEY (`forum_id`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_post_type
-- ----------------------------
INSERT INTO `bbs_post_type` VALUES ('2', '系统售前咨询', '1', '1', '1', null);
INSERT INTO `bbs_post_type` VALUES ('3', 'bug反馈', '1', '1', '2', null);

-- ----------------------------
-- Table structure for `bbs_private_msg`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_private_msg`;
CREATE TABLE `bbs_private_msg` (
  `PRIVMSG_ID` bigint(20) NOT NULL,
  `TO_USER` bigint(20) NOT NULL COMMENT '收信人',
  `FROM_USER` bigint(20) NOT NULL COMMENT '发信人',
  `MSG_TYPE` smallint(6) NOT NULL DEFAULT '1' COMMENT '类型（2：已发，1：已阅，0：未阅）',
  `MSG_SUBJECT` varchar(255) DEFAULT NULL COMMENT '主题',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MSG_IP` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP地址',
  PRIMARY KEY (`PRIVMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人短消息';

-- ----------------------------
-- Records of bbs_private_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_private_msg_text`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_private_msg_text`;
CREATE TABLE `bbs_private_msg_text` (
  `PRIVMSG_ID` bigint(20) NOT NULL,
  `MSG_TEXT` longtext COMMENT '个人信息内容',
  PRIMARY KEY (`PRIVMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人消息内容';

-- ----------------------------
-- Records of bbs_private_msg_text
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_report`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_report`;
CREATE TABLE `bbs_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_url` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '举报地址',
  `process_user` int(11) DEFAULT NULL COMMENT '处理人',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `process_result` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '处理结果',
  `status` tinyint(1) DEFAULT NULL COMMENT '处理状态0未处理。1已经处理',
  `report_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '举报时间',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_report_process_user` (`process_user`),
  CONSTRAINT `fk_bbs_report_process_user` FOREIGN KEY (`process_user`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报记录';

-- ----------------------------
-- Records of bbs_report
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_report_ext`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_report_ext`;
CREATE TABLE `bbs_report_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `report_id` int(11) NOT NULL DEFAULT '0' COMMENT 'reportid',
  `report_user` int(11) NOT NULL DEFAULT '0' COMMENT '举报人',
  `report_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '举报时间',
  `report_reason` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '举报理由',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_report_ext_report_user` (`report_user`),
  KEY `fk_bbs_report_ext_report` (`report_id`),
  CONSTRAINT `fk_bbs_report_ext_report` FOREIGN KEY (`report_id`) REFERENCES `bbs_report` (`id`),
  CONSTRAINT `fk_bbs_report_ext_report_user` FOREIGN KEY (`report_user`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报扩展';

-- ----------------------------
-- Records of bbs_report_ext
-- ----------------------------

-- ----------------------------
-- Table structure for `bbs_topic`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `TOPIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL COMMENT '板块',
  `LAST_POST_ID` int(11) DEFAULT NULL COMMENT '最后帖',
  `FIRST_POST_ID` int(11) DEFAULT NULL COMMENT '主题帖',
  `SITE_ID` int(11) NOT NULL COMMENT '站点',
  `CREATER_ID` int(11) NOT NULL COMMENT '发帖会员',
  `REPLYER_ID` int(11) NOT NULL COMMENT '最后回帖会员',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_TIME` datetime NOT NULL COMMENT '最后回帖时间',
  `SORT_TIME` datetime NOT NULL COMMENT '用于排序',
  `VIEW_COUNT` bigint(20) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `REPLY_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '恢复次数',
  `TOP_LEVEL` smallint(6) NOT NULL DEFAULT '0' COMMENT '固定级别',
  `PRIME_LEVEL` smallint(6) NOT NULL DEFAULT '0' COMMENT '精华级别',
  `STATUS` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
  `OUTER_URL` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `STYLE_BOLD` tinyint(1) NOT NULL DEFAULT '0' COMMENT '粗体',
  `STYLE_ITALIC` tinyint(1) NOT NULL DEFAULT '0' COMMENT '斜体',
  `STYLE_COLOR` char(6) DEFAULT NULL COMMENT '颜色',
  `STYLE_TIME` datetime DEFAULT NULL COMMENT '样式有效时间',
  `IS_AFFIX` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传附件',
  `HAVA_REPLY` longtext COMMENT '回复列表',
  `moderator_reply` tinyint(1) DEFAULT '0' COMMENT '版主是否回复',
  `TYPE_ID` int(11) NOT NULL COMMENT '主题分类id',
  `ALLAY_REPLY` tinyint(1) DEFAULT NULL COMMENT '主题是否允许回复',
  `HAS_SOFAED` tinyint(1) DEFAULT NULL COMMENT '主题是否已经被抢走沙发',
  `CATEGORY` tinyint(1) DEFAULT NULL COMMENT '帖子类型(0:普通帖;1:投票贴)',
  `TOTAL_COUNT` int(11) DEFAULT NULL COMMENT '总票数',
  PRIMARY KEY (`TOPIC_ID`),
  KEY `BBS_SORT_TIME` (`SORT_TIME`),
  KEY `FK_BBS_FIRST_POST` (`FIRST_POST_ID`),
  KEY `FK_BBS_LAST_POST` (`LAST_POST_ID`),
  KEY `FK_BBS_TOPIC_FORUM` (`FORUM_ID`),
  KEY `FK_BBS_TOPIC_USER_CREATE` (`CREATER_ID`),
  KEY `FK_BBS_TOPIC_USER_LAST` (`REPLYER_ID`),
  KEY `FK_BBS_TOPIC_SITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_FIRST_POST` FOREIGN KEY (`FIRST_POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_LAST_POST` FOREIGN KEY (`LAST_POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_TOPIC_FORUM` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`),
  CONSTRAINT `FK_BBS_TOPIC_SITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `FK_BBS_TOPIC_USER_CREATE` FOREIGN KEY (`CREATER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_TOPIC_USER_LAST` FOREIGN KEY (`REPLYER_ID`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='论坛主题';

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES ('2', '1', null, '2', '1', '9', '9', '版主帖子', '2012-05-03 11:59:18', '2012-05-03 11:59:18', '2012-05-03 11:59:18', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '2', '1', '0', '0', null);
INSERT INTO `bbs_topic` VALUES ('3', '2', null, '3', '1', '10', '10', 'bbs是不是有很多bug', '2012-05-03 12:01:17', '2012-05-03 12:01:17', '2012-05-03 12:01:17', '2', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '3', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for `bbs_topic_text`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic_text`;
CREATE TABLE `bbs_topic_text` (
  `topic_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '主题标题',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛主题内容';

-- ----------------------------
-- Records of bbs_topic_text
-- ----------------------------
INSERT INTO `bbs_topic_text` VALUES ('2', '版主帖子');
INSERT INTO `bbs_topic_text` VALUES ('3', 'bbs是不是有很多bug');

-- ----------------------------
-- Table structure for `bbs_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user_group`;
CREATE TABLE `bbs_user_group` (
  `GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL COMMENT '头衔',
  `GROUP_TYPE` smallint(6) NOT NULL DEFAULT '0' COMMENT '组类别',
  `GROUP_IMG` varchar(100) DEFAULT NULL COMMENT '图片',
  `GROUP_POINT` int(11) NOT NULL DEFAULT '0' COMMENT '升级积分',
  `IS_DEFAULT` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认组',
  `GRADE_NUM` int(11) DEFAULT '0' COMMENT '评分',
  `magic_packet_size` int(11) DEFAULT NULL COMMENT '用户组道具包容量',
  PRIMARY KEY (`GROUP_ID`),
  KEY `FK_BBS_GROUP_SITE` (`site_id`),
  CONSTRAINT `FK_BBS_GROUP_SITE` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='论坛会员组';

-- ----------------------------
-- Records of bbs_user_group
-- ----------------------------
INSERT INTO `bbs_user_group` VALUES ('1', '1', '白丁', '1', '1', '0', '1', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('2', '1', '童生', '1', '2', '10', '0', '0', '20');
INSERT INTO `bbs_user_group` VALUES ('3', '1', '秀才', '1', '3', '50', '0', '0', '30');
INSERT INTO `bbs_user_group` VALUES ('4', '1', '举人', '1', '4', '100', '0', '0', '40');
INSERT INTO `bbs_user_group` VALUES ('5', '1', '解元', '1', '5', '200', '0', '0', '50');
INSERT INTO `bbs_user_group` VALUES ('6', '1', '贡士', '1', '6', '400', '0', '0', '60');
INSERT INTO `bbs_user_group` VALUES ('7', '1', '会元', '1', '7', '800', '0', '0', '70');
INSERT INTO `bbs_user_group` VALUES ('8', '1', '进士', '1', '8', '1600', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('9', '1', '探花', '1', '9', '3200', '0', '0', '80');
INSERT INTO `bbs_user_group` VALUES ('10', '1', '榜眼', '1', '10', '6400', '0', '0', '90');
INSERT INTO `bbs_user_group` VALUES ('11', '1', '状元', '1', '11', '12800', '0', '0', '100');
INSERT INTO `bbs_user_group` VALUES ('12', '1', '版主', '2', '21', '0', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('13', '1', 'VIP会员', '3', '10', '0', '0', '0', '100');
INSERT INTO `bbs_user_group` VALUES ('14', '1', '游客', '0', '1', '0', '0', '2', '10');

-- ----------------------------
-- Table structure for `bbs_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user_online`;
CREATE TABLE `bbs_user_online` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_latest` double(10,2) DEFAULT NULL COMMENT '最后登录时长',
  `online_day` double(10,2) DEFAULT NULL COMMENT '今日在线时长',
  `online_week` double(10,2) DEFAULT NULL COMMENT '本周在线',
  `online_month` double(10,2) DEFAULT NULL COMMENT '本月在线',
  `online_year` double(10,2) DEFAULT NULL COMMENT '本年在线',
  `online_total` double(10,2) DEFAULT NULL COMMENT '总在线时长',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_bbs_user_online_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=gbk COMMENT='用户在线时长统计';

-- ----------------------------
-- Records of bbs_user_online
-- ----------------------------
INSERT INTO `bbs_user_online` VALUES ('5', '0.00', '235.07', '235.07', '235.07', '235.07', '235.07');
INSERT INTO `bbs_user_online` VALUES ('9', '5.00', '30.54', '30.54', '30.54', '30.54', '30.54');
INSERT INTO `bbs_user_online` VALUES ('10', '90.00', '90.00', '90.00', '90.00', '90.00', '90.00');
INSERT INTO `bbs_user_online` VALUES ('29', '0.00', '25.00', '25.00', '25.00', '25.00', '25.00');

-- ----------------------------
-- Table structure for `bbs_vote_item`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_vote_item`;
CREATE TABLE `bbs_vote_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '票数',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_item
-- ----------------------------
INSERT INTO `bbs_vote_item` VALUES ('1', '3', '非常多', '0');
INSERT INTO `bbs_vote_item` VALUES ('2', '3', '很多', '0');
INSERT INTO `bbs_vote_item` VALUES ('3', '3', '一般般', '0');
INSERT INTO `bbs_vote_item` VALUES ('4', '3', '少', '0');

-- ----------------------------
-- Table structure for `bbs_vote_record`
-- ----------------------------
DROP TABLE IF EXISTS `bbs_vote_record`;
CREATE TABLE `bbs_vote_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `vote_time` datetime DEFAULT NULL COMMENT '投票时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_vote_record_user` (`user_id`),
  KEY `fk_vote_record_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_record
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_friendship`
-- ----------------------------
DROP TABLE IF EXISTS `jb_friendship`;
CREATE TABLE `jb_friendship` (
  `friendship_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `friend_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '好友状态(0:申请中;1:接受;2:拒绝)',
  PRIMARY KEY (`friendship_id`),
  KEY `fk_jb_friendship_friend` (`friend_id`),
  KEY `fk_jb_friendship_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_friendship
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_message`
-- ----------------------------
DROP TABLE IF EXISTS `jb_message`;
CREATE TABLE `jb_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sender` int(11) DEFAULT NULL COMMENT '发送人',
  `receiver` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `content` longtext CHARACTER SET gbk NOT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统消息(0:不是;1:是)',
  `msg_type` int(2) NOT NULL DEFAULT '1' COMMENT '1消息，2留言,3打招呼',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '信息状态 0未读 1已读',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jb_message_user` (`user_id`),
  KEY `fk_jb_message_receiver` (`receiver`),
  KEY `fk_jb_message_sender` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_message_reply`
-- ----------------------------
DROP TABLE IF EXISTS `jb_message_reply`;
CREATE TABLE `jb_message_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL DEFAULT '0',
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `fk_jb_reply_sender` (`sender`),
  KEY `fk_jb_reply_receiver` (`receiver`),
  KEY `fk_jb_reply_msg` (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_user`
-- ----------------------------
DROP TABLE IF EXISTS `jb_user`;
CREATE TABLE `jb_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `PROHIBIT_POST` smallint(6) NOT NULL DEFAULT '0' COMMENT '禁言(0:不禁言;1:永久禁言;2:定期禁言)',
  `PROHIBIT_TIME` datetime DEFAULT NULL COMMENT '解禁时间',
  `GRADE_TODAY` int(11) DEFAULT '0' COMMENT '今日评分',
  `UPLOAD_TODAY` int(11) DEFAULT '0' COMMENT '今日上传',
  `POINT` bigint(20) DEFAULT '0' COMMENT '积分',
  `INTRODUCTION` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `SIGNED` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '个人头像',
  `AVATAR_TYPE` smallint(6) DEFAULT '0' COMMENT '头像类型',
  `TOPIC_COUNT` int(11) DEFAULT '0' COMMENT '主题总数',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复总数',
  `PRIME_COUNT` int(11) DEFAULT '0' COMMENT '精华总数',
  `POST_TODAY` int(11) DEFAULT '0' COMMENT '今日发帖',
  `LAST_POST_TIME` datetime DEFAULT NULL COMMENT '最后回帖时间',
  `PRESTIGE` bigint(20) DEFAULT '0' COMMENT '威望',
  `magic_packet_size` int(11) DEFAULT NULL COMMENT '用户道具包现有容量',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `FK_BBS_MEMBER_MEMBERGROUP` (`group_id`),
  CONSTRAINT `FK_BBS_MEMBER_MEMBERGROUP` FOREIGN KEY (`group_id`) REFERENCES `bbs_user_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS用户表';

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO `jb_user` VALUES ('5', '1', 'admin', 'wudily2010@1631.com', '2011-03-17 12:02:04', '127.0.0.1', '2012-08-23 16:55:10', '127.0.0.1', '161', '0', '0', '2011-03-17', '1', '0', '0', null, null, '0', '22', null, null, '/jeebbs3beta/user/images/201204/19171421xnzd.jpg', '0', '2', '12', '0', '14', null, '0', '0');
INSERT INTO `jb_user` VALUES ('9', '12', 'test', '123@123.com', '2011-04-11 00:38:08', '127.0.0.1', '2012-08-23 15:19:53', '127.0.0.1', '69', '0', '0', '2011-04-11', '0', '0', '0', null, '5', '0', '113', null, '', 'none.gif', '0', '22', '6', '0', '28', null, '1', '0');
INSERT INTO `jb_user` VALUES ('10', '1', 'chen', 'chen@163.com', '2012-05-03 11:38:45', '127.0.0.1', '2012-05-03 12:00:27', '127.0.0.1', '1', '0', '0', '2012-05-03', '0', '0', '0', null, null, '0', '5', null, null, null, '0', '1', '0', '0', '1', null, '1', '0');
INSERT INTO `jb_user` VALUES ('23', '14', 'yang', '', '2012-08-23 12:54:56', '127.0.0.1', '2012-08-23 12:54:56', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('24', '14', 'yang2', '', '2012-08-23 13:10:13', '127.0.0.1', '2012-08-23 13:10:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('25', '1', 'hhhh', '', '2012-08-23 15:37:25', '127.0.0.1', '2012-08-23 15:37:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('27', '1', 'test2', null, '2012-08-23 15:45:32', '127.0.0.1', '2012-08-23 15:45:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('29', '1', 'sa', null, '2012-08-23 16:06:00', '127.0.0.1', '2012-08-23 16:59:10', '127.0.0.1', '4', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('30', '1', 'gzs_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('31', '1', 'chs_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('32', '1', 'zcs_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('33', '1', 'hdq_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('34', '1', 'atz_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('35', '1', 'lkz_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('36', '1', 'wqz_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('37', '1', 'ltz_admin', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('38', '1', '2011000012', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('39', '1', '2011000013', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('40', '1', '2011000014', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('41', '1', '2011000015', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('42', '1', '2011000016', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('43', '1', '2011000017', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('44', '1', '2011000018', null, '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('45', '1', '2011000019', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('46', '1', '2011000031', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('47', '1', '2011000032', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('48', '1', '2011000033', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('49', '1', '2011000034', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('50', '1', '2011000035', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('51', '1', '2011000036', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('52', '1', '2011000037', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('53', '1', '2011000038', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('54', '1', '2011000050', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('55', '1', '2011000051', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('56', '1', '2011000052', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('57', '1', '2011000053', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('58', '1', '2011000054', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('59', '1', '2011000055', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('60', '1', '2011000056', null, '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('61', '1', '2011000057', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('62', '1', '2011000058', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('63', '1', '2011000059', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('64', '1', '2011000060', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('65', '1', '2011000061', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('66', '1', '2011000062', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('67', '1', '2011000063', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('68', '1', '2011000075', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('69', '1', '2011000076', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('70', '1', '2011000077', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('71', '1', '2011000078', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('72', '1', '2011000079', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('73', '1', '2011000080', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('74', '1', '2011000081', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('75', '1', '2011000082', null, '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('76', '1', '2011000083', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('77', '1', '2011000084', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('78', '1', '2011000085', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('79', '1', '2011000086', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('80', '1', '2011000087', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('81', '1', '2011000088', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('82', '1', '2011000089', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('83', '1', '2011000090', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('84', '1', '2011000091', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('85', '1', '2011000092', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('86', '1', '2011000093', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('87', '1', '2011000094', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('88', '1', '2011000095', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('89', '1', '2011000096', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('90', '1', '2011000097', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('91', '1', '2011000098', null, '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('92', '1', '2011000099', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('93', '1', '2011000100', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('94', '1', '2011000101', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('95', '1', '2011000102', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('96', '1', '2011000103', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('97', '1', '2011000104', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('98', '1', '2011000105', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('99', '1', '2011000106', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('100', '1', '2011000107', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('101', '1', '2011000108', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('102', '1', '2011000109', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('103', '1', '2011000110', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('104', '1', '2011000111', null, '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('105', '1', '2011000112', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('106', '1', '2011000113', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('107', '1', '2011000114', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('108', '1', '2011000115', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('109', '1', '2011000116', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('110', '1', '2011000117', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('111', '1', '2011000118', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('112', '1', '2011000119', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('113', '1', '2011000120', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('114', '1', '2011000121', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('115', '1', '2011000122', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('116', '1', '2011000133', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('117', '1', '2011000134', null, '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('118', '1', '2011000135', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('119', '1', '2011000136', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('120', '1', '2011000137', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('121', '1', '2011000138', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('122', '1', '2011000139', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('123', '1', '2011000151', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('124', '1', '2011000152', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('125', '1', '2011000153', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('126', '1', '2011000154', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('127', '1', '2011000155', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('128', '1', '2011000156', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('129', '1', '2011000157', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('130', '1', '2011000158', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('131', '1', '2011000159', null, '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('132', '1', '2011000160', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('133', '1', '2011000161', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('134', '1', '2011000162', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('135', '1', '2011000163', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('136', '1', '2011000164', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('137', '1', '2011000165', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('138', '1', '2011000166', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('139', '1', '2011000167', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('140', '1', '2011000168', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('141', '1', '2011000169', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('142', '1', '2011000170', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('143', '1', '2011000182', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('144', '1', '2011000183', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('145', '1', '2011000184', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('146', '1', '2011000185', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('147', '1', '2011000186', null, '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('148', '1', '2011000187', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('149', '1', '2011000188', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('150', '1', '2011000189', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('151', '1', '2011000190', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('152', '1', '2011000191', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('153', '1', '2011000193', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('154', '1', '2011000194', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('155', '1', '2011000195', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('156', '1', '2011000192', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('157', '1', '2011000196', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('158', '1', '2011000197', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('159', '1', '2011000198', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('160', '1', '2011000199', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('161', '1', '2011000200', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('162', '1', '2011000201', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('163', '1', '2011000202', null, '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('164', '1', '2011000203', null, '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('165', '1', '2011000204', null, '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('166', '1', '2011000205', null, '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('167', '1', '2011000206', null, '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('168', '1', 'hzq_admin', null, '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('169', '1', 'hpq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('170', '1', 'thq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('171', '1', 'lwq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('172', '1', 'yxq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('173', '1', 'pyq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('174', '1', 'lgq_admin', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('175', '1', '2011000020', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('176', '1', '2011000001', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('177', '1', '2011000040', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('178', '1', '2011000070', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('179', '1', '2011000130', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('180', '1', '2011000140', null, '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('181', '1', '2011000180', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('182', '1', 'ptz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('183', '1', 'xlz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('184', '1', 'zgz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('185', '1', 'tmz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('186', '1', 'zjz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('187', '1', 'zxz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('188', '1', 'zcz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('189', '1', 'xtz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('190', '1', 'stz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('191', '1', 'lcz_admin', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('192', '1', '2011000002', null, '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('193', '1', '2011000003', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('194', '1', '2011000004', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('195', '1', '2011000005', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('196', '1', '2011000006', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('197', '1', '2011000007', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('198', '1', '2011000008', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('199', '1', '2011000009', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('200', '1', '2011000010', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('201', '1', '2011000011', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('202', '1', '2011000021', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('203', '1', '2011000022', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('204', '1', '2011000023', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('205', '1', '2011000025', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('206', '1', '2011000026', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('207', '1', '2011000027', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('208', '1', '2011000028', null, '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('209', '1', '2011000029', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('210', '1', '2011000024', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('211', '1', '2011000030', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('212', '1', '2011000039', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('213', '1', '2011000041', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('214', '1', '2011000042', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('215', '1', '2011000043', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('216', '1', '2011000044', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('217', '1', '2011000045', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('218', '1', '2011000046', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('219', '1', '2011000047', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('220', '1', '2011000048', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('221', '1', '2011000049', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('222', '1', '2011000064', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('223', '1', '2011000065', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('224', '1', '2011000066', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('225', '1', '2011000067', null, '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('226', '1', '2011000068', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('227', '1', '2011000069', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('228', '1', '2011000071', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('229', '1', '2011000072', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('230', '1', '2011000073', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('231', '1', '2011000074', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('232', '1', '2011000123', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('233', '1', '2011000124', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('234', '1', '2011000125', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('235', '1', '2011000126', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('236', '1', '2011000127', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('237', '1', '2011000128', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('238', '1', '2011000129', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('239', '1', '2011000131', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('240', '1', '2011000132', null, '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('241', '1', '2011000141', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('242', '1', '2011000142', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('243', '1', '2011000143', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('244', '1', '2011000144', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('245', '1', '2011000145', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('246', '1', '2011000146', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('247', '1', '2011000147', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('248', '1', '2011000148', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('249', '1', '2011000149', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('250', '1', '2011000150', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('251', '1', '2011000171', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('252', '1', '2011000172', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('253', '1', '2011000173', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('254', '1', '2011000174', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('255', '1', '2011000175', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('256', '1', '2011000176', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('257', '1', '2011000177', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('258', '1', '2011000178', null, '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('259', '1', '2011000179', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('260', '1', '2011000181', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('261', '1', 'tpz_admin', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('262', '1', 'jkjd_admin', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('263', '1', 'jpjd_admin', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('264', '1', 'cjjd_admin', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('265', '1', ' thq_admin ', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('266', '1', '2011001001', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('267', '1', '2011001002', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('268', '1', '2011001003', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('269', '1', '2011001004', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('270', '1', '2011001005', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('271', '1', '2011001006', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('272', '1', '2011001007', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('273', '1', '2011001008', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('274', '1', '2011001009', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('275', '1', '2011001010', null, '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('276', '1', '2011001011', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('277', '1', '2011001012', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('278', '1', '2011001013', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('279', '1', '2011001014', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('280', '1', '2011001015', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('281', '1', '2011001016', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('282', '1', '2011001017', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('283', '1', '2011001018', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('284', '1', '2011001019', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('285', '1', '2011001020', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('286', '1', '2011001021', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('287', '1', '2011001022', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('288', '1', '2011001023', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('289', '1', '2011001024', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('290', '1', '2011001025', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('291', '1', '2011001026', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('292', '1', '2011001027', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('293', '1', '2011001028', null, '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('294', '1', '2011001029', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('295', '1', '2011001030', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('296', '1', '2011001031', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('297', '1', '2011001032', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('298', '1', '2011001033', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('299', '1', '2011001034', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('300', '1', '2011001035', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('301', '1', '2011001036', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('302', '1', '2011001037', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('303', '1', '2011001038', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('304', '1', '2011001039', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('305', '1', '2011001040', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('306', '1', '2011001041', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('307', '1', '2011001042', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('308', '1', '2011001043', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('309', '1', '2011001044', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('310', '1', '2011001045', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('311', '1', '2011001046', null, '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('312', '1', '2011001047', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('313', '1', '2011001048', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('314', '1', '2011001049', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('315', '1', '2011001050', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('316', '1', '2011001051', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('317', '1', '2011001052', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('318', '1', '2011001053', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('319', '1', '2011001054', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('320', '1', '2011001055', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('321', '1', '2011001056', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('322', '1', '2011001057', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('323', '1', '2011001058', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('324', '1', '2011001059', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('325', '1', '2011001060', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('326', '1', '2011001061', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('327', '1', '2011001062', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('328', '1', '2011001063', null, '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('329', '1', '2011001064', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('330', '1', '2011001065', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('331', '1', '2011001066', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('332', '1', '2011001067', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('333', '1', '2011001068', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('334', '1', '2011001069', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('335', '1', '2011001070', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('336', '1', '2011001071', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('337', '1', '2011001072', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('338', '1', '2011001073', null, '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('339', '1', '2011001074', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('340', '1', '2011001075', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('341', '1', '2011001076', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('342', '1', '2011001077', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('343', '1', '2011001078', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('344', '1', '2011001079', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('345', '1', '2011001080', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('346', '1', '2011001081', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('347', '1', '2011001082', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('348', '1', '2011001083', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('349', '1', '2011002001', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('350', '1', '2011002002', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('351', '1', '2011002003', null, '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('352', '1', '2011002004', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('353', '1', '2011002005', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('354', '1', '2011002006', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('355', '1', '2011002007', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('356', '1', '2011002008', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('357', '1', '2011002009', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('358', '1', '2011002010', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('359', '1', '2011002011', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('360', '1', '2011002012', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('361', '1', '2011002013', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('362', '1', '2011002014', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('363', '1', '2011002015', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('364', '1', '2011002016', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('365', '1', '2011002017', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('366', '1', '2011002018', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('367', '1', '2011002019', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('368', '1', '2011002020', null, '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('369', '1', '2011002021', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('370', '1', '2011002022', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('371', '1', '2011002023', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('372', '1', '2011002024', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('373', '1', '2011002025', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('374', '1', '2011002026', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('375', '1', '2011002027', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('376', '1', '2011002028', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('377', '1', '2011002029', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('378', '1', '2011002030', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('379', '1', '2011002031', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('380', '1', '2011002032', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('381', '1', '2011002033', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('382', '1', '2011002034', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('383', '1', '2011002035', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('384', '1', '2011002036', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('385', '1', '2011002037', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('386', '1', '2011002038', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('387', '1', '2011002039', null, '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('388', '1', '2011002040', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('389', '1', '2011002041', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('390', '1', '2011002042', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('391', '1', '2011002043', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('392', '1', '2011002044', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('393', '1', '2011002045', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('394', '1', '2011002046', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('395', '1', '2011002047', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('396', '1', '2011002048', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('397', '1', '2011002049', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('398', '1', '2011002050', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('399', '1', '2011002051', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('400', '1', '2011002052', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('401', '1', '2011002053', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('402', '1', '2011002054', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('403', '1', '2011002055', null, '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('404', '1', '2011002056', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('405', '1', '2011002057', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('406', '1', '2011002058', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('407', '1', '2011002059', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('408', '1', '2011002060', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('409', '1', '2011002061', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('410', '1', '2011002062', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('411', '1', '2011002063', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('412', '1', '2011002064', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('413', '1', '2011002065', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('414', '1', '2011002066', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('415', '1', '2011002067', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('416', '1', '2011002068', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('417', '1', '2011002069', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('418', '1', '2011002070', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('419', '1', '2011002071', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('420', '1', '2011002072', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('421', '1', '2011002073', null, '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('422', '1', '2011002074', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('423', '1', '2011002075', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('424', '1', '2011002076', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('425', '1', '2011002077', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('426', '1', '2011002078', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('427', '1', '2011002079', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('428', '1', '11', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('429', '1', 'taipin_group', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('430', '1', 'baiyun', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('431', '1', 'chfpb_admin', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('432', '1', 'zcfpb_admin', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('433', '1', '2011002080', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('434', '1', '2011002081', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('435', '1', '2011002082', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('436', '1', '2011002083', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('437', '1', '2011002084', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('438', '1', '2011002085', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('439', '1', '2011002086', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('440', '1', '2011002087', null, '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('441', '1', '2011002088', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('442', '1', '2011002089', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('443', '1', '2011002090', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('444', '1', '2011002091', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('445', '1', '2011002092', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('446', '1', 'lgqfpb_admin', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('447', '1', 'nsqfpb_admin', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('448', '1', '2011002093', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('449', '1', '2011002094', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('450', '1', '2011002095', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('451', '1', 'pyqfpb_admin', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('452', '1', 'by201101001', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('453', '1', 'by201101002', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('454', '1', 'by201101003', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('455', '1', 'by201101004', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('456', '1', 'by201101005', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('457', '1', 'by201101006', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('458', '1', 'by201101007', null, '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('459', '1', 'by201101008', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('460', '1', 'by201101009', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('461', '1', 'by201101010', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('462', '1', 'by201101011', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('463', '1', 'by201101012', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('464', '1', 'by201101013', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('465', '1', 'by201101014', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('466', '1', 'by201101015', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('467', '1', 'by201101016', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('468', '1', 'by201101017', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('469', '1', 'by201101018', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('470', '1', 'by201101019', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('471', '1', 'by201101020', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('472', '1', 'by201101021', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('473', '1', 'by201101022', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('474', '1', 'by201101023', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('475', '1', 'by201101024', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('476', '1', 'by201101025', null, '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('477', '1', 'by201101026', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('478', '1', 'by201101027', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('479', '1', 'by201101028', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('480', '1', 'by201101029', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('481', '1', 'by201101030', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('482', '1', 'by201101031', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('483', '1', 'by201101032', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('484', '1', 'by201101033', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('485', '1', 'by201101034', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('486', '1', 'by201101035', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('487', '1', 'by201102001', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('488', '1', 'by201102002', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('489', '1', 'by201102003', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('490', '1', 'by201102004', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('491', '1', 'by201102005', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('492', '1', 'by201102006', null, '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('493', '1', 'by201102007', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('494', '1', 'by201102008', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('495', '1', 'by201102009', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('496', '1', 'by201102010', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('497', '1', 'by201102011', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('498', '1', 'by201102012', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('499', '1', 'by201102013', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('500', '1', 'by201102014', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('501', '1', 'by201102015', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('502', '1', 'by201102016', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('503', '1', 'by201102017', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('504', '1', 'by201102018', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('505', '1', 'by201102019', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('506', '1', 'by201102020', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('507', '1', 'by201102021', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('508', '1', 'by201102022', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('509', '1', 'by201102023', null, '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('510', '1', 'by201102024', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('511', '1', 'by201102025', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('512', '1', 'by201103001', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('513', '1', 'by201103002', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('514', '1', 'by201103003', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('515', '1', 'by201103004', null, '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('516', '1', 'by201103005', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('517', '1', 'by201103006', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('518', '1', 'by201103007', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('519', '1', 'by201103008', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('520', '1', 'by201103009', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('521', '1', 'by201103010', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('522', '1', 'by201103011', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('523', '1', 'by201103012', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('524', '1', 'by201103013', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('525', '1', 'by201103014', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('526', '1', 'by201103015', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('527', '1', 'by201103016', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('528', '1', 'by201103017', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('529', '1', 'by201103018', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('530', '1', 'by201103019', null, '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('531', '1', 'by201103020', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('532', '1', 'by201103021', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('533', '1', 'by201104001', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('534', '1', 'by201104002', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('535', '1', 'by201104003', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('536', '1', 'by201104004', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('537', '1', 'by201104005', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('538', '1', 'by201104006', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('539', '1', 'by201104007', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('540', '1', 'by201104008', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('541', '1', 'by201104009', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('542', '1', 'by201104010', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('543', '1', 'by201104011', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('544', '1', 'by201104012', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('545', '1', 'by201104013', null, '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('546', '1', 'by201104014', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('547', '1', 'by201104015', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('548', '1', 'by201104016', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('549', '1', 'by201104017', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('550', '1', 'by201104018', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('551', '1', 'by201104019', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('552', '1', 'by201104020', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('553', '1', 'by201104021', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('554', '1', 'by201104022', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('555', '1', 'by201104023', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('556', '1', 'by201104024', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('557', '1', 'by201104025', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('558', '1', 'by201104026', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('559', '1', 'by201104027', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('560', '1', 'by201104028', null, '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('561', '1', 'by201104029', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('562', '1', 'by201104030', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('563', '1', 'by201104031', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('564', '1', 'by201104032', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('565', '1', 'by201104033', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('566', '1', 'by201104034', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('567', '1', 'by201104035', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('568', '1', 'by201104036', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('569', '1', 'by201104037', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('570', '1', 'renhe', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('571', '1', 'atz_admin2', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('572', '1', 'haizhugzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('573', '1', 'huangpugzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('574', '1', 'liwangzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('575', '1', 'luoganggzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('576', '1', 'yuexiugzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('577', '1', 'tianhegzz', null, '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('578', '1', '2011001084', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('579', '1', '2011001085', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('580', '1', '2011001086', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('581', '1', '2011001087', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('582', '1', '2011001088', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('583', '1', '2011001089', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('584', '1', '2011001090', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('585', '1', '2011001091', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('586', '1', '2011001092', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('587', '1', '2011001093', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('588', '1', '2011001094', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('589', '1', '2011001095', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('590', '1', '2011001096', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('591', '1', '2011001097', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('592', '1', '2011001098', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('593', '1', '2011001099', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('594', '1', '2011001100', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('595', '1', '2011001101', null, '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('596', '1', '2011001102', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('597', '1', '2011001103', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('598', '1', '2011001104', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('599', '1', '2011001106', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('600', '1', '2011001107', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('601', '1', '2011001108', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('602', '1', '2011001109', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('603', '1', '2011001111', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('604', '1', '2011001112', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('605', '1', '2011001113', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('606', '1', '2011001114', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('607', '1', '2011001115', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('608', '1', '2011001116', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('609', '1', '2011001117', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('610', '1', '2011001118', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('611', '1', '2011001119', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('612', '1', '2011001120', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');
INSERT INTO `jb_user` VALUES ('613', '1', '2011001121', null, '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', '0', '0', '2012-08-23', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0');

-- ----------------------------
-- Table structure for `jb_user_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_ext`;
CREATE TABLE `jb_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `moble` varchar(50) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS用户扩展信息表';

-- ----------------------------
-- Records of jb_user_ext
-- ----------------------------
INSERT INTO `jb_user_ext` VALUES ('5', 'abc', null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('9', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('23', 'yanglei', null, null, null, null, ',', '41666693', null, null, null);
INSERT INTO `jb_user_ext` VALUES ('24', null, null, null, null, null, ',', '677777', null, null, null);
INSERT INTO `jb_user_ext` VALUES ('25', null, null, null, null, null, ',', null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('32', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('33', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('34', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('35', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('36', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('37', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('38', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('39', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('40', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('41', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('42', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('43', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('44', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('45', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('46', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('47', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('48', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('49', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('50', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('51', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('52', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('53', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('54', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('55', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('56', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('57', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('58', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('59', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('60', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('61', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('62', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('63', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('64', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('65', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('66', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('67', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('68', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('69', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('70', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('71', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('72', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('73', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('74', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('75', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('76', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('77', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('78', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('79', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('80', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('81', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('82', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('83', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('84', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('85', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('86', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('87', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('88', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('89', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('90', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('91', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('92', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('93', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('94', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('95', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('96', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('97', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('98', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('99', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('100', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('101', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('102', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('103', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('104', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('105', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('106', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('107', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('108', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('109', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('110', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('111', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('112', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('113', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('114', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('115', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('116', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('117', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('118', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('119', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('120', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('121', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('122', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('123', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('124', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('125', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('126', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('127', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('128', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('129', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('130', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('131', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('132', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('133', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('134', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('135', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('136', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('137', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('138', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('139', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('140', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('141', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('142', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('143', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('144', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('145', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('146', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('147', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('148', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('149', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('150', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('151', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('152', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('153', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('154', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('155', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('156', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('157', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('158', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('159', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('160', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('161', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('162', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('163', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('164', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('165', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('166', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('167', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('168', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('169', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('170', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('171', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('172', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('173', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('174', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('175', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('176', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('177', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('178', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('179', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('180', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('181', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('182', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('183', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('184', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('185', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('186', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('187', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('188', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('189', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('190', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('191', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('192', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('193', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('194', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('195', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('196', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('197', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('198', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('199', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('200', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('201', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('202', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('203', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('204', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('205', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('206', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('207', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('208', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('209', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('210', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('211', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('212', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('213', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('214', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('215', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('216', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('217', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('218', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('219', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('220', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('221', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('222', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('223', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('224', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('225', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('226', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('227', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('228', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('229', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('230', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('231', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('232', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('233', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('234', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('235', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('236', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('237', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('238', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('239', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('240', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('241', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('242', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('243', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('244', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('245', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('246', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('247', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('248', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('249', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('250', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('251', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('252', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('253', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('254', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('255', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('256', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('257', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('258', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('259', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('260', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('261', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('262', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('263', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('264', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('265', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('266', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('267', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('268', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('269', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('270', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('271', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('272', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('273', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('274', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('275', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('276', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('277', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('278', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('279', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('280', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('281', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('282', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('283', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('284', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('285', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('286', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('287', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('288', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('289', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('290', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('291', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('292', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('293', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('294', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('295', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('296', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('297', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('298', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('299', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('300', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('301', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('302', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('303', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('304', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('305', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('306', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('307', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('308', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('309', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('310', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('311', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('312', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('313', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('314', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('315', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('316', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('317', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('318', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('319', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('320', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('321', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('322', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('323', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('324', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('325', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('326', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('327', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('328', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('329', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('330', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('331', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('332', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('333', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('334', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('335', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('336', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('337', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('338', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('339', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('340', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('341', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('342', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('343', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('344', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('345', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('346', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('347', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('348', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('349', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('350', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('351', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('352', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('353', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('354', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('355', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('356', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('357', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('358', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('359', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('360', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('361', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('362', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('363', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('364', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('365', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('366', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('367', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('368', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('369', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('370', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('371', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('372', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('373', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('374', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('375', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('376', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('377', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('378', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('379', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('380', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('381', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('382', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('383', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('384', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('385', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('386', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('387', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('388', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('389', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('390', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('391', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('392', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('393', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('394', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('395', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('396', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('397', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('398', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('399', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('400', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('401', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('402', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('403', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('404', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('405', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('406', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('407', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('408', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('409', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('410', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('411', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('412', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('413', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('414', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('415', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('416', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('417', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('418', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('419', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('420', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('421', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('422', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('423', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('424', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('425', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('426', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('427', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('428', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('429', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('430', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('431', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('432', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('433', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('434', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('435', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('436', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('437', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('438', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('439', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('440', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('441', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('442', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('443', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('444', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('445', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('446', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('447', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('448', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('449', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('450', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('451', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('452', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('453', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('454', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('455', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('456', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('457', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('458', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('459', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('460', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('461', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('462', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('463', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('464', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('465', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('466', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('467', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('468', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('469', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('470', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('471', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('472', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('473', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('474', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('475', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('476', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('477', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('478', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('479', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('480', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('481', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('482', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('483', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('484', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('485', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('486', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('487', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('488', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('489', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('490', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('491', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('492', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('493', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('494', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('495', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('496', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('497', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('498', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('499', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('500', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('501', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('502', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('503', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('504', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('505', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('506', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('507', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('508', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('509', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('510', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('511', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('512', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('513', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('514', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('515', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('516', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('517', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('518', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('519', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('520', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('521', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('522', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('523', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('524', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('525', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('526', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('527', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('528', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('529', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('530', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('531', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('532', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('533', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('534', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('535', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('536', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('537', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('538', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('539', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('540', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('541', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('542', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('543', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('544', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('545', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('546', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('547', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('548', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('549', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('550', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('551', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('552', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('553', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('554', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('555', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('556', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('557', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('558', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('559', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('560', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('561', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('562', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('563', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('564', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('565', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('566', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('567', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('568', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('569', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('570', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('571', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('572', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('573', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('574', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('575', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('576', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('577', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('578', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('579', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('580', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('581', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('582', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('583', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('584', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('585', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('586', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('587', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('588', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('589', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('590', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('591', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('592', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('593', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('594', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('595', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('596', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('597', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('598', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('599', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('600', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('601', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('602', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('603', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('604', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('605', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('606', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('607', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('608', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('609', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('610', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('611', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('612', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('613', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `jc_config`
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES ('1', '/jeebbs', null, '8080', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '20', '#FF0000', '50', '1', '0', '0', '2011-12-26', '2011-12-26 13:32:26', 'jeecms', '12', null, null, null, null, null);

-- ----------------------------
-- Table structure for `jc_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_friendlink_ctg`
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_sensitivity`
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`),
  KEY `fk_sensitivity_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_site`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `creditex_id` int(11) DEFAULT '1' COMMENT '积分交易规则id',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES ('1', '1', null, 'localhost', 'www', '扶贫论坛', 'jeebbs', 'http://', '.jhtml', '.html', null, '0', '0', 'zh_CN', 'zh_CN', 'blue', '2', '2', '1', '1', '', '', '1');

-- ----------------------------
-- Table structure for `jo_authentication`
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Records of jo_authentication
-- ----------------------------
INSERT INTO `jo_authentication` VALUES ('08dabd4aba984b938b386786f2279f67', '9', 'test', '123@123.com', '2012-08-23 15:13:10', '127.0.0.1', '2012-08-23 15:13:10');
INSERT INTO `jo_authentication` VALUES ('0f7adb6682c14f49af7175f5e6f715e6', '5', 'admin', null, '2012-08-23 11:17:58', '127.0.0.1', '2012-08-23 11:17:58');
INSERT INTO `jo_authentication` VALUES ('0fc771bcd72746428c2c4c9779e718f7', '9', 'test', '123@123.com', '2012-08-23 15:19:43', '127.0.0.1', '2012-08-23 15:19:53');
INSERT INTO `jo_authentication` VALUES ('13bd4780cf4846a2ae21f892a9e3c675', '29', 'sa', null, '2012-08-23 16:25:54', '127.0.0.1', '2012-08-23 16:59:10');
INSERT INTO `jo_authentication` VALUES ('203ffa1e67ae4bb981752baf85ed62de', '5', 'admin', null, '2012-08-23 15:45:50', '127.0.0.1', '2012-08-23 15:48:17');
INSERT INTO `jo_authentication` VALUES ('21b96bacb7f34947b219fc57e5feff5e', '5', 'admin', 'wudily2010@1631.com', '2012-04-19 10:09:28', '127.0.0.1', '2012-04-19 11:34:00');
INSERT INTO `jo_authentication` VALUES ('22cc4c8f46b841d4934272523d9e3d33', '18', 'xinyonghu', 'pass@pa.comaaa', '2012-05-02 10:28:18', '127.0.0.1', '2012-05-02 12:10:35');
INSERT INTO `jo_authentication` VALUES ('237e48c454034fca85d1c2f292ec9037', '29', 'sa', null, '2012-08-23 16:25:27', '127.0.0.1', '2012-08-23 16:25:28');
INSERT INTO `jo_authentication` VALUES ('2b9da3e2fcc34dba826dbf8e1aa275c5', '5', 'admin', null, '2012-08-23 00:01:11', '0:0:0:0:0:0:0:1', '2012-08-23 00:06:24');
INSERT INTO `jo_authentication` VALUES ('3007deb25cd94dcda3e850ac802ee872', '29', 'sa', null, '2012-08-23 16:22:18', '127.0.0.1', '2012-08-23 16:23:18');
INSERT INTO `jo_authentication` VALUES ('3971ab2a07724fcf842adc1c500d1ae1', '5', 'admin', null, '2012-08-22 23:38:09', '0:0:0:0:0:0:0:1', '2012-08-22 23:56:52');
INSERT INTO `jo_authentication` VALUES ('48d01318dae84b70b8ee6025719b3171', '9', 'test', '123@123.com', '2012-05-03 11:19:16', '127.0.0.1', '2012-05-03 11:28:10');
INSERT INTO `jo_authentication` VALUES ('4b54c91e542d463b9510aa72c7b9291b', '12', 'yang', 'yang@sina.com', '2012-08-23 11:30:14', '127.0.0.1', '2012-08-23 11:32:11');
INSERT INTO `jo_authentication` VALUES ('51a8bbe324524910bb51eac2b0da4ec3', '5', 'admin', null, '2012-08-23 16:08:38', '127.0.0.1', '2012-08-23 16:09:09');
INSERT INTO `jo_authentication` VALUES ('69b54e32ffaf48409bbfdb60bb733000', '5', 'admin', null, '2012-05-03 10:55:56', '127.0.0.1', '2012-05-03 11:27:09');
INSERT INTO `jo_authentication` VALUES ('733612561972429891d3e8ed62fe9fd0', '9', 'test', '123@123.com', '2012-08-23 15:02:40', '127.0.0.1', '2012-08-23 15:12:41');
INSERT INTO `jo_authentication` VALUES ('759d42085c5749cfa7e76de5c4e1d72e', '19', 'xinxin', 'ad@la.com', '2012-04-19 09:48:58', '127.0.0.1', '2012-04-19 11:33:13');
INSERT INTO `jo_authentication` VALUES ('7760c84dc92d42689819fee173446e78', '5', 'admin', null, '2012-08-23 15:54:04', '127.0.0.1', '2012-08-23 16:07:05');
INSERT INTO `jo_authentication` VALUES ('7bf9f4d431c446c8aa3f94035d11d649', '5', 'admin', null, '2012-08-23 00:00:32', '0:0:0:0:0:0:0:1', '2012-08-23 00:00:33');
INSERT INTO `jo_authentication` VALUES ('7f9dcf59208041188cddd7d35787a849', '6', 'korven', 'jeecms@163.com', '2012-05-02 17:50:06', '127.0.0.1', '2012-05-02 18:04:09');
INSERT INTO `jo_authentication` VALUES ('84b9c779add84c339d0fc870cb92311d', '19', 'xinxin', 'ad@la.com', '2012-04-18 09:41:29', '127.0.0.1', '2012-04-18 16:43:50');
INSERT INTO `jo_authentication` VALUES ('84de8397ce9741a49a6eba7407dd40d7', '5', 'admin', null, '2012-08-23 15:50:52', '127.0.0.1', '2012-08-23 15:52:11');
INSERT INTO `jo_authentication` VALUES ('92020a1ede2247348883184184e1b37b', '5', 'admin', null, '2012-05-02 09:20:53', '127.0.0.1', '2012-05-02 12:18:54');
INSERT INTO `jo_authentication` VALUES ('9913d2da053943ae8911563eee5d23af', '29', 'sa', null, '2012-08-23 16:59:10', '127.0.0.1', '2012-08-23 16:59:29');
INSERT INTO `jo_authentication` VALUES ('a0c03174572f41f3a0c898b68f45439d', '9', 'test', '123@123.com', '2012-08-23 15:19:53', '127.0.0.1', '2012-08-23 15:27:41');
INSERT INTO `jo_authentication` VALUES ('a2b4a46a0f684a35877e96860c4b1282', '5', 'admin', null, '2012-05-03 11:40:45', '127.0.0.1', '2012-05-03 13:35:57');
INSERT INTO `jo_authentication` VALUES ('addeb2dacf624f78acc207e07e2ca40d', '5', 'admin', null, '2012-08-23 00:42:02', '0:0:0:0:0:0:0:1', '2012-08-23 00:56:50');
INSERT INTO `jo_authentication` VALUES ('b16c6ee8813a4004b5a31e890d25cdd8', '12', 'yang', 'yang@sina.com', '2012-08-23 11:27:37', '127.0.0.1', '2012-08-23 11:29:13');
INSERT INTO `jo_authentication` VALUES ('bcf1e070828f4d5cad7f162575c8249e', '5', 'admin', null, '2012-05-02 15:12:38', '127.0.0.1', '2012-05-02 15:26:25');
INSERT INTO `jo_authentication` VALUES ('bd59a64dbe4041feb2f889699d48bfea', '18', 'xinyonghu', 'pass@pa.comaaa', '2012-05-02 17:14:46', '127.0.0.1', '2012-05-02 18:04:55');
INSERT INTO `jo_authentication` VALUES ('bd995cae5590478bbdf55461ebe319c8', '5', 'admin', null, '2012-08-23 12:49:35', '127.0.0.1', '2012-08-23 12:54:56');
INSERT INTO `jo_authentication` VALUES ('cb3b87634bba4a00b6a20f471c055ef1', '5', 'admin', null, '2012-08-23 16:55:10', '127.0.0.1', '2012-08-23 16:58:47');
INSERT INTO `jo_authentication` VALUES ('cbfef381a98849e2abc189ba9aaad20f', '5', 'admin', null, '2012-08-23 15:33:24', '127.0.0.1', '2012-08-23 15:37:25');
INSERT INTO `jo_authentication` VALUES ('cf0bc10031f644ae9444e4930bef0e6f', '5', 'admin', null, '2012-08-23 00:38:56', '0:0:0:0:0:0:0:1', '2012-08-23 00:39:07');
INSERT INTO `jo_authentication` VALUES ('db8cc0e2ec324c1ba1a4285fd6e24288', '5', 'admin', null, '2012-08-22 23:34:56', '0:0:0:0:0:0:0:1', '2012-08-22 23:36:58');
INSERT INTO `jo_authentication` VALUES ('dd54b46b56514a4ab4210abb7fdde92c', '10', 'chen', 'chen@163.com', '2012-05-03 12:00:27', '127.0.0.1', '2012-05-03 13:31:22');
INSERT INTO `jo_authentication` VALUES ('e29784c17c0f41269fe9bbd5e6854e66', '12', 'yang', 'yang@sina.com', '2012-08-23 11:29:13', '127.0.0.1', '2012-08-23 11:29:13');
INSERT INTO `jo_authentication` VALUES ('e56909cc61034ef7bca2dc403b9c11a1', '5', 'admin', null, '2012-08-23 12:25:34', '127.0.0.1', '2012-08-23 12:28:12');
INSERT INTO `jo_authentication` VALUES ('e9357176e80e453b9101190e5f875c7e', '5', 'admin', null, '2012-08-23 13:08:20', '127.0.0.1', '2012-08-23 13:10:13');
INSERT INTO `jo_authentication` VALUES ('f38daf4ce4764861ba087ac8107ff01e', '5', 'admin', 'wudily2010@1631.com', '2012-04-19 13:36:14', '127.0.0.1', '2012-04-19 18:00:43');

-- ----------------------------
-- Table structure for `jo_config`
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', 'utf-8');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.163.com');
INSERT INTO `jo_config` VALUES ('email_password', 'jeecms2012strong');
INSERT INTO `jo_config` VALUES ('email_personal', 'jeecms');
INSERT INTO `jo_config` VALUES ('email_port', null);
INSERT INTO `jo_config` VALUES ('email_username', 'jeecms2012@163.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '2');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:8080/jeebbs3beta/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
INSERT INTO `jo_config` VALUES ('message_register_subject', 'JEECMS会员注册信息');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册JEECMS系统会员\r\n请点击以下链接进行激活\r\nhttp://localhost:8080/jeebbs3beta/active.jspx?username=${username}&key=${activationCode}\r\n');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

-- ----------------------------
-- Table structure for `jo_ftp`
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Records of jo_ftp
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_template`
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of jo_template
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_upload`
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Records of jo_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_user`
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `activation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('5', 'admin', null, '5f4dcc3b5aa765d61d8327deb882cf99', '2011-03-17 12:02:04', '127.0.0.1', '2012-08-23 16:55:10', '127.0.0.1', '161', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('9', 'test', '123@123.com', '202cb962ac59075b964b07152d234b70', '2011-04-11 00:38:08', '127.0.0.1', '2012-08-23 15:19:53', '127.0.0.1', '69', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('10', 'chen', 'chen@163.com', 'a1a8887793acfc199182a649e905daab', '2012-05-03 11:38:45', '127.0.0.1', '2012-05-03 12:00:27', '127.0.0.1', '1', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('23', 'yang', '', '202cb962ac59075b964b07152d234b70', '2012-08-23 12:54:56', '127.0.0.1', '2012-08-23 12:54:56', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('24', 'yang2', '', '202cb962ac59075b964b07152d234b70', '2012-08-23 13:10:13', '127.0.0.1', '2012-08-23 13:10:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('25', 'hhhh', '', '202cb962ac59075b964b07152d234b70', '2012-08-23 15:37:25', '127.0.0.1', '2012-08-23 15:37:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('27', 'test2', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 15:45:32', '127.0.0.1', '2012-08-23 15:45:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('29', 'sa', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:00', '127.0.0.1', '2012-08-23 16:59:10', '127.0.0.1', '4', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('30', 'gzs_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('31', 'chs_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('32', 'zcs_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('33', 'hdq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('34', 'atz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('35', 'lkz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('36', 'wqz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('37', 'ltz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('38', '2011000012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('39', '2011000013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('40', '2011000014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('41', '2011000015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('42', '2011000016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('43', '2011000017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('44', '2011000018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:01', '127.0.0.1', '2012-08-23 16:06:01', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('45', '2011000019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('46', '2011000031', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('47', '2011000032', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('48', '2011000033', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('49', '2011000034', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('50', '2011000035', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('51', '2011000036', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('52', '2011000037', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('53', '2011000038', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('54', '2011000050', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('55', '2011000051', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('56', '2011000052', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('57', '2011000053', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('58', '2011000054', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('59', '2011000055', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('60', '2011000056', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:02', '127.0.0.1', '2012-08-23 16:06:02', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('61', '2011000057', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('62', '2011000058', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('63', '2011000059', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('64', '2011000060', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('65', '2011000061', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('66', '2011000062', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('67', '2011000063', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('68', '2011000075', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('69', '2011000076', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('70', '2011000077', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('71', '2011000078', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('72', '2011000079', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('73', '2011000080', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('74', '2011000081', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('75', '2011000082', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:03', '127.0.0.1', '2012-08-23 16:06:03', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('76', '2011000083', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('77', '2011000084', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('78', '2011000085', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('79', '2011000086', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('80', '2011000087', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('81', '2011000088', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('82', '2011000089', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('83', '2011000090', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('84', '2011000091', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('85', '2011000092', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('86', '2011000093', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('87', '2011000094', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('88', '2011000095', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('89', '2011000096', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('90', '2011000097', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('91', '2011000098', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:04', '127.0.0.1', '2012-08-23 16:06:04', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('92', '2011000099', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('93', '2011000100', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('94', '2011000101', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('95', '2011000102', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('96', '2011000103', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('97', '2011000104', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('98', '2011000105', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('99', '2011000106', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('100', '2011000107', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('101', '2011000108', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('102', '2011000109', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('103', '2011000110', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('104', '2011000111', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:05', '127.0.0.1', '2012-08-23 16:06:05', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('105', '2011000112', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('106', '2011000113', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('107', '2011000114', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('108', '2011000115', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('109', '2011000116', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('110', '2011000117', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('111', '2011000118', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('112', '2011000119', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('113', '2011000120', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('114', '2011000121', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('115', '2011000122', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('116', '2011000133', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('117', '2011000134', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:06', '127.0.0.1', '2012-08-23 16:06:06', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('118', '2011000135', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('119', '2011000136', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('120', '2011000137', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('121', '2011000138', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('122', '2011000139', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('123', '2011000151', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('124', '2011000152', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('125', '2011000153', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('126', '2011000154', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('127', '2011000155', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('128', '2011000156', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('129', '2011000157', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('130', '2011000158', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('131', '2011000159', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:07', '127.0.0.1', '2012-08-23 16:06:07', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('132', '2011000160', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('133', '2011000161', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('134', '2011000162', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('135', '2011000163', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('136', '2011000164', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('137', '2011000165', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('138', '2011000166', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('139', '2011000167', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('140', '2011000168', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('141', '2011000169', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('142', '2011000170', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('143', '2011000182', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('144', '2011000183', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('145', '2011000184', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('146', '2011000185', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('147', '2011000186', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:08', '127.0.0.1', '2012-08-23 16:06:08', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('148', '2011000187', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('149', '2011000188', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('150', '2011000189', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('151', '2011000190', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('152', '2011000191', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('153', '2011000193', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('154', '2011000194', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('155', '2011000195', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('156', '2011000192', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('157', '2011000196', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('158', '2011000197', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('159', '2011000198', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('160', '2011000199', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('161', '2011000200', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('162', '2011000201', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('163', '2011000202', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:09', '127.0.0.1', '2012-08-23 16:06:09', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('164', '2011000203', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('165', '2011000204', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('166', '2011000205', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('167', '2011000206', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('168', 'hzq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:10', '127.0.0.1', '2012-08-23 16:06:10', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('169', 'hpq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('170', 'thq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('171', 'lwq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('172', 'yxq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('173', 'pyq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('174', 'lgq_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('175', '2011000020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('176', '2011000001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('177', '2011000040', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('178', '2011000070', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('179', '2011000130', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('180', '2011000140', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:11', '127.0.0.1', '2012-08-23 16:06:11', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('181', '2011000180', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('182', 'ptz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('183', 'xlz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('184', 'zgz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('185', 'tmz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('186', 'zjz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('187', 'zxz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('188', 'zcz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('189', 'xtz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('190', 'stz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('191', 'lcz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('192', '2011000002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:12', '127.0.0.1', '2012-08-23 16:06:12', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('193', '2011000003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('194', '2011000004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('195', '2011000005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('196', '2011000006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('197', '2011000007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('198', '2011000008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('199', '2011000009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('200', '2011000010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('201', '2011000011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('202', '2011000021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('203', '2011000022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('204', '2011000023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('205', '2011000025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('206', '2011000026', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('207', '2011000027', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('208', '2011000028', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:13', '127.0.0.1', '2012-08-23 16:06:13', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('209', '2011000029', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('210', '2011000024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('211', '2011000030', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('212', '2011000039', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('213', '2011000041', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('214', '2011000042', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('215', '2011000043', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('216', '2011000044', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('217', '2011000045', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('218', '2011000046', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('219', '2011000047', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('220', '2011000048', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('221', '2011000049', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('222', '2011000064', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('223', '2011000065', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('224', '2011000066', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('225', '2011000067', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:14', '127.0.0.1', '2012-08-23 16:06:14', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('226', '2011000068', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('227', '2011000069', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('228', '2011000071', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('229', '2011000072', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('230', '2011000073', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('231', '2011000074', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('232', '2011000123', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('233', '2011000124', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('234', '2011000125', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('235', '2011000126', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('236', '2011000127', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('237', '2011000128', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('238', '2011000129', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('239', '2011000131', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('240', '2011000132', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:15', '127.0.0.1', '2012-08-23 16:06:15', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('241', '2011000141', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('242', '2011000142', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('243', '2011000143', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('244', '2011000144', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('245', '2011000145', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('246', '2011000146', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('247', '2011000147', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('248', '2011000148', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('249', '2011000149', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('250', '2011000150', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('251', '2011000171', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('252', '2011000172', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('253', '2011000173', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('254', '2011000174', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('255', '2011000175', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('256', '2011000176', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('257', '2011000177', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('258', '2011000178', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:16', '127.0.0.1', '2012-08-23 16:06:16', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('259', '2011000179', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('260', '2011000181', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('261', 'tpz_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('262', 'jkjd_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('263', 'jpjd_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('264', 'cjjd_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('265', ' thq_admin ', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('266', '2011001001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('267', '2011001002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('268', '2011001003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('269', '2011001004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('270', '2011001005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('271', '2011001006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('272', '2011001007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('273', '2011001008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('274', '2011001009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('275', '2011001010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:17', '127.0.0.1', '2012-08-23 16:06:17', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('276', '2011001011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('277', '2011001012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('278', '2011001013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('279', '2011001014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('280', '2011001015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('281', '2011001016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('282', '2011001017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('283', '2011001018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('284', '2011001019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('285', '2011001020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('286', '2011001021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('287', '2011001022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('288', '2011001023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('289', '2011001024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('290', '2011001025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('291', '2011001026', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('292', '2011001027', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('293', '2011001028', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:18', '127.0.0.1', '2012-08-23 16:06:18', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('294', '2011001029', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('295', '2011001030', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('296', '2011001031', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('297', '2011001032', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('298', '2011001033', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('299', '2011001034', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('300', '2011001035', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('301', '2011001036', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('302', '2011001037', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('303', '2011001038', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('304', '2011001039', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('305', '2011001040', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('306', '2011001041', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('307', '2011001042', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('308', '2011001043', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('309', '2011001044', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('310', '2011001045', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('311', '2011001046', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:19', '127.0.0.1', '2012-08-23 16:06:19', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('312', '2011001047', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('313', '2011001048', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('314', '2011001049', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('315', '2011001050', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('316', '2011001051', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('317', '2011001052', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('318', '2011001053', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('319', '2011001054', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('320', '2011001055', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('321', '2011001056', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('322', '2011001057', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('323', '2011001058', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('324', '2011001059', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('325', '2011001060', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('326', '2011001061', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('327', '2011001062', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('328', '2011001063', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:20', '127.0.0.1', '2012-08-23 16:06:20', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('329', '2011001064', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('330', '2011001065', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('331', '2011001066', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('332', '2011001067', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('333', '2011001068', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('334', '2011001069', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('335', '2011001070', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('336', '2011001071', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('337', '2011001072', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('338', '2011001073', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:21', '127.0.0.1', '2012-08-23 16:06:21', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('339', '2011001074', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('340', '2011001075', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('341', '2011001076', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('342', '2011001077', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('343', '2011001078', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('344', '2011001079', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('345', '2011001080', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('346', '2011001081', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('347', '2011001082', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('348', '2011001083', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('349', '2011002001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('350', '2011002002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('351', '2011002003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:22', '127.0.0.1', '2012-08-23 16:06:22', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('352', '2011002004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('353', '2011002005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('354', '2011002006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('355', '2011002007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('356', '2011002008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('357', '2011002009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('358', '2011002010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('359', '2011002011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('360', '2011002012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('361', '2011002013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('362', '2011002014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('363', '2011002015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('364', '2011002016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('365', '2011002017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('366', '2011002018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('367', '2011002019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('368', '2011002020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:23', '127.0.0.1', '2012-08-23 16:06:23', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('369', '2011002021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('370', '2011002022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('371', '2011002023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('372', '2011002024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('373', '2011002025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('374', '2011002026', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('375', '2011002027', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('376', '2011002028', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('377', '2011002029', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('378', '2011002030', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('379', '2011002031', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('380', '2011002032', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('381', '2011002033', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('382', '2011002034', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('383', '2011002035', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('384', '2011002036', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('385', '2011002037', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('386', '2011002038', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('387', '2011002039', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:24', '127.0.0.1', '2012-08-23 16:06:24', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('388', '2011002040', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('389', '2011002041', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('390', '2011002042', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('391', '2011002043', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('392', '2011002044', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('393', '2011002045', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('394', '2011002046', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('395', '2011002047', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('396', '2011002048', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('397', '2011002049', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('398', '2011002050', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('399', '2011002051', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('400', '2011002052', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('401', '2011002053', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('402', '2011002054', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('403', '2011002055', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:25', '127.0.0.1', '2012-08-23 16:06:25', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('404', '2011002056', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('405', '2011002057', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('406', '2011002058', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('407', '2011002059', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('408', '2011002060', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('409', '2011002061', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('410', '2011002062', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('411', '2011002063', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('412', '2011002064', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('413', '2011002065', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('414', '2011002066', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('415', '2011002067', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('416', '2011002068', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('417', '2011002069', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('418', '2011002070', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('419', '2011002071', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('420', '2011002072', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('421', '2011002073', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:26', '127.0.0.1', '2012-08-23 16:06:26', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('422', '2011002074', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('423', '2011002075', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('424', '2011002076', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('425', '2011002077', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('426', '2011002078', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('427', '2011002079', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('428', '11', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('429', 'taipin_group', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('430', 'baiyun', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('431', 'chfpb_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('432', 'zcfpb_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('433', '2011002080', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('434', '2011002081', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('435', '2011002082', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('436', '2011002083', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('437', '2011002084', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('438', '2011002085', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('439', '2011002086', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('440', '2011002087', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:27', '127.0.0.1', '2012-08-23 16:06:27', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('441', '2011002088', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('442', '2011002089', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('443', '2011002090', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('444', '2011002091', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('445', '2011002092', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('446', 'lgqfpb_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('447', 'nsqfpb_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('448', '2011002093', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('449', '2011002094', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('450', '2011002095', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('451', 'pyqfpb_admin', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('452', 'by201101001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('453', 'by201101002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('454', 'by201101003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('455', 'by201101004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('456', 'by201101005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('457', 'by201101006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('458', 'by201101007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:28', '127.0.0.1', '2012-08-23 16:06:28', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('459', 'by201101008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('460', 'by201101009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('461', 'by201101010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('462', 'by201101011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('463', 'by201101012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('464', 'by201101013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('465', 'by201101014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('466', 'by201101015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('467', 'by201101016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('468', 'by201101017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('469', 'by201101018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('470', 'by201101019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('471', 'by201101020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('472', 'by201101021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('473', 'by201101022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('474', 'by201101023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('475', 'by201101024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('476', 'by201101025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:29', '127.0.0.1', '2012-08-23 16:06:29', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('477', 'by201101026', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('478', 'by201101027', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('479', 'by201101028', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('480', 'by201101029', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('481', 'by201101030', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('482', 'by201101031', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('483', 'by201101032', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('484', 'by201101033', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('485', 'by201101034', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('486', 'by201101035', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('487', 'by201102001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('488', 'by201102002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('489', 'by201102003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('490', 'by201102004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('491', 'by201102005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('492', 'by201102006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:30', '127.0.0.1', '2012-08-23 16:06:30', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('493', 'by201102007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('494', 'by201102008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('495', 'by201102009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('496', 'by201102010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('497', 'by201102011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('498', 'by201102012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('499', 'by201102013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('500', 'by201102014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('501', 'by201102015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('502', 'by201102016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('503', 'by201102017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('504', 'by201102018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('505', 'by201102019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('506', 'by201102020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('507', 'by201102021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('508', 'by201102022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('509', 'by201102023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:31', '127.0.0.1', '2012-08-23 16:06:31', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('510', 'by201102024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('511', 'by201102025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('512', 'by201103001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('513', 'by201103002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('514', 'by201103003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('515', 'by201103004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:32', '127.0.0.1', '2012-08-23 16:06:32', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('516', 'by201103005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('517', 'by201103006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('518', 'by201103007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('519', 'by201103008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('520', 'by201103009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('521', 'by201103010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('522', 'by201103011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('523', 'by201103012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('524', 'by201103013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('525', 'by201103014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('526', 'by201103015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('527', 'by201103016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('528', 'by201103017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('529', 'by201103018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('530', 'by201103019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:33', '127.0.0.1', '2012-08-23 16:06:33', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('531', 'by201103020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('532', 'by201103021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('533', 'by201104001', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('534', 'by201104002', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('535', 'by201104003', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('536', 'by201104004', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('537', 'by201104005', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('538', 'by201104006', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('539', 'by201104007', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('540', 'by201104008', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('541', 'by201104009', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('542', 'by201104010', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('543', 'by201104011', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('544', 'by201104012', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('545', 'by201104013', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:34', '127.0.0.1', '2012-08-23 16:06:34', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('546', 'by201104014', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('547', 'by201104015', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('548', 'by201104016', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('549', 'by201104017', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('550', 'by201104018', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('551', 'by201104019', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('552', 'by201104020', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('553', 'by201104021', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('554', 'by201104022', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('555', 'by201104023', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('556', 'by201104024', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('557', 'by201104025', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('558', 'by201104026', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('559', 'by201104027', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('560', 'by201104028', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:35', '127.0.0.1', '2012-08-23 16:06:35', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('561', 'by201104029', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('562', 'by201104030', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('563', 'by201104031', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('564', 'by201104032', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('565', 'by201104033', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('566', 'by201104034', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('567', 'by201104035', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('568', 'by201104036', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('569', 'by201104037', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('570', 'renhe', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('571', 'atz_admin2', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('572', 'haizhugzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('573', 'huangpugzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('574', 'liwangzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('575', 'luoganggzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('576', 'yuexiugzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('577', 'tianhegzz', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:36', '127.0.0.1', '2012-08-23 16:06:36', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('578', '2011001084', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('579', '2011001085', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('580', '2011001086', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('581', '2011001087', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('582', '2011001088', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('583', '2011001089', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('584', '2011001090', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('585', '2011001091', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('586', '2011001092', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('587', '2011001093', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('588', '2011001094', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('589', '2011001095', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('590', '2011001096', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('591', '2011001097', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('592', '2011001098', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('593', '2011001099', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('594', '2011001100', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('595', '2011001101', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:37', '127.0.0.1', '2012-08-23 16:06:37', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('596', '2011001102', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('597', '2011001103', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('598', '2011001104', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('599', '2011001106', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('600', '2011001107', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('601', '2011001108', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('602', '2011001109', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('603', '2011001111', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('604', '2011001112', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('605', '2011001113', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('606', '2011001114', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('607', '2011001115', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('608', '2011001116', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('609', '2011001117', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('610', '2011001118', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('611', '2011001119', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('612', '2011001120', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
INSERT INTO `jo_user` VALUES ('613', '2011001121', null, '202cb962ac59075b964b07152d234b70', '2012-08-23 16:06:38', '127.0.0.1', '2012-08-23 16:06:38', '127.0.0.1', '0', null, null, '1', null);
