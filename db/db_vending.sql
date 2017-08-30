/*
Navicat MySQL Data Transfer

Source Server         : cluster
Source Server Version : 50616
Source Host           : rdsvp8brw4q4nfjwghqcq.mysql.rds.aliyuncs.com:3306
Source Database       : db_vending

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2017-08-30 13:57:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司',
  `linkman` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `is_valid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `pid` int(11) DEFAULT NULL COMMENT '父级用户id\n            当用户角色为推广员时，并且level>1时需要填写父级推广员id，level=1的推广员表示一级推广员无需填写',
  `level` tinyint(4) DEFAULT NULL COMMENT '推广员级别：\r\n -1超级管理员\r\n 0运维人员\r\n 1一级推广员\r\n 2二级推广员\r\n 3三级推广员\r\n 4权重账号管理员（没有父级用户）',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='后台管理用户';

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO `tb_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', null, '-1', '2015-04-08 11:04:07', '2016-04-27 15:23:40');
INSERT INTO `tb_admin_user` VALUES ('2', '运维人员', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '1', '0', '2015-04-08 11:39:11', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_user` VALUES ('3', '一级推广员', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '2', '1', '2015-04-08 11:40:22', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_user` VALUES ('4', '二级推广员', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '3', '2', '2015-04-08 11:40:25', '2015-04-20 23:53:34');
INSERT INTO `tb_admin_user` VALUES ('5', '三级推广员', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '4', '3', '2015-04-08 11:40:27', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_user` VALUES ('6', 'test1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '1', '0', '2015-04-08 11:40:30', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_user` VALUES ('14', 'test2', 'e10adc3949ba59abbe56e057f20f883e', 'asdf', 'sdf', '1111', '', '1', '6', '1', '2015-04-09 14:10:45', '2015-04-09 14:10:45');
INSERT INTO `tb_admin_user` VALUES ('23', '掌通无线', 'e10adc3949ba59abbe56e057f20f883e', 'Tianjin Zhangtong Wireless Technology Co.,Ltd.', '12', '12', '12', '1', '1', '0', '2015-04-21 15:34:59', '2015-04-21 15:34:59');
INSERT INTO `tb_admin_user` VALUES ('24', '李江涛', 'e10adc3949ba59abbe56e057f20f883e', '李江涛', '李江涛', '李江涛', '李江涛', '1', '23', '1', '2015-04-21 15:35:51', '2015-04-21 15:35:51');
INSERT INTO `tb_admin_user` VALUES ('25', '云睿民', 'e10adc3949ba59abbe56e057f20f883e', '云睿民', '云睿民', '云睿民', '云睿民', '1', '23', '1', '2015-04-21 15:36:14', '2015-04-21 15:36:14');
INSERT INTO `tb_admin_user` VALUES ('26', '李俊龙', 'e10adc3949ba59abbe56e057f20f883e', '李俊龙', '李俊龙', '李俊龙', '李俊龙', '1', '24', '2', '2015-04-21 15:37:11', '2015-04-21 15:37:11');
INSERT INTO `tb_admin_user` VALUES ('27', '石向阳', 'e10adc3949ba59abbe56e057f20f883e', '石向阳', '石向阳', '石向阳', '石向阳', '1', '24', '2', '2015-04-21 15:37:32', '2015-04-21 15:37:32');
INSERT INTO `tb_admin_user` VALUES ('28', '李妍', 'e10adc3949ba59abbe56e057f20f883e', '李妍', '李妍', '李妍', '李妍', '1', '26', '3', '2015-04-21 15:38:31', '2015-04-21 15:38:31');
INSERT INTO `tb_admin_user` VALUES ('29', '康文清', 'e10adc3949ba59abbe56e057f20f883e', '康文清', '康文清', '康文清', '康文清', '1', '26', '3', '2015-04-21 15:38:46', '2015-04-21 15:38:46');
INSERT INTO `tb_admin_user` VALUES ('30', '翟秀英', 'e10adc3949ba59abbe56e057f20f883e', '翟秀英', '翟秀英', '翟秀英', '翟秀英', '1', '26', '3', '2015-04-21 15:39:02', '2015-04-21 15:39:02');
INSERT INTO `tb_admin_user` VALUES ('32', '权重账号管理员', 'e10adc3949ba59abbe56e057f20f883e', '天津掌通无线科技有限公司', '陈双源', '123', '', '1', null, '4', '2015-05-10 01:34:24', '2015-05-10 13:55:18');
INSERT INTO `tb_admin_user` VALUES ('35', 'system', '', '', null, null, '预留关键字，勿删', '0', null, null, '2015-04-10 11:09:22', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_user` VALUES ('36', '123', '202cb962ac59075b964b07152d234b70', null, null, null, null, '1', null, null, '2016-09-28 17:24:44', '2016-09-28 17:24:44');
INSERT INTO `tb_admin_user` VALUES ('37', '1234', '202cb962ac59075b964b07152d234b70', null, null, null, null, '1', null, null, '2016-09-28 17:26:11', '2016-09-28 17:26:11');
INSERT INTO `tb_admin_user` VALUES ('38', '123456', '202cb962ac59075b964b07152d234b70', null, null, null, null, '1', null, null, '2016-09-28 17:27:23', '2016-09-28 17:27:23');
INSERT INTO `tb_admin_user` VALUES ('39', '12', '202cb962ac59075b964b07152d234b70', null, null, null, null, '1', null, null, '2016-09-28 17:29:27', '2016-09-28 17:29:27');

-- ----------------------------
-- Table structure for `tb_authority`
-- ----------------------------
DROP TABLE IF EXISTS `tb_authority`;
CREATE TABLE `tb_authority` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of tb_authority
-- ----------------------------
INSERT INTO `tb_authority` VALUES ('10', '-10', null, null, '查询', '2015-05-03 18:09:54', '2015-05-03 18:09:54');
INSERT INTO `tb_authority` VALUES ('11', 'A_USER', '/search/search_user', '10', '用户概览', '2014-12-08 22:59:25', '2014-12-08 22:59:25');
INSERT INTO `tb_authority` VALUES ('12', 'A_QUICK_TASK', '/search/quick_task', '10', '快速任务', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority` VALUES ('13', 'A_ADS_TASK', '/search/general_task', '10', '常规任务', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority` VALUES ('14', 'A_QUERY_MEMBER', '/search/member_list', '10', '成员查询', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority` VALUES ('15', 'A_QUERY_PERFORM', '/search/search_performance', '10', '业绩查询', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority` VALUES ('20', '-20', null, null, '管理', '2015-05-03 18:11:55', '2015-05-03 18:11:55');
INSERT INTO `tb_authority` VALUES ('21', 'A_EXCEPT_ACCOUNT', '/account/exception', '20', '异常帐号', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority` VALUES ('22', 'A_CREATE_ADMIN', '/account/create', '20', '创建账号', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('23', 'A_ADMIN_LIST', '/account/list', '20', '成员信息', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('24', 'A_USER_BLACK', '/account/backlist', '20', '黑名单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('25', 'A_USER_WEIGHT', '/weightAccount/weight_account_list.jsp', '20', '权重账号', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('30', '-30', null, null, '发布', '2015-05-03 18:14:14', '2015-05-03 18:14:14');
INSERT INTO `tb_authority` VALUES ('31', 'A_TASK_PUBLISH', '/task/published', '30', '已发布任务', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('32', 'A_QUICK_TASK_ADD', '/task/published/create', '30', '添加快速任务', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('33', 'A_ADS_LIST', '/task/normal', '30', '联盟平台', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('34', 'A_ADS_ADD', '/task/normal/add', '30', '发布平台', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('40', '-40', null, null, '兑换', '2015-05-03 18:14:14', '2015-05-03 18:14:14');
INSERT INTO `tb_authority` VALUES ('41', 'A_ORDER_AUDIT', '/bill/checked/list', '40', '审核订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('42', 'A_ORDER_DELAY', '/bill/delayed/list', '40', '推迟订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('43', 'A_ORDER_EXCEPT', '/bill/wrong/list', '40', '异常订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('44', 'A_ORDER_RECHARGE', '/bill/recharged/list', '40', '充值订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('45', 'A_ORDER_QUERY', '/bill/searched/list', '40', '查询订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority` VALUES ('50', 'A_NOTICE', '/notice/list', null, '公告', '2015-05-03 18:14:15', '2015-05-03 18:14:15');

-- ----------------------------
-- Table structure for `tb_authority_bak`
-- ----------------------------
DROP TABLE IF EXISTS `tb_authority_bak`;
CREATE TABLE `tb_authority_bak` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_authority_bak
-- ----------------------------
INSERT INTO `tb_authority_bak` VALUES ('11', 'A_USER', '用户概览', '2014-12-08 22:59:25', '2014-12-08 22:59:25');
INSERT INTO `tb_authority_bak` VALUES ('12', 'A_QUICK_TASK', '快速任务', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority_bak` VALUES ('13', 'A_ADS_TASK', '常规任务', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority_bak` VALUES ('14', 'A_QUERY_MEMBER', '成员查询', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority_bak` VALUES ('15', 'A_QUERY_PERFORM', '业绩查询', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority_bak` VALUES ('21', 'A_EXCEPT_ACCOUNT', '异常帐号', '2015-04-19 23:39:07', '2015-04-19 23:39:07');
INSERT INTO `tb_authority_bak` VALUES ('22', 'A_CREATE_ADMIN', '创建账号', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('23', 'A_ADMIN_LIST', '成员信息', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('24', 'A_USER_BLACK', '黑名单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('25', 'A_USER_WEIGHT', '权重账号', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('31', 'A_TASK_PUBLISH', '已发布任务', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('32', 'A_QUICK_TASK_ADD', '添加快速任务', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('33', 'A_ADS_LIST', '联盟平台', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('34', 'A_ADS_ADD', '发布平台', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('41', 'A_ORDER_AUDIT', '审核订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('42', 'A_ORDER_DELAY', '推迟订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('43', 'A_ORDER_EXCEPT', '异常订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('44', 'A_ORDER_RECHARGE', '充值订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('45', 'A_ORDER_QUERY', '查询订单', '2015-04-19 23:53:16', '2015-04-19 23:53:16');
INSERT INTO `tb_authority_bak` VALUES ('51', 'A_NOTICE', '公告', '2015-04-19 23:53:16', '2015-04-19 23:53:16');

-- ----------------------------
-- Table structure for `tb_comm_mem_cash`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm_mem_cash`;
CREATE TABLE `tb_comm_mem_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(40) NOT NULL COMMENT '掌通订单号',
  `description` varchar(128) NOT NULL COMMENT '当前订单的详细描述',
  `openid` varchar(60) DEFAULT NULL COMMENT '用户唯一标志',
  `real_name` varchar(20) DEFAULT NULL COMMENT '用户真实姓名，用于微信验证收款人身份，可为空',
  `amount` int(11) NOT NULL COMMENT '充值提现金额（单位：分）',
  `totalcredits` double(20,0) NOT NULL COMMENT '用户的余额（当前交易之前）',
  `status` tinyint(2) DEFAULT NULL COMMENT '0：申请\n                        1：审核通过，处理中           2：推迟\n                        3：账号异常，拒绝，此时拒绝原因写入充值结果字段\n                4、订单失败    9、充值成功',
  `operate_time` datetime DEFAULT NULL COMMENT '充值时间',
  `operate_result` varchar(200) DEFAULT NULL COMMENT '充值结果',
  `operator` int(11) DEFAULT NULL COMMENT '充值操作员，运营人员id。0代表系统处理',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `alipay_account` varchar(256) DEFAULT NULL COMMENT '支付宝账号',
  `type` tinyint(2) DEFAULT NULL COMMENT '1：微信 0 ：支付宝',
  `token` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `orderid` (`orderid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='提现';

-- ----------------------------
-- Records of tb_comm_mem_cash
-- ----------------------------
INSERT INTO `tb_comm_mem_cash` VALUES ('1', '10ffa4f6-eed7-4929-a3d5-e0c2eaf23dcb', '微信提现：50元', 'ooFMmsw3B3bk4_4VTx-G_flUp_AQ', '张一天', '50', '450', '2', null, null, '0', '2017-07-10 22:47:58', '', '1', '0b12296544fd42d19db82a380b8b3fef');
INSERT INTO `tb_comm_mem_cash` VALUES ('2', 'ac9a9333-e286-4ada-bc59-a9f9418263f2', '微信提现：10元', 'ooFMmsw3B3bk4_4VTx-G_flUp_AQ', '张一天', '10', '400', '2', null, null, '0', '2017-07-10 22:48:40', '', '1', '0b12296544fd42d19db82a380b8b3fef');
INSERT INTO `tb_comm_mem_cash` VALUES ('3', '1df0d371-6a06-41db-9728-502465770e5f', '微信提现：10元', 'ooFMmsw3B3bk4_4VTx-G_flUp_AQ', '张一天', '10', '390', '2', null, null, '0', '2017-07-10 22:48:56', '', '1', '0b12296544fd42d19db82a380b8b3fef');
INSERT INTO `tb_comm_mem_cash` VALUES ('4', 'ab3c6fc0-cc06-4b67-9cee-951fbb20d362', '支付宝提现：50元', '', '��һ��', '50', '380', '2', null, null, '0', '2017-07-11 12:14:13', null, '0', '0b12296544fd42d19db82a380b8b3fef');
INSERT INTO `tb_comm_mem_cash` VALUES ('5', 'b76e50a5-b9f2-4012-aa8b-0757c4a5f8b2', '支付宝提现：10元', '', '王艺锦', '10', '30', '2', null, null, '0', '2017-07-20 10:45:37', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('6', '46ca3bb7-ac6b-4830-a043-298c5a149527', '支付宝提现：10元', '', '王艺锦', '10', '20', '2', null, null, '0', '2017-07-20 10:48:15', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('7', '244ec7e6-b911-47ba-b780-baa7d5b5a6da', '支付宝提现：10元', '', '王艺锦', '10', '10', '2', null, null, '0', '2017-07-20 10:51:31', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('8', '73bac0e2-bf9a-4e3a-8e2e-69d47e8f4464', '支付宝提现：10元', '', '姚远', '10', '100', '2', null, null, '0', '2017-07-20 17:09:34', '18500999562', '0', 'ae4bc254ea0b4ee4b2ea4118edd7a5d9');
INSERT INTO `tb_comm_mem_cash` VALUES ('9', '18be0c7b-0a58-485e-b089-927597e6f518', '支付宝提现：10元', '', '王艺锦', '10', '30', '2', null, null, '0', '2017-07-24 15:16:17', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('10', '0bac7ab6-865c-4202-a345-f49d809b70df', '支付宝提现：10元', '', '王艺锦', '10', '20', '2', null, null, '0', '2017-07-24 15:20:28', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('11', '7c168568-bebf-4379-9d55-b4193222c440', '支付宝提现：10元', '', '王艺锦', '10', '10', '2', null, null, '0', '2017-07-24 15:20:35', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('12', 'e708a9d9-3560-4465-b898-f7b1132f997b', '支付宝提现：10元', '', '王艺锦', '10', '1000', '0', '2017-07-25 13:12:06', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-24 15:28:26', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('13', '3380bad7-2a16-4752-b300-673cbc16ed16', '支付宝提现：10元', '', '王艺锦', '10', '990', '2', null, null, '0', '2017-07-24 15:32:43', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('14', '0a8ce8a0-b38e-4063-96e9-42575f84f850', '支付宝提现：10元', '', '王艺锦', '10', '980', '2', null, null, '0', '2017-07-24 15:33:52', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('15', '5256744b-8846-4ce9-82f8-9d2397f8b2f9', '支付宝提现：10元', '', '姚远', '10', '90', '2', null, null, '0', '2017-07-24 16:33:51', '18500999562', '0', 'ae4bc254ea0b4ee4b2ea4118edd7a5d9');
INSERT INTO `tb_comm_mem_cash` VALUES ('16', '3639e729-6a03-4f6c-b193-f89436d62d98', '支付宝提现：10元', '', '姚远', '10', '80', '2', null, null, '0', '2017-07-24 16:34:01', '18500999562', '0', 'ae4bc254ea0b4ee4b2ea4118edd7a5d9');
INSERT INTO `tb_comm_mem_cash` VALUES ('17', 'bf396683-58c9-4a4c-8d36-00115f33e1e2', '支付宝提现：10元', '', '王艺锦', '10', '970', '2', null, null, '0', '2017-07-24 16:46:18', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('18', 'f2763090-985f-4f57-bd12-8281df4544db', '支付宝提现：10元', '', '王艺锦', '10', '960', '2', null, null, '0', '2017-07-24 16:46:39', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('19', '7843f653-688a-43d2-a4e7-412249b1e46f', '支付宝提现：10元', '', '王艺锦', '10', '950', '0', '2017-07-25 10:29:55', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 10:20:34', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('20', '07a50950-e32e-457a-befb-681d8be2aabf', '支付宝提现：10元', '', '王艺锦', '10', '940', '0', '2017-07-25 11:08:43', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:03:11', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('21', 'b84e068c-0219-4b7d-aebd-dfc2d9d4a5ab', '支付宝提现：10元', '', '王艺锦', '10', '930', '0', '2017-07-25 11:19:20', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:16:02', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('22', '2edfacf1-c56b-4d86-ae7f-afb44ef11894', '支付宝提现：10元', '', '王艺锦', '10', '920', '0', '2017-07-25 11:21:34', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:20:38', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('23', '9e87f559-9a52-4e95-a1c7-dda63b748ed4', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 11:24:22', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:23:09', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('24', 'd8ef4bef-af1b-4120-9a99-48486095686a', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 11:27:34', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:26:38', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('25', '0703d585-6b4b-4a3e-9638-0e1c77425c81', '支付宝提现：10元', '', '姚远', '10', '70', '0', '2017-07-25 11:35:15', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:33:34', '18500999562', '0', 'ae4bc254ea0b4ee4b2ea4118edd7a5d9');
INSERT INTO `tb_comm_mem_cash` VALUES ('26', 'b34e0484-b09e-47aa-9ff1-770c3d2369a2', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 11:41:28', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 11:37:44', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('27', '43449c63-4bce-44fc-adf7-653f3e0f60ca', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 11:44:26', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 11:43:22', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('28', '9e97751f-9fa1-4218-bad4-843d5dab0c95', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 11:46:34', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 11:44:38', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('29', '7d643f0a-fcd2-43a5-870e-1f4cc3df2f86', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 11:49:23', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 11:48:26', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('30', 'd1db90e5-9dc3-42f5-8287-4226adc35c6e', '支付宝提现：10元', '', '王瑛琦', '10', '900', '0', '2017-07-25 11:56:08', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 11:53:48', 'knq_007@163.com', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('31', '3ce6a565-c6cc-48f1-8f2e-9bb3be707235', '支付宝提现：10元', '', '王瑛琦', '10', '900', '0', '2017-07-25 11:58:25', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 11:57:37', 'knq_007@163.com', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('32', 'f6f090ee-aeaf-45bf-acc4-e0893928df19', '支付宝提现：10元', '', '康士豪', '10', '900', '0', '2017-07-25 12:02:02', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 12:00:47', '18519102403', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('33', 'd62d4989-3a19-4056-8996-4919b96744c9', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 12:15:27', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 12:14:33', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('34', 'c389b5c5-7363-40a0-a92e-5356d50866ed', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 12:17:34', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 12:16:31', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('35', '0640c2a3-5350-4985-be10-84c5bbc1e05f', '支付宝提现：10元', '', '王艺锦', '10', '900', '0', '2017-07-25 13:10:50', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 12:25:04', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('36', '08fbbc9e-e7ca-4eb2-ae76-ed5efded81fd', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 13:16:58', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 13:14:43', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('37', '7ae4198e-ed91-42be-b18b-1a8481eea1f5', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 13:34:35', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 13:33:10', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('38', '245bd3f9-0544-4986-bb53-6565b249eae6', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 13:39:22', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 13:36:54', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('39', '9c72937f-d53f-47a5-bded-7ae2b74d1533', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 13:47:39', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 13:46:16', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('40', '59778eb6-1c26-42f5-b33a-2124b905400b', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:00:16', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 13:58:58', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('41', 'fc2fbe00-d993-4afe-8bf2-ff2c2adfaa6e', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:01:37', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 14:00:37', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('42', '2bb3c903-24a7-4315-a6a2-ac05237bdbe8', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:05:09', '转账失败，错误代码：PAYEE_NOT_EXIST，错误信息：收款账号不存在', '0', '2017-07-25 14:03:32', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('43', 'eaed1b22-4f6e-4b69-930d-6310ba2f1811', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:07:26', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 14:06:21', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('44', 'ba0b3977-95c3-464c-a755-90a5430dfa01', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:08:40', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 14:07:35', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('45', '7d46c0c0-26ae-4785-85a1-43f7163f3b80', '支付宝提现：10元', '', '王艺锦', '10', '910', '0', '2017-07-25 14:17:06', '转账失败，错误代码：isp.unknow-error，错误信息：系统繁忙', '0', '2017-07-25 14:15:34', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('46', '998cf264-4bec-4dc9-b5d8-3e9f8d689fb7', '支付宝提现：10元', '', '王艺锦', '10', '910', '1', '2017-07-25 14:20:18', '支付宝体现：1', '0', '2017-07-25 14:18:38', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('47', '9cc2ddd3-c100-4c4c-8123-a6dc46048bd9', '支付宝提现：10元', '', '王艺锦', '10', '900', '1', '2017-07-25 14:26:54', '支付宝体现：1', '0', '2017-07-25 14:25:38', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('48', 'b03aced1-f7b7-4bed-8033-194c3f5cd085', '支付宝提现：10元', '', '王艺锦', '10', '890', '1', '2017-07-25 14:45:54', '确认到账: 支付宝订单号:20170725110070001500450000000003', '0', '2017-07-25 14:41:45', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('49', '4010a414-a620-483d-aa92-120bd99158b5', '支付宝提现：10元', '', '王艺锦', '10', '880', '1', '2017-07-25 14:49:33', '确认到账: 支付宝订单号:20170725110070001500450000001005', '0', '2017-07-25 14:49:09', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('50', '13074a40-a20b-460e-8e73-2e50be177875', '支付宝提现：10元', '', '王艺锦', '10', '870', '1', '2017-07-25 14:53:09', '确认到账: 支付宝订单号:20170725110070001500450000001006', '0', '2017-07-25 14:50:58', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('51', '6603f237-e33b-4fc5-908a-611fc383e7c9', '支付宝提现：10元', '', '王艺锦', '10', '860', '1', '2017-07-25 15:58:51', '确认到账: 支付宝订单号:20170725110070001502780005274281', '0', '2017-07-25 15:00:25', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('52', '72160c69-8b61-4a51-8525-38328e103805', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '850', '0', '2017-07-26 10:25:13', '转账失败，错误代码：PARAM_ERROR，错误信息：参数错误:spbill_create_ip必须是合法的IP字符串.', '0', '2017-07-26 10:09:21', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('53', '55917ab9-36ca-4c2b-b840-5c9c04db29bc', '支付宝提现：10元', '', '王艺锦', '1', '850', '0', '2017-07-26 12:21:37', '审核异常', '0', '2017-07-26 10:33:15', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('54', '57978236-91c6-4caa-b0d0-70ada5b4d3ca', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '840', '0', '2017-07-26 10:50:44', '转账失败，错误代码：PARAM_ERROR，错误信息：参数错误:spbill_create_ip必须是合法的IP字符串.', '0', '2017-07-26 10:49:56', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('55', '949f63a7-9937-46c9-bd98-8153ae315660', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '840', '0', '2017-07-26 10:53:18', '转账失败，错误代码：PARAM_ERROR，错误信息：参数错误:单号必须为33位以下的数字或字母', '0', '2017-07-26 10:51:16', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('56', '22f7126e-264e-462c-8bc5-28055a2de34f', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '840', '0', '2017-07-26 11:00:01', '转账失败，错误代码：CA_ERROR，错误信息：CA证书出错，请登录微信支付商户平台下载证书', '0', '2017-07-26 10:58:47', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('57', '8a5426d2-7594-4184-b3d2-253a1b4d203e', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '840', '0', '2017-07-26 11:08:46', '转账失败，错误代码：AMOUNT_LIMIT，错误信息：付款金额超出限制。低于最小金额1.00元或累计超过20000.00元。', '0', '2017-07-26 11:07:14', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('58', '8a23335a-d457-4412-9bd0-9392d57c0b3f', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '840', '1', '2017-07-26 11:13:03', '支付宝体现：1', '0', '2017-07-26 11:11:52', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('59', 'e399e6e098df42179451aed4822823d1', '微信提现：10元', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '王艺锦', '10', '831', '1', '2017-07-26 13:23:35', '确认到账: 微信订单号:1000018301201707268706772491', '0', '2017-07-26 13:21:41', '', '1', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('60', '774543562e954d01b2379d6bf1171edd', '支付宝提现：10元', '', '王艺锦', '10', '821', '1', '2017-07-26 13:23:25', '确认到账: 支付宝订单号:20170726110070001502780005299257', '0', '2017-07-26 13:21:58', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('61', '4b40b914fc014e4e9185f4f0bc80ed27', '支付宝提现：10元', '', '王艺锦', '1', '811', '1', '2017-07-26 16:03:18', '确认到账: 支付宝订单号:20170726110070001502780005280356', '0', '2017-07-26 15:55:55', '13552886455', '0', '2e9d442f78a1420f88a38b52d8b96b80');
INSERT INTO `tb_comm_mem_cash` VALUES ('62', '856e1af97c094d599e9602107fc8e15b', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙轩', '10', '100', '2', null, null, '0', '2017-07-28 11:18:00', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('63', 'dcec643e7b744cc3b983694d43fecf28', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙轩', '10', '90', '0', '2017-07-28 17:13:53', '转账失败，错误代码：NOTENOUGH，错误信息：余额不足', '0', '2017-07-28 11:18:10', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('64', 'e20ee60fe66b496e845ddbb743164a25', '支付宝提现：10元', '', '孙轩', '10', '80', '1', '2017-07-28 17:11:47', '确认到账: 支付宝订单号:20170728110070001502780005358509', '0', '2017-07-28 17:10:11', 'xuansun@126.com', '0', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('65', 'd8f9003f618749eaa88b86cf625672e5', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙', '10', '80', '0', '2017-07-28 18:06:27', '转账失败，错误代码：NAME_MISMATCH，错误信息：真实姓名不一致.', '0', '2017-07-28 18:05:56', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('66', '932ffdad61b14f8cb73d946cdfc32625', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '张泽', '10', '80', '0', '2017-07-28 18:07:06', '转账失败，错误代码：NAME_MISMATCH，错误信息：真实姓名不一致.', '0', '2017-07-28 18:06:59', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('67', '6a6625238c194f6791673b68c25521cb', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙轩', '10', '80', '0', '2017-07-28 18:07:36', '转账失败，错误代码：NOTENOUGH，错误信息：余额不足', '0', '2017-07-28 18:07:29', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');
INSERT INTO `tb_comm_mem_cash` VALUES ('68', '20318daecddc4756be28048977161c5e', '微信提现：10元', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙轩', '1', '80', '1', '2017-07-28 18:17:58', '确认到账: 微信订单号:1000018301201707288739833415', '0', '2017-07-28 18:08:48', '', '1', '0c1b29884973438f9dd4ea97c42e5e9b');

-- ----------------------------
-- Table structure for `tb_comm_mem_cash_approve`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm_mem_cash_approve`;
CREATE TABLE `tb_comm_mem_cash_approve` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(40) NOT NULL COMMENT '订单号',
  `ordernum` varchar(40) NOT NULL,
  `result` varchar(20) NOT NULL COMMENT '审核结果，对应提现充值记录表里的status',
  `description` varchar(200) DEFAULT NULL COMMENT '结果描述',
  `operator` int(11) NOT NULL COMMENT '操作员',
  `approve_time` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='提现\n营运人员每操作一次（比如申请订单，推迟，审核通过等），记入一条记录，并需要更改提现';

-- ----------------------------
-- Records of tb_comm_mem_cash_approve
-- ----------------------------
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('1', '10ffa4f6-eed7-4929-a3d5-e0c2eaf23dcb', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-10 22:47:58');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('2', 'ac9a9333-e286-4ada-bc59-a9f9418263f2', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-10 22:48:40');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('3', '1df0d371-6a06-41db-9728-502465770e5f', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-10 22:48:56');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('4', 'ab3c6fc0-cc06-4b67-9cee-951fbb20d362', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-11 12:14:13');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('5', 'b76e50a5-b9f2-4012-aa8b-0757c4a5f8b2', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-20 10:45:37');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('6', '46ca3bb7-ac6b-4830-a043-298c5a149527', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-20 10:48:15');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('7', '244ec7e6-b911-47ba-b780-baa7d5b5a6da', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-20 10:51:31');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('8', '73bac0e2-bf9a-4e3a-8e2e-69d47e8f4464', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-20 17:09:34');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('9', '18be0c7b-0a58-485e-b089-927597e6f518', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:16:17');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('10', '0bac7ab6-865c-4202-a345-f49d809b70df', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:20:28');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('11', '7c168568-bebf-4379-9d55-b4193222c440', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:20:35');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('12', 'e708a9d9-3560-4465-b898-f7b1132f997b', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:28:26');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('13', '3380bad7-2a16-4752-b300-673cbc16ed16', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:32:43');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('14', '0a8ce8a0-b38e-4063-96e9-42575f84f850', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 15:33:52');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('15', '5256744b-8846-4ce9-82f8-9d2397f8b2f9', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 16:33:51');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('16', '3639e729-6a03-4f6c-b193-f89436d62d98', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 16:34:01');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('17', 'bf396683-58c9-4a4c-8d36-00115f33e1e2', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 16:46:18');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('18', 'f2763090-985f-4f57-bd12-8281df4544db', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-24 16:46:39');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('19', '7843f653-688a-43d2-a4e7-412249b1e46f', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 10:20:34');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('20', '7843f653-688a-43d2-a4e7-412249b1e46f', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 10:25:34');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('21', '07a50950-e32e-457a-befb-681d8be2aabf', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:03:11');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('22', '07a50950-e32e-457a-befb-681d8be2aabf', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:07:17');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('23', 'b84e068c-0219-4b7d-aebd-dfc2d9d4a5ab', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:16:02');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('24', 'b84e068c-0219-4b7d-aebd-dfc2d9d4a5ab', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:17:55');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('25', '2edfacf1-c56b-4d86-ae7f-afb44ef11894', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:20:38');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('26', '2edfacf1-c56b-4d86-ae7f-afb44ef11894', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:21:28');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('27', '9e87f559-9a52-4e95-a1c7-dda63b748ed4', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:23:09');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('28', '9e87f559-9a52-4e95-a1c7-dda63b748ed4', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:23:48');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('29', 'd8ef4bef-af1b-4120-9a99-48486095686a', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:26:38');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('30', 'd8ef4bef-af1b-4120-9a99-48486095686a', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:27:08');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('31', '0703d585-6b4b-4a3e-9638-0e1c77425c81', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:33:34');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('32', '0703d585-6b4b-4a3e-9638-0e1c77425c81', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:34:12');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('33', 'b34e0484-b09e-47aa-9ff1-770c3d2369a2', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:37:44');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('34', 'b34e0484-b09e-47aa-9ff1-770c3d2369a2', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 11:40:59');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('35', '43449c63-4bce-44fc-adf7-653f3e0f60ca', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:43:22');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('36', '43449c63-4bce-44fc-adf7-653f3e0f60ca', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 11:43:51');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('37', '9e97751f-9fa1-4218-bad4-843d5dab0c95', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:44:38');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('38', '9e97751f-9fa1-4218-bad4-843d5dab0c95', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 11:45:57');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('39', '7d643f0a-fcd2-43a5-870e-1f4cc3df2f86', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:48:26');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('40', '7d643f0a-fcd2-43a5-870e-1f4cc3df2f86', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 11:48:59');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('41', 'd1db90e5-9dc3-42f5-8287-4226adc35c6e', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:53:48');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('42', 'd1db90e5-9dc3-42f5-8287-4226adc35c6e', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 11:55:06');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('43', '3ce6a565-c6cc-48f1-8f2e-9bb3be707235', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 11:57:37');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('44', '3ce6a565-c6cc-48f1-8f2e-9bb3be707235', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 11:58:08');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('45', 'f6f090ee-aeaf-45bf-acc4-e0893928df19', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 12:00:47');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('46', 'f6f090ee-aeaf-45bf-acc4-e0893928df19', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 12:01:14');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('47', 'd62d4989-3a19-4056-8996-4919b96744c9', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 12:14:33');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('48', 'd62d4989-3a19-4056-8996-4919b96744c9', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 12:14:57');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('49', 'c389b5c5-7363-40a0-a92e-5356d50866ed', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 12:16:31');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('50', 'c389b5c5-7363-40a0-a92e-5356d50866ed', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 12:17:06');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('51', '0640c2a3-5350-4985-be10-84c5bbc1e05f', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 12:25:04');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('52', '0640c2a3-5350-4985-be10-84c5bbc1e05f', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:10:31');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('53', 'e708a9d9-3560-4465-b898-f7b1132f997b', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:12:03');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('54', '08fbbc9e-e7ca-4eb2-ae76-ed5efded81fd', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 13:14:43');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('55', '08fbbc9e-e7ca-4eb2-ae76-ed5efded81fd', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:16:16');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('56', '7ae4198e-ed91-42be-b18b-1a8481eea1f5', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 13:33:10');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('57', '7ae4198e-ed91-42be-b18b-1a8481eea1f5', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:33:42');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('58', '245bd3f9-0544-4986-bb53-6565b249eae6', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 13:36:54');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('59', '245bd3f9-0544-4986-bb53-6565b249eae6', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:38:49');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('60', '9c72937f-d53f-47a5-bded-7ae2b74d1533', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 13:46:16');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('61', '9c72937f-d53f-47a5-bded-7ae2b74d1533', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 13:46:37');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('62', '59778eb6-1c26-42f5-b33a-2124b905400b', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 13:58:58');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('63', '59778eb6-1c26-42f5-b33a-2124b905400b', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 13:59:20');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('64', 'fc2fbe00-d993-4afe-8bf2-ff2c2adfaa6e', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:00:37');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('65', 'fc2fbe00-d993-4afe-8bf2-ff2c2adfaa6e', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 14:01:04');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('66', '2bb3c903-24a7-4315-a6a2-ac05237bdbe8', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:03:32');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('67', '2bb3c903-24a7-4315-a6a2-ac05237bdbe8', '支付宝提现', '0', '收款账号不存在', '0', '2017-07-25 14:03:50');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('68', 'eaed1b22-4f6e-4b69-930d-6310ba2f1811', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:06:21');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('69', 'eaed1b22-4f6e-4b69-930d-6310ba2f1811', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 14:06:39');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('70', 'ba0b3977-95c3-464c-a755-90a5430dfa01', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:07:35');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('71', 'ba0b3977-95c3-464c-a755-90a5430dfa01', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 14:08:04');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('72', '7d46c0c0-26ae-4785-85a1-43f7163f3b80', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:15:34');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('73', '7d46c0c0-26ae-4785-85a1-43f7163f3b80', '支付宝提现', '0', '系统繁忙', '0', '2017-07-25 14:16:27');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('74', '998cf264-4bec-4dc9-b5d8-3e9f8d689fb7', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:18:38');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('75', '998cf264-4bec-4dc9-b5d8-3e9f8d689fb7', '支付宝提现', '1', '确认到账', '0', '2017-07-25 14:19:49');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('76', '9cc2ddd3-c100-4c4c-8123-a6dc46048bd9', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:25:38');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('77', '9cc2ddd3-c100-4c4c-8123-a6dc46048bd9', '支付宝提现', '1', '确认到账', '0', '2017-07-25 14:26:12');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('78', 'b03aced1-f7b7-4bed-8033-194c3f5cd085', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:41:45');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('79', 'b03aced1-f7b7-4bed-8033-194c3f5cd085', '支付宝提现', '1', '确认到账', '0', '2017-07-25 14:45:12');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('80', '4010a414-a620-483d-aa92-120bd99158b5', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:49:09');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('81', '4010a414-a620-483d-aa92-120bd99158b5', '支付宝提现', '1', '确认到账', '0', '2017-07-25 14:49:28');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('82', '13074a40-a20b-460e-8e73-2e50be177875', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 14:50:58');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('83', '13074a40-a20b-460e-8e73-2e50be177875', '支付宝提现', '1', '确认到账', '0', '2017-07-25 14:53:05');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('84', '6603f237-e33b-4fc5-908a-611fc383e7c9', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-25 15:00:25');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('85', '6603f237-e33b-4fc5-908a-611fc383e7c9', '支付宝提现', '1', '确认到账', '0', '2017-07-25 15:58:45');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('86', '72160c69-8b61-4a51-8525-38328e103805', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 10:09:21');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('87', '72160c69-8b61-4a51-8525-38328e103805', '微信付款', '0', '参数错误:spbill_create_ip必须是合法的IP字符串.', '0', '2017-07-26 10:21:04');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('88', '55917ab9-36ca-4c2b-b840-5c9c04db29bc', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-26 10:33:15');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('89', '57978236-91c6-4caa-b0d0-70ada5b4d3ca', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 10:49:56');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('90', '57978236-91c6-4caa-b0d0-70ada5b4d3ca', '微信付款', '0', '参数错误:spbill_create_ip必须是合法的IP字符串.', '0', '2017-07-26 10:50:19');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('91', '949f63a7-9937-46c9-bd98-8153ae315660', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 10:51:16');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('92', '949f63a7-9937-46c9-bd98-8153ae315660', '微信付款', '0', '参数错误:单号必须为33位以下的数字或字母', '0', '2017-07-26 10:52:24');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('93', '22f7126e-264e-462c-8bc5-28055a2de34f', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 10:58:47');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('94', '22f7126e-264e-462c-8bc5-28055a2de34f', '微信付款', '0', 'CA证书出错，请登录微信支付商户平台下载证书', '0', '2017-07-26 10:59:25');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('95', '8a5426d2-7594-4184-b3d2-253a1b4d203e', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 11:07:14');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('96', '8a5426d2-7594-4184-b3d2-253a1b4d203e', '微信付款', '0', '付款金额超出限制。低于最小金额1.00元或累计超过20000.00元。', '0', '2017-07-26 11:07:39');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('97', '8a23335a-d457-4412-9bd0-9392d57c0b3f', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 11:11:52');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('98', '8a23335a-d457-4412-9bd0-9392d57c0b3f', '1000018301201707268704931230', '1', '确认到账', '0', '2017-07-26 11:12:23');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('99', '55917ab9-36ca-4c2b-b840-5c9c04db29bc', '支付宝提现', '0', '审核异常', '0', '2017-07-26 12:21:37');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('100', 'e399e6e098df42179451aed4822823d1', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-26 13:21:41');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('101', '774543562e954d01b2379d6bf1171edd', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-26 13:21:58');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('102', '774543562e954d01b2379d6bf1171edd', '20170726110070001502780005299257', '1', '确认到账', '0', '2017-07-26 13:23:24');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('103', 'e399e6e098df42179451aed4822823d1', '1000018301201707268706772491', '1', '确认到账', '0', '2017-07-26 13:23:33');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('104', '4b40b914fc014e4e9185f4f0bc80ed27', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-26 15:55:55');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('105', '4b40b914fc014e4e9185f4f0bc80ed27', '20170726110070001502780005280356', '1', '确认到账', '0', '2017-07-26 16:03:17');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('106', '856e1af97c094d599e9602107fc8e15b', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 11:18:00');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('107', 'dcec643e7b744cc3b983694d43fecf28', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 11:18:10');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('108', 'e20ee60fe66b496e845ddbb743164a25', '支付宝提现', '2', '提交订单，等待审核', '0', '2017-07-28 17:10:11');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('109', 'e20ee60fe66b496e845ddbb743164a25', '20170728110070001502780005358509', '1', '确认到账', '0', '2017-07-28 17:11:47');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('110', 'dcec643e7b744cc3b983694d43fecf28', '微信付款', '0', '余额不足', '0', '2017-07-28 17:13:52');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('111', 'd8f9003f618749eaa88b86cf625672e5', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 18:05:56');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('112', 'd8f9003f618749eaa88b86cf625672e5', '微信付款', '0', '真实姓名不一致.', '0', '2017-07-28 18:06:26');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('113', '932ffdad61b14f8cb73d946cdfc32625', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 18:06:59');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('114', '932ffdad61b14f8cb73d946cdfc32625', '微信付款', '0', '真实姓名不一致.', '0', '2017-07-28 18:07:06');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('115', '6a6625238c194f6791673b68c25521cb', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 18:07:29');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('116', '6a6625238c194f6791673b68c25521cb', '微信付款', '0', '余额不足', '0', '2017-07-28 18:07:35');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('117', '20318daecddc4756be28048977161c5e', '微信付款', '2', '提交订单，等待审核', '0', '2017-07-28 18:08:48');
INSERT INTO `tb_comm_mem_cash_approve` VALUES ('118', '20318daecddc4756be28048977161c5e', '1000018301201707288739833415', '1', '确认到账', '0', '2017-07-28 18:17:57');

-- ----------------------------
-- Table structure for `tb_comm_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm_user`;
CREATE TABLE `tb_comm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indicate` varchar(40) DEFAULT NULL COMMENT '用户标示',
  `openid` varchar(40) DEFAULT NULL,
  `unionid` varchar(40) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `sex` smallint(6) DEFAULT NULL,
  `language` varchar(60) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `province` varchar(60) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `headimgurl` varchar(200) DEFAULT NULL,
  `privilege` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `idfa` varchar(60) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `award` double(12,2) DEFAULT NULL,
  `tdaward` double(12,2) DEFAULT NULL,
  `invite_code` varchar(10) DEFAULT NULL COMMENT '二维码',
  `pid` int(11) DEFAULT NULL COMMENT '推广员id',
  `commid` int(11) DEFAULT NULL COMMENT '主播id',
  `udid` varchar(128) DEFAULT NULL,
  `imei` varchar(128) DEFAULT NULL,
  `device_model` varchar(128) DEFAULT NULL COMMENT '通过usr/callback接口获取，对应PRODUCT这个参数',
  `device_serial` varchar(128) DEFAULT NULL COMMENT '通过usr/callback接口获取到，对应SERIAL这个参数',
  `device_version` varchar(128) DEFAULT NULL COMMENT '通过usr/callback接口获取到，对应VERSION这个参数',
  `device_iccid` varchar(128) DEFAULT NULL COMMENT '通过usr/callback接口获取到，对应ICCID这个参数',
  `user_agent` varchar(512) DEFAULT NULL,
  `get_udid_time` datetime DEFAULT NULL COMMENT '得到udid的时间',
  `status` varchar(20) DEFAULT NULL COMMENT '1推广员2主播  主播重新建表',
  `appid` varchar(20) DEFAULT NULL,
  `totalaward` double(12,2) DEFAULT NULL COMMENT '总收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_comm_user
-- ----------------------------
INSERT INTO `tb_comm_user` VALUES ('1', '4c14b8ba538242f19bbc38c327dcf161', 'ooFMmsxEhgwZsvE7RT1Da4aJSPwI', 'oPSnRvpam2Q0-pnqMoUdlXxXOe7k', '江涛', '1', 'zh_CN', 'East', 'Beijing', 'CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBaBLrVvxThN0uF3vgLFbmiaiau3MpZ4RxfmY8CgYV66oTXf2kiawrZNqrSzWIg0ZV2EVZXxTeicCqNuw/0', '[]', '2017-06-05 15:28:18', '2017-06-12 15:39:26', null, null, '18601042108', '3.00', '3.00', null, null, '1', null, null, null, null, null, null, null, null, '1', null, '3.00');
INSERT INTO `tb_comm_user` VALUES ('2', '0b12296544fd42d19db82a380b8b3fef', 'ooFMmsw3B3bk4_4VTx-G_flUp_AQ1', 'oPSnRvo_7VyeFU1TowB57TQP4OXY1', '锦', '1', 'zh_CN', 'Haidian', 'Beijing', 'CN', 'http://wx.qlogo.cn/mmopen/5Iqib1CQeJMn8pMGLZQysbhcnTKRxIzrMZQ6EaLYicdkicoPyArna4d9k3fu9NIoWMyOekjNE2MeTKy6bkgoYmR5Emv6oFXDJYw/0', '[]', '2017-06-05 16:44:52', '2017-06-05 16:44:53', null, null, '18500504384', '330.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '450.00');
INSERT INTO `tb_comm_user` VALUES ('3', 'cef4e421aeaa4b36aa043feb34561b01', null, null, null, null, null, null, null, null, null, null, '2017-06-05 17:01:11', '2017-06-05 17:01:11', null, null, '18500504385', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('4', '61e73f7db57145a89367f62ddb37ab79', null, null, null, null, null, null, null, null, null, null, '2017-06-05 18:25:33', '2017-06-05 18:25:33', null, null, '18500504389', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('5', '9c36c4e4bdf6472ea6805e2552867510', null, null, null, null, null, null, null, null, null, null, '2017-06-05 18:26:06', '2017-06-05 18:26:06', null, null, '18500504589', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('6', '959f10cd45d54063a39bd21d31d52489', null, null, null, null, null, null, null, null, null, null, '2017-06-05 18:26:52', '2017-06-05 18:26:52', null, null, '18501504589', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('7', '7afe542341d24ba5bba5c855c1e33f6b', 'ooFMms6zEn0Zt4LPNflBo9mSjHFM', 'oPSnRvpzCG1SJgOUIuqtKTbCdu8I', 'denver', '1', 'zh_CN', 'Shenzhen', 'Guangdong', 'CN', 'http://wx.qlogo.cn/mmopen/5Iqib1CQeJMk7tfxRSndlyiaZ7uvGibdXHHh3PMD4KVvT6vAYUWlrtDKajOmYIR4ibuiaOmgVdPHJ2hk6AqsSGZH92Aj6Ir5C9xvT/0', '[]', '2017-06-06 09:51:40', '2017-06-08 19:43:13', null, null, '13480803718', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('8', '6dda74520e5246f4845d018f51f9688b', 'ooFMms3yUFvYbHCIrwrWo0nAf-Es', 'oPSnRvow7aIwseThQyO6OkjTfjZE', '雨天', '1', 'en', 'Shenzhen', 'Guangdong', 'CN', 'http://wx.qlogo.cn/mmopen/kv7ops3ia9nVicgf6WTcRnFQteLiagic8rlwWiawUEZ8SsCv2gSTk4cznblJqVeib0yDTrGKlYiayFOFFYhorjiaJXTIU1tia6FrEhOmF/0', '[]', '2017-06-06 10:13:25', '2017-06-06 10:13:25', null, null, '13410981907', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('9', '0994233555604941b38014d4833533c1', null, null, null, null, null, null, null, null, null, null, '2017-06-06 10:54:43', '2017-06-06 10:54:44', null, null, '18700504384', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('10', '9c3c5da61da84cc5a7dedd781a0cdd62', 'ooFMms62SaziG-U_Ttk26pY1pNfc1', 'oPSnRvqXZuvxSjOfamUQSrL7bFrU', '转身、未来', '1', 'zh_CN', 'Shenzhen', 'Guangdong', 'CN', 'http://wx.qlogo.cn/mmopen/ibiccpSrxQbjQapaBore9Q67uNJJC496vEP2ibWx1GXy8VpMbSEunyEdcLK48He9ianxeZia6HSbOQ84SKjQg34D9JtjqjHqZZ2eO/0', '[]', '2017-06-06 10:56:23', '2017-06-26 16:15:19', null, null, '13456962663', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('11', 'ae4bc254ea0b4ee4b2ea4118edd7a5d9', 'ooFMmsxmnYKgaYB_LdgDD_eRFnrk', 'oPSnRvpNVGZCmDqO74fLqNJs7bw0', '姚远', '1', 'zh_CN', '', '', 'AD', 'http://wx.qlogo.cn/mmopen/ibiccpSrxQbjS3icKEGHS0GFse4OibJeBBIicEc8G0SuHaC2I8wbnlWYUeQzmZJSVQ5VGGPouKtjCkfCK4bvThibIlM50owmcDictiaB/0', '[]', '2017-06-06 12:04:24', '2017-06-26 12:43:04', null, null, '18500999562', '70.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '100.00');
INSERT INTO `tb_comm_user` VALUES ('12', '02bcd3228a5e4bb3b3f960624e6be537', 'ooFMms62SaziG-U_Ttk26pY1pNfc', 'oPSnRvqXZuvxSjOfamUQSrL7bFrU', '转身、未来', '1', 'zh_CN', 'Shenzhen', 'Guangdong', 'CN', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6kKY2N5KX2mRfYI5TyPtVUHXnsxQyictKHWapq7pU02LA/0', '[]', '2017-06-07 10:20:51', '2017-06-24 18:31:02', null, null, '13246732195', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('13', '1fd928aef8274084854b968d3c8d3213', null, null, null, null, null, null, null, null, null, null, '2017-06-07 19:46:33', '2017-06-09 00:02:01', null, null, '13035149469', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('14', '10077bbbc49647ff819c2aadb9b152fe', null, null, null, null, null, null, null, null, null, null, '2017-06-08 23:13:14', '2017-06-08 23:13:21', null, null, '13716328136', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('15', '85a92639805a437fb04ee6a46bac2e65', 'ooFMmswdPjNm_2xVpUW4lSkoAnwE', 'oPSnRvnzPc9ySnF9Hp1dJ9eSBPaQ', 'Evan', '1', 'zh_CN', 'Chaoyang', 'Beijing', 'CN', 'http://wx.qlogo.cn/mmopen/EWo3hwIVSD31uTW3McgqA6rMQa9sF1nvsbb7Cr8808M1sbXRPEKich3V9o34bxfukXlTIvpmdHhscL23owL8XAg/0', '[]', '2017-06-09 09:51:24', '2017-06-12 11:34:49', null, null, '18610320580', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('16', '3e41c4e377714a84a353721c27ea8991', null, null, null, null, null, null, null, null, null, null, '2017-06-09 10:20:16', '2017-06-21 17:20:26', null, null, '13750005684', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('17', 'b57bff9477524d76bfdbbb2128133280', null, null, null, null, null, null, null, null, null, null, '2017-06-09 14:47:22', '2017-06-09 14:49:15', null, null, '18201016608', '0.00', '0.00', null, '15', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('18', 'cd5be518b3c94fdda20135275ddd657f', null, null, null, null, null, null, null, null, null, null, '2017-06-09 17:30:53', '2017-06-09 17:30:59', null, null, '18681585618', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('19', 'f880a155404240bdb22fd7403be469c5', null, null, null, null, null, null, null, null, null, null, '2017-06-09 23:34:56', '2017-06-09 23:35:00', null, null, '13466369500', '0.00', '0.00', null, '15', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('20', '79a3fc6d1f7844da821a50297020561a', null, null, null, null, null, null, null, null, null, null, '2017-06-11 14:21:29', '2017-06-11 14:29:20', null, null, '13927553607', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('21', '056b313400654596ac22a47f531bf9e0', null, null, null, null, null, null, null, null, null, null, '2017-06-11 14:37:44', '2017-06-11 14:38:22', null, null, '15827590779', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('22', '2e52702127ef456b93ba97aa1ee4f0e9', null, null, null, null, null, null, null, null, null, null, '2017-06-12 16:03:44', '2017-06-19 11:12:54', null, null, '15600600596', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('23', 'ce6e4a21b01648f493805a0b87d42ae8', null, null, null, null, null, null, null, null, null, null, '2017-06-13 14:59:47', '2017-06-13 14:59:47', null, null, '13110555937', '0.00', '0.00', null, '1', null, null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('25', '84411ddfd06645e099806bc1df64c1ed', 'ooFMms9GFlU5B6VCVwAdmtLrqDJw', 'oPSnRvnNfu0ozehaEqr-Vy_h01m8', '无花果', '1', 'zh_CN', 'Shenzhen', 'Guangdong', 'CN', 'http://wx.qlogo.cn/mmopen/EWo3hwIVSD2D5lqyvd8pxDYT55YRrenczluIictxHZvqAl2viaow506icUsxib3BrhqWBMGSDdv1gldaRmPVLib06DT7r17eg2PbL/0', '[]', '2017-06-13 15:08:59', '2017-06-13 15:13:22', null, null, '18613236352', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('26', '814b8146dbe941b184c4e46f96f59e40', null, null, null, null, null, null, null, null, null, null, '2017-06-14 10:27:45', '2017-06-14 10:27:54', null, null, '15727002312', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('27', '7be0c777d29f42b08c61cdfe68fd60cd', null, null, null, null, null, null, null, null, null, null, '2017-06-14 10:36:08', '2017-06-14 10:44:18', null, null, '13856968874', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('28', '2e9d442f78a1420f88a38b52d8b96b80', 'ooFMmsw3B3bk4_4VTx-G_flUp_AQ', 'oPSnRvo_7VyeFU1TowB57TQP4OXY', '锦', '1', 'zh_CN', 'Haidian', 'Beijing', 'CN', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7KzpIlic23Kia0hSyYup4camIpRmBXWS9N0SXqmCIqAkAg/0', '[]', '2017-06-14 15:40:48', '2017-06-14 16:50:34', null, null, '13552886455', '801.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '1060.00');
INSERT INTO `tb_comm_user` VALUES ('29', '2b55b6ca2d014ed8aa55bec4a6b1fd42', null, null, null, null, null, null, null, null, null, null, '2017-06-14 20:15:03', '2017-06-14 20:15:10', null, null, '18613122021', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('30', '9e720d0611894620835d86bab9369861', null, null, null, null, null, null, null, null, null, null, '2017-06-15 10:40:12', '2017-06-15 10:40:12', null, null, '17671157752', '0.00', '0.00', null, '1', null, null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('31', '0c1b29884973438f9dd4ea97c42e5e9b', 'ooFMms6fLYdNoPSxbKBRRJpeq3Fc', 'oPSnRvuU0mtaVUVS7tKwV02t6emw', '孙轩', '0', 'zh_CN', '', 'Beijing', 'CN', 'http://wx.qlogo.cn/mmopen/5Iqib1CQeJMn8pMGLZQysbvdqNZrUlQU77HRW2VnHOoefibUMmTABVtKbWs2EFzfwWeic37czkdXLiaXAyqOjZaTQmhwkPCIKUMx/0', '[]', '2017-06-15 11:43:10', '2017-06-15 11:47:56', null, null, '13501210345', '70.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '100.00');
INSERT INTO `tb_comm_user` VALUES ('32', 'edaa74c1a4404de084223c980ad7dfad', null, null, null, null, null, null, null, null, null, null, '2017-06-16 15:28:05', '2017-06-16 15:28:14', null, null, '18810468409', '0.00', '0.00', null, '1', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('33', '4574ede697c4456691dcbbeeaedd9429', null, null, null, null, null, null, null, null, null, null, '2017-06-16 16:19:42', '2017-07-19 18:43:34', null, null, '18810572605', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('34', 'fc9de649fbd04a488925509a5c57b79e', null, null, null, null, null, null, null, null, null, null, '2017-06-21 17:44:02', '2017-06-21 17:44:09', null, null, '13801380100', '0.00', '0.00', null, '31', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('35', '90dcefdbcebf4d8693ff73d6b15499b7', null, null, null, null, null, null, null, null, null, null, '2017-06-21 17:45:29', '2017-06-21 17:59:33', null, null, '13801380101', '0.00', '0.00', null, '31', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('36', '654cf3dbf9f042309c559a97e83028ca', null, null, null, null, null, null, null, null, null, null, '2017-06-22 10:28:49', '2017-06-22 10:28:58', null, null, '13801380011', '0.00', '0.00', null, '31', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('37', '2d1ab384d6934e479cfc82e53b8ff0a4', null, null, null, null, null, null, null, null, null, null, '2017-06-22 10:31:47', '2017-06-22 10:31:56', null, null, '13801380012', '0.00', '0.00', null, '31', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('38', 'e4e687435ac3439aaf7228931e418840', null, null, null, null, null, null, null, null, null, null, '2017-06-22 10:33:48', '2017-06-22 10:33:52', null, null, '13801380013', '0.00', '0.00', null, '31', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('39', 'fcff48ace98e455a856a06cb5c75fec3', null, null, null, null, null, null, null, null, null, null, '2017-06-22 12:16:17', '2017-06-22 14:29:25', null, null, '13801380014', '0.00', '0.00', null, '31', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('40', '58e7aae9632e4abb94c73d27d4a2e5df', 'ooFMms0GKk4f0mXfvAgBadyUEijo', 'oPSnRvoSjL9YZR0gHp0YXjNbsG7I', '安迪', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5q7ia7PiajkzTj2Eict9yodibNd3db1wTldA7XB9fQFaSsVjDRvb9NN2bSjcFaFxQWovV9qib7bFhE0IwGjEmZF3Y5ZdicskpuE9JnU/0', '[]', '2017-06-23 17:30:43', '2017-07-06 16:26:45', null, null, '15619411745', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('41', 'aa1bfef586b94b43a1ab34f69e3ef470', 'ooFMms1QXIP-47lShC8bsRzWP1oQ', 'oPSnRvjYzdH2PM50echvVl0hEezU', '曲筱筱', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/N6NBwMnz0iaBq2EEX6gT4GNjuwmUZa5rRpodHsusrDcH6YtkUbvEMbxR9AwYqKHa8tWjdN9AK2CQvhZ2sddykghQL0R7tnPzt/0', '[]', '2017-06-23 17:37:23', '2017-06-25 09:35:06', null, null, '15619425148', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('42', '17672cf40d1348bb9f65e5984ebce655', 'ooFMms53eOl5o0G-i5YZMJd7xY7E', 'oPSnRvjrXFvKqmWNIdmHuj0JsKzQ', '大阿宇', '1', 'zh_CN', '', 'Siem Reab', 'KH', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5mBHna6tlj9q2Qhoic1hLcVMoo8iaZmUsSKvfGGWMoricnF4zjlI0Tb5v30Dht8GIP3iauSS7gHBFXKIOo7Mzib9MmvQIsCcFg0Oiaw/0', '[]', '2017-06-23 17:46:15', '2017-06-24 00:37:01', null, null, '15619423050', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('43', '44a9314eb9f7438c80eb9b6c486f170c', null, null, null, null, null, null, null, null, null, null, '2017-06-23 17:50:16', '2017-06-23 17:50:20', null, null, '18986187889', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('44', '58804d77db654b3da256871b2c28d638', null, null, null, null, null, null, null, null, null, null, '2017-06-23 18:46:09', '2017-06-27 16:34:40', null, null, '15619432917', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('45', 'cd2a7d06f6e64f0ea6063beae943667c', null, null, null, null, null, null, null, null, null, null, '2017-06-25 09:40:08', '2017-06-25 09:40:39', null, null, '18696196758', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('46', '3cf1b7e06bc244ee96c1d3d142a54b71', null, null, null, null, null, null, null, null, null, null, '2017-06-26 18:44:14', '2017-06-26 18:44:32', null, null, '17325869874', '0.00', '0.00', null, '31', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('47', '916265d646b746b29fd278114789c8f2', null, null, null, null, null, null, null, null, null, null, '2017-06-26 18:46:51', '2017-06-27 15:18:24', null, null, '17325869875', '0.00', '0.00', null, '31', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('48', 'af0b017cb6e043f0bc110a57f3e3f56d', 'ooFMms6Syj84AHri3Ag4Wj6hW0W0', 'oPSnRvsYJaeGrSJYXLmT2tiseHSQ', '战神', '1', 'zh_CN', 'Wuhan', 'Hubei', 'CN', 'http://wx.qlogo.cn/mmopen/kv7ops3ia9nW8DPuFDIhj8aUaBcJV19789xF0mwia5icrqZmsFMWjwIJL6VZfpFR3fQYa2oR9Qiar9WoYgAmdiaCwB4Ne19b7ScNf/0', '[]', '2017-06-27 12:17:25', '2017-06-27 12:17:25', null, null, '13377883131', '0.00', '0.00', null, '1', null, null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('49', 'd9dd517583d047d89ae282b5d4584bbc', null, null, null, null, null, null, null, null, null, null, '2017-06-29 12:09:18', '2017-06-29 18:24:22', null, null, '17307896412', '0.00', '0.00', null, '31', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('50', '0deee743279047609612e9009abc44b5', null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:20:04', '2017-07-03 16:20:21', null, null, '17725682568', '0.00', '0.00', null, '31', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('51', 'e26fb3e631b743b5b6f9d774ac6df156', null, null, null, null, null, null, null, null, null, null, '2017-07-06 21:07:28', '2017-07-06 21:07:34', null, null, '15318738467', '0.00', '0.00', null, '1', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('52', '5ecbf5a914994e5eba6b0fba83b7b99a', 'ooFMms_k4X0HOkFq0uX9wcCemEVY', 'oPSnRvueXmDktkO5BnRgIOQsp4ug', '章螂', '1', 'zh_CN', 'Yangyang', 'Hubei', 'CN', 'http://wx.qlogo.cn/mmopen/5Iqib1CQeJMmf7RGVtmJfnI4Afd1O2hqm2C2rJ0fnmEViaFB9UrONOmchLF0QAcCjVXvpbLA7ibVKv7yia7ey1RFausXvFEKIzne/0', '[]', '2017-07-09 12:30:03', '2017-08-05 00:26:48', null, null, '13720288838', '0.00', '0.00', null, '11', '1', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('53', '273cc99c2d6440778d731c5b10c18879', null, null, null, null, null, null, null, null, null, null, '2017-07-28 14:20:06', '2017-07-28 14:21:02', null, null, '17301300130', '0.00', '0.00', null, '22', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');
INSERT INTO `tb_comm_user` VALUES ('54', 'cebb79c6f32f4c2bb6600326049ed38a', null, null, null, null, null, null, null, null, null, null, '2017-07-28 15:11:33', '2017-07-28 15:11:45', null, null, '13701390139', '0.00', '0.00', null, '53', '2', null, null, null, null, null, null, null, null, '1', null, '0.00');

-- ----------------------------
-- Table structure for `tb_comm_user_qdjl`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm_user_qdjl`;
CREATE TABLE `tb_comm_user_qdjl` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) NOT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `language` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `unionid` varchar(128) DEFAULT NULL,
  `invite_code` int(64) DEFAULT NULL COMMENT '邀请码',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL COMMENT '取消关注后enable设为false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='西瓜妹社区关注者的信息';

-- ----------------------------
-- Records of tb_comm_user_qdjl
-- ----------------------------
INSERT INTO `tb_comm_user_qdjl` VALUES ('1', 'o2Tkns654qtrJrUMa-V_7CwhzxBU', '锦', '1', 'zh_CN', '海淀', '北京', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8asfgs30KruxRWBIuicFFYgUkZtia07v8tibsjFcuQFfCgQIlgibgwsmlAqTfcDkNeT8oS9E0RVQsk1D/0', 'oPSnRvo_7VyeFU1TowB57TQP4OXY', null, '2017-07-25 18:19:31', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('2', 'o2Tkns9b-N15MVStT4zXSVgSAvG0', '姚远', '1', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfwe6CJJzD3TM4HsGziahIWiceLlPT2RZaian13lNv1sD4IZSn4aAxwSsW68vHpnGrIWG9mPKnSvQOicAELURvprc1oM/0', 'oPSnRvpNVGZCmDqO74fLqNJs7bw0', null, '2017-07-25 18:26:44', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('3', 'o2Tkns4H46XNE2khUTWReKQV2L6k', ' 瑛琦', '2', 'zh_CN', '朝阳', '北京', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALy5Qa0KRgu2Ludb4eiaQ7QI9Wgp46lwnNPrCa6jbIIVVKw9Y15mJldLNwFSmO0ia3mqpehD4ucYwuhciapk6qKUeT1/0', 'oPSnRvrql272nKOAFqE36rCcoA60', null, '2017-07-25 18:36:33', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('4', 'o2Tkns2U3k38gXsZhObJZQCt-alc', '刘刚', '1', 'zh_CN', '宁波', '浙江', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfyWIp4NJJVU3Cjn3iahqdLaLmickblwvQkVGt3Jia6fHROZKhwXMngSQzt0iapbpibS3a0dhG5xfFIsf7Enpb1hibeh2h/0', 'oPSnRvm6FLUa0xahOZJKQMuFhuw8', null, '2017-07-25 20:14:31', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('5', 'o2Tkns0lppQTuzXpHmRkofjnf19U', '龙骚', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfy0rInfrLgt8oTibGKIn3JVg9icT2U7KuiagcGBvKNFz9opYBFEETfTdCZ3IN7LIl10zsfT2oqjkBSkXdo2XXdYxGI/0', 'oPSnRvk0aryBpPA0l1UKlggoDKko', null, '2017-07-25 20:48:50', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('6', 'o2Tknsxvi4WgCkftRrqkXJlZXbB4', '丢丢', '2', 'zh_CN', '台州', '浙江', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLUZ1uicyDy4bc0OWtVBibrrSugxQhGvg4eJMTvZ5jaCR7fGKSVBtVEibR9weQOB97ZqX0DKXVIiasjHkh9ytuuXbYfd/0', 'oPSnRvvRrn0tde8WJaIZ5Jw0fAhw', null, '2017-07-25 23:45:06', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('7', 'o2TknsxNlj8PDKpwKTRFd6PHEr38', 'I  miss  you', '1', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALy5Qa0KRgu2LrBMYXC5Hm9vNc8mfibDk3nsxG0XUqzJR4rhliaYt9Hzia2fTzplAsVqaMbyM9rYjFHhv0cQeo4LUsX/0', 'oPSnRvlXAMmV8nsRxOkZKnqJ8ANY', null, '2017-07-26 00:11:26', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('8', 'o2Tknsz6jIIzekoymZuCBmr4UWCQ', 'czy噗', '1', 'zh_CN', '闸北', '上海', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM54NxmVYMKbUnZ3Diahyibpdbfq9NK6CXFeUyyeAZgm3hzC9DynflKCK31lpwaB9hVYp1IdprSecw38qE9cVkfCPB/0', 'oPSnRvqrmLDYR0cJ5iICCC0vOfSI', null, '2017-07-26 10:12:58', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('9', 'o2Tkns1OzbvQzv2-UeXjuCw9xxv8', '尘封的记忆', '2', 'zh_CN', '', '福拉尔贝格', '奥地利', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM54NxmVYMKbUkGclYYdBGZCDfIOJzvGicvTyo8ibbMmfbGxTia639fqbuL9NKOmNpnOIMr4mxcmcbLgUKicyKfH6MmU/0', 'oPSnRvtF2L63A_rJyhIOqxP5L22o', null, '2017-07-26 11:16:25', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('10', 'o2Tkns3Txoue8m3oJHA1JJ4N2gLQ', '积哥哥', '2', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM6gxKO9vyHI2Hthye0yFagMkjnfhNy3fx2Y9icDcmNRdyE7WjgzT74PKiclQAaT0iboiawjiaxN3PKAiaQkxZNiaQxyyGo/0', 'oPSnRvhCu7w_PtBDu4P45Tsw-IDU', null, '2017-07-26 16:26:37', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('11', 'o2Tkns3eTMPt6PqZCUEv367pS0H4', '绿色调', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyLww9yC40w8iaWHBm2G6FNgzINmp2pYRXRXumxlHpjPceXDSTX8VhxHvctiaOoIjHqNvp3xiaKCDBTWqBFiavb3Plk/0', 'oPSnRvuHx8S3eVQJHL3qEFTM2tmE', null, '2017-07-26 21:26:19', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('12', 'o2Tkns6bQUxSwNSt9wjiQjaG1wzo', 'String', '2', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM54NxmVYMKbUv6pL9fKCadc2J95KLqtpdCK04pTcFuwickrNoDUof0oL6bsGp3eiazGXRLhJkMC7BZzvPxBg2ZoPl/0', 'oPSnRvnFt3pN5Tj1xM91qA_XypFM', null, '2017-07-27 02:12:54', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('13', 'o2Tkns_22VR6ssvz43v8eqTuEmVE', '天浪', '1', 'zh_CN', '', '', '缅甸', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM44ibMEZYYMFicvXCBUfk28wUvbjRaqxfrwmUmZbL9oVYnLtVNZuBoEIicUEiaR2kG8ys41cDoy8AurqnjPI2W9AZss/0', 'oPSnRvlniVEyVft3XU8h8440Jmzo', null, '2017-07-27 05:15:37', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('14', 'o2Tkns5affocArYYPniM5U9qSQUE', '珊', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4vJ6FhP8Gm2frF0jGpjrsBNXNVibVWZjcDMT5Hj7Ovqwh7SWymkIHnGcmLicDLz6KG4kibh9W8gKiaT1kdUibFNumfO/0', 'oPSnRvhrdyGeKa1gZWFmWtzRHRyk', null, '2017-07-27 08:00:18', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('15', 'o2Tkns9uBS_Bl68VH7X-HOJF75rg', '䒕时候就很乖', '2', 'zh_CN', '铁岭', '辽宁', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzgeNcxN7icGMe85rconB7BSxt57Czr145q2GomibJmqDLIP9LVjJkbnSVsiclpg08ic2ib5ADYDqleUIciaick91sdibJt/0', 'oPSnRvhdsqAi1Ea0hCvMsAxVe0Ro', null, '2017-07-27 19:23:39', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('16', 'o2Tkns6RBmPPifb4JSHbGREO-gdA', '唐杰', '2', 'zh_CN', '沈阳', '辽宁', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJjHzEkZjnn1YdOrkicIYn3klNwbiaRdJbdmLRKuQA7CGpdlnhIKU9I45w5oAqg66uM9kluCTPRLtjlia3libwmW4Q7TTNL6OXg7bU/0', 'oPSnRvqZ4PLUKD5FIkeHQRcKcFNU', null, '2017-07-27 22:18:31', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('17', 'o2Tkns62cf9ZKi1ubsRqKU4WhrRk', 'WENYAQI.', '2', 'zh_CN', '茂名', '广东', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM6jH3sIkBw5WZl7repq2wcZWpqbJ2ib0BJ9tImfkCOnnHwXmYF6fcstHse4MKlXT0cnwlSLamgtYXeRtYWaial6od/0', 'oPSnRvqeMqTBsIUPXf7h--AXbP_Q', null, '2017-07-28 00:17:41', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('18', 'o2TknswAdb36MpRbAIrCApPVUs6Q', '拉菲', '2', 'zh_CN', '鹤壁', '河南', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyycJibBem3GrbDw9rhj68p0APhVaiaOibdibmFp5JrwL1V85IqqESdExYDoeVgrqUXibNr4jv72OUYWGQ/0', 'oPSnRvkFN1caREqtQxfn0JsqlUI8', null, '2017-07-28 00:47:38', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('19', 'o2Tknsy4nob4DNbLv6odbhohfn68', '大展宏图', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVBiaoibicic0kNW0s7eCQHiciaCApMrNO5XgBNxLCWSiacTZvGjOibxQq9eEZpUjHyUIX6kEyNE6ap05Vb0r/0', 'oPSnRvkO-BP02B5XY50O7vINwGeQ', null, '2017-07-28 06:36:22', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('20', 'o2TknszcUxp7ZTN8FD5ACOrifwEU', '孙轩', '0', 'zh_CN', '', '北京', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8QqAnj12Chs1ibII8hUCIMpYh2s4YLlW1A0n1gbSVllWbnxyVuU2caGic3AtH3xoVUW8eONic3FiarpK/0', 'oPSnRvuU0mtaVUVS7tKwV02t6emw', null, '2017-07-28 10:44:38', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('21', 'o2Tkns146rl1a5JyZfXzwQCSZDgE', '百家借--总代--黑马', '1', 'zh_CN', '泉州', '福建', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzR5bbHYt6PbSfTFicGsicN1pN9Yh20FBAb6b3L1qa8q5Ldiaq5icr8lamC4y0nFSx5QIlEaAthZbIXmTCq6cqXO2PS/0', 'oPSnRvikf8jlURnlxGP935G1kM-8', null, '2017-07-28 12:40:13', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('22', 'o2TknszdfoTLo-WAMdJmRxtR8oP8', 'A伟爱人！', '1', 'zh_CN', '西安', '陕西', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8erRcyG7VsTDaKUl7icnKGrd32QtKYOtxVxGqNTuLjRjHouf98JIRUibNNWrpuMHSPJyzMf6wDib8ba/0', 'oPSnRvoX9YoqoI_5m9HW7IMVgVlQ', null, '2017-07-30 02:55:46', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('23', 'o2Tkns7Jled3aK9wlj3CUz3G-zkg', '咖啡不懂酒的醉', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLWbIA3bpoNO0XtcJnI2sdI9HjuYZ7NTHRjmhHXURVk5b0yUQ9l8nO9Kib6ED1Pb6D8UXjkAn1Rz3Un5rKeicjszKG/0', 'oPSnRvlIygiJFm3vTNFrC9BakojU', null, '2017-07-30 06:44:25', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('24', 'o2Tkns9mbl2-xqcdVNePJ0M0CP2I', '大小咖啡', '1', 'zh_CN', '', '', '加拿大', 'http://wx.qlogo.cn/mmopen/EhlBsINlALy5Qa0KRgu2LraiaUdsvwwXibNEkiaoib0gQpay3nt5Y5oosV2wPLyIibVFFH5P8y3OgHPNfM4RV9UI4waXMrOM8n7Fw/0', 'oPSnRvtt99Oq_RzgMkuycE8Zndkg', null, '2017-07-30 08:41:12', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('25', 'o2TknsyzZk7WChu26QeXTLQ5zAYM', '  ', '2', 'zh_CN', '成都', '四川', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPmsCmeCHdibxkcX3BD2D6H8hjaELSIgWAhWcD0MCiah2V3NAnYg7qJJAY2VapVlxrjB3gIfaAR4Gg/0', 'oPSnRvgGscg53ZHxMgsbEjDouXHM', null, '2017-07-30 17:09:05', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('26', 'o2Tknsx6AlFY7G3HBH8-qVnqNV_0', '爱你不需要理由i', '2', 'zh_CN', '中山', '广东', '中国', 'http://wx.qlogo.cn/mmopen/6pa1zVRjwibYe97qeCmO8Lbr2Y9ZzKiaLN8WwfweVYgWgqyIuIRWAcn2ibHic4iax4FAQmhSaY2j7AWQbGhkBwLBbbFXlj4Sl3kWr/0', 'oPSnRvjPj8u8pDYxPRAIaexgE9Fs', null, '2017-07-30 22:30:14', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('27', 'o2Tkns1WHe08KaT3GOQu68tfLVWE', '( ･᷄ὢ･᷅ )', '2', 'zh_CN', '长宁', '上海', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLVH5ED3F6ev3yavXvDvsIceYpRDO9mjQoKMibE2rBWTq6DxHZsoHegG9tAKLT4Na3ZlhQAyTLF6RAA/0', 'oPSnRvsksFKzTTmyI3kt28SQEf-A', null, '2017-07-30 23:50:13', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('28', 'o2Tkns75sbpJDYlV_J_2yZu1-lT8', '美少女战士', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM6jo4boIv6buHQ2mMbbSiaPY0e8WT4tLkkmESl8KaoOmic5CsyroJesg8OfqzYtoyQSVETMiaeawup8BslS5K9icxVa/0', 'oPSnRvgzS4GLPNW5jAAx0cMoxq18', null, '2017-07-31 11:46:33', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('29', 'o2Tkns1iT3az0M7eNrkuJdK5O80c', '大王', '1', 'zh_CN', '合肥', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/6pa1zVRjwibYe97qeCmO8LcdzfBA2MhWRcHnCDXUhcGKFeiagpsSia0xDJU49xsvicYRkjCZHc9KzzUqaNbRFvhuicC67sU0Otnlu/0', 'oPSnRvnB445zdrz2ls2Dte4XAYLw', null, '2017-07-31 15:05:10', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('30', 'o2Tknsw_qpNPUARgX9K9AfHELaLA', '多多', '0', 'zh_CN', '', '', '', '', 'oPSnRvugex2AdH9u9NKDsijOpUh0', null, '2017-07-31 19:58:41', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('31', 'o2Tkns4nh42fZfAbHvjp5Xv7x5Ag', '过期少女', '2', 'zh_CN', '张家界', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM6OAyHyearbZbHO7oxa0FSaA676asqUHxicl6tMsbQK6lccwvwPM7j2Pk8Kav65V9zrGVLibyEpPn0Xo1tjcRR1iaD/0', 'oPSnRvuKGu8_BUReUUZtmPFeel4U', null, '2017-07-31 20:07:04', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('32', 'o2Tkns0Szp83AvpLo-fbQkdx5Ah8', '漫步人生路', '1', 'zh_CN', '苏州', '江苏', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAryKwZiafibibHe2nPrLWFEeUqw4Rk8jmAl1DaAzbr1CULSHrAeib5ouq5mwKjoxafp5JEz5ezPVtvkPSYGxQJORzv7zUOWjdAnqQ/0', 'oPSnRvvG_DrdRW89CNwNezwBlGps', null, '2017-07-31 23:21:17', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('33', 'o2Tkns5twpZorRbVzxOFcjpmwy7E', 'Jecoloco', '2', 'zh_CN', '杭州', '浙江', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8aCsvSaehuFJicKCLOv4bzU685tuW5vC1megBuhEg6xthSes3wMicqU6WRF8KecetS1CMbibtGIeLWH/0', 'oPSnRvu5TD1GkqPNGi3bjBeNk8TI', null, '2017-08-01 12:00:47', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('34', 'o2Tkns-T-2JeTvpWEPQmH1Cnu5ec', '小程', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM7iaib86TpnfrncL9vZ4XBE6mUFwdHp6D0JPDdLQdFhmYj1peoqhPCUoskNjld35cHq5ERQPG3KKT6qFsj4vjkLN2/0', 'oPSnRvhnsvxghvHxn2QbPdFtun_k', null, '2017-08-01 20:53:42', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('35', 'o2Tkns7esVzI1x_O4DPv31zPkwcg', '૮ ੍莪也会累 。', '2', 'zh_CN', '荆门', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVM3AXosUCZx3Lrc8F63Bh8EYj7b4UrSjenKbVicJBwxahE23whc0QacAzUK7YSicMzrN6ib2sVtU1df/0', 'oPSnRviQcvraiqasIA1CDZp51f8Y', null, '2017-08-01 23:33:13', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('36', 'o2Tkns_MSmXqK2kh8t3SHqt117FY', '厨卫', '2', 'zh_CN', '亳州', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/2bHzR5l70y4PfAlcB2ruGolLaiaZNHDDq8zXbmVehWoYe1FgVCtjzNCub1tHxzTLNM9rwsBoUv5ZsbJ9E5CZc6HwmIhIsI3S2/0', 'oPSnRvqGU31i6GQLb9BUxWpzoBOs', null, '2017-08-02 13:21:00', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('37', 'o2Tkns1uhHwrhZ2XzISIdHoVt5XI', '。', '1', 'zh_CN', '武汉', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVNFVsqOloNQDGgpOFnscsvPjXys14iaNrib07hibVkgpuibiavCuwQiaib5egEsPX8A4hmkYChUgdJafqDb/0', 'oPSnRvgnTuzCLe9bowwon_4gA8jQ', null, '2017-08-02 22:21:11', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('38', 'o2Tkns0XVPMMuRxPm4PRMYB7jXpo', '00001', '0', 'zh_CN', '', '', '', '', 'oPSnRvpIf_MUspdHDt1p36mvx90o', null, '2017-08-03 00:15:57', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('39', 'o2TknswGKvv92MWKzP0b4ZRVE2VY', '天黑，请闭眼。。。', '2', 'zh_CN', '', '', '埃塞俄比亚', 'http://wx.qlogo.cn/mmopen/77kxhOrzE8xLwAarAGM9aESibnqGO6uabn8mjZ2sydooSV1VqCYCgRHjDCMQiaNnnpyUdwTKLu6JaK5FOStYsdaEd1HTRlwfXA/0', 'oPSnRvg38ePQ-C0ZxrDmkIwnhvwo', null, '2017-08-03 03:56:27', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('40', 'o2Tknsx0N-4MPTNhvLLWIzyk0M5Q', '萱哥哥', '2', 'zh_CN', '保定', '河北', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJZGUTr3sc892qxNFiaXKKdJ5lmPOt9noRaoRlNdf8uZbA835zXoibfaLdystBdeibX10iaxYfUGG9E2A/0', 'oPSnRvixEQI-QNWis9A8NAwOdseI', null, '2017-08-03 11:02:49', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('41', 'o2TknsyM394XPG53QdE0_sASh8II', '茄子', '1', 'zh_CN', '深圳', '广东', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLXOaiaSI6PRg1uT1KLlDKVeVQiaCQyeIC2dy30WDboGEooyWwdTOEUQ6UzJ6PlISegETBr0TJwdoAzw/0', 'oPSnRvpARiyAzK_6iDaloLqmkPOo', null, '2017-08-03 12:47:37', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('42', 'o2Tkns21uzUS-Ge8_cOVKEQFzYA8', '无限流量随身宽带支持全返', '2', 'zh_CN', '安庆', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8bdWibYa0NOwmicOrRGXXvllv6iboZBOU7evE3o0npHKgP07iafVZd4tcsicCJW7Ryaavfrs6Z1yNLs64/0', 'oPSnRvlFOfTtcMMnGIuK3Q1KdKf8', null, '2017-08-03 17:05:07', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('43', 'o2Tknswk4-74CFJPoDrSoNZrBjhU', '陈大大', '2', 'zh_CN', '孝感', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDbPh7Ijpqu45libkHT5N1hEuERWIHNF6S5ZVK3cNFicxJqKHEPP7pMFib6bWOC2wM9D842A98hAH6hg/0', 'oPSnRvtVlLkMCzc0GmX3Psm23gBk', null, '2017-08-04 20:45:36', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('44', 'o2Tkns0NR1CgiEhGr3dFGUfRqiQM', '沙沙游', '1', 'zh_CN', '酒泉', '甘肃', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJdMxdkTDI4KAYs3941iaYYiboRzoLlsUMbPa2OcZ3yWkqWYPjOU5mHXX9ibh9220IWia8Rqp1iczmwGiab/0', 'oPSnRvlFdnqHZHCuS-XJTpXCar3U', null, '2017-08-04 22:52:51', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('45', 'o2Tkns_YG5vQ-OGjilfaYHcW8yfE', '清风与我', '2', 'zh_CN', '潍坊', '山东', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4S3S949a3l7dt24RxKFmJ5cqc1cdiba1L5FRHgojs5WxzWnqMaXcZzkcR8o8ibrnuYpvWIFkbzHx1B7gQm6Oaq6K/0', 'oPSnRvjLo89Gm73cX1NXSkwcsMkM', null, '2017-08-05 01:18:11', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('46', 'o2Tkns-AMM1-N-qOe9sEEXCrICE4', '王丽', '2', 'zh_CN', '西城', '北京', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJRia82r5YYfPh2oPPnxNX0SEjuGJPrfJibFm328zUWBm1fhpAhttZ2CM8q7Dm1FBlSXTLbdHiacu0E0/0', 'oPSnRvnkCHej4l7lTnBc0ft9qsbI', null, '2017-08-05 02:44:18', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('47', 'o2Tkns_nhDKjPfQdxTg8joCNopH8', '？？？？', '1', 'zh_CN', '', '巴黎', '法国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJpdQdbAEfca1VerytHiaNiaicvmEC3eGE8JEVtcibLDibMvLqBsG5vVzSkib9mQf4Umxopzb6K5TGlRZEB3JeMVl1iaCgkuuBLiaiciaf8/0', 'oPSnRvtzTiu1oeGgHkMfcxOe-Ulc', null, '2017-08-05 12:59:10', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('48', 'o2Tkns1E1EYMSJfEPRHI6XdsmK14', '回到、过去', '1', 'zh_CN', '', '北阿里', '马尔代夫', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJeb5icARxXoj8Ue4sxsNiaAgic4ibcibDR4TPD6n0ffOFxdrw8rNgafFia8suabUCC5GTHkIysvxAqenxI/0', 'oPSnRvuIVoJm99ovviZDyTiFZCnU', null, '2017-08-05 13:33:04', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('49', 'o2Tknsw8ixIVF3RqyYrCu3JuGHek', '一半', '1', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLXR8bSJ6hyQ4dJeQX1QN4MicIwIElNDhJomWypCSNWKpCafsL2w5icBPjJlMemaNZxMom7SZcUsfa6g/0', 'oPSnRvqeViott1ZoGTDJSI5LOnSg', null, '2017-08-05 17:25:01', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('50', 'o2Tkns-bf7-2o86npI8fJVdbW-nE', '枫逍遥', '1', 'zh_CN', '合肥', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6uxINUoYibI5LvibuSOAD631ibctJDko7Ly3a3iaicsL7yZ2OF3fg99lcP3kBzbBclKiaspe6gxL7mpK5g/0', 'oPSnRvq9vKq02zvkYdMp1IcJ73Mk', null, '2017-08-05 19:02:19', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('51', 'o2TknswmsV_0xbCAjd2j752w80bQ', '私は、林暁ました', '2', 'zh_CN', '揭阳', '广东', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALy5Qa0KRgu2LoOiappx2x3ibuefPyby8kVbBt2uUDQuK9LzK98QWs3zrDC6FOic1ibyWGzxiazIdEz0BNDiaxhT5ApDtI/0', 'oPSnRvqkI__eIQXOd4eVYXG619-8', null, '2017-08-06 13:56:11', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('52', 'o2Tkns6JuQ1hv4h-EjaF8FYlEPmA', 'Je veux que tu .', '1', 'zh_CN', '苏州', '江苏', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzvfRxyXUBiajaVPAYAAqjvYAhm9bVrUSlRk7ibgfUmGnbKSPQhnuhrGnq0afpfOwq5fibaIgLMehTQ5yRic73VUCey/0', 'oPSnRvhJSplp3kLSmLh8OI9YX9yw', null, '2017-08-06 23:44:00', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('53', 'o2Tkns3ORSkTitWhvJvARRuppJyI', '平南产业链', '1', 'zh_CN', '柳州', '广西', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8Zv078X2gaEgr8xFmMkveTKtxtwgSfLy8lRQibpQDxp8bBLxkpyiaf4arjFhdDEeaqQfqT9rPyjd2ia/0', 'oPSnRvqti6_C45MztND_6prRw5U8', null, '2017-08-07 00:10:24', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('54', 'o2Tkns8UXDjajNa5vU-A0o2QBfh8', '好心情', '2', 'zh_CN', '聊城', '山东', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLUZ1uicyDy4bc5md98p8oF9ib3Aia352seV9t2vRz59LDRFtzK8P3ydmiaJBoRic1N7B6vF2MRyxA392icgXX5XSe56yh/0', 'oPSnRvqgLums2MKZkXSuVyCinwrM', null, '2017-08-07 13:21:31', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('55', 'o2Tkns-nATp8ShqbrMkD2hP7xrdc', '张浩', '1', 'zh_CN', '黄冈', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM5INrvjaP0YzRHhMbp7RSGbMMA6X9bC7GYU6wHVbBGn0P4uicylwDuUkyxooV7HRKc0RwhicsChr98Mf4LmibW4BmF/0', 'oPSnRvrPNsfhce1AUyjrYW5wJIqw', null, '2017-08-07 18:40:04', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('56', 'o2Tknszu5IOCLfb5yeJNeWQcVOOs', '懂人自懂', '1', 'zh_CN', '武汉', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4kVnGOagT8RrkLZ6PckzGNu78bmfZKKvnHRO7AscetTDuBoSOnoxd7e1dsLa64PlWsZ2mSicJMjtY2icNrPVeA15/0', 'oPSnRvs_LkTkmOxuqWealNdVlW60', null, '2017-08-08 13:56:24', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('57', 'o2Tkns7D54jnVAAkFYFDlDWK4QvA', '中国士兵', '1', 'zh_CN', '龙岩', '福建', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLW1nhRnib4KzPa4vfnrHjkUhdIXHBMrxC29T13ibcd1vWh3mmQD95cPKHicmkhdJfTwK4MQX5JG79COetTAB5FGVOk/0', 'oPSnRvsk-DAcv0O_LU8d7iE-T-GI', null, '2017-08-08 21:13:25', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('58', 'o2TknswnEFbnxVjVPjPulJcFnPNU', '雪', '2', 'zh_CN', '', '萨尔茨堡', '奥地利', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKVTHaWWiatiblicFpUVHJK1LibUMWTy0N28zY3LuGbY1xXxibhoad09R6C7C61d1OPZbhicu1P7lSic8lqA/0', 'oPSnRvm4whkSZRv9danUDCDvzM5Y', null, '2017-08-09 17:40:49', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('59', 'o2Tkns511br33ceXe0aYzG1zS89c', 'My.逸晨', '1', 'zh_CN', '贵阳', '贵州', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Sib3kicNJNHPzc9V4ibAmiarP0jPGzXTmd4wBKyDoaSAqI09ODxMicZn0PI4WtqC7iads154hhribdjBdw/0', 'oPSnRvp6714A4_zuHObNCyw02XQo', null, '2017-08-10 01:27:43', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('60', 'o2Tknszsl7bfLrSsXOu_VwmYcpJs', '凯旋子工作室', '2', 'zh_CN', '湖州', '浙江', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVCMic0iaF58dpFD99qHmkSliaK1eCdGic6zm4GVa9HbiazGKy0iaUXhSEW7vbccNmaysP3hPYNzxtV1cE1/0', 'oPSnRvqDaAKGt5wNOH90cAJj2e3Y', null, '2017-08-10 02:23:44', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('61', 'o2TknszMbqVegO8QVez-VrtCuQH8', '冰雨忧蓝', '2', 'zh_CN', '哈尔滨', '黑龙江', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyYpqBHMMaL4sehjiagbzjET01XEyMOSpricZtlZwQ1ofzTGgUYGIKB8Bq4WaS1SbhycjM206dQmPKXpuK32iaYeiaP/0', 'oPSnRvpZ5r-mOT4idQWMogKWA_J8', null, '2017-08-10 16:52:45', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('62', 'o2Tkns5eoT9QvKor_XSm3YO04rPI', '一一', '2', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyF5qIOTLL5INZdNTa4D4s3kBylvJyXvJBicAQH8T6Hia6mT96qmK5Hx80urvRwp7BJuuibw6kzwyjAYEUzmaURhW2/0', 'oPSnRvkeXjZ9sBHB-8n91p_wfQUo', null, '2017-08-10 20:08:01', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('63', 'o2Tkns5VwkFaNSy9ByHNSj4gla00', '一夜孤行', '1', 'zh_CN', '湘西', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLUMPdafAlZZxRibtibPpIUibNO6a5LcohlQ7wdGCYtnzoZh9XutGlaniaG7D0HIdYGW4iaf3GD1iaFvvZ9TEtJa46xFGL/0', 'oPSnRvq6m--pBam15H0yQDABhLkY', null, '2017-08-10 20:23:54', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('64', 'o2Tkns5ZuiySOI4nlUIdsG5_V-Mo', '鑫', '1', 'zh_CN', '衡阳', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLWmc9pwttJr5Y1wvdwoz4E5oVhia0EUKp8NzHicjdV2kibnfib6Rqantn52x02221KZibo9ktMrticBZZntUIEf1Qqibg8/0', 'oPSnRvq83yh4OfAOgpm0aWh5krFA', null, '2017-08-10 20:30:17', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('65', 'o2Tkns2SdnPe8ngGxG4oTzksDCnA', '不༄～_夜༄～_天', '1', 'zh_CN', '贵港', '广西', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4icgg1QHyQkO04OyavEF8t4rKUysQqKbwQqWM2VRxyInSCVohF5VcN4tIl6cqfwIiawYZjlSs4xQroK9uFvorqCL/0', 'oPSnRvjMiGLws3J_YMpgQi4uYC-4', null, '2017-08-11 07:36:22', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('66', 'o2Tkns3Zi3P1clgJ1iUMx3QhrgDU', '小聋女', '2', 'zh_CN', '池州', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAryKwZiafibibHW5yoiaicrZ5h8vw4RLRkibI0hMIapAzHgJAjYAk97ic9SiaIT0mibsCrC3IMPxCkdMibGz65ZTVlgBruIybW0qUtF1ZZA/0', 'oPSnRvhRFcxPIJj_rm2fwvxmKrkw', null, '2017-08-11 10:27:44', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('67', 'o2TknswWLM8QpgE7jBnCN-MAJ_RQ', '王澳', '1', 'zh_CN', '苏州', '江苏', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJannmBSZShiafsJ5sthF3CCp0cy8fRYibicq0ryr9WkKmJIKoF6jhZ1I6kicZLkv6PGHFzib208lMpCHr/0', 'oPSnRvoJKYMcWvmh3_K0l3JkDOic', null, '2017-08-11 11:11:05', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('68', 'o2TknszDIlEcCndv2_gVG0li3iRI', '天知道乐', '1', 'zh_CN', '郴州', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVJISUzdsaRb3ovpMabwnBGGk89L5UTCJgbMN9a6qPicInoeYooVutryUfBnTY5yhsLrjcvseicJB2D/0', 'oPSnRvp0-SZB4X45f8evQE7YFGDI', null, '2017-08-11 11:22:41', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('69', 'o2Tkns6e1NQNOOqT591_wi-puLKs', '若翾', '2', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxgfuRBMAAzich3N6gpbIgu8Bt8nAUoibJkLeoKarOMKSG4I6I5a4iaO7wKJiccnEmpnEGcuzRw8DZfvUIozbRXtr9E/0', 'oPSnRvn8mBS1OqYqEYSrAYv54Zhw', null, '2017-08-12 06:03:23', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('70', 'o2Tkns6IgNHDeNtudJAvfp6JTKnc', '复杂的2017', '1', 'zh_CN', '芜湖', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM54NxmVYMKbUsbFnCpQFAu99ib8cM3snXLIicicdwz0WfLUJ5aWjrpCOpVtzsedNmnaRfB6y0f3SretoMibvvGyjHye/0', 'oPSnRvv-m0YS2MobyeT1k5pLP9zY', null, '2017-08-12 18:52:46', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('71', 'o2Tkns6DHqQ9u8RDp9_o5Fd0JJZU', 'Sun flower', '2', 'zh_CN', '', '四川', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM54NxmVYMKbUqwCUSwFb36Iow2skHcLwNJpa7Jic7DXmZFgibXMqGhRRibUWAW17lkSw2GOQkXVMak5MwchaoxS220/0', 'oPSnRvi2TsaD6vP9n0GTWfFuwroI', null, '2017-08-12 19:27:49', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('72', 'o2Tkns4tkMnwkHyHvIn_1WPdEAL0', '昵称', '1', 'zh_CN', '', '', '芬兰', 'http://wx.qlogo.cn/mmopen/MzfqicbJqBTuUibkZ0LmF2vxPMgbzogvqGrM22u5Xz2gDzRj8JJ4PJruRCKNTbjxfQD6bBrRFsZNursFuaFnIibQYcKicibPia2bJl/0', 'oPSnRvtyCMkCV41bq-RxrLDnXNsE', null, '2017-08-12 20:15:31', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('73', 'o2Tkns00csDCkPXWMvy1yYRdeKzM', '呼呼啦喲', '2', 'zh_CN', '成都', '四川', '中国', 'http://wx.qlogo.cn/mmopen/77kxhOrzE8xiaSb5IVKVibficibpWuq9V2WnJS8a5DdRXOBQe2IUh1o3vuUibwvnW1ZHWbEnia7r6oBIicSzibrJS4fZVf5ibg4EDGicAR/0', 'oPSnRvvMoCwvYlemCxVwk4TmyeWg', null, '2017-08-13 07:29:41', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('74', 'o2Tknsxhia1PB8hzuMKEGQtwl95c', '跃文', '0', 'zh_CN', '', '', '', '', 'oPSnRvmtEWHZX1Eu_JQiKw5wBl_0', null, '2017-08-13 11:18:42', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('75', 'o2Tknszpt8OM9kbhQdSnJP3RSQH4', '晓凇哥', '1', 'zh_CN', '长沙', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLWQUvYv1WbcbcWm7kkt9Qhj2RiapbZoTUwzx58K9AFMd8optB9aUicORNDm3p2iaoclxnhFRPjs3kysZgiafjqibpSB5/0', 'oPSnRvkwa4CZHavowpzYZP-efBTc', null, '2017-08-13 20:42:16', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('76', 'o2Tkns0g6P9fSa4jQadzzrH35VtM', '田馥解', '0', 'zh_CN', '', '克莱尔', '爱尔兰', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM6SL4vmQxX9jpzQx9u8aZ6V9Vj5ZtaREDKqwicScqAIs7PPAKGFicm60JIBMibibMA8vJrFFvo9pASMbAo6waKic6Eg7/0', 'oPSnRvm_zXyelAsH15_eaE53pzyA', null, '2017-08-13 23:08:28', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('77', 'o2TknswGwPBrQ6h9E7jz1pi8dykc', 'KIN', '1', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8ScISFkoMD0kgb9wZHBOcBEwIeuk22mBSBOIJlxPYibuuFahwdrUZlzwl7EibaCnnr8q6ZhnfKUnicv/0', 'oPSnRvsdLV-YODe5nOFMXc1eiOLk', null, '2017-08-14 00:58:15', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('78', 'o2Tkns5TnCgMprsRx5wwrqOVEjrE', '烈火', '0', 'zh_CN', '', '', '', '', 'oPSnRvhTeWBhBHOKC6SaX6BZTyGM', null, '2017-08-14 01:44:57', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('79', 'o2Tkns3Z954mB1tn36VleMyMuRiM', '梦梦', '2', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLUm11UNuzSROMCeInx2AZLE8rjibGthMMmdB89Im1g6n6zcje7TsEC2E0VRen2exJefAGicJsRJMBFg/0', 'oPSnRvjaKZpuvRBncwIt1bm0z-8k', null, '2017-08-14 22:58:06', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('80', 'o2Tkns8UIHftVCiP9FFT21-Ys0t0', 'CHAO', '1', 'zh_CN', '东莞', '广东', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzvDvgCI0vweic3v8c4QVczCnuKQznQsGGpI1YribFm43HqCgL1Wmrbbjeg45yF56V30jbMlwaiaNX9iaodCe8Vfvku/0', 'oPSnRvt-M9jRsZ5kFWOGKa3LXl0o', null, '2017-08-15 13:39:35', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('81', 'o2Tkns8BvsnUD4f-6rpqw6Yh0xbE', '彼岸花', '2', 'zh_CN', '南昌', '江西', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8WJZIOCjqwICraw1Vf1NYyuf7AuJLjRq76mQQvpYDlQLnTfiagbbIiafMhDx4SDcmwmNjbaBkicAYCL/0', 'oPSnRvlue3003ogJl6a7mMZBAL0Q', null, '2017-08-16 12:32:04', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('82', 'o2Tkns5KHfYXle3lh8Um6leznXno', '雨影成风', '2', 'zh_CN', '南宁', '广西', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALxXDJyfJAJ9bfz5LvyqnvHvrLicJDFGYH404P17W5TanyqEibLHGNGCM0DlvpRpV5Sicj2NrICxrTGGUaI0CSiczJxt/0', 'oPSnRviiBKpY45ZPsxm7C8I52ztE', null, '2017-08-16 13:36:08', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('83', 'o2Tkns-BWfpxeBfSZh2KlXTa3DpA', '，', '1', 'zh_CN', '厦门', '福建', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzy8Y7hujrRXjv60phC8wr26ps8u20PqnjPH0UzanFMkwRsztML35QYRkeacxXkdR1ZnVKdtKQHibCEgj8jFBhGk/0', 'oPSnRvmKQvJzscauHRyUplwK4VzE', null, '2017-08-16 23:37:59', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('84', 'o2Tkns7d1gvm_BOadrH264ogybXM', '樊', '1', 'zh_CN', '铜仁', '贵州', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALwDK4f7YkjxicMP6rZVbpVxynoTJhbKuLv5YRPK5A2iafuMgeeeHHLPHw5l3Wb56zCy0tSZFyOrDjPyIF1cJZUoNB/0', 'oPSnRvoWLLs2p60BW9px2g0Q0Ots', null, '2017-08-16 23:52:46', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('85', 'o2Tkns-M4ugvu4exW5R2VTHCn_T4', '随风飘逸', '1', 'zh_CN', '合肥', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxcFawibKlAiaGBreUKCfpcibh626XTnVuyPH3zH2PKNYbnlfTYO2pnlI5kId8qQ2XZ9L8sFsvdcT5XYCwH6EeXkHT/0', 'oPSnRvoGjTk-aTvwl5powOSWTlic', null, '2017-08-17 08:36:08', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('86', 'o2Tknsx6aAKvhUtkZQZJqbuELy8A', '子寒', '1', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfzDkxQw2RCI1W5WEic0mmJlu0r9FFr45AFbNClTm41ezfAoXZqnH3XfrCibGsMaEwuJ60QHRSBK6vUYGS46CFQh5M/0', 'oPSnRvqFimzkKCLqWFk_yEtNY96U', null, '2017-08-17 23:27:50', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('87', 'o2Tkns3KVTZtCE-JtwF79n4g0cSw', 'wo姓梁也狠善良', '1', 'zh_CN', '路环岛', '澳门', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALwpDQ7Jjz5X7hQRiaicnSBQtbJ62ibktqLtj9V2yIVIzKfFibuaRgw3vzEYI5h9bcBm2eEFGeicr8tfVRtx054rCXlst/0', 'oPSnRvhUTpX_G0zy0oFg76aQQJqc', null, '2017-08-18 01:22:02', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('88', 'o2Tkns2dkKmCChfbToQ4Uhqzoa2Q', 'lisa', '2', 'zh_CN', '', '', '安道尔', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8To0z1J8uSaahaqyun1zv2NgychWc5lbIymkT0OEWkicRFg0L1g40PYkMyeX1TkGF765JBsRvQYFu/0', 'oPSnRvphtMB27RsRoACj8dl7ZNBM', null, '2017-08-18 14:00:17', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('89', 'o2Tkns-AJLlvfgGG5n4w1Y-yaIFA', '久保田卫梦', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/icT7D3pJU35I5LhYuBTfQvJNkQyaeLfcYrGDyreF0aotfVTXyj1q8Gib2GuPE8oICaLJG2r1icLftEN7Gq5YfO5PiaIffvBKMwZK/0', 'oPSnRvg8Zo1mVdO0nIc28heBVi5U', null, '2017-08-18 19:40:21', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('90', 'o2Tkns72Jeter1kU2qOyl9DSCEa0', '星晨', '2', 'zh_CN', '深圳', '广东', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVMV9e4pckMU4V9DxLuVicvG4NghGogibhqKDDARjs3iaep6ribd5jDxia4Jvwvf6qnXoQ9huISPgXUj86/0', 'oPSnRvv9iaPCoTXOP2D6C-7aBbJg', null, '2017-08-18 22:26:15', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('91', 'o2Tkns4bGgzAeDLZF2zcPsFy6vAM', '看莴', '2', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM5o0rQyxicwfibHmcicrVWUdIRVQpicAl3BiaD9XNBeGwIickPCfMWUY49GERa9hazwGziap25WG3a81eX8kGyjVicXkXYn/0', 'oPSnRvmiMtmewXKqm86Qth5pFAAU', null, '2017-08-19 01:08:57', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('92', 'o2Tkns20Jrm1eDO_9rMleSMvYTR8', '天下皆白', '1', 'zh_CN', '孝感', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLUoOIleT9vGxKwFFqdWb7Ajvv9ShlQS0qyhn5mw3cmxRSIYaGvLfeRsMXwjTrZ6leDqH71icEYeu3quMUghKZgn6/0', 'oPSnRvjAZm6Kl_K4YRv95wDis9ec', null, '2017-08-19 10:14:22', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('93', 'o2Tkns5kVNi-YyBlkK5YxryDgNiM', '梅雪', '2', 'zh_CN', '沧州', '河北', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJbm417SGRiaJdsomL6L7xYWqTttLI7RSibYxysBYjzHQddyANpAdt5qq5fY4xEYlLzfHc7njzEeA8w/0', 'oPSnRvuLweMwGB9_SeqqyvxU6Qq0', null, '2017-08-19 15:07:34', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('94', 'o2Tkns3uTK5TvfDRgeUCeCgrBjwA', '花生', '2', 'zh_CN', '泰安', '山东', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8WWuze1ABNeINWZh2GH3AeTlWBRRkANwG42yJPOibMtN8gq7KJyT5PT0cxY7Y56h9ApSbLiaIxNoo4/0', 'oPSnRvgdA0fJm_IK2gFCQKVKXxtc', null, '2017-08-19 15:22:30', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('95', 'o2Tknsx6uprBnyPGKndfo-XhgECM', '幸福', '0', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfwGyOLP2uYibfnCthicLjj8JzC3kfhNeoIrQxuCibtIEDwicRyBiaiaCIZUxf0MZGbGDBOCA39Vbs822WUrkUvNwBwYia7/0', 'oPSnRvn5pNF7S_hmsfYxZ1U_8ecc', null, '2017-08-19 22:15:26', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('96', 'o2Tkns9yeZArJWFEhHfKMwwD7mYI', '陌角停落丶', '2', 'zh_CN', '', '巴黎', '法国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALyQVibyCY7AJ8fZWYQaicqD8ZpOicDFbHflV9G4ibia3qFYWSIKahRlIgWiaRyyKwnTuBackqNGPicFgYL91ylCCKaVTIb/0', 'oPSnRvjT9rI_teysiAaMmtu21mvk', null, '2017-08-22 00:15:35', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('97', 'o2TknsxasFqyDD5E8GsSHTk2wCos', '又何妨', '1', 'zh_CN', '襄阳', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVLlJ4MsiaXREIybEC59ibbSG1RryIxB51MA9p6KyZv9wI0QG92evwhpg9XdzzyeWZJ2njquFhE3nkZ/0', 'oPSnRvu-PtKtgkntGJCIttddGNys', null, '2017-08-23 22:06:19', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('98', 'o2Tknsx7kMZ8ImdI7cHgakM1FtqI', '○   ○', '1', 'zh_CN', '汕头', '广东', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5pcVT4o8Uow0Z1OdwzXbMe84R0OdCZ2oqtozD0jZYzx2QAAha96DokUVN9XY7cCxIURTUhr4mbgdWgr21jh36yj0MSfEdTCg0/0', 'oPSnRvl9_QRH7s0LQI8dxe5xtLec', null, '2017-08-25 11:52:05', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('99', 'o2TknszBzfFJoZw6lIejfRI97vQE', '习惯被依赖', '1', 'zh_CN', '石家庄', '河北', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxwfEErU1lnJc4NnrKHTyCs5Kso8axSHza7GNsxIBzUflTcERMEI0azeXGgn24V4P2y5dtmy7HdgWTTwDpU5GxM/0', 'oPSnRvvNV0hc0pso9SZADfQaBl4E', null, '2017-08-25 20:01:16', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('100', 'o2Tkns6_uuG-13NB0eM5CEjZ6cpA', '傻的可怜。玩的已烂', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5e9cRbThIJTjnf5ibKxtK6XvhAuROnag7EnJzazT0EKUficQdYCdCIwfeuGoR8eKKeHAveIia566SicA/0', 'oPSnRvk63jfKddZdGGIJk_ncNGKw', null, '2017-08-26 01:22:56', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('101', 'o2Tknsz0YT7XJuCgRE0TT9wbeD18', '风的线条', '1', 'zh_CN', '郴州', '湖南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6b8a65XLpchib4iaMia0TYtrveWyUBEpeQbP57XJzE0xcEw6BV9XkAfwlXHfnxKUnMmjQWZ0O3UiaG2gojgph3YfwckzknhDBKicX4/0', 'oPSnRvn8r2UmBcspuG00lg_Zu840', null, '2017-08-26 10:06:49', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('102', 'o2Tkns9T4KhyppGhhJjYFiCOlEGs', '素城灬丿独演丶浅笑°', '2', 'zh_CN', '安康', '陕西', '中国', 'http://wx.qlogo.cn/mmopen/Gh0TxTVoGM4XL8hSaSmbVBvzibv1CXQamTRdz5micf6ukEybPDrWxLz4NmuVdHB8nmcwwrH9TXYInAhZVRUoYmptUD4nPVx51o/0', 'oPSnRvo0IROblvywygjS0lZlBkCU', null, '2017-08-26 18:10:22', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('103', 'o2Tkns_uNzrGM05pHWBVIp5WcmV4', '天天快乐', '2', 'zh_CN', '吉朗', '维多利亚', '澳大利亚', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7lZBfiadf4P2ibL7UswyxQaG6nW7FHVecMXqLusdNBicsmz9cZvohe9K2Ja9auQ6HbWfbickM6GJT2dA/0', 'oPSnRvoBB7Z7NKnYWsL-t9vLOrvs', null, '2017-08-26 18:42:21', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('104', 'o2Tkns0FuK9qw1OavEsxOA1DPNXE', '守护相望', '0', 'zh_CN', '', '', '', '', 'oPSnRvk8qS1bzVHMbK_xmjamCR8Y', null, '2017-08-27 11:58:34', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('105', 'o2Tkns2RRIBcfAemBQUjP9l2MzDs', '创新『莹儿』招双代', '2', 'zh_CN', '贵港', '广西', '中国', 'http://wx.qlogo.cn/mmopen/zSiaCXvUvwfxzC3ZapJeROgsaRaeducdvSByzmyFr90nBljnHek6LRwPGLkLIvLNm7PdlQTPyoajJUQhhellCmwMjosdI8LtR/0', 'oPSnRvjFBFvzXEv2vg7EI4YeBlyA', null, '2017-08-27 14:15:11', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('106', 'o2Tkns2unyuEEEfmxxnh_SBSoNWw', '出马', '2', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/SY3lHO8iciaqLoSsfrJiaqe0k1pyeIN0Bkwr2ic17enP7WqPv5QRoag6h94vWicZY32VO1QnWtR9bibp8v5Fw0M1TIgV9kGe6NnIzK/0', 'oPSnRvsOuFpMsmv73gCgfFyz01LU', null, '2017-08-27 22:57:08', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('107', 'o2Tkns3tnSgBFgB7qO6zY67rqG9o', '，，，，，，', '1', 'zh_CN', '安庆', '安徽', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7OflQibaId7LCwSUDkzm826LtkXHs8483xwYibcqHMtEoQrC3b2icXicwlic9IYoES3sNC2M0X4XUR6jg/0', 'oPSnRvm4QD0jWGZxkmNmACZGSXzk', null, '2017-08-28 10:19:47', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('108', 'o2Tkns2N88WsAiUuxN7JuD3WcK5E', '　　　　　', '1', 'zh_CN', '两江新区', '重庆', '中国', 'http://wx.qlogo.cn/mmopen/50HcP4UOeLWn1LvdnlFHUfx4XvzWRO27W8Stiafjt0AutAUJ51AgsdnicuTaOFwiaxRgXia3yLHzCBuMxN3vg43n6g/0', 'oPSnRvqxNblHvPJRJl_-Kzu02ZcI', null, '2017-08-28 11:21:45', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('109', 'o2Tkns8Bp6-uHztJACtPjQ-VTluw', '好奇心害死喵*', '2', 'zh_CN', '梧州', '广西', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALy5Qa0KRgu2Loa9MdjTeE4r93rVcibUn0cmFVwL9mndlXLt31O8qf7gTCUlOnNZvo5iaO90wcgSnLdJqSTL54UbDx/0', 'oPSnRvlOETVhNyzzf2lQbNh9aOfc', null, '2017-08-29 00:16:15', null, '1');
INSERT INTO `tb_comm_user_qdjl` VALUES ('110', 'o2Tkns6zgwLXwb1fOoBu-6-BW0CQ', '开心文玩快乐。', '1', 'zh_CN', '南充', '四川', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALzyCg2dQmhiavsCYq8Hdw7GWtibyStoOTsXfxHazsWC80Q7dN94r0bIWcdkVQQK19shAm822KuictlFhW7nX7noibOo/0', 'oPSnRvnMXuzVTkMNjvH1_RpdkXHQ', null, '2017-08-29 06:15:49', null, '0');
INSERT INTO `tb_comm_user_qdjl` VALUES ('111', 'o2Tkns1Nz7BomVpX0QT7auiQ1PEg', '朱慧珍', '2', 'zh_CN', '黄浦', '上海', '中国', 'http://wx.qlogo.cn/mmopen/EhlBsINlALzS5hXWrAzlxPDXBK5mf1VOUINZQnmic1haJtFJeWYxib0M9WibWc4c3CIicqJjCKpefiadPwNsdLL507ZFMLuZb1tVB/0', 'oPSnRvgQyTzVdNXOiOgaoxIYckgc', null, '2017-08-29 07:41:32', null, '1');

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', 'R_ADMIN', '2014-12-08 15:51:57', '2014-12-08 15:51:57');
INSERT INTO `tb_role` VALUES ('2', 'R_OPERATOR', '2015-04-19 23:55:27', '2015-04-19 23:55:27');
INSERT INTO `tb_role` VALUES ('3', 'R_PROMOTER', '2015-04-19 23:55:27', '2015-04-19 23:55:27');
INSERT INTO `tb_role` VALUES ('4', 'R_WEIGHT_ACCOUNT_MANAGER', '2015-05-10 00:00:37', '2015-05-10 00:00:45');
INSERT INTO `tb_role` VALUES ('5', 'R_HOST', '2017-06-03 13:34:33', '2017-06-03 13:34:39');

-- ----------------------------
-- Table structure for `tb_role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_authority`;
CREATE TABLE `tb_role_authority` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `authority_id` int(11) unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='角色权限关系';

-- ----------------------------
-- Records of tb_role_authority
-- ----------------------------
INSERT INTO `tb_role_authority` VALUES ('3', '1', '11', '2015-04-20 23:30:46', '2015-04-20 23:30:46');
INSERT INTO `tb_role_authority` VALUES ('4', '1', '12', '2015-04-20 23:30:46', '2015-04-20 23:30:46');
INSERT INTO `tb_role_authority` VALUES ('5', '1', '13', '2015-04-20 23:30:46', '2015-04-20 23:30:46');
INSERT INTO `tb_role_authority` VALUES ('6', '1', '14', '2015-04-20 23:30:46', '2015-04-20 23:30:46');
INSERT INTO `tb_role_authority` VALUES ('7', '1', '15', '2015-04-20 23:30:47', '2015-04-20 23:30:47');
INSERT INTO `tb_role_authority` VALUES ('8', '1', '21', '2015-04-20 23:30:47', '2015-04-20 23:30:47');
INSERT INTO `tb_role_authority` VALUES ('9', '1', '22', '2015-04-20 23:30:47', '2015-04-20 23:30:47');
INSERT INTO `tb_role_authority` VALUES ('10', '1', '23', '2015-04-20 23:30:48', '2015-04-20 23:30:48');
INSERT INTO `tb_role_authority` VALUES ('11', '1', '24', '2015-04-20 23:30:48', '2015-04-20 23:30:48');
INSERT INTO `tb_role_authority` VALUES ('12', '1', '25', '2015-04-20 23:30:48', '2015-04-20 23:30:48');
INSERT INTO `tb_role_authority` VALUES ('13', '1', '31', '2015-04-20 23:30:48', '2015-04-20 23:30:48');
INSERT INTO `tb_role_authority` VALUES ('14', '1', '32', '2015-04-20 23:30:48', '2015-04-20 23:30:48');
INSERT INTO `tb_role_authority` VALUES ('15', '1', '33', '2015-04-20 23:30:49', '2015-04-20 23:30:49');
INSERT INTO `tb_role_authority` VALUES ('16', '1', '34', '2015-04-20 23:30:49', '2015-04-20 23:30:49');
INSERT INTO `tb_role_authority` VALUES ('17', '1', '41', '2015-04-20 23:30:49', '2015-04-20 23:30:49');
INSERT INTO `tb_role_authority` VALUES ('18', '1', '42', '2015-04-20 23:30:49', '2015-04-20 23:30:49');
INSERT INTO `tb_role_authority` VALUES ('19', '1', '43', '2015-04-20 23:30:49', '2015-04-20 23:30:49');
INSERT INTO `tb_role_authority` VALUES ('20', '1', '44', '2015-04-20 23:30:50', '2015-04-20 23:30:50');
INSERT INTO `tb_role_authority` VALUES ('21', '1', '45', '2015-04-20 23:30:50', '2015-04-20 23:30:50');
INSERT INTO `tb_role_authority` VALUES ('22', '1', '50', '2015-04-20 23:30:50', '2015-04-20 23:30:50');
INSERT INTO `tb_role_authority` VALUES ('23', '2', '11', '2015-04-20 23:33:48', '2015-04-20 23:33:48');
INSERT INTO `tb_role_authority` VALUES ('24', '2', '12', '2015-04-20 23:33:48', '2015-04-20 23:33:48');
INSERT INTO `tb_role_authority` VALUES ('25', '2', '13', '2015-04-20 23:33:48', '2015-04-20 23:33:48');
INSERT INTO `tb_role_authority` VALUES ('26', '2', '14', '2015-04-20 23:33:49', '2015-04-20 23:33:49');
INSERT INTO `tb_role_authority` VALUES ('27', '2', '15', '2015-04-20 23:33:49', '2015-04-20 23:33:49');
INSERT INTO `tb_role_authority` VALUES ('28', '2', '21', '2015-04-20 23:33:49', '2015-04-20 23:33:49');
INSERT INTO `tb_role_authority` VALUES ('29', '2', '22', '2015-04-20 23:33:49', '2015-04-20 23:33:49');
INSERT INTO `tb_role_authority` VALUES ('30', '2', '23', '2015-04-20 23:33:49', '2015-04-20 23:33:49');
INSERT INTO `tb_role_authority` VALUES ('31', '2', '24', '2015-04-20 23:33:50', '2015-04-20 23:33:50');
INSERT INTO `tb_role_authority` VALUES ('32', '2', '25', '2015-04-20 23:33:50', '2015-04-20 23:33:50');
INSERT INTO `tb_role_authority` VALUES ('33', '2', '41', '2015-04-20 23:33:50', '2015-04-20 23:33:50');
INSERT INTO `tb_role_authority` VALUES ('34', '2', '42', '2015-04-20 23:33:50', '2015-04-20 23:33:50');
INSERT INTO `tb_role_authority` VALUES ('35', '2', '43', '2015-04-20 23:33:50', '2015-04-20 23:33:50');
INSERT INTO `tb_role_authority` VALUES ('36', '2', '44', '2015-04-20 23:33:51', '2015-04-20 23:33:51');
INSERT INTO `tb_role_authority` VALUES ('37', '2', '45', '2015-04-20 23:33:51', '2015-04-20 23:33:51');
INSERT INTO `tb_role_authority` VALUES ('38', '3', '15', '2015-04-20 23:39:40', '2015-04-20 23:39:40');
INSERT INTO `tb_role_authority` VALUES ('39', '3', '22', '2015-04-20 23:39:40', '2015-04-20 23:39:40');
INSERT INTO `tb_role_authority` VALUES ('40', '3', '23', '2015-04-20 23:39:40', '2015-04-20 23:39:40');
INSERT INTO `tb_role_authority` VALUES ('41', '1', '10', '2015-05-03 18:38:15', '2015-05-03 18:38:15');
INSERT INTO `tb_role_authority` VALUES ('42', '1', '20', '2015-05-03 18:38:16', '2015-05-03 18:38:16');
INSERT INTO `tb_role_authority` VALUES ('43', '1', '30', '2015-05-03 18:38:16', '2015-05-03 18:38:16');
INSERT INTO `tb_role_authority` VALUES ('44', '1', '40', '2015-05-03 18:38:16', '2015-05-03 18:38:16');
INSERT INTO `tb_role_authority` VALUES ('51', '2', '10', '2015-05-03 19:38:37', '2015-05-03 19:38:37');
INSERT INTO `tb_role_authority` VALUES ('52', '2', '20', '2015-05-03 19:38:37', '2015-05-03 19:38:37');
INSERT INTO `tb_role_authority` VALUES ('53', '2', '40', '2015-05-03 19:38:38', '2015-05-03 19:38:38');
INSERT INTO `tb_role_authority` VALUES ('54', '3', '10', '2015-05-03 19:39:25', '2015-05-03 19:39:25');
INSERT INTO `tb_role_authority` VALUES ('55', '3', '20', '2015-05-03 19:39:25', '2015-05-03 19:39:25');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL COMMENT 'userid，每个用户唯一，推广员注册时填写的上级ID',
  `username` varchar(60) NOT NULL COMMENT '用户名',
  `passwd` varchar(100) DEFAULT NULL COMMENT '密码',
  `fromto` varchar(20) NOT NULL COMMENT '用户来源： \n            online:线上\n            offline:线下',
  `type` varchar(20) DEFAULT NULL COMMENT '用户类型\n：\r\nA:提供手机和apple id \r\nB:提供apple id\r\nC:不提供apple id的注册用户\n (获取金币会多出10%) \r\nD:游客 \r\nE:微信',
  `idfa` varchar(60) DEFAULT NULL,
  `p_user` varchar(60) NOT NULL DEFAULT '5' COMMENT '推广ID',
  `name` varchar(60) DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `invite_code` varchar(50) DEFAULT NULL,
  `apple_account` varchar(100) DEFAULT NULL COMMENT '苹果账号',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `award` int(11) DEFAULT NULL COMMENT '余额',
  `type_time` datetime DEFAULT NULL COMMENT '用户类型升级时间',
  `city` varchar(100) DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是',
  `ip` varchar(100) DEFAULT NULL,
  `nation` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态，  1:正常 2:IDFA异常(可能是自己的idfa重置了，也可能是idfa与之前注册用户的idfa重复了)  3:停用 4:冻结 5:黑名单',
  `area` varchar(100) DEFAULT NULL,
  `exception_level` tinyint(1) DEFAULT '0' COMMENT '异常级别，不同级别的用户出现异常  所对应的管理员不一样。',
  `client_type` char(1) DEFAULT NULL,
  `weight_flag` int(1) NOT NULL DEFAULT '0' COMMENT 'weight_flag（权重标记，0未下载 1已下载未检测 2已测试，有变化 3 无权重）',
  `weight_count` int(4) NOT NULL DEFAULT '0' COMMENT 'weight_count（完成奖励任务次数）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('14', '61', '18762931954', null, 'offline', 'E', 'abcd-bcde-defg-efgh', '5', '', null, '18762931954', '5', null, '', '0', null, '', '0', null, null, '', '1', '', '0', null, '0', '0', '2015-04-30 16:57:09');
INSERT INTO `tb_user` VALUES ('16', '118285', '13804419886', 'e10adc3949ba59abbe56e057f20f883e', 'offline', 'E', 'D8CF8021-65D9-483F-A16A-A48F97116D1B', '5', null, null, '13804419886', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-04-30 17:47:09');
INSERT INTO `tb_user` VALUES ('19', '551988', '13626299557', null, 'offline', 'E', null, '5', null, null, '13626299557', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-04-30 18:53:11');
INSERT INTO `tb_user` VALUES ('20', '217000', '15600600596', null, 'offline', 'E', 'C731182A-50B5-4070-B986-9166A6D97245', '5', null, null, '15600600596', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-04-30 19:33:46');
INSERT INTO `tb_user` VALUES ('22', '614848', '13910779120', null, 'offline', 'E', '896A8ECD-F6E0-4D37-96EB-23521BEC64AD', '5', null, null, '13910779120', '5', null, null, '1030', null, null, '0', null, null, null, '1', null, '0', null, '3', '3', '2015-04-30 19:42:06');
INSERT INTO `tb_user` VALUES ('24', '559362', '15338595053', null, 'offline', 'E', null, '5', null, null, '15338595053', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-04-30 20:12:02');
INSERT INTO `tb_user` VALUES ('30', '157592', '13594767987', null, 'offline', 'E', null, '5', null, null, '13594767987', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 03:48:28');
INSERT INTO `tb_user` VALUES ('31', '432499', '13808743329', null, 'offline', 'E', null, '5', null, null, '13808743329', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 05:08:21');
INSERT INTO `tb_user` VALUES ('32', '528178', '15002070645', null, 'offline', 'E', null, '5', null, null, '15002070645', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 08:41:09');
INSERT INTO `tb_user` VALUES ('33', '572208', '18676261197', null, 'offline', 'E', null, '5', null, null, '18676261197', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 08:46:42');
INSERT INTO `tb_user` VALUES ('38', '658859', '18500817089', null, 'offline', 'E', '29740340-894A-4AD1-BD36-46C88445A3CE', '5', null, null, '18500817089', '5', null, null, '300', null, null, '0', null, null, null, '1', null, '0', null, '2', '0', '2015-05-01 11:43:50');
INSERT INTO `tb_user` VALUES ('41', '494814', '18040170589', null, 'offline', 'E', null, '5', null, null, '18040170589', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 13:06:23');
INSERT INTO `tb_user` VALUES ('43', '164382', '15801435098', null, 'offline', 'E', null, '5', null, null, '15801435098', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 13:44:24');
INSERT INTO `tb_user` VALUES ('51', '223145', '13750077508', null, 'offline', 'E', 'A9415CD9-76F4-4DC8-AB01-00922D62BB08', '5', null, null, '13750077508', '5', null, null, '680', null, null, '0', null, null, null, '2', null, '0', null, '3', '2', '2015-05-01 19:37:57');
INSERT INTO `tb_user` VALUES ('55', '147650', '13020079463', null, 'offline', 'E', '4726A010-F45E-401E-940B-1575180743B4', '5', null, null, '13020079463', '5', null, null, '300', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 20:15:12');
INSERT INTO `tb_user` VALUES ('56', '394143', '13311582655', null, 'offline', 'E', '0DF7F45D-60E1-4CB1-A4F7-E1840D026092', '5', null, null, '13311582655', '5', null, null, '200', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 20:21:14');
INSERT INTO `tb_user` VALUES ('58', '539292', '18652909710', null, 'offline', 'E', null, '5', null, null, '18652909710', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 22:17:57');
INSERT INTO `tb_user` VALUES ('59', '240180', '13311285708', null, 'offline', 'E', null, '5', null, null, '13311285708', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-01 22:25:09');
INSERT INTO `tb_user` VALUES ('60', '214073', '18600156045', null, 'offline', 'E', '877A500F-617D-4D74-A6CC-9E6454A83DCB', '5', null, null, '18600156045', '5', null, null, '650', null, null, '0', null, null, null, '1', null, '0', null, '2', '1', '2015-05-01 22:40:54');
INSERT INTO `tb_user` VALUES ('61', '321536', '13338019809', null, 'offline', 'E', '6EC88DCD-B2E8-4BF7-9304-9165225D90DA', '5', null, null, '13338019809', '5', null, null, '1730', null, null, '0', null, null, null, '1', null, '0', null, '2', '3', '2015-05-02 00:53:50');
INSERT INTO `tb_user` VALUES ('62', '272134', '13772507716', null, 'offline', 'E', 'DC51BC1D-BA56-48A8-B1C8-9DD7103A572F', '5', null, null, '13772507716', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:15:13');
INSERT INTO `tb_user` VALUES ('63', '369874', '15883783768', null, 'offline', 'E', '363E531B-1CD7-44DB-85BC-C1F80A089F5B', '5', null, null, '15883783768', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:18:28');
INSERT INTO `tb_user` VALUES ('64', '126124', '18509247275', null, 'offline', 'E', null, '5', null, null, '18509247275', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:23:26');
INSERT INTO `tb_user` VALUES ('65', '594303', '18672713268', null, 'offline', 'E', null, '5', null, null, '18672713268', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:27:14');
INSERT INTO `tb_user` VALUES ('66', '237924', '13501210345', null, 'offline', 'E', 'D8CF8021-65D9-483F-A16A-A48F97116D1B', '5', null, null, '13501210345', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:28:08');
INSERT INTO `tb_user` VALUES ('67', '285992', '18700907415', null, 'offline', 'E', 'D8CF8021-65D9-483F-A16A-A48F97116D1B', '5', null, null, '18700907415', '5', null, null, '0', null, null, '0', null, null, null, '1', null, '0', null, '0', '0', '2015-05-14 13:29:40');

-- ----------------------------
-- Table structure for `tb_user_action_history`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_action_history`;
CREATE TABLE `tb_user_action_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `action_type` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `descrption` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3311 DEFAULT CHARSET=utf8 COMMENT='用户行为记录';

-- ----------------------------
-- Records of tb_user_action_history
-- ----------------------------
INSERT INTO `tb_user_action_history` VALUES ('3082', '305843', '1', '2015-04-08 17:04:26', null);
INSERT INTO `tb_user_action_history` VALUES ('3083', '305843', '1', '2015-04-08 17:14:30', null);
INSERT INTO `tb_user_action_history` VALUES ('3084', '305843', '1', '2015-04-08 17:16:19', null);
INSERT INTO `tb_user_action_history` VALUES ('3085', '305843', '1', '2015-04-08 17:16:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3086', '305843', '1', '2015-04-08 18:04:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3087', '305843', '1', '2015-04-08 18:21:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3088', '305843', '1', '2015-04-08 18:24:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3089', '305843', '1', '2015-04-08 18:25:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3090', '305843', '1', '2015-04-08 18:40:09', null);
INSERT INTO `tb_user_action_history` VALUES ('3091', '305843', '1', '2015-04-08 18:40:51', null);
INSERT INTO `tb_user_action_history` VALUES ('3092', '305843', '1', '2015-04-08 18:46:06', null);
INSERT INTO `tb_user_action_history` VALUES ('3093', '305843', '1', '2015-04-08 18:50:19', null);
INSERT INTO `tb_user_action_history` VALUES ('3094', '305843', '1', '2015-04-08 18:54:15', null);
INSERT INTO `tb_user_action_history` VALUES ('3095', '305843', '1', '2015-04-09 10:00:44', null);
INSERT INTO `tb_user_action_history` VALUES ('3096', '305843', '1', '2015-04-09 10:18:53', null);
INSERT INTO `tb_user_action_history` VALUES ('3097', '305843', '1', '2015-04-09 10:19:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3098', '305843', '1', '2015-04-09 10:31:17', null);
INSERT INTO `tb_user_action_history` VALUES ('3099', '305843', '1', '2015-04-09 10:34:05', null);
INSERT INTO `tb_user_action_history` VALUES ('3100', '305843', '1', '2015-04-09 10:35:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3101', '305843', '1', '2015-04-09 10:42:25', null);
INSERT INTO `tb_user_action_history` VALUES ('3102', '305843', '1', '2015-04-09 10:56:57', null);
INSERT INTO `tb_user_action_history` VALUES ('3103', '305843', '1', '2015-04-09 11:03:31', null);
INSERT INTO `tb_user_action_history` VALUES ('3104', '305843', '1', '2015-04-09 11:06:56', null);
INSERT INTO `tb_user_action_history` VALUES ('3105', '305843', '1', '2015-04-09 11:07:07', null);
INSERT INTO `tb_user_action_history` VALUES ('3106', '305843', '1', '2015-04-09 11:07:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3107', '305843', '1', '2015-04-09 11:10:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3108', '305843', '1', '2015-04-09 11:12:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3109', '305843', '1', '2015-04-09 11:12:34', null);
INSERT INTO `tb_user_action_history` VALUES ('3110', '305843', '1', '2015-04-09 11:12:52', null);
INSERT INTO `tb_user_action_history` VALUES ('3111', '305843', '1', '2015-04-09 11:13:11', null);
INSERT INTO `tb_user_action_history` VALUES ('3112', '305843', '1', '2015-04-09 11:18:09', null);
INSERT INTO `tb_user_action_history` VALUES ('3113', '305843', '1', '2015-04-09 11:20:40', null);
INSERT INTO `tb_user_action_history` VALUES ('3114', '305843', '1', '2015-04-09 11:21:59', null);
INSERT INTO `tb_user_action_history` VALUES ('3115', '305843', '1', '2015-04-09 11:28:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3116', '305843', '1', '2015-04-09 11:28:52', null);
INSERT INTO `tb_user_action_history` VALUES ('3117', '305843', '1', '2015-04-09 11:29:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3118', '305843', '1', '2015-04-09 11:34:15', null);
INSERT INTO `tb_user_action_history` VALUES ('3119', '305843', '1', '2015-04-09 11:34:33', null);
INSERT INTO `tb_user_action_history` VALUES ('3120', '305843', '1', '2015-04-09 11:34:45', null);
INSERT INTO `tb_user_action_history` VALUES ('3121', '305843', '1', '2015-04-09 11:34:54', null);
INSERT INTO `tb_user_action_history` VALUES ('3122', '305843', '1', '2015-04-09 11:35:03', null);
INSERT INTO `tb_user_action_history` VALUES ('3123', '305843', '1', '2015-04-09 11:35:10', null);
INSERT INTO `tb_user_action_history` VALUES ('3124', '346344', '1', '2015-04-09 11:35:46', null);
INSERT INTO `tb_user_action_history` VALUES ('3125', '346344', '1', '2015-04-09 11:35:47', null);
INSERT INTO `tb_user_action_history` VALUES ('3126', '305843', '1', '2015-04-09 11:36:30', null);
INSERT INTO `tb_user_action_history` VALUES ('3127', '305843', '1', '2015-04-09 11:38:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3128', '305843', '1', '2015-04-09 11:38:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3129', '305843', '1', '2015-04-09 11:39:09', null);
INSERT INTO `tb_user_action_history` VALUES ('3130', '305843', '1', '2015-04-09 11:42:49', null);
INSERT INTO `tb_user_action_history` VALUES ('3131', '346344', '1', '2015-04-09 11:43:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3132', '346344', '1', '2015-04-09 11:43:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3133', '346344', '1', '2015-04-09 11:44:09', null);
INSERT INTO `tb_user_action_history` VALUES ('3134', '346344', '1', '2015-04-09 11:45:06', null);
INSERT INTO `tb_user_action_history` VALUES ('3135', '346344', '1', '2015-04-09 11:58:01', null);
INSERT INTO `tb_user_action_history` VALUES ('3136', '346344', '1', '2015-04-09 11:58:04', null);
INSERT INTO `tb_user_action_history` VALUES ('3137', '305843', '1', '2015-04-09 12:03:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3138', '346344', '1', '2015-04-09 12:05:50', null);
INSERT INTO `tb_user_action_history` VALUES ('3139', '305843', '1', '2015-04-09 14:21:42', null);
INSERT INTO `tb_user_action_history` VALUES ('3140', '305843', '1', '2015-04-09 14:22:53', null);
INSERT INTO `tb_user_action_history` VALUES ('3141', '305843', '1', '2015-04-09 14:24:51', null);
INSERT INTO `tb_user_action_history` VALUES ('3142', '305843', '1', '2015-04-09 14:34:16', null);
INSERT INTO `tb_user_action_history` VALUES ('3143', '305843', '1', '2015-04-09 14:36:37', null);
INSERT INTO `tb_user_action_history` VALUES ('3144', '305843', '1', '2015-04-09 14:36:44', null);
INSERT INTO `tb_user_action_history` VALUES ('3145', '305843', '1', '2015-04-09 14:38:15', null);
INSERT INTO `tb_user_action_history` VALUES ('3146', '305843', '1', '2015-04-09 14:39:49', null);
INSERT INTO `tb_user_action_history` VALUES ('3147', '305843', '1', '2015-04-09 15:08:05', null);
INSERT INTO `tb_user_action_history` VALUES ('3148', '305843', '1', '2015-04-09 15:37:46', null);
INSERT INTO `tb_user_action_history` VALUES ('3149', '305843', '1', '2015-04-09 15:42:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3150', '305843', '1', '2015-04-09 15:45:17', null);
INSERT INTO `tb_user_action_history` VALUES ('3151', '305843', '1', '2015-04-09 15:46:37', null);
INSERT INTO `tb_user_action_history` VALUES ('3152', '305843', '1', '2015-04-09 15:48:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3153', '305843', '1', '2015-04-09 15:50:44', null);
INSERT INTO `tb_user_action_history` VALUES ('3154', '305843', '1', '2015-04-09 15:51:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3155', '305843', '1', '2015-04-09 15:52:41', null);
INSERT INTO `tb_user_action_history` VALUES ('3156', '305843', '1', '2015-04-09 15:53:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3157', '305843', '1', '2015-04-09 15:54:47', null);
INSERT INTO `tb_user_action_history` VALUES ('3158', '305843', '1', '2015-04-09 15:55:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3159', '305843', '1', '2015-04-09 15:56:36', null);
INSERT INTO `tb_user_action_history` VALUES ('3160', '305843', '1', '2015-04-09 16:14:58', null);
INSERT INTO `tb_user_action_history` VALUES ('3161', '305843', '1', '2015-04-09 16:16:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3162', '305843', '1', '2015-04-09 16:25:23', null);
INSERT INTO `tb_user_action_history` VALUES ('3163', '190469', '1', '2015-04-09 16:30:01', null);
INSERT INTO `tb_user_action_history` VALUES ('3164', '190469', '1', '2015-04-09 16:30:02', null);
INSERT INTO `tb_user_action_history` VALUES ('3165', '305843', '1', '2015-04-09 16:30:42', null);
INSERT INTO `tb_user_action_history` VALUES ('3166', '190469', '1', '2015-04-09 16:30:49', null);
INSERT INTO `tb_user_action_history` VALUES ('3167', '190469', '1', '2015-04-09 16:32:34', null);
INSERT INTO `tb_user_action_history` VALUES ('3168', '190469', '1', '2015-04-09 16:33:00', null);
INSERT INTO `tb_user_action_history` VALUES ('3169', '305843', '1', '2015-04-09 16:33:58', null);
INSERT INTO `tb_user_action_history` VALUES ('3170', '190469', '1', '2015-04-09 16:36:53', null);
INSERT INTO `tb_user_action_history` VALUES ('3171', '305843', '1', '2015-04-09 16:40:54', null);
INSERT INTO `tb_user_action_history` VALUES ('3172', '305843', '1', '2015-04-09 16:41:37', null);
INSERT INTO `tb_user_action_history` VALUES ('3173', '305843', '1', '2015-04-09 16:43:12', null);
INSERT INTO `tb_user_action_history` VALUES ('3174', '305843', '1', '2015-04-09 16:44:02', null);
INSERT INTO `tb_user_action_history` VALUES ('3175', '305843', '1', '2015-04-09 16:44:42', null);
INSERT INTO `tb_user_action_history` VALUES ('3176', '305843', '1', '2015-04-09 16:45:21', null);
INSERT INTO `tb_user_action_history` VALUES ('3177', '305843', '1', '2015-04-09 16:46:16', null);
INSERT INTO `tb_user_action_history` VALUES ('3178', '305843', '1', '2015-04-09 16:46:56', null);
INSERT INTO `tb_user_action_history` VALUES ('3179', '305843', '1', '2015-04-09 16:47:40', null);
INSERT INTO `tb_user_action_history` VALUES ('3180', '305843', '1', '2015-04-09 16:48:21', null);
INSERT INTO `tb_user_action_history` VALUES ('3181', '305843', '1', '2015-04-09 16:49:10', null);
INSERT INTO `tb_user_action_history` VALUES ('3182', '305843', '1', '2015-04-09 17:01:12', null);
INSERT INTO `tb_user_action_history` VALUES ('3183', '305843', '1', '2015-04-09 17:05:18', null);
INSERT INTO `tb_user_action_history` VALUES ('3184', '305843', '1', '2015-04-09 17:07:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3185', '305843', '1', '2015-04-09 17:10:22', null);
INSERT INTO `tb_user_action_history` VALUES ('3186', '305843', '1', '2015-04-09 17:12:03', null);
INSERT INTO `tb_user_action_history` VALUES ('3187', '305843', '1', '2015-04-09 17:13:03', null);
INSERT INTO `tb_user_action_history` VALUES ('3188', '305843', '1', '2015-04-09 17:13:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3189', '305843', '1', '2015-04-09 17:15:02', null);
INSERT INTO `tb_user_action_history` VALUES ('3190', '305843', '1', '2015-04-09 17:17:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3191', '305843', '1', '2015-04-09 17:24:22', null);
INSERT INTO `tb_user_action_history` VALUES ('3192', '305843', '1', '2015-04-09 17:25:02', null);
INSERT INTO `tb_user_action_history` VALUES ('3193', '305843', '1', '2015-04-09 17:26:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3194', '305843', '1', '2015-04-09 17:28:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3195', '305843', '1', '2015-04-09 17:29:40', null);
INSERT INTO `tb_user_action_history` VALUES ('3196', '305843', '1', '2015-04-09 17:29:44', null);
INSERT INTO `tb_user_action_history` VALUES ('3197', '305843', '1', '2015-04-09 17:30:30', null);
INSERT INTO `tb_user_action_history` VALUES ('3198', '305843', '1', '2015-04-09 17:31:20', null);
INSERT INTO `tb_user_action_history` VALUES ('3199', '305843', '1', '2015-04-09 17:32:16', null);
INSERT INTO `tb_user_action_history` VALUES ('3200', '305843', '1', '2015-04-09 17:33:22', null);
INSERT INTO `tb_user_action_history` VALUES ('3201', '305843', '1', '2015-04-09 17:38:06', null);
INSERT INTO `tb_user_action_history` VALUES ('3202', '305843', '1', '2015-04-09 17:43:49', null);
INSERT INTO `tb_user_action_history` VALUES ('3203', '305843', '1', '2015-04-09 17:49:53', null);
INSERT INTO `tb_user_action_history` VALUES ('3204', '305843', '1', '2015-04-09 17:56:00', null);
INSERT INTO `tb_user_action_history` VALUES ('3205', '305843', '1', '2015-04-09 17:56:07', null);
INSERT INTO `tb_user_action_history` VALUES ('3206', '305843', '1', '2015-04-09 17:59:14', null);
INSERT INTO `tb_user_action_history` VALUES ('3207', '305843', '1', '2015-04-09 17:59:20', null);
INSERT INTO `tb_user_action_history` VALUES ('3208', '305843', '1', '2015-04-09 18:04:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3209', '305843', '1', '2015-04-09 18:07:27', null);
INSERT INTO `tb_user_action_history` VALUES ('3210', '305843', '1', '2015-04-09 18:07:58', null);
INSERT INTO `tb_user_action_history` VALUES ('3211', '305843', '1', '2015-04-09 18:20:31', null);
INSERT INTO `tb_user_action_history` VALUES ('3212', '305843', '1', '2015-04-09 18:23:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3213', '305843', '1', '2015-04-09 18:24:14', null);
INSERT INTO `tb_user_action_history` VALUES ('3214', '305843', '1', '2015-04-09 18:29:11', null);
INSERT INTO `tb_user_action_history` VALUES ('3215', '305843', '1', '2015-04-09 18:31:27', null);
INSERT INTO `tb_user_action_history` VALUES ('3216', '305843', '1', '2015-04-09 19:19:15', null);
INSERT INTO `tb_user_action_history` VALUES ('3217', '305843', '1', '2015-04-10 16:25:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3218', '305843', '1', '2015-04-10 16:25:45', null);
INSERT INTO `tb_user_action_history` VALUES ('3219', '305843', '1', '2015-04-10 16:25:50', null);
INSERT INTO `tb_user_action_history` VALUES ('3220', '305843', '1', '2015-04-10 16:27:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3221', '305843', '1', '2015-04-10 16:27:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3222', '305843', '1', '2015-04-10 16:28:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3223', '305843', '1', '2015-04-10 16:28:52', null);
INSERT INTO `tb_user_action_history` VALUES ('3224', '305843', '1', '2015-04-10 16:38:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3225', '305843', '1', '2015-04-10 16:42:27', null);
INSERT INTO `tb_user_action_history` VALUES ('3226', '305843', '1', '2015-04-10 16:42:35', null);
INSERT INTO `tb_user_action_history` VALUES ('3227', '305843', '1', '2015-04-10 16:44:06', null);
INSERT INTO `tb_user_action_history` VALUES ('3228', '305843', '1', '2015-04-10 16:44:33', null);
INSERT INTO `tb_user_action_history` VALUES ('3229', '305843', '1', '2015-04-10 16:44:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3230', '305843', '1', '2015-04-10 16:45:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3231', '190469', '1', '2015-04-10 17:08:43', null);
INSERT INTO `tb_user_action_history` VALUES ('3232', '190469', '1', '2015-04-10 17:08:47', null);
INSERT INTO `tb_user_action_history` VALUES ('3233', '190469', '1', '2015-04-10 17:08:49', null);
INSERT INTO `tb_user_action_history` VALUES ('3234', '190469', '1', '2015-04-10 17:09:24', null);
INSERT INTO `tb_user_action_history` VALUES ('3235', '190469', '1', '2015-04-10 17:09:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3236', '190469', '1', '2015-04-10 17:09:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3237', '190469', '1', '2015-04-10 17:16:14', null);
INSERT INTO `tb_user_action_history` VALUES ('3238', '190469', '1', '2015-04-10 17:16:34', null);
INSERT INTO `tb_user_action_history` VALUES ('3239', '305843', '1', '2015-04-10 17:21:14', null);
INSERT INTO `tb_user_action_history` VALUES ('3240', '190469', '1', '2015-04-10 17:24:59', null);
INSERT INTO `tb_user_action_history` VALUES ('3241', '190469', '1', '2015-04-10 17:25:05', null);
INSERT INTO `tb_user_action_history` VALUES ('3242', '190469', '1', '2015-04-10 17:25:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3243', '190469', '1', '2015-04-10 17:25:21', null);
INSERT INTO `tb_user_action_history` VALUES ('3244', '190469', '1', '2015-04-10 17:25:26', null);
INSERT INTO `tb_user_action_history` VALUES ('3245', '190469', '1', '2015-04-10 17:25:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3246', '305843', '1', '2015-04-10 17:26:15', null);
INSERT INTO `tb_user_action_history` VALUES ('3247', '190469', '1', '2015-04-10 17:28:11', null);
INSERT INTO `tb_user_action_history` VALUES ('3248', '305843', '1', '2015-04-10 17:28:12', null);
INSERT INTO `tb_user_action_history` VALUES ('3249', '305843', '1', '2015-04-10 17:31:04', null);
INSERT INTO `tb_user_action_history` VALUES ('3250', '305843', '1', '2015-04-10 17:32:45', null);
INSERT INTO `tb_user_action_history` VALUES ('3251', '305843', '1', '2015-04-10 17:32:59', null);
INSERT INTO `tb_user_action_history` VALUES ('3252', '305843', '1', '2015-04-10 17:33:03', null);
INSERT INTO `tb_user_action_history` VALUES ('3253', '305843', '1', '2015-04-10 18:08:10', null);
INSERT INTO `tb_user_action_history` VALUES ('3254', '305843', '1', '2015-04-10 18:08:23', null);
INSERT INTO `tb_user_action_history` VALUES ('3255', '305843', '1', '2015-04-10 18:08:37', null);
INSERT INTO `tb_user_action_history` VALUES ('3256', '305843', '1', '2015-04-10 18:08:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3257', '305843', '1', '2015-04-10 18:09:20', null);
INSERT INTO `tb_user_action_history` VALUES ('3258', '305843', '1', '2015-04-10 18:09:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3259', '305843', '1', '2015-04-10 18:17:42', null);
INSERT INTO `tb_user_action_history` VALUES ('3260', '305843', '1', '2015-04-10 18:26:01', null);
INSERT INTO `tb_user_action_history` VALUES ('3261', '305843', '1', '2015-04-10 18:27:56', null);
INSERT INTO `tb_user_action_history` VALUES ('3262', '305843', '1', '2015-04-10 18:28:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3263', '305843', '1', '2015-04-10 18:29:19', null);
INSERT INTO `tb_user_action_history` VALUES ('3264', '305843', '1', '2015-04-10 18:29:54', null);
INSERT INTO `tb_user_action_history` VALUES ('3265', '305843', '1', '2015-04-10 18:52:25', null);
INSERT INTO `tb_user_action_history` VALUES ('3266', '305843', '1', '2015-04-10 18:53:17', null);
INSERT INTO `tb_user_action_history` VALUES ('3267', '305843', '1', '2015-04-10 18:54:57', null);
INSERT INTO `tb_user_action_history` VALUES ('3268', '305843', '1', '2015-04-10 18:56:36', null);
INSERT INTO `tb_user_action_history` VALUES ('3269', '305843', '1', '2015-04-10 18:57:47', null);
INSERT INTO `tb_user_action_history` VALUES ('3270', '305843', '1', '2015-04-10 19:00:45', null);
INSERT INTO `tb_user_action_history` VALUES ('3271', '305843', '1', '2015-04-10 19:01:32', null);
INSERT INTO `tb_user_action_history` VALUES ('3272', '305843', '1', '2015-04-10 19:02:22', null);
INSERT INTO `tb_user_action_history` VALUES ('3273', '305843', '1', '2015-04-10 19:05:28', null);
INSERT INTO `tb_user_action_history` VALUES ('3274', '305843', '1', '2015-04-10 19:06:44', null);
INSERT INTO `tb_user_action_history` VALUES ('3275', '305843', '1', '2015-04-10 19:06:52', null);
INSERT INTO `tb_user_action_history` VALUES ('3276', '305843', '1', '2015-04-10 19:07:07', null);
INSERT INTO `tb_user_action_history` VALUES ('3277', '305843', '1', '2015-04-10 19:07:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3278', '305843', '1', '2015-04-10 19:07:58', null);
INSERT INTO `tb_user_action_history` VALUES ('3279', '305843', '1', '2015-04-10 19:13:07', null);
INSERT INTO `tb_user_action_history` VALUES ('3280', '124450', '1', '2015-04-10 20:15:18', null);
INSERT INTO `tb_user_action_history` VALUES ('3281', '124450', '1', '2015-04-10 20:15:19', null);
INSERT INTO `tb_user_action_history` VALUES ('3282', '124450', '1', '2015-04-10 20:28:39', null);
INSERT INTO `tb_user_action_history` VALUES ('3283', '124450', '1', '2015-04-10 20:30:07', null);
INSERT INTO `tb_user_action_history` VALUES ('3284', '472826', '1', '2015-04-15 11:35:27', null);
INSERT INTO `tb_user_action_history` VALUES ('3285', '472826', '1', '2015-04-15 11:35:33', null);
INSERT INTO `tb_user_action_history` VALUES ('3286', '472826', '1', '2015-04-15 11:55:04', null);
INSERT INTO `tb_user_action_history` VALUES ('3287', '472826', '1', '2015-04-15 11:55:12', null);
INSERT INTO `tb_user_action_history` VALUES ('3288', '472826', '1', '2015-04-15 11:55:56', null);
INSERT INTO `tb_user_action_history` VALUES ('3289', '472826', '1', '2015-04-15 12:01:08', null);
INSERT INTO `tb_user_action_history` VALUES ('3290', '472826', '1', '2015-04-15 12:06:25', null);
INSERT INTO `tb_user_action_history` VALUES ('3291', '472826', '1', '2015-04-15 12:24:38', null);
INSERT INTO `tb_user_action_history` VALUES ('3292', '472826', '1', '2015-04-15 18:06:46', null);
INSERT INTO `tb_user_action_history` VALUES ('3293', '472826', '1', '2015-04-15 18:06:48', null);
INSERT INTO `tb_user_action_history` VALUES ('3294', '163553', '1', '2015-04-20 20:16:36', null);
INSERT INTO `tb_user_action_history` VALUES ('3295', '163553', '1', '2015-04-20 20:16:50', null);
INSERT INTO `tb_user_action_history` VALUES ('3296', '163553', '1', '2015-04-21 11:46:24', null);
INSERT INTO `tb_user_action_history` VALUES ('3297', '104816', '1', '2015-04-21 13:01:29', null);
INSERT INTO `tb_user_action_history` VALUES ('3298', '104816', '1', '2015-04-21 13:01:47', null);
INSERT INTO `tb_user_action_history` VALUES ('3299', '163553', '1', '2015-04-21 17:16:41', null);
INSERT INTO `tb_user_action_history` VALUES ('3300', '163553', '1', '2015-04-21 17:18:24', null);
INSERT INTO `tb_user_action_history` VALUES ('3301', '163553', '1', '2015-04-21 17:18:33', null);
INSERT INTO `tb_user_action_history` VALUES ('3302', '163553', '1', '2015-04-21 17:18:43', null);
INSERT INTO `tb_user_action_history` VALUES ('3303', '163553', '1', '2015-04-21 17:19:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3304', '163553', '1', '2015-04-21 19:17:55', null);
INSERT INTO `tb_user_action_history` VALUES ('3305', '163553', '1', '2015-04-21 19:18:10', null);
INSERT INTO `tb_user_action_history` VALUES ('3306', '163553', '1', '2015-04-21 19:18:13', null);
INSERT INTO `tb_user_action_history` VALUES ('3307', '163553', '1', '2015-04-21 19:18:17', null);
INSERT INTO `tb_user_action_history` VALUES ('3308', '163553', '1', '2015-04-21 19:18:19', null);
INSERT INTO `tb_user_action_history` VALUES ('3309', '163553', '1', '2015-04-21 19:18:29', null);
INSERT INTO `tb_user_action_history` VALUES ('3310', '163553', '1', '2015-04-22 11:25:27', null);

-- ----------------------------
-- Table structure for `tb_user_award`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_award`;
CREATE TABLE `tb_user_award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL,
  `award` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '连续有收益任务：\n            2: 连续2日有任务收益 收益：100 金币\n            3: 连续3日有任务收益 收益：200 金币\n            4: 连续4日有任务收益 收益：300 金币\n            5: 连续5日有任务收益 收益：400 金币\n            6: 连续6日有任务收益 收益：500 金币\n            7: 连续7日有任务收益 收益：700 金币\n            周共计：2.2元\n            周日晚0点刷新',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` char(1) DEFAULT NULL COMMENT '已领用与未领',
  `need_days` int(2) DEFAULT NULL,
  `task_days` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '弃用',
  `modify_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='连续任务奖励明细';

-- ----------------------------
-- Records of tb_user_award
-- ----------------------------
INSERT INTO `tb_user_award` VALUES ('202', '18762931954', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 00:10:01');
INSERT INTO `tb_user_award` VALUES ('204', '13804419886', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 00:10:01');
INSERT INTO `tb_user_award` VALUES ('207', '15600600596', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 00:10:01');
INSERT INTO `tb_user_award` VALUES ('211', '15338595053', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 00:10:01');
INSERT INTO `tb_user_award` VALUES ('213', '13910779120', '10', null, '已登陆做任务1天', '0', '2', '1', null, '2015-05-02 12:27:56');
INSERT INTO `tb_user_award` VALUES ('215', '13626299557', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 00:10:01');
INSERT INTO `tb_user_award` VALUES ('218', '13750077508', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-01 21:51:10');
INSERT INTO `tb_user_award` VALUES ('219', '13338019809', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-02 01:12:24');
INSERT INTO `tb_user_award` VALUES ('220', '13772507716', '0', null, '已登陆做任务0天', '0', '2', '0', null, '2015-05-14 13:18:24');

-- ----------------------------
-- Table structure for `tb_user_cash`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_cash`;
CREATE TABLE `tb_user_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(40) NOT NULL COMMENT '掌通订单号',
  `ordernum` varchar(40) NOT NULL COMMENT '兑吧订单号',
  `description` varchar(128) NOT NULL COMMENT '当前订单的详细描述',
  `userid` varchar(60) NOT NULL COMMENT '用户唯一标志',
  `amount` int(11) NOT NULL COMMENT '充值提现金额（单位：分）',
  `credits` int(11) NOT NULL COMMENT '本次交易消耗的积分',
  `totalcredits` int(20) NOT NULL COMMENT '用户的积分剩余余额（当前交易之前）',
  `exchange_type` varchar(20) NOT NULL COMMENT '交易类型：\n   alipay(支付宝), qb(q币), coupon(优惠券), object(实物), phonebill(话费), virtual(虚拟商品)  所有类型不区分大小写',
  `alipay_account` varchar(256) DEFAULT NULL COMMENT '支付宝账号',
  `fullname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '充值手机号',
  `status` char(2) DEFAULT NULL COMMENT '0：申请\n            1：审核通过，处理中           2：推迟\n            3：账号异常，拒绝，此时拒绝原因写入充值结果字段\n    4、订单失败    9、充值成功       ',
  `operate_time` datetime DEFAULT NULL COMMENT '充值时间',
  `operate_result` varchar(200) DEFAULT NULL COMMENT '充值结果',
  `operator` int(11) DEFAULT NULL COMMENT '充值操作员，运营人员id。0代表系统处理',
  `client_type` int(11) NOT NULL COMMENT '平台的类型：0网页1微信3app线下4app线上',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='提现&话费充值记录';

-- ----------------------------
-- Records of tb_user_cash
-- ----------------------------
INSERT INTO `tb_user_cash` VALUES ('1', 'a', 'a', 'a', '61', '2000', '2000', '3000', 'alipay', 'aaa', null, null, '9', null, null, '0', '1', '2015-05-04 17:44:06');
INSERT INTO `tb_user_cash` VALUES ('2', 'b', 'b', 'b', '61', '1000', '1000', '1000', 'phonebill', 'bbb', '2', null, '9', null, null, '0', '1', '2015-05-04 20:07:53');

-- ----------------------------
-- Table structure for `tb_user_cash_approve`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_cash_approve`;
CREATE TABLE `tb_user_cash_approve` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(40) NOT NULL COMMENT '订单号',
  `ordernum` varchar(40) NOT NULL,
  `result` varchar(20) NOT NULL COMMENT '审核结果，对应提现充值记录表里的status',
  `description` varchar(200) DEFAULT NULL COMMENT '结果描述',
  `operator` int(11) NOT NULL COMMENT '操作员',
  `approve_time` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='提现&充值审核记录\r\n营运人员每操作一次（比如申请订单，推迟，审核通过等），记入一条记录，并需要更改提现&充值表的sta';

-- ----------------------------
-- Records of tb_user_cash_approve
-- ----------------------------
INSERT INTO `tb_user_cash_approve` VALUES ('327', '23e03ea5-ea88-4332-924e-82bbed474a6e', '2015040815220572000528568', '0', '提交订单，等待审核', '0', '2015-04-08 15:22:06');
INSERT INTO `tb_user_cash_approve` VALUES ('328', '1e073e12-3503-4f6d-931a-5f57478c8681', '2015040815241969000528590', '0', '提交订单，等待审核', '0', '2015-04-08 15:24:20');
INSERT INTO `tb_user_cash_approve` VALUES ('329', '54d76f48-8ff3-40f2-b792-04e8752445c2', '2015040816191529800529648', '0', '提交订单，等待审核', '0', '2015-04-08 16:19:16');
INSERT INTO `tb_user_cash_approve` VALUES ('330', '810847f2-9caf-481e-bdc9-f99cfaddb0b0', '2015040816192374400529651', '0', '提交订单，等待审核', '0', '2015-04-08 16:19:24');
INSERT INTO `tb_user_cash_approve` VALUES ('331', 'b9be539b-27b4-4b18-862e-fc97345f69d5', '2015040816192815600529654', '0', '提交订单，等待审核', '0', '2015-04-08 16:19:28');
INSERT INTO `tb_user_cash_approve` VALUES ('332', '4013b845-f06f-4be6-a578-1b7b9d06348f', '2015040816193539800529656', '1', '提交订单，等待审核', '0', '2015-04-08 16:19:36');
INSERT INTO `tb_user_cash_approve` VALUES ('333', '4013b845-f06f-4be6-a578-1b7b9d06348f', '2015040816193539800529656', '9', '确认到账', '0', '2015-04-08 16:19:40');
INSERT INTO `tb_user_cash_approve` VALUES ('334', 'c4870500-4f2a-4986-bfe3-2f8dfc15c5ed', '2015040817092385100530657', '0', '提交订单，等待审核', '0', '2015-04-08 17:09:25');
INSERT INTO `tb_user_cash_approve` VALUES ('335', '687dbb71-af3d-4398-b5d1-d4e224e772cd', '2015040902172400700538695', '0', '提交订单，等待审核', '0', '2015-04-09 02:17:26');
INSERT INTO `tb_user_cash_approve` VALUES ('336', '182a9c96-d268-4717-b5bc-87bfc0997d94', '2015040902173402500538696', '0', '提交订单，等待审核', '0', '2015-04-09 02:17:34');
INSERT INTO `tb_user_cash_approve` VALUES ('337', '274ce797-12cb-4c7a-8134-9fb877da719f', '2015040902315699300538738', '0', '提交订单，等待审核', '0', '2015-04-09 02:31:57');
INSERT INTO `tb_user_cash_approve` VALUES ('338', 'a8198cba-42fa-45b5-9c06-e910a7e387b8', '2015040902320727100538740', '0', '提交订单，等待审核', '0', '2015-04-09 02:32:07');
INSERT INTO `tb_user_cash_approve` VALUES ('339', '2a7af01b-4b26-4b11-9439-13ebcfde9587', '2015040912483964700547882', '0', '提交订单，等待审核', '0', '2015-04-09 12:48:40');
INSERT INTO `tb_user_cash_approve` VALUES ('340', 'b6de924e-78d1-4bf7-8dd6-00279d94316e', '2015040912491069300547892', '0', '提交订单，等待审核', '0', '2015-04-09 12:49:11');
INSERT INTO `tb_user_cash_approve` VALUES ('341', '54df7035-d72f-43b5-9332-1491ac5ef023', '2015040912500952900547915', '0', '提交订单，等待审核', '0', '2015-04-09 12:50:10');
INSERT INTO `tb_user_cash_approve` VALUES ('342', 'a206bf27-71e9-4720-88a5-e761df13a5f5', '2015040914424468000550409', '0', '提交订单，等待审核', '0', '2015-04-09 14:42:45');
INSERT INTO `tb_user_cash_approve` VALUES ('343', '630fc5ab-3120-4333-9a72-8cd7e1db8565', '2015040914425286200550414', '0', '提交订单，等待审核', '0', '2015-04-09 14:42:53');
INSERT INTO `tb_user_cash_approve` VALUES ('344', '7b8378e7-fc42-403a-889e-325b14b8d6dd', '2015040920432422100540999', '0', '提交订单，等待审核', '0', '2015-04-09 20:43:25');
INSERT INTO `tb_user_cash_approve` VALUES ('345', '46eaf108-a56d-4a92-892b-0a3803845a83', '2015041008445880400550484', '0', '提交订单，等待审核', '0', '2015-04-10 08:44:59');
INSERT INTO `tb_user_cash_approve` VALUES ('346', '33a52b7a-8b04-454e-9888-28d6de720a93', '2015041009435691900551464', '0', '提交订单，等待审核', '0', '2015-04-10 09:43:57');
INSERT INTO `tb_user_cash_approve` VALUES ('347', 'cbac9941-6762-4bfa-88ca-33bb0e816189', '2015041009440901600551475', '0', '提交订单，等待审核', '0', '2015-04-10 09:44:09');
INSERT INTO `tb_user_cash_approve` VALUES ('348', '446d8d02-226b-44a5-bc78-a21b6483453f', '2015041009443070400551483', '0', '提交订单，等待审核', '0', '2015-04-10 09:44:31');
INSERT INTO `tb_user_cash_approve` VALUES ('349', 'e8edb481-b3e1-4c0a-a494-3c0b3721ef7d', '2015041009443577900551485', '0', '提交订单，等待审核', '0', '2015-04-10 09:44:36');
INSERT INTO `tb_user_cash_approve` VALUES ('350', '23e03ea5-ea88-4332-924e-82bbed474a6e', '2015040815220572000528568', '4', '审核不通过', '0', '2015-04-10 10:17:47');
INSERT INTO `tb_user_cash_approve` VALUES ('351', 'e8edb481-b3e1-4c0a-a494-3c0b3721ef7d', '2015041009443577900551485', '4', '审核不通过', '0', '2015-04-10 10:18:02');
INSERT INTO `tb_user_cash_approve` VALUES ('352', '446d8d02-226b-44a5-bc78-a21b6483453f', '2015041009443070400551483', '4', '审核不通过', '0', '2015-04-10 10:18:02');
INSERT INTO `tb_user_cash_approve` VALUES ('353', '33a52b7a-8b04-454e-9888-28d6de720a93', '2015041009435691900551464', '4', '审核不通过', '0', '2015-04-10 10:18:03');
INSERT INTO `tb_user_cash_approve` VALUES ('354', 'c4870500-4f2a-4986-bfe3-2f8dfc15c5ed', '2015040817092385100530657', '4', '审核不通过', '0', '2015-04-10 10:18:03');
INSERT INTO `tb_user_cash_approve` VALUES ('355', 'b9be539b-27b4-4b18-862e-fc97345f69d5', '2015040816192815600529654', '4', '审核不通过', '0', '2015-04-10 10:18:03');
INSERT INTO `tb_user_cash_approve` VALUES ('356', '810847f2-9caf-481e-bdc9-f99cfaddb0b0', '2015040816192374400529651', '4', '审核不通过', '0', '2015-04-10 10:18:03');
INSERT INTO `tb_user_cash_approve` VALUES ('357', 'a206bf27-71e9-4720-88a5-e761df13a5f5', '2015040914424468000550409', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('358', '46eaf108-a56d-4a92-892b-0a3803845a83', '2015041008445880400550484', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('359', 'b6de924e-78d1-4bf7-8dd6-00279d94316e', '2015040912491069300547892', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('360', '2a7af01b-4b26-4b11-9439-13ebcfde9587', '2015040912483964700547882', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('361', '54d76f48-8ff3-40f2-b792-04e8752445c2', '2015040816191529800529648', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('362', '54df7035-d72f-43b5-9332-1491ac5ef023', '2015040912500952900547915', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('363', '630fc5ab-3120-4333-9a72-8cd7e1db8565', '2015040914425286200550414', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('364', '274ce797-12cb-4c7a-8134-9fb877da719f', '2015040902315699300538738', '4', '审核不通过', '0', '2015-04-10 10:18:04');
INSERT INTO `tb_user_cash_approve` VALUES ('365', 'a8198cba-42fa-45b5-9c06-e910a7e387b8', '2015040902320727100538740', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('366', '182a9c96-d268-4717-b5bc-87bfc0997d94', '2015040902173402500538696', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('367', 'cbac9941-6762-4bfa-88ca-33bb0e816189', '2015041009440901600551475', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('368', '1e073e12-3503-4f6d-931a-5f57478c8681', '2015040815241969000528590', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('369', '687dbb71-af3d-4398-b5d1-d4e224e772cd', '2015040902172400700538695', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('370', '7b8378e7-fc42-403a-889e-325b14b8d6dd', '2015040920432422100540999', '4', '审核不通过', '0', '2015-04-10 10:18:05');
INSERT INTO `tb_user_cash_approve` VALUES ('371', '2365c39a-9246-432a-b895-7e2546180ce2', '2015041011050858300554549', '0', '提交订单，等待审核', '0', '2015-04-10 11:05:09');
INSERT INTO `tb_user_cash_approve` VALUES ('372', 'af763e6b-3856-48bf-9dfb-72ddbe7fd509', '2015041013081476200559359', '0', '提交订单，等待审核', '0', '2015-04-10 13:08:15');
INSERT INTO `tb_user_cash_approve` VALUES ('373', '5c2ef7a6-4a43-40d1-ab53-97619961fd03', '2015041013082555600559361', '0', '提交订单，等待审核', '0', '2015-04-10 13:08:26');
INSERT INTO `tb_user_cash_approve` VALUES ('374', '29cafe26-5f85-4a96-b1c5-b1912e897137', '2015041013083208600559363', '0', '提交订单，等待审核', '0', '2015-04-10 13:08:32');
INSERT INTO `tb_user_cash_approve` VALUES ('375', 'db7e4bd0-7a01-4414-9db1-8e77a77e7083', '2015041015470697100564840', '0', '提交订单，等待审核', '0', '2015-04-10 15:47:07');
INSERT INTO `tb_user_cash_approve` VALUES ('376', '9c5e6aed-7142-4bdf-837c-1385ef183a4b', '2015041016262885100566195', '0', '提交订单，等待审核', '0', '2015-04-10 16:26:29');
INSERT INTO `tb_user_cash_approve` VALUES ('377', '3afc9ed5-0582-499e-8d1b-41c07ea4eccf', '2015041016273946100566215', '0', '提交订单，等待审核', '0', '2015-04-10 16:27:40');
INSERT INTO `tb_user_cash_approve` VALUES ('378', '7483de35-a02c-47ae-8f87-9631766f1a61', '2015041100463924400577291', '0', '提交订单，等待审核', '0', '2015-04-11 00:46:40');
INSERT INTO `tb_user_cash_approve` VALUES ('379', 'fe9f9228-0022-401a-8756-d2cef5b28bc3', '2015041100465975100577293', '0', '提交订单，等待审核', '0', '2015-04-11 00:47:00');
INSERT INTO `tb_user_cash_approve` VALUES ('380', '44cfeccd-7a51-4806-a595-cf8c2ac26968', '2015041100470570800577296', '0', '提交订单，等待审核', '0', '2015-04-11 00:47:06');
INSERT INTO `tb_user_cash_approve` VALUES ('381', '21008394-dcbb-4f27-bba0-216834c24284', '2015041100471082200577298', '0', '提交订单，等待审核', '0', '2015-04-11 00:47:11');
INSERT INTO `tb_user_cash_approve` VALUES ('382', '9e5aa08c-9f00-4174-ba6d-22aa7e706b7c', '2015041100471605000577301', '0', '提交订单，等待审核', '0', '2015-04-11 00:47:16');
INSERT INTO `tb_user_cash_approve` VALUES ('383', '01cbe8d5-cc1b-4dfd-b5cc-a139502f04f1', '2015041109300466300581304', '0', '提交订单，等待审核', '0', '2015-04-11 09:30:05');
INSERT INTO `tb_user_cash_approve` VALUES ('384', '0821f6ed-c44d-4610-94b9-6716caeb15ff', '2015041310590096500779440', '0', '提交订单，等待审核', '0', '2015-04-13 10:59:02');
INSERT INTO `tb_user_cash_approve` VALUES ('385', '07b850d9-490f-4350-825f-ae4cd181194b', '2015042018180893600072655', '0', '提交订单，等待审核', '0', '2015-04-20 18:18:09');
INSERT INTO `tb_user_cash_approve` VALUES ('386', '07b850d9-490f-4350-825f-ae4cd181194b', '2015042018180893600072655', '1', '正在充值', '6', '2015-04-21 10:12:23');
INSERT INTO `tb_user_cash_approve` VALUES ('387', '07b850d9-490f-4350-825f-ae4cd181194b', '2015042018180893600072655', '9', '确认到账', '0', '2015-04-21 10:12:27');
INSERT INTO `tb_user_cash_approve` VALUES ('388', 'f8020723-0bcf-409e-b12c-2b9d7b95e78b', '2015042110302261600087087', '0', '提交订单，等待审核', '0', '2015-04-21 10:30:23');
INSERT INTO `tb_user_cash_approve` VALUES ('389', 'f8020723-0bcf-409e-b12c-2b9d7b95e78b', '2015042110302261600087087', '1', '正在充值', '1', '2015-04-21 10:30:44');
INSERT INTO `tb_user_cash_approve` VALUES ('390', 'f8020723-0bcf-409e-b12c-2b9d7b95e78b', '2015042110302261600087087', '9', '确认到账', '0', '2015-04-21 10:34:59');
INSERT INTO `tb_user_cash_approve` VALUES ('391', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '0', '提交订单，等待审核', '0', '2015-04-21 10:47:06');
INSERT INTO `tb_user_cash_approve` VALUES ('392', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '2', '滞后', '1', '2015-04-21 10:47:17');
INSERT INTO `tb_user_cash_approve` VALUES ('393', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '3', '客服人员正在处理', '1', '2015-04-21 10:50:55');
INSERT INTO `tb_user_cash_approve` VALUES ('394', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '2', '滞后', '1', '2015-04-21 10:51:20');
INSERT INTO `tb_user_cash_approve` VALUES ('395', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '1', '正在充值', '1', '2015-04-21 10:51:31');
INSERT INTO `tb_user_cash_approve` VALUES ('396', '5a0f2f21-e9f8-4072-9a0f-556e06e809d0', '2015042110470542800087421', '9', '确认到账', '0', '2015-04-21 10:54:59');
INSERT INTO `tb_user_cash_approve` VALUES ('397', 'cdbd98e8-426b-43ea-a3cf-cbf910dfa0e3', '2015042116484348000103302', '0', '提交订单，等待审核', '0', '2015-04-21 16:48:44');
INSERT INTO `tb_user_cash_approve` VALUES ('398', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '0', '提交订单，等待审核', '0', '2015-04-21 16:52:30');
INSERT INTO `tb_user_cash_approve` VALUES ('399', 'cdbd98e8-426b-43ea-a3cf-cbf910dfa0e3', '2015042116484348000103302', '1', '正在充值', '1', '2015-04-21 16:57:35');
INSERT INTO `tb_user_cash_approve` VALUES ('400', 'cdbd98e8-426b-43ea-a3cf-cbf910dfa0e3', '2015042116484348000103302', '9', '确认到账', '0', '2015-04-21 16:57:37');
INSERT INTO `tb_user_cash_approve` VALUES ('401', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '2', '滞后', '1', '2015-04-21 16:58:06');
INSERT INTO `tb_user_cash_approve` VALUES ('402', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '3', '客服人员正在处理', '1', '2015-04-21 16:58:28');
INSERT INTO `tb_user_cash_approve` VALUES ('403', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '2', '滞后', '1', '2015-04-21 16:58:45');
INSERT INTO `tb_user_cash_approve` VALUES ('404', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '1', '正在充值', '1', '2015-04-21 16:59:01');
INSERT INTO `tb_user_cash_approve` VALUES ('405', '89610521-3ebc-426f-be26-49a8178aceef', '2015042116522982600103383', '9', '确认到账', '0', '2015-04-21 17:01:44');
INSERT INTO `tb_user_cash_approve` VALUES ('406', '40b6e29d-5022-4f6e-bc1a-002ec9d5d9af', '2015042118120263000105302', '0', '提交订单，等待审核', '0', '2015-04-21 18:12:03');
INSERT INTO `tb_user_cash_approve` VALUES ('407', 'e5f6f98f-d7d6-45d8-a6d2-1b874b83edaf', '2015042211284781600162049', '0', '提交订单，等待审核', '0', '2015-04-22 11:28:49');
INSERT INTO `tb_user_cash_approve` VALUES ('408', 'b91a36c4-53dd-4679-8575-4ee9381df697', '2015042309110554400779082', '0', '提交订单，等待审核', '0', '2015-04-23 09:11:06');
INSERT INTO `tb_user_cash_approve` VALUES ('409', 'fd9dc2a2-96f9-46e2-9f5d-87660e8255df', '2015042316025443000797480', '0', '提交订单，等待审核', '0', '2015-04-23 16:02:55');
INSERT INTO `tb_user_cash_approve` VALUES ('410', '1d152e9e-0ab7-4ec2-b111-8147f4cfc25f', '2015042717552734100735215', '0', '提交订单，等待审核', '0', '2015-04-27 17:55:28');
INSERT INTO `tb_user_cash_approve` VALUES ('411', '51a738b9-5c4e-4b09-95cf-bdd8b8f64819', '2015042717560622600735238', '0', '提交订单，等待审核', '0', '2015-04-27 17:56:07');
INSERT INTO `tb_user_cash_approve` VALUES ('412', '1d152e9e-0ab7-4ec2-b111-8147f4cfc25f', '2015042717552734100735215', '1', '正在充值', '1', '2015-04-27 18:03:55');
INSERT INTO `tb_user_cash_approve` VALUES ('413', '1d152e9e-0ab7-4ec2-b111-8147f4cfc25f', '2015042717552734100735215', '9', '确认到账', '0', '2015-04-27 18:06:33');
INSERT INTO `tb_user_cash_approve` VALUES ('414', '6c482e73-2056-4a19-9976-fd67e2b44dab', '2015042913135476400605652', '0', '提交订单，等待审核', '0', '2015-04-29 13:13:57');
INSERT INTO `tb_user_cash_approve` VALUES ('415', '4410a509-9b96-4b34-9690-5339313790e5', '2015043009311773700635925', '0', '提交订单，等待审核', '0', '2015-04-30 09:31:18');
INSERT INTO `tb_user_cash_approve` VALUES ('416', '7dd426da-755f-49ca-8f22-d0b2e4d1c968', '2015043009511466200636364', '0', '提交订单，等待审核', '0', '2015-04-30 09:51:15');
INSERT INTO `tb_user_cash_approve` VALUES ('417', '7dd426da-755f-49ca-8f22-d0b2e4d1c968', '2015043009511466200636364', '1', '正在充值', '1', '2015-04-30 10:05:29');
INSERT INTO `tb_user_cash_approve` VALUES ('418', '7dd426da-755f-49ca-8f22-d0b2e4d1c968', '2015043009511466200636364', '9', '确认到账', '0', '2015-04-30 10:08:26');
INSERT INTO `tb_user_cash_approve` VALUES ('419', 'ff56029d-5fd5-435e-9168-1fb8d3f7083f', '2015050113402341800875152', '0', '提交订单，等待审核', '0', '2015-05-01 13:40:24');

-- ----------------------------
-- Table structure for `tb_user_login_exception`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_login_exception`;
CREATE TABLE `tb_user_login_exception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `moblie` varchar(60) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `client_type` char(1) DEFAULT NULL,
  `apple_id` varchar(20) DEFAULT NULL,
  `idfa` varchar(100) NOT NULL,
  `operator` varchar(20) DEFAULT NULL COMMENT '处理异常人员',
  `status` char(1) DEFAULT '0' COMMENT '0:未处理 1：已处理',
  `process_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '分配时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`moblie`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='高级用户认证记录\r\n备注：针对此表需要有一个后台任务，判断用户下载之后软件排名是否有变化，如果变化了，需对此用';

-- ----------------------------
-- Records of tb_user_login_exception
-- ----------------------------
INSERT INTO `tb_user_login_exception` VALUES ('240', '15600600596', '(null)', '(null)', '(null)', '1', null, 'CEB6DA3A-A7B5-4E83-B2AF-1CE55F2E99F2', null, '0', null, '2015-04-29 18:34:15');
INSERT INTO `tb_user_login_exception` VALUES ('241', '15600600596', '(null)', '(null)', '(null)', '1', null, '71082811-B0D3-4597-AA39-95E664E6D4A0', null, '0', null, '2015-04-29 18:39:13');
INSERT INTO `tb_user_login_exception` VALUES ('242', '15600600596', null, null, '', null, null, '71082811-B0D3-4597-AA39-95E664E6D4A0', null, '0', null, '2015-04-29 18:49:37');
INSERT INTO `tb_user_login_exception` VALUES ('243', '15600600596', null, null, '', null, null, '71082811-B0D3-4597-AA39-95E664E6D4A0', null, '0', null, '2015-04-29 19:22:04');
INSERT INTO `tb_user_login_exception` VALUES ('245', '15600600596', '(null)', '(null)', '(null)', '1', null, 'CEB6DA3A-A7B5-4E83-B2AF-1CE55F2E99F2', null, '0', null, '2015-04-30 09:48:32');
INSERT INTO `tb_user_login_exception` VALUES ('246', '15600600596', '(null)', '(null)', '(null)', '1', null, '71082811-B0D3-4597-AA39-95E664E6D4A0', null, '0', null, '2015-04-30 11:20:36');
INSERT INTO `tb_user_login_exception` VALUES ('251', '15600600596', '(null)', '(null)', '(null)', '1', null, 'CEB6DA3A-A7B5-4E83-B2AF-1CE55F2E99F2', null, '0', null, '2015-04-30 11:30:37');

-- ----------------------------
-- Table structure for `tb_user_login_history`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_login_history`;
CREATE TABLE `tb_user_login_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(16) DEFAULT NULL,
  `ip` varchar(48) DEFAULT NULL,
  `country` varchar(96) DEFAULT NULL,
  `area` varchar(96) DEFAULT NULL,
  `province` varchar(96) DEFAULT NULL,
  `city` varchar(96) DEFAULT NULL,
  `county` varchar(96) DEFAULT NULL,
  `isp` varchar(96) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_user_login_history
-- ----------------------------
INSERT INTO `tb_user_login_history` VALUES ('1', '61', '27.205.75.3', '?й?', '????', 'ɽ??ʡ', 'Ϋ???', '', '??ͨ', '2015-06-16 19:59:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('2', '1070', '123.151.42.46', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 16:19:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('3', '2163', '123.139.39.127', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:19:12', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('4', '4283', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:19:14', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('5', '4278', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:19:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('6', '4283', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:19:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('7', '3207', '113.132.98.203', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:19:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('8', '4283', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:19:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('9', '4278', '114.234.56.150', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:20:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('10', '3519', '223.104.11.112', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:20:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('11', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:20:57', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('12', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:20:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('13', '4279', '180.123.208.213', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:22:09', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('14', '3519', '223.104.11.112', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:22:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('15', '4050', '112.224.67.115', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '??ͨ', '2015-06-16 16:22:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('16', '2347', '117.22.106.52', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:22:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('17', '4285', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:22:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('18', '1089', '223.104.11.122', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:22:46', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('19', '4285', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:23:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('20', '4028', '117.22.106.102', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:23:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('21', '2588', '123.113.99.61', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 16:24:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('22', '4284', '223.104.11.98', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:24:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('23', '4050', '112.224.67.115', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '??ͨ', '2015-06-16 16:24:41', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('24', '4284', '223.104.11.98', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:24:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('25', '4028', '117.22.106.102', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:25:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('26', '4284', '223.104.11.98', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:25:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('27', '4284', '223.104.11.98', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:25:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('28', '4050', '112.224.67.115', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '??ͨ', '2015-06-16 16:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('29', '3488', '36.45.41.217', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:26:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('30', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:26:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('31', '3720', '105.168.18.4', '??????', '', '', '', '', '', '2015-06-16 16:26:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('32', '4286', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:27:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('33', '4287', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:27:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('34', '2900', '111.20.152.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:27:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('35', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:27:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('36', '4285', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:27:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('37', '4287', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:27:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('38', '4286', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:27:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('39', '3792', '111.161.114.248', '?й?', '????', '?????', '?????', '', '??ͨ', '2015-06-16 16:27:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('40', '2921', '123.138.74.248', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:28:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('41', '3759', '117.22.107.130', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:28:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('42', '4288', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:31:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('43', '2280', '123.138.17.244', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:31:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('44', '4288', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:31:54', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('45', '2881', '117.35.168.139', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:31:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('46', '4050', '111.37.2.174', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '?ƶ?', '2015-06-16 16:32:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('47', '560', '113.200.85.88', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:33:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('48', '4289', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:33:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('49', '4289', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:33:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('50', '2881', '117.35.168.139', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:34:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('51', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:34:46', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('52', '1775', '117.22.106.88', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:34:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('53', '2881', '117.35.168.139', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:35:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('54', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:35:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('55', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:35:44', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('56', '3777', '221.11.20.204', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:36:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('57', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:36:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('58', '1860', '36.45.6.123', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:37:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('59', '3585', '117.32.218.153', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:37:25', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('60', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:37:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('61', '4281', '117.87.224.101', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:37:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('62', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:37:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('63', '4291', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:37:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('64', '4291', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:38:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('65', '1771', '223.104.11.228', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:38:17', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('66', '1761', '124.89.2.94', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:38:41', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('67', '4278', '114.234.56.150', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:39:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('68', '1774', '1.85.61.102', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:40:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('69', '4279', '180.123.208.213', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:40:31', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('70', '1882', '117.35.169.190', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:41:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('71', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:41:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('72', '4291', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:41:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('73', '1086', '117.32.216.75', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:41:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('74', '3207', '113.132.98.203', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:41:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('75', '2354', '117.35.159.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:41:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('76', '4292', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:42:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('77', '4292', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:42:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('78', '2354', '117.35.159.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:42:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('79', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:42:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('80', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:43:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('81', '2900', '111.20.152.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:43:20', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('82', '2893', '221.11.46.226', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:43:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('83', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:44:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('84', '4293', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:46:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('85', '4293', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:46:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('86', '4128', '221.220.251.68', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 16:46:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('87', '2714', '111.20.19.13', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:46:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('88', '4293', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:47:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('89', '2714', '111.20.19.13', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:47:09', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('90', '1771', '111.20.19.77', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:47:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('91', '3692', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:47:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('92', '2881', '117.35.168.139', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:48:12', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('93', '1005', '113.140.29.12', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:48:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('94', '4163', '113.25.82.164', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 16:48:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('95', '3692', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:48:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('96', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:49:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('97', '3692', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:49:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('98', '3692', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:49:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('99', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:50:20', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('100', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:50:25', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('101', '4160', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 16:50:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('102', '4175', '61.148.242.16', '?й?', '????', '?????', '?????', '', '??ͨ', '2015-06-16 16:50:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('103', '4280', '117.87.226.31', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:51:12', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('104', '3037', '113.7.248.145', '?й?', '????', '??????ʡ', '??ľ˹?', '', '??ͨ', '2015-06-16 16:52:20', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('105', '4294', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('106', '2921', '123.138.74.248', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:52:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('107', '4294', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:53:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('108', '1776', '117.32.216.125', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:53:25', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('109', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:53:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('110', '4266', '1.28.218.142', '?й?', '????', '???ɹ???????', '??ͷ?', '', '??ͨ', '2015-06-16 16:55:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('111', '2723', '113.200.29.118', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:55:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('112', '2881', '117.35.168.139', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:55:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('113', '2900', '111.20.152.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:55:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('114', '4050', '111.37.2.174', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '?ƶ?', '2015-06-16 16:55:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('115', '4290', '49.81.155.90', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:55:46', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('116', '3692', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:55:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('117', '4281', '117.87.224.101', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:56:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('118', '4291', '113.200.204.84', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 16:56:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('119', '3488', '36.45.41.217', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:57:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('120', '482', '114.231.223.160', '?й?', '????', '????ʡ', '??ͨ?', '', '???', '2015-06-16 16:57:32', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('121', '3764', '223.104.11.123', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 16:57:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('122', '425', '112.224.20.17', '?й?', '????', 'ɽ??ʡ', '?????', '', '??ͨ', '2015-06-16 16:58:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('123', '385', '124.31.141.61', '?й?', '???', '??????????', '????????', '', '???', '2015-06-16 16:58:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('124', '2354', '117.35.159.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:58:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('125', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:59:05', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('126', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:59:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('127', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:59:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('128', '4278', '114.234.56.150', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 16:59:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('129', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:00:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('130', '4291', '113.200.85.127', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:01:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('131', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:02:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('132', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:02:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('133', '4279', '180.123.208.213', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:03:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('134', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:03:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('135', '577', '113.200.205.17', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:04:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('136', '2458', '123.139.179.176', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:05:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('137', '2793', '14.145.231.149', '?й?', '???', '?㶫ʡ', '?????', '', '???', '2015-06-16 17:05:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('138', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:06:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('139', '560', '113.200.205.148', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:07:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('140', '3801', '182.124.33.239', '?й?', '???', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:07:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('141', '3750', '223.73.11.210', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '?ƶ?', '2015-06-16 17:07:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('142', '4272', '223.104.11.102', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:08:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('143', '4247', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:08:54', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('144', '4247', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:09:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('145', '2330', '221.11.109.54', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:09:57', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('146', '2354', '117.35.159.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:10:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('147', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:10:56', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('148', '664', '117.35.168.212', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:12:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('149', '3488', '36.45.41.217', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:12:20', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('150', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:12:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('151', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:13:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('152', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:13:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('153', '2089', '60.183.128.99', '?й?', '????', '?㽭ʡ', '?????', '', '???', '2015-06-16 17:14:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('154', '3548', '106.44.55.172', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:14:56', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('155', '3585', '117.32.218.153', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:15:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('156', '3207', '113.132.98.203', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:15:09', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('157', '2567', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:15:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('158', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:15:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('159', '4295', '36.45.6.120', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:15:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('160', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:15:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('161', '664', '117.35.168.212', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:15:42', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('162', '4297', '110.210.176.181', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '??ͨ', '2015-06-16 17:15:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('163', '614', '1.85.4.132', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:16:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('164', '4297', '110.210.176.181', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '??ͨ', '2015-06-16 17:16:56', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('165', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:17:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('166', '4050', '111.37.2.174', '?й?', '????', 'ɽ??ʡ', '?ൺ?', '', '?ƶ?', '2015-06-16 17:18:17', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('167', '2900', '111.20.152.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:19:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('168', '4227', '49.68.42.110', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:19:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('169', '2262', '223.11.0.40', '?й?', '????', 'ɽ??ʡ', '̫ԭ?', '', '???', '2015-06-16 17:19:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('170', '2153', '113.200.85.91', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:20:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('171', '2900', '111.20.152.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:21:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('172', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:21:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('173', '2262', '223.11.0.40', '?й?', '????', 'ɽ??ʡ', '̫ԭ?', '', '???', '2015-06-16 17:21:40', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('174', '2222', '111.20.19.1', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:22:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('175', '2306', '117.22.106.52', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:22:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('176', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:22:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('177', '4297', '110.210.176.181', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '??ͨ', '2015-06-16 17:22:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('178', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:22:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('179', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:22:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('180', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:23:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('181', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:23:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('182', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:24:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('183', '4295', '223.104.11.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:24:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('184', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:25:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('185', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:26:08', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('186', '2262', '223.11.0.40', '?й?', '????', 'ɽ??ʡ', '̫ԭ?', '', '???', '2015-06-16 17:28:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('187', '4276', '123.138.19.177', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:28:42', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('188', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:28:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('189', '3596', '221.220.251.68', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 17:29:08', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('190', '3844', '123.125.212.105', '?й?', '????', '?????', '?????', '', '??ͨ', '2015-06-16 17:29:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('191', '4276', '123.138.19.177', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:29:14', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('192', '4276', '123.138.19.177', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:31:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('193', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:31:08', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('194', '3764', '223.104.11.123', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:31:09', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('195', '664', '117.35.168.212', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:31:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('196', '3596', '221.220.251.68', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 17:31:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('197', '3803', '61.158.152.28', '?й?', '???', '????ʡ', '֣???', '', '??ͨ', '2015-06-16 17:31:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('198', '3331', '221.11.20.203', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:31:44', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('199', '2793', '14.145.231.149', '?й?', '???', '?㶫ʡ', '?????', '', '???', '2015-06-16 17:32:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('200', '2262', '223.11.0.40', '?й?', '????', 'ɽ??ʡ', '̫ԭ?', '', '???', '2015-06-16 17:32:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('201', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:32:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('202', '4299', '36.45.9.52', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:32:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('203', '4298', '180.123.157.245', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:33:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('204', '3596', '221.220.251.68', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 17:33:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('205', '4299', '36.45.9.52', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:33:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('206', '2262', '223.11.0.40', '?й?', '????', 'ɽ??ʡ', '̫ԭ?', '', '???', '2015-06-16 17:33:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('207', '2875', '219.131.203.23', '?й?', '???', '?㶫ʡ', '?麣?', '', '???', '2015-06-16 17:33:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('208', '1224', '123.138.40.130', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:34:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('209', '989', '111.20.21.39', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:34:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('210', '1776', '111.20.19.199', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:35:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('211', '3803', '123.8.45.1', '?й?', '???', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:36:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('212', '2793', '14.145.231.149', '?й?', '???', '?㶫ʡ', '?????', '', '???', '2015-06-16 17:36:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('213', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:39:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('214', '2722', '122.96.37.182', '?й?', '????', '????ʡ', '?Ͼ??', '', '??ͨ', '2015-06-16 17:40:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('215', '3676', '123.138.33.79', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:41:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('216', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:41:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('217', '4227', '49.68.42.110', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:41:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('218', '2572', '123.138.19.187', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:42:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('219', '989', '111.20.21.39', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:42:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('220', '4300', '117.169.1.79', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:42:57', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('221', '2923', '1.81.141.46', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:42:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('222', '3488', '36.45.41.217', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:43:05', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('223', '2964', '111.20.19.97', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:43:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('224', '989', '111.20.21.39', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:43:31', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('225', '3796', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 17:43:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('226', '229', '219.131.207.63', '?й?', '???', '?㶫ʡ', '?麣?', '', '???', '2015-06-16 17:43:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('227', '3803', '123.8.45.1', '?й?', '???', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:43:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('228', '3986', '111.20.21.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:44:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('229', '2793', '14.145.231.149', '?й?', '???', '?㶫ʡ', '?????', '', '???', '2015-06-16 17:45:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('230', '3519', '223.104.11.112', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:45:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('231', '3986', '111.20.21.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:45:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('232', '3986', '111.20.21.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:45:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('233', '3519', '223.104.11.112', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:45:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('234', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:46:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('235', '2893', '223.104.11.118', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:46:32', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('236', '1086', '117.32.216.75', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:47:03', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('237', '4301', '106.44.198.115', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:47:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('238', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:47:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('239', '1770', '117.32.216.126', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:47:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('240', '2456', '117.136.25.234', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:48:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('241', '3997', '117.22.107.229', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:49:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('242', '3764', '223.104.11.123', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:50:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('243', '3986', '111.20.21.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:50:31', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('244', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:50:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('245', '1776', '111.20.19.199', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:51:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('246', '2601', '124.116.5.250', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:51:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('247', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:51:30', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('248', '610', '117.35.168.1', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:51:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('249', '2923', '1.81.141.46', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:53:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('250', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:53:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('251', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:53:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('252', '1774', '1.85.61.102', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:53:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('253', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:53:31', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('254', '2601', '124.116.5.250', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:53:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('255', '537', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:53:41', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('256', '3779', '223.104.20.125', '?й?', '???', '????ʡ', '?人?', '', '?ƶ?', '2015-06-16 17:54:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('257', '4301', '106.44.198.115', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:54:08', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('258', '2423', '123.139.179.176', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 17:54:25', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('259', '3779', '223.104.20.125', '?й?', '???', '????ʡ', '?人?', '', '?ƶ?', '2015-06-16 17:55:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('260', '2601', '124.116.5.250', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:56:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('261', '576', '120.192.231.182', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 17:57:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('262', '3550', '123.151.42.52', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 17:57:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('263', '3550', '117.32.218.179', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:58:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('264', '4301', '106.44.198.115', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 17:58:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('265', '3550', '123.151.42.52', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 17:59:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('266', '270', '139.205.184.140', '?й?', '???', '?Ĵ?ʡ', '?ɶ??', '', '???', '2015-06-16 17:59:44', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('267', '3296', '1.85.13.101', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:00:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('268', '3646', '223.104.11.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:02:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('269', '2222', '111.20.19.1', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:03:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('270', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:04:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('271', '1683', '223.104.11.234', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:05:25', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('272', '4297', '110.210.176.181', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '??ͨ', '2015-06-16 18:06:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('273', '3809', '1.84.84.253', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:06:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('274', '3754', '117.22.106.29', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:06:44', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('275', '4297', '110.210.176.181', '?й?', '???', '?㶫ʡ', '??ͷ?', '', '??ͨ', '2015-06-16 18:07:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('276', '4229', '49.81.154.242', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:08:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('277', '3375', '111.20.19.45', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:08:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('278', '2423', '123.139.179.176', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:08:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('279', '3986', '111.20.21.114', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:09:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('280', '3759', '117.22.106.187', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:09:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('281', '2222', '111.20.19.1', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:10:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('282', '3417', '124.89.2.82', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:10:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('283', '4057', '117.22.106.243', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:11:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('284', '1776', '111.20.19.199', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:11:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('285', '2923', '1.81.141.46', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:12:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('286', '4028', '117.22.106.243', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:13:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('287', '2280', '123.138.17.244', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:13:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('288', '3207', '113.57.183.148', '?й?', '???', '????ʡ', '?人?', '', '??ͨ', '2015-06-16 18:14:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('289', '1086', '117.32.216.75', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:16:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('290', '4304', '113.200.205.17', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:20:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('291', '4304', '113.200.205.17', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:21:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('292', '434', '111.175.21.129', '?й?', '???', '????ʡ', '?人?', '', '???', '2015-06-16 18:22:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('293', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 18:22:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('294', '1623', '117.32.216.25', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:22:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('295', '1623', '117.32.216.25', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:22:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('296', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:22:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('297', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 18:23:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('298', '4305', '113.25.89.166', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('299', '4303', '113.25.101.54', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('300', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('301', '4306', '113.25.100.209', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('302', '4308', '113.25.88.32', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('303', '4309', '113.25.89.63', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('304', '4310', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:23:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('305', '4310', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('306', '4309', '113.25.89.63', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('307', '4308', '113.25.88.32', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('308', '4306', '113.25.100.209', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:20', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('309', '4309', '113.25.89.63', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('310', '4310', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('311', '4303', '113.25.101.54', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('312', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('313', '4305', '113.25.89.166', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:24:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('314', '4305', '113.25.89.166', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('315', '4303', '113.25.101.54', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('316', '4306', '113.25.100.209', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('317', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('318', '4308', '113.25.88.32', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('319', '4309', '113.25.89.63', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('320', '4310', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:25:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('321', '2639', '61.185.19.126', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:26:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('322', '2639', '202.200.64.201', '?й?', '????', '????ʡ', '?????', '', '??????', '2015-06-16 18:26:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('323', '4249', '58.58.75.74', '?й?', '????', 'ɽ??ʡ', 'Ϋ???', '', '???', '2015-06-16 18:27:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('324', '4311', '113.200.205.177', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:27:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('325', '1151', '124.161.171.183', '?й?', '???', '?Ĵ?ʡ', '?????', '', '??ͨ', '2015-06-16 18:27:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('326', '4311', '113.200.205.177', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:27:32', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('327', '1623', '117.32.216.25', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:28:36', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('328', '2639', '202.200.64.201', '?й?', '????', '????ʡ', '?????', '', '??????', '2015-06-16 18:28:53', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('329', '1623', '117.32.216.25', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:29:02', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('330', '4301', '106.44.198.70', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:29:23', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('331', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:31:12', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('332', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:31:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('333', '1151', '124.161.171.183', '?й?', '???', '?Ĵ?ʡ', '?????', '', '??ͨ', '2015-06-16 18:31:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('334', '4304', '36.45.97.34', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:32:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('335', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:33:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('336', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:36:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('337', '3801', '182.124.33.239', '?й?', '???', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:37:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('338', '4301', '106.44.198.70', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:39:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('339', '2306', '221.11.61.49', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:39:41', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('340', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:40:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('341', '3331', '221.11.20.204', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:41:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('342', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 18:41:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('343', '2623', '113.200.212.50', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:41:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('344', '3430', '221.11.20.101', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:41:51', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('345', '4304', '36.45.97.34', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:42:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('346', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 18:42:09', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('347', '4249', '58.58.75.74', '?й?', '????', 'ɽ??ʡ', 'Ϋ???', '', '???', '2015-06-16 18:44:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('348', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 18:45:45', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('349', '3646', '223.104.11.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:47:27', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('350', '4312', '223.104.11.250', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:48:31', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('351', '4312', '223.104.11.250', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:48:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('352', '3417', '124.89.2.82', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:49:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('353', '4312', '223.104.11.250', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:49:47', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('354', '3430', '221.11.20.101', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:53:15', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('355', '4304', '36.45.97.26', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:53:41', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('356', '3550', '123.151.42.52', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 18:53:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('357', '4295', '111.20.21.65', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:54:54', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('358', '4309', '113.25.89.63', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:55:26', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('359', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:55:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('360', '3596', '111.161.114.250', '?й?', '????', '?????', '?????', '', '??ͨ', '2015-06-16 18:55:59', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('361', '3510', '111.20.20.32', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 18:56:10', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('362', '2623', '113.200.212.50', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 18:56:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('363', '3550', '123.151.42.52', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 18:56:32', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('364', '4308', '113.25.88.32', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 18:58:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('365', '3550', '123.151.42.52', '?й?', '????', '?????', '?????', '', '???', '2015-06-16 18:58:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('366', '3048', '61.185.224.243', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:59:30', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('367', '3688', '113.132.159.33', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 18:59:35', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('368', '3048', '61.185.224.243', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:00:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('369', '332', '113.200.205.52', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 19:00:16', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('370', '3764', '123.138.76.52', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 19:00:18', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('371', '4308', '113.25.88.32', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:00:19', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('372', '4310', '113.25.85.9', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:00:21', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('373', '1145', '117.35.168.160', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:03:05', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('374', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:04:06', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('375', '4306', '113.25.100.209', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:04:38', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('376', '4303', '113.25.101.54', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:04:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('377', '4302', '113.25.104.53', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:04:39', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('378', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:05:46', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('379', '4306', '113.25.100.209', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:05:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('380', '4305', '113.25.89.166', '?й?', '????', 'ɽ??ʡ', '?????', '', '???', '2015-06-16 19:07:32', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('381', '605', '117.35.168.141', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:07:57', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('382', '2131', '27.46.38.145', '?й?', '???', '?㶫ʡ', '?????', '', '??ͨ', '2015-06-16 19:08:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('383', '3550', '117.32.218.145', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:09:50', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('384', '3577', '111.172.44.82', '?й?', '???', '????ʡ', '?人?', '', '???', '2015-06-16 19:10:48', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('385', '2923', '1.81.141.46', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:11:05', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('386', '229', '219.131.207.63', '?й?', '???', '?㶫ʡ', '?麣?', '', '???', '2015-06-16 19:11:22', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('387', '4301', '106.44.198.80', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:11:49', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('388', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:11:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('389', '605', '117.35.168.141', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:11:56', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('390', '2601', '117.23.16.106', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:12:13', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('391', '163', '123.113.99.61', '?й?', '????', '?????', '?????', '??????', '??ͨ', '2015-06-16 19:12:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('392', '2744', '117.85.32.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:13:58', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('393', '3054', '123.139.23.196', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 19:14:52', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('394', '1885', '117.35.168.129', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:15:04', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('395', '3296', '1.85.13.101', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:15:24', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('396', '2027', '117.22.107.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:15:37', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('397', '3514', '113.200.204.182', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 19:15:55', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('398', '2027', '117.22.107.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:17:33', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('399', '2826', '111.20.19.251', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 19:18:00', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('400', '1086', '117.32.216.75', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:18:05', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('401', '1637', '124.114.71.97', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:18:11', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('402', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:18:43', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('403', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:19:34', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('404', '3646', '223.104.11.113', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 19:21:29', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('405', '2744', '117.85.32.134', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:22:01', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('406', '4295', '111.20.21.65', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 19:22:40', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('407', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:23:17', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('408', '907', '117.36.52.218', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:25:08', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('409', '2163', '106.44.198.80', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:25:28', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('410', '4313', '223.104.11.238', '?й?', '????', '????ʡ', '?????', '', '?ƶ?', '2015-06-16 19:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('411', '4307', '113.143.207.188', '?й?', '????', '????ʡ', 'μ???', '', '???', '2015-06-16 19:25:56', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('412', '1298', '61.232.197.4', '?й?', '????', '????ʡ', '?????', '', '??ͨ', '2015-06-16 19:26:07', '0000-00-00 00:00:00');
INSERT INTO `tb_user_login_history` VALUES ('413', '1882', '117.35.169.190', '?й?', '????', '????ʡ', '?????', '', '???', '2015-06-16 19:26:26', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `tb_user_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_notice`;
CREATE TABLE `tb_user_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL COMMENT '标题',
  `mobile` varchar(20) NOT NULL COMMENT '内容',
  `status` varchar(100) NOT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '起始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of tb_user_notice
-- ----------------------------
INSERT INTO `tb_user_notice` VALUES ('136', '32', '15600600596', '1', '2015-04-08 12:31:49');
INSERT INTO `tb_user_notice` VALUES ('137', '32', '18500817089', '1', '2015-04-08 14:47:22');
INSERT INTO `tb_user_notice` VALUES ('138', '32', '18358275214', '1', '2015-04-08 15:48:53');
INSERT INTO `tb_user_notice` VALUES ('139', '32', '15707247050', '1', '2015-04-08 17:53:17');
INSERT INTO `tb_user_notice` VALUES ('140', '32', '13311582655', '1', '2015-04-08 17:55:11');
INSERT INTO `tb_user_notice` VALUES ('141', '32', '13750077508', '1', '2015-04-20 13:22:16');
INSERT INTO `tb_user_notice` VALUES ('142', '32', '13576249782', '1', '2015-04-20 16:00:06');
INSERT INTO `tb_user_notice` VALUES ('143', '32', '15547811385', '1', '2015-04-20 18:58:23');
INSERT INTO `tb_user_notice` VALUES ('144', '32', '17003504000', '1', '2015-04-20 20:50:09');
INSERT INTO `tb_user_notice` VALUES ('145', '32', '13501210345', '1', '2015-04-21 10:37:11');
INSERT INTO `tb_user_notice` VALUES ('146', '32', '18652909710', '1', '2015-04-21 11:22:27');
INSERT INTO `tb_user_notice` VALUES ('147', '32', '18613122021', '1', '2015-04-21 17:53:54');
INSERT INTO `tb_user_notice` VALUES ('148', '32', '15210917868', '1', '2015-04-21 18:28:06');
INSERT INTO `tb_user_notice` VALUES ('149', '32', '18210143160', '1', '2015-04-22 12:39:07');
INSERT INTO `tb_user_notice` VALUES ('150', '32', '15801435098', '1', '2015-04-22 13:48:41');
INSERT INTO `tb_user_notice` VALUES ('151', '32', '13804419886', '1', '2015-04-22 14:16:01');
INSERT INTO `tb_user_notice` VALUES ('152', '32', '18601042108', '1', '2015-04-22 14:27:36');
INSERT INTO `tb_user_notice` VALUES ('153', '32', '18516146916', '1', '2015-04-23 09:11:28');
INSERT INTO `tb_user_notice` VALUES ('154', '32', '18326567766', '1', '2015-04-23 09:39:01');
INSERT INTO `tb_user_notice` VALUES ('155', '32', '15210693150', '1', '2015-04-23 11:53:53');
INSERT INTO `tb_user_notice` VALUES ('156', '32', '13910779120', '1', '2015-04-24 11:26:11');
INSERT INTO `tb_user_notice` VALUES ('157', '32', '13672737679', '1', '2015-04-24 17:02:53');
INSERT INTO `tb_user_notice` VALUES ('158', '32', '13771255742', '1', '2015-04-25 00:02:56');
INSERT INTO `tb_user_notice` VALUES ('159', '32', '13418932536', '1', '2015-04-25 23:47:54');
INSERT INTO `tb_user_notice` VALUES ('160', '32', '15892648577', '1', '2015-04-26 12:31:59');
INSERT INTO `tb_user_notice` VALUES ('161', '32', '18914451739', '1', '2015-04-26 12:57:25');
INSERT INTO `tb_user_notice` VALUES ('162', '32', '15593360336', '1', '2015-04-26 13:27:02');
INSERT INTO `tb_user_notice` VALUES ('163', '32', '13234894822', '1', '2015-04-26 23:12:40');
INSERT INTO `tb_user_notice` VALUES ('164', '32', '15073362105', '1', '2015-04-27 06:48:23');
INSERT INTO `tb_user_notice` VALUES ('165', '32', '13226484369', '1', '2015-04-27 14:07:37');
INSERT INTO `tb_user_notice` VALUES ('166', '32', '13153967176', '1', '2015-04-27 16:40:12');
INSERT INTO `tb_user_notice` VALUES ('167', '32', '13594767987', '1', '2015-04-30 09:34:04');
INSERT INTO `tb_user_notice` VALUES ('168', '32', '13338019809', '1', '2015-05-02 00:58:49');
INSERT INTO `tb_user_notice` VALUES ('169', '32', '13772507716', '1', '2015-05-14 13:17:46');
INSERT INTO `tb_user_notice` VALUES ('170', '32', '15883783768', '1', '2015-05-14 13:18:48');

-- ----------------------------
-- Table structure for `tb_user_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_record`;
CREATE TABLE `tb_user_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '用户唯一标志',
  `create_time` datetime NOT NULL COMMENT '时间',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `award` int(11) NOT NULL COMMENT '奖励',
  `type` char(20) NOT NULL COMMENT 'recharge：兑换中的话费充值\r\nrecharge_fail： 兑换中的话费充值失败\r\ncash：兑换中的支付宝提现\r\ncash_fail：兑换中的支付宝提现失败\r\n（以上四种类型的pid对应兑换订单的id）\r\ntask：快速任务，pid为快速任务明细的id\n            ads：广告平台任务，pid为广告平台任务明细的id\n  award：连续任务奖励，pid为连续任务奖励明细的id',
  `total_award` int(11) NOT NULL COMMENT '用户总积分=用户最后一条记录的总积分+本次奖励积分',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级记录id',
  PRIMARY KEY (`id`),
  KEY `username` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1645 DEFAULT CHARSET=utf8 COMMENT='用户积分流水';

-- ----------------------------
-- Records of tb_user_record
-- ----------------------------
INSERT INTO `tb_user_record` VALUES ('1573', '15600600596', '2015-04-30 19:34:47', '快速任务 i43小助手', '200', 'FAST', '200', '1317');
INSERT INTO `tb_user_record` VALUES ('1575', '13910779120', '2015-04-30 19:43:02', '快速任务 i43小助手', '200', 'FAST', '200', '1319');
INSERT INTO `tb_user_record` VALUES ('1578', '13910779120', '2015-04-30 19:43:42', '快速任务 京东', '100', 'FAST', '300', '1322');
INSERT INTO `tb_user_record` VALUES ('1602', '18500817089', '2015-05-01 11:45:12', '快速任务 i43小助手', '200', 'FAST', '200', '1342');
INSERT INTO `tb_user_record` VALUES ('1612', '18500817089', '2015-05-01 17:20:21', '快速任务 京东', '100', 'FAST', '300', '1351');
INSERT INTO `tb_user_record` VALUES ('1622', '13020079463', '2015-05-01 20:15:53', '快速任务 i43小助手', '200', 'FAST', '200', '1361');
INSERT INTO `tb_user_record` VALUES ('1623', '13311582655', '2015-05-01 20:21:50', '快速任务 i43小助手', '200', 'FAST', '200', '1362');
INSERT INTO `tb_user_record` VALUES ('1624', '13020079463', '2015-05-01 20:25:32', '快速任务 京东', '100', 'FAST', '300', '1363');
INSERT INTO `tb_user_record` VALUES ('1625', '13750077508', '2015-05-01 22:20:39', '快速任务 i43小助手', '200', 'FAST', '200', '1364');
INSERT INTO `tb_user_record` VALUES ('1626', '13750077508', '2015-05-01 22:23:55', '快速任务 サンスター文具商品カタログ', '350', 'FAST', '550', '1365');
INSERT INTO `tb_user_record` VALUES ('1629', '18600156045', '2015-05-01 22:50:37', '快速任务 i43小助手', '200', 'FAST', '200', '1368');
INSERT INTO `tb_user_record` VALUES ('1630', '18600156045', '2015-05-01 23:22:02', '快速任务 京东金融', '100', 'FAST', '300', '1369');
INSERT INTO `tb_user_record` VALUES ('1631', '18600156045', '2015-05-01 23:35:35', '快速任务 品牌折扣 秒杀包邮特卖', '350', 'FAST', '650', '1370');
INSERT INTO `tb_user_record` VALUES ('1632', '13338019809', '2015-05-02 01:15:41', '快速任务 i43小助手', '200', 'FAST', '200', '1371');
INSERT INTO `tb_user_record` VALUES ('1633', '13338019809', '2015-05-02 01:17:31', '快速任务 京东', '100', 'FAST', '300', '1372');
INSERT INTO `tb_user_record` VALUES ('1634', '13338019809', '2015-05-02 01:18:52', '快速任务 京东金融', '100', 'FAST', '400', '1373');
INSERT INTO `tb_user_record` VALUES ('1635', '13338019809', '2015-05-02 01:19:18', '快速任务 京东金融', '100', 'FAST', '500', '1374');
INSERT INTO `tb_user_record` VALUES ('1636', '13338019809', '2015-05-02 01:20:49', '快速任务 品牌折扣 秒杀包邮特卖', '350', 'FAST', '850', '1375');
INSERT INTO `tb_user_record` VALUES ('1637', '13338019809', '2015-05-02 01:21:52', '快速任务 新刊チェッカー for Kindle', '180', 'FAST', '1030', '1376');
INSERT INTO `tb_user_record` VALUES ('1638', '13338019809', '2015-05-02 01:22:49', '快速任务 围住小明', '200', 'FAST', '1230', '1377');
INSERT INTO `tb_user_record` VALUES ('1639', '13338019809', '2015-05-02 01:24:09', '快速任务 时髦圈-淘宝最低价超值商品，限量抢购，天天特价，全场包邮', '200', 'FAST', '1430', '1378');
INSERT INTO `tb_user_record` VALUES ('1640', '13338019809', '2015-05-02 01:35:33', '快速任务 指尖上的星星', '300', 'FAST', '1730', '1379');
INSERT INTO `tb_user_record` VALUES ('1641', '13910779120', '2015-05-02 12:24:39', '快速任务 子作りチェッカー　妊娠から出産、排卵日から子どもができやすい時期などの子づくりの全てがわかる。赤ちゃんが欲しいカップルは必見！生理日＆排卵日予測で計画的な子づくりを', '350', 'FAST', '650', '1380');
INSERT INTO `tb_user_record` VALUES ('1642', '13910779120', '2015-05-02 12:24:48', '快速任务 Paediatric Emergencies Lite', '180', 'FAST', '830', '1381');
INSERT INTO `tb_user_record` VALUES ('1643', '13910779120', '2015-05-02 12:24:58', '快速任务 宝鸡中心医院', '200', 'FAST', '1030', '1382');
INSERT INTO `tb_user_record` VALUES ('1644', '13750077508', '2015-05-03 18:32:10', '快速任务 Aston Martin - Official Brochure Collection', '130', 'FAST', '680', '1383');

-- ----------------------------
-- Table structure for `tb_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('1', '1', '1', '2014-12-08 16:02:02', '2014-12-08 16:02:02');
INSERT INTO `tb_user_role` VALUES ('2', '2', '2', '2014-12-08 16:02:14', '2014-12-08 16:02:14');
INSERT INTO `tb_user_role` VALUES ('3', '3', '3', '2014-12-08 22:10:24', '2014-12-08 22:10:24');
INSERT INTO `tb_user_role` VALUES ('4', '4', '3', '2014-12-08 16:02:02', '2014-12-08 16:02:02');
INSERT INTO `tb_user_role` VALUES ('5', '5', '3', '2015-04-21 15:31:07', '2015-04-21 15:31:12');
INSERT INTO `tb_user_role` VALUES ('6', '7', '2', '2014-12-08 16:02:02', '2014-12-08 16:02:02');
INSERT INTO `tb_user_role` VALUES ('7', '10', '1', '2015-04-08 11:56:38', '2014-12-08 16:02:02');
INSERT INTO `tb_user_role` VALUES ('8', '6', '1', '2015-04-09 14:06:53', '2014-12-08 16:02:02');
INSERT INTO `tb_user_role` VALUES ('11', '23', '2', '2015-04-21 15:34:59', '2015-04-21 15:34:59');
INSERT INTO `tb_user_role` VALUES ('12', '24', '3', '2015-04-21 15:35:51', '2015-04-21 15:35:51');
INSERT INTO `tb_user_role` VALUES ('13', '25', '3', '2015-04-21 15:36:14', '2015-04-21 15:36:14');
INSERT INTO `tb_user_role` VALUES ('14', '26', '3', '2015-04-21 15:37:11', '2015-04-21 15:37:11');
INSERT INTO `tb_user_role` VALUES ('15', '27', '3', '2015-04-21 15:37:33', '2015-04-21 15:37:33');
INSERT INTO `tb_user_role` VALUES ('16', '28', '3', '2015-04-21 15:38:31', '2015-04-21 15:38:31');
INSERT INTO `tb_user_role` VALUES ('17', '29', '3', '2015-04-21 15:38:46', '2015-04-21 15:38:46');
INSERT INTO `tb_user_role` VALUES ('18', '30', '3', '2015-04-21 15:39:02', '2015-04-21 15:39:02');
INSERT INTO `tb_user_role` VALUES ('20', '32', '4', '2015-05-10 01:34:35', '2015-05-10 01:34:35');
