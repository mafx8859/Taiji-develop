/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_taiji

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-10 12:43:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `content` text COMMENT '活动内容',
  `population` int(20) DEFAULT NULL COMMENT '活动人数限额',
  `provide_meal` varchar(20) DEFAULT NULL COMMENT '是否提供餐饮',
  `provide_hotel` varchar(20) DEFAULT NULL COMMENT '是否提供住宿',
  `need_id_card` varchar(20) DEFAULT NULL COMMENT '是否需要身份证复印件',
  `need_health` varchar(20) DEFAULT NULL COMMENT '是否需要健康证明',
  `need_insurance` varchar(20) DEFAULT NULL COMMENT '是否需要保险证明',
  `need_safe` varchar(20) DEFAULT NULL COMMENT '是否需要安全责任书',
  `sponsor` varchar(100) DEFAULT NULL COMMENT '主办单位',
  `organization` varchar(100) DEFAULT NULL COMMENT '承办单位',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(50) DEFAULT NULL COMMENT '联系qq',
  `time` varchar(50) DEFAULT NULL COMMENT '活动时间',
  `budget` varchar(50) DEFAULT '费用',
  `certificate` varchar(255) DEFAULT NULL COMMENT '证书',
  `who_certificate` varchar(255) DEFAULT NULL COMMENT '证书查看权限',
  `permit` varchar(255) DEFAULT NULL COMMENT '入场证',
  `who_permit` varchar(50) DEFAULT NULL COMMENT '入场证下载权限',
  `year` varchar(50) DEFAULT NULL COMMENT '年份（编号使用）',
  `status` varchar(255) DEFAULT '0' COMMENT '审核状态 0未审核 1通过 2不通过',
  `is_deleted` varchar(11) DEFAULT '1' COMMENT '是否删除 1可用0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('14', '武术段位制培训班—杨式太极拳三段', '                                                                                                                                                      <p class=\"MsoListParagraph\" align=\"left\"><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-bidi-font-family:Arial\">&nbsp; 为了响应国家体育局武术运动管理中心提出的中国武术段位制规范化、标准化进程，</span><span style=\"font-size:12.0pt;font-family:宋体\">进一步提高吉林省太极拳运动水平，分期举办全省太极拳段位制培训班。<span lang=\"EN-US\"><o:p></o:p></span></span><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-bidi-font-family:Arial\"><br></span></p><p class=\"MsoListParagraph\" align=\"left\"><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-bidi-font-family:Arial\">&nbsp; 利用本省以及国内、外知名各式太极拳名家，分段、分拳种进行中国武术段位制套路培训。<span lang=\"EN-US\"><o:p></o:p></span></span>\r\n                            \r\n                            \r\n                            </p>\r\n                            \r\n                            ', '0', '0', '0', '1', '0', '0', '0', '吉林省体育运动管理中心', '吉林省太极拳协会', '13333333333', '133333333', '2018-04-05 到 2018-05-04', '300', null, null, '武术段位制培训班—杨式太极拳三段.pdf', 'self', '2017', null, '1');

-- ----------------------------
-- Table structure for `t_application`
-- ----------------------------
DROP TABLE IF EXISTS `t_application`;
CREATE TABLE `t_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员表ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动表ID',
  `insurance` varchar(200) DEFAULT NULL COMMENT '保险',
  `health` varchar(200) DEFAULT NULL COMMENT '健康证明',
  `meal` varchar(200) DEFAULT NULL COMMENT '订餐',
  `liability` varchar(200) DEFAULT NULL COMMENT '责任书',
  `hotel` varchar(200) DEFAULT NULL COMMENT '住宿',
  `status` varchar(3) DEFAULT '0' COMMENT '审核是否通过',
  `score` varchar(50) DEFAULT '' COMMENT '成绩',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_application
-- ----------------------------
INSERT INTO `t_application` VALUES ('42', '38', '10', null, null, '1', null, '1', '1', '4', '2017-12-21 19:17:43');
INSERT INTO `t_application` VALUES ('43', '41', '10', null, null, '1', null, '1', '1', '', '2017-12-21 19:17:44');
INSERT INTO `t_application` VALUES ('44', '42', '10', null, null, '1', null, '1', '1', '', '2017-12-21 19:17:49');
INSERT INTO `t_application` VALUES ('45', '43', '10', null, null, '1', null, '1', '0', '', '2017-12-21 18:59:59');
INSERT INTO `t_application` VALUES ('46', '46', '17', null, null, '1', null, '1', '1', '', '2018-03-16 17:52:13');
INSERT INTO `t_application` VALUES ('47', '47', '9', null, null, '1', null, '1', '0', '', '2018-03-17 11:38:16');
INSERT INTO `t_application` VALUES ('49', '38', '16', null, null, '1', null, '1', '0', '', '2018-03-29 19:00:54');
INSERT INTO `t_application` VALUES ('50', '50', '14', null, null, '1', null, '1', '2', '1', '2018-04-01 20:55:18');
INSERT INTO `t_application` VALUES ('52', '49', '10', null, null, '1', null, '1', '0', '', '2018-03-29 19:29:47');
INSERT INTO `t_application` VALUES ('54', '42', '16', null, null, '1', null, '1', '0', '', '2018-03-29 19:35:33');
INSERT INTO `t_application` VALUES ('55', '43', '16', null, null, '1', null, '1', '0', '', '2018-03-29 19:35:38');
INSERT INTO `t_application` VALUES ('56', '54', '14', null, null, '0', null, '1', '2', '1', '2018-04-01 20:55:25');
INSERT INTO `t_application` VALUES ('57', '38', '14', null, null, '1', null, '1', '1', '', '2018-04-01 20:55:33');
INSERT INTO `t_application` VALUES ('58', '52', '14', null, null, '1', null, '1', '2', '', '2018-04-01 20:53:55');
INSERT INTO `t_application` VALUES ('60', '41', '14', null, null, '1', null, '1', '0', '', '2018-03-30 14:20:46');

-- ----------------------------
-- Table structure for `t_couch`
-- ----------------------------
DROP TABLE IF EXISTS `t_couch`;
CREATE TABLE `t_couch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `couch_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_couch
-- ----------------------------
INSERT INTO `t_couch` VALUES ('1', '暂无', '0');
INSERT INTO `t_couch` VALUES ('2', '初级', '1');
INSERT INTO `t_couch` VALUES ('3', '中级', '2');
INSERT INTO `t_couch` VALUES ('4', '高级', '3');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `grade_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '暂无', '0');
INSERT INTO `t_grade` VALUES ('2', '段前一级', '1');
INSERT INTO `t_grade` VALUES ('3', '段前二级', '2');
INSERT INTO `t_grade` VALUES ('4', '段前三级', '3');
INSERT INTO `t_grade` VALUES ('5', '一段', '4');
INSERT INTO `t_grade` VALUES ('6', '二段', '5');
INSERT INTO `t_grade` VALUES ('7', '三段', '6');
INSERT INTO `t_grade` VALUES ('8', '四段', '7');
INSERT INTO `t_grade` VALUES ('9', '五段', '8');
INSERT INTO `t_grade` VALUES ('10', '六段', '9');
INSERT INTO `t_grade` VALUES ('11', '七段', '10');
INSERT INTO `t_grade` VALUES ('12', '八段', '11');
INSERT INTO `t_grade` VALUES ('13', '九段', '12');

-- ----------------------------
-- Table structure for `t_guide`
-- ----------------------------
DROP TABLE IF EXISTS `t_guide`;
CREATE TABLE `t_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guide
-- ----------------------------
INSERT INTO `t_guide` VALUES ('1', '9f0abada-eaba-4ab2-880d-8423a7f8e2bd.pdf');

-- ----------------------------
-- Table structure for `t_instructor`
-- ----------------------------
DROP TABLE IF EXISTS `t_instructor`;
CREATE TABLE `t_instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `instructor_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_instructor
-- ----------------------------
INSERT INTO `t_instructor` VALUES ('1', '暂无', '0');
INSERT INTO `t_instructor` VALUES ('2', '国家一级', '1');

-- ----------------------------
-- Table structure for `t_judge`
-- ----------------------------
DROP TABLE IF EXISTS `t_judge`;
CREATE TABLE `t_judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `judge_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_judge
-- ----------------------------
INSERT INTO `t_judge` VALUES ('1', '暂无', '0');
INSERT INTO `t_judge` VALUES ('2', '国际级', '1');
INSERT INTO `t_judge` VALUES ('3', '国家级', '2');
INSERT INTO `t_judge` VALUES ('4', '一级', '3');
INSERT INTO `t_judge` VALUES ('5', '二级', '4');
INSERT INTO `t_judge` VALUES ('6', '三级', '5');

-- ----------------------------
-- Table structure for `t_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `birth` varchar(50) DEFAULT NULL COMMENT '出生年月日',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(2) DEFAULT NULL COMMENT '1男 2女',
  `is_admin` varchar(2) DEFAULT '0' COMMENT '1系统管理员 2单位管理员 3普通会员',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `duty` varchar(100) DEFAULT NULL COMMENT '职务',
  `qualification` varchar(100) DEFAULT NULL COMMENT '学历',
  `political` varchar(100) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `organization` varchar(100) DEFAULT NULL COMMENT '所属单位',
  `is_manager` int(2) DEFAULT '0' COMMENT '是否为单位管理员 1是0否',
  `level` varchar(20) DEFAULT NULL COMMENT '会员级别',
  `performance` text COMMENT '经营范围及主要业绩',
  `dues` text COMMENT '会费缴纳记录',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `company` varchar(50) DEFAULT NULL COMMENT '工作单位',
  `job_title` varchar(50) DEFAULT NULL COMMENT '职称',
  `id_number` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `telephone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `qq` varchar(13) DEFAULT NULL COMMENT 'QQ号',
  `photo` varchar(100) DEFAULT NULL COMMENT '照片',
  `grade` varchar(50) DEFAULT NULL COMMENT '段位',
  `item` varchar(50) DEFAULT NULL COMMENT '晋段项目',
  `grade_num` varchar(100) DEFAULT NULL COMMENT '段位编号',
  `grade_date` varchar(100) DEFAULT NULL COMMENT '段位获证日期',
  `instructed_num` varchar(100) DEFAULT NULL COMMENT '段位指导员编号',
  `instructed_item` varchar(100) DEFAULT NULL COMMENT '指导项目',
  `instructed_date` varchar(200) DEFAULT NULL COMMENT '获证日期',
  `managed_num` varchar(100) DEFAULT NULL COMMENT '段位管理员编号',
  `managed_item` varchar(200) DEFAULT NULL COMMENT '管理项目',
  `managed_date` varchar(200) DEFAULT NULL COMMENT '获证日期',
  `examed_num` varchar(100) DEFAULT NULL COMMENT '段位考评员编号',
  `examed_item` varchar(200) DEFAULT NULL COMMENT '考评项目',
  `examed_date` varchar(200) DEFAULT NULL COMMENT '获证日期',
  `is_judge` varchar(50) DEFAULT NULL COMMENT '是否有裁判员资格 1有0无',
  `judge_number` varchar(20) DEFAULT NULL COMMENT '裁判员证书编号',
  `judge_date` varchar(15) DEFAULT NULL COMMENT '裁判员证书获证日期',
  `is_coach` varchar(50) DEFAULT NULL COMMENT '是否有教练员资格证 1有0无',
  `coach_number` varchar(20) DEFAULT NULL COMMENT '教练员证书编号',
  `coach_date` varchar(20) DEFAULT NULL COMMENT '教练员资格获证日期',
  `is_instructor` varchar(50) DEFAULT NULL COMMENT '是否有社会指导员资格 1有0无',
  `instructor_number` varchar(20) DEFAULT NULL COMMENT '社会指导员资格证书编号',
  `instructor_date` varchar(20) DEFAULT NULL COMMENT '社会指导员整数获证日期',
  `experience` text COMMENT '习练太极拳经历和获奖情况',
  `activity` text COMMENT '参加本协会活动情况',
  `status` varchar(3) DEFAULT '0' COMMENT '审核状态 0未审核 1审核通过 2审核未通过',
  `is_deleted` varchar(2) DEFAULT '1' COMMENT '是否删除 1可用 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('38', '单继重', '1997/10/20', null, '1', '2', 'sjztest', '123', '学生', '3', '1', '740676000@qq.com', '1', null, null, null, null, '长春市,朝阳区', '计算机', '', '123123', '1', '', '', '1', null, '', '', null, null, null, null, null, null, null, null, null, '3', '', '', '0', '', '', '0', '', '', '京津冀                                                                                                \r\n                      \r\n                      \r\n                      \r\n                      ', '柔柔弱弱                                                                                                        \r\n                      \r\n                      \r\n                      \r\n                      ', null, '1');
INSERT INTO `t_member` VALUES ('39', '吴晓阳', '2017/12/24', null, '1', '2', 'wxytest', '123', '测试数据', '1', '1', '测试数据', '8', null, null, null, null, '吉林市,龙潭区', '师大', '教工', '123456', '233333', '12345', '', '0', null, '', '', null, null, null, null, null, null, null, null, null, '0', '', '', '0', '', '', '0', '', '', '刚刚                        \r\n                      ', '解决                          \r\n                      ', null, '1');
INSERT INTO `t_member` VALUES ('41', 'zhang', '1990/10/24', null, '2', '2', 'test01', '123', 'jjjj', '1', '1', '123123123@qq.com', null, null, null, null, null, '???,???', 'hhh', 'kkkk', '123456789', '123456', 'dddd', '', '5', null, '', '', null, null, null, null, null, null, null, null, null, '2', 'ffffff', '', '1', '', '', '1', '', '', '                                                                                                dddd\r\n                      \r\n                      \r\n                      \r\n                      ', '                                                                                                        nnnnn\r\n                      \r\n                      \r\n                      \r\n                      ', null, '1');
INSERT INTO `t_member` VALUES ('44', '系统管理员', '', null, '', '1', 'admin', '123', '', '', '', '', '', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1');
INSERT INTO `t_member` VALUES ('64', '匡匡', '2018/03/13', null, '2', '3', 'kcj', 'kcj', '', '3', '2', '', '3', null, null, null, null, '长春市,南关区', '', '', '11111111111111111', '18443175484', '', '1522464802180.PNG', '0', null, '', '', null, null, null, null, null, null, null, null, null, '0', '', '', '0', '', '', '0', '', '', '                                                \r\n                      <br>\r\n                      \r\n                      ', '                                                      \r\n                      <br>\r\n                      \r\n                      ', null, '1');
INSERT INTO `t_member` VALUES ('65', '刘思东', '1963/01/01', null, '1', '3', 'lsd', '123', '无', '5', '3', '54321', '8', null, null, null, null, '吉林市,船营区', '师大', '教工', '220102', '12345678', '12345', '1522501745790.jpg', '9', null, 'p123456', '2018/02/27', null, null, null, null, null, null, null, null, null, '1', '', '', '1', '', '', '1', '', '', '                                                                                                古古怪怪<br>\r\n                      \r\n                      \r\n                      \r\n                      ', '                                                                                                        哈哈哈哈\r\n                      \r\n                      \r\n                      \r\n                      ', null, '1');
INSERT INTO `t_member` VALUES ('66', '1', '2018/03/19', null, '1', '3', 'wxy', '1', '', '1', '1', '', '8', null, null, null, null, '长春市,朝阳区', '', '', '1', '1', '', '', '0', null, '', '', null, null, null, null, null, null, null, null, null, '0', '', '', '0', '', '', '0', '', '', '                                                                        \r\n                      \r\n                      \r\n                      \r\n                      ', '                                                                                \r\n                      \r\n                      \r\n                      \r\n                      ', null, '1');

-- ----------------------------
-- Table structure for `t_member_organization`
-- ----------------------------
DROP TABLE IF EXISTS `t_member_organization`;
CREATE TABLE `t_member_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member_organization
-- ----------------------------
INSERT INTO `t_member_organization` VALUES ('5', '1', '17');
INSERT INTO `t_member_organization` VALUES ('6', '2', '18');
INSERT INTO `t_member_organization` VALUES ('7', '1', '19');
INSERT INTO `t_member_organization` VALUES ('8', '1', '20');
INSERT INTO `t_member_organization` VALUES ('9', '1', '21');
INSERT INTO `t_member_organization` VALUES ('10', '-2', '22');
INSERT INTO `t_member_organization` VALUES ('11', '-2', '23');
INSERT INTO `t_member_organization` VALUES ('12', '-2', '24');
INSERT INTO `t_member_organization` VALUES ('13', '1', '25');
INSERT INTO `t_member_organization` VALUES ('14', '2', '26');
INSERT INTO `t_member_organization` VALUES ('15', '1', '30');
INSERT INTO `t_member_organization` VALUES ('16', '1', '31');
INSERT INTO `t_member_organization` VALUES ('17', '1', '32');
INSERT INTO `t_member_organization` VALUES ('18', '1', '33');
INSERT INTO `t_member_organization` VALUES ('19', '1', '34');
INSERT INTO `t_member_organization` VALUES ('20', '2', '35');
INSERT INTO `t_member_organization` VALUES ('21', '1', '36');
INSERT INTO `t_member_organization` VALUES ('22', '1', '38');
INSERT INTO `t_member_organization` VALUES ('23', '8', '39');
INSERT INTO `t_member_organization` VALUES ('24', '2', '40');
INSERT INTO `t_member_organization` VALUES ('26', '1', '42');
INSERT INTO `t_member_organization` VALUES ('27', '1', '43');
INSERT INTO `t_member_organization` VALUES ('28', '-2', '45');
INSERT INTO `t_member_organization` VALUES ('29', '1', '48');
INSERT INTO `t_member_organization` VALUES ('30', '1', '49');
INSERT INTO `t_member_organization` VALUES ('31', '1', '50');
INSERT INTO `t_member_organization` VALUES ('32', '1', '51');
INSERT INTO `t_member_organization` VALUES ('33', '1', '52');
INSERT INTO `t_member_organization` VALUES ('34', '2', '53');
INSERT INTO `t_member_organization` VALUES ('35', '2', '55');
INSERT INTO `t_member_organization` VALUES ('36', '1', '56');
INSERT INTO `t_member_organization` VALUES ('37', '3', '57');
INSERT INTO `t_member_organization` VALUES ('38', '-2', '58');
INSERT INTO `t_member_organization` VALUES ('39', '-2', '60');
INSERT INTO `t_member_organization` VALUES ('40', '-2', '61');
INSERT INTO `t_member_organization` VALUES ('41', '1', '62');
INSERT INTO `t_member_organization` VALUES ('42', '-2', '63');
INSERT INTO `t_member_organization` VALUES ('43', '3', '64');
INSERT INTO `t_member_organization` VALUES ('44', '8', '65');
INSERT INTO `t_member_organization` VALUES ('45', '8', '66');

-- ----------------------------
-- Table structure for `t_organization`
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `address` varchar(200) DEFAULT NULL COMMENT '单位地址',
  `department` varchar(200) DEFAULT NULL COMMENT '主管部门',
  `qq_group` varchar(20) DEFAULT NULL COMMENT 'QQ群号',
  `principal1` varchar(200) DEFAULT NULL COMMENT '负责人1 对应会员表ID',
  `job1` varchar(200) DEFAULT NULL COMMENT '负责人1 职务',
  `title1` varchar(200) DEFAULT NULL COMMENT '负责人1 职称',
  `tel1` varchar(200) DEFAULT NULL COMMENT '负责人1 联系方式',
  `principal2` varchar(200) DEFAULT NULL COMMENT '负责人2',
  `job2` varchar(200) DEFAULT NULL COMMENT '负责人2 职务',
  `title2` varchar(200) DEFAULT NULL COMMENT '负责人2 职称',
  `tel2` varchar(200) DEFAULT NULL COMMENT '负责人2 联系方式',
  `admin` int(11) DEFAULT NULL COMMENT '管理员',
  `performance` text COMMENT '经营范围及业绩',
  `dues` text COMMENT '会费缴纳记录',
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES ('1', '教育部东北师范大学', '吉林省长春市净月大街', '教育部', '123123123123', '张三', '教师', '教授', '13459565478', '李四22', '教师', '副教授', '13459565478', '38', '                                                                                                                                                                                                                                                不不不\r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            ', '                                                                                                                                                                                                                                                是是是\r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            ', '1');
INSERT INTO `t_organization` VALUES ('2', '吉林大学', '吉林省长春市', '长春都是我的', '123321', '张国庆', '校长', '教授', '138771984891', '李哈哈', '教师', '教授', '138771984891', '39', '                              请在此输入...\r\n                            ', '                              请在此输入...\r\n                            ', '1');
INSERT INTO `t_organization` VALUES ('3', '三里屯美术学院', '三里屯', null, '123456789', '单继重', '老师', '高级', '123', '吴晓阳', '老师2', '高级2', '456', null, '                        请在此输入...\r\n                      ', '                        请在此输入...\r\n                      ', '1');
INSERT INTO `t_organization` VALUES ('7', '太极拳研究会', '长春市', '长春市民政局', '23456', '呵呵呵', '解决', '理论', '456789', '那你呢', '别别别', '你你你', '123456', null, '扭扭捏捏', '                        灌灌灌灌灌', '2');
INSERT INTO `t_organization` VALUES ('8', '区武术馆', '白城市', '市民政局', '23456', '呵呵呵', '解决', '理论', '456789', '那你呢', '别别别', '你你你', '456789', '-1', '                              对对对\r\n                            ', '                              嘎嘎嘎\r\n                            ', '1');
