SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (6, 0, '研发部', 4, 1);
INSERT INTO `sys_dept` VALUES (9, 0, '生产部', 1, 1);
INSERT INTO `sys_dept` VALUES (10, 9, '生产一部', 1, 1);
INSERT INTO `sys_dept` VALUES (11, 0, '质量部', 2, 1);
INSERT INTO `sys_dept` VALUES (13, 0, '测试部', 3, 1);
INSERT INTO `sys_dept` VALUES (16, 9, '生产二部', 2, 1);
INSERT INTO `sys_dept` VALUES (17, 0, '质检部', 5, 1);
INSERT INTO `sys_dept` VALUES (18, 0, '运维部', 7, 1);
INSERT INTO `sys_dept` VALUES (19, 0, 'PMO', 6, 1);
INSERT INTO `sys_dept` VALUES (20, 0, '项目管理', 7, 1);
INSERT INTO `sys_dept` VALUES (21, 0, '项目经理', 8, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (166, 'IAS', '1', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (167, 'IAS事业部', '2', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (168, 'LBS事业部', '3', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (169, 'MMS', '4', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (170, 'MMS事业部', '5', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (171, 'SCOC', '6', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (172, 'SCSS事业部', '7', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (173, '大城管', '8', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (174, '大城管事业部', '9', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (175, '公安部', '10', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (176, '公安事业部', '11', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (177, '集成公安事业部', '12', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (178, '交通事业部', '13', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (179, '旅游事业部', '14', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (180, '数工部', '15', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (181, '系统集成部', '16', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (182, '研发部', '17', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (183, '移动测量事业部', '18', 'main_department', '主导部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (184, '吴政', 'wz', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (185, '龚星', 'gx', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (186, '鞠伟平', 'jwp', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (187, '乐辉', 'lh', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (188, '李凡', 'lf', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (189, '任罗伟', 'rlw', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (190, '王超', 'wc', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (191, '吴睿', 'wr', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (192, '吴政', 'wz', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (193, '项目部', 'xmb', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (194, '章捷', 'zj', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (195, '朱磊', 'zl', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (196, '邹利平', 'zlp', 'project_minister', '项目部长', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (197, '龚星', 'gx', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (198, '王毅力', 'wyl', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (199, '张胜', 'zs', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (200, '喻剑飞', 'yjf', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (201, '赵星', 'zx', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (202, '吴辉', 'wh', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (203, '孙梦范', 'smf', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (204, '陈城', 'cc', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (205, '董清', 'dq', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (206, '邹飞', 'zf', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (207, '石可', 'sk', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (208, '赵天俊', 'ztj', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (209, '马覃', 'mt', 'project_manager', '项目经理', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (210, '程思丽', 'csl', 'inner_head', '内业主管', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (211, '王宜', 'wy', 'inner_head', '内业主管', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12257 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (11490, 1, 'admin', '登录', 45, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-16 14:36:26');
INSERT INTO `sys_log` VALUES (11491, 1, 'admin', '请求访问主页', 52, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-16 14:36:26');
INSERT INTO `sys_log` VALUES (11492, 1, 'admin', 'error', NULL, 'http://localhost:8080/diskProjectManage/selectAllDisk', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist\r\n### The error may exist in file [E:\\Project\\IdeaWork\\data-manage\\trunk\\Code\\data-manage\\data-manage-core\\target\\classes\\mybatis\\disk\\DiskInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, disk_id, cabinet, status, lending_time, return_time, holder, reason, total_volume,     available_capacity, remark, create_time, update_time, cabinet_code, columns_number, rows_number     from disk_info\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist', NULL, '2019-05-16 14:36:54');
INSERT INTO `sys_log` VALUES (11493, 1, 'admin', 'error', NULL, 'http://localhost:8080/diskManage/listData', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist\r\n### The error may exist in file [E:\\Project\\IdeaWork\\data-manage\\trunk\\Code\\data-manage\\data-manage-core\\target\\classes\\mybatis\\disk\\DiskInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from disk_info\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist', NULL, '2019-05-16 14:36:54');
INSERT INTO `sys_log` VALUES (11494, 1, 'admin', '登录', 84, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-16 14:49:19');
INSERT INTO `sys_log` VALUES (11495, 1, 'admin', '请求访问主页', 44, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-16 14:49:19');
INSERT INTO `sys_log` VALUES (11496, 1, 'admin', '登录', 212, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-16 15:04:24');
INSERT INTO `sys_log` VALUES (11497, 1, 'admin', '请求访问主页', 96, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-16 15:04:24');
INSERT INTO `sys_log` VALUES (11498, 1, 'admin', '登录', 63, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-16 15:07:14');
INSERT INTO `sys_log` VALUES (11499, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:07:14');
INSERT INTO `sys_log` VALUES (11500, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:08:14');
INSERT INTO `sys_log` VALUES (11501, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:09:06');
INSERT INTO `sys_log` VALUES (11502, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:09:06');
INSERT INTO `sys_log` VALUES (11503, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:09:41');
INSERT INTO `sys_log` VALUES (11504, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:09:54');
INSERT INTO `sys_log` VALUES (11505, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:09:57');
INSERT INTO `sys_log` VALUES (11506, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:00');
INSERT INTO `sys_log` VALUES (11507, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:07');
INSERT INTO `sys_log` VALUES (11508, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:11');
INSERT INTO `sys_log` VALUES (11509, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:13');
INSERT INTO `sys_log` VALUES (11510, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:16');
INSERT INTO `sys_log` VALUES (11511, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:18');
INSERT INTO `sys_log` VALUES (11512, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:20');
INSERT INTO `sys_log` VALUES (11513, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:22');
INSERT INTO `sys_log` VALUES (11514, 1, 'admin', '删除用户', 16, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:10:24');
INSERT INTO `sys_log` VALUES (11515, 1, 'admin', '添加用户', 16, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:10:42');
INSERT INTO `sys_log` VALUES (11516, 1, 'admin', '保存用户', 0, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:12:01');
INSERT INTO `sys_log` VALUES (11517, 1, 'admin', '保存用户', 32, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:12:10');
INSERT INTO `sys_log` VALUES (11518, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:12:34');
INSERT INTO `sys_log` VALUES (11519, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:13:42');
INSERT INTO `sys_log` VALUES (11520, 1, 'admin', '删除用户', 15, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:15:13');
INSERT INTO `sys_log` VALUES (11521, 1, 'admin', '删除用户', 0, 'com.wjystem.controller.UserController.remove()', NULL, '192.168.22.25', '2019-05-16 15:15:16');
INSERT INTO `sys_log` VALUES (11522, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.239', '2019-05-16 15:15:51');
INSERT INTO `sys_log` VALUES (11523, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.239', '2019-05-16 15:15:51');
INSERT INTO `sys_log` VALUES (11524, 1, 'admin', 'error', NULL, 'http://192.168.100.32:8080/diskProjectManage/selectAllDisk', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist\r\n### The error may exist in URL [jar:file:/C:/Users/Administrator/Desktop/v1.01.0001/data-manage-web.jar!/BOOT-INF/lib/data-manage-core-0.0.1-SNAPSHOT.jar!/mybatis/disk/DiskInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, disk_id, cabinet, status, lending_time, return_time, holder, reason, total_volume,     available_capacity, remark, create_time, update_time, cabinet_code, columns_number, rows_number     from disk_info\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist', NULL, '2019-05-16 15:16:10');
INSERT INTO `sys_log` VALUES (11525, 1, 'admin', 'error', NULL, 'http://192.168.100.32:8080/diskManage/listData', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist\r\n### The error may exist in URL [jar:file:/C:/Users/Administrator/Desktop/v1.01.0001/data-manage-web.jar!/BOOT-INF/lib/data-manage-core-0.0.1-SNAPSHOT.jar!/mybatis/disk/DiskInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from disk_info\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'data_manage.disk_info\' doesn\'t exist', NULL, '2019-05-16 15:16:10');
INSERT INTO `sys_log` VALUES (11526, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:18:04');
INSERT INTO `sys_log` VALUES (11527, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:18:15');
INSERT INTO `sys_log` VALUES (11528, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:18:50');
INSERT INTO `sys_log` VALUES (11529, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:18:56');
INSERT INTO `sys_log` VALUES (11530, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.239', '2019-05-16 15:19:14');
INSERT INTO `sys_log` VALUES (11531, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:19:20');
INSERT INTO `sys_log` VALUES (11532, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.239', '2019-05-16 15:19:28');
INSERT INTO `sys_log` VALUES (11533, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.239', '2019-05-16 15:19:28');
INSERT INTO `sys_log` VALUES (11534, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:19:45');
INSERT INTO `sys_log` VALUES (11535, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:19:49');
INSERT INTO `sys_log` VALUES (11536, 1, 'admin', '更新用户', 16, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:19:55');
INSERT INTO `sys_log` VALUES (11537, 1, 'admin', '编辑用户', 31, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:20:01');
INSERT INTO `sys_log` VALUES (11538, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:20:09');
INSERT INTO `sys_log` VALUES (11539, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.239', '2019-05-16 15:20:15');
INSERT INTO `sys_log` VALUES (11540, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.239', '2019-05-16 15:20:15');
INSERT INTO `sys_log` VALUES (11541, 1, 'admin', '保存用户', 15, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:20:35');
INSERT INTO `sys_log` VALUES (11542, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:20:44');
INSERT INTO `sys_log` VALUES (11543, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:21:04');
INSERT INTO `sys_log` VALUES (11544, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:21:15');
INSERT INTO `sys_log` VALUES (11545, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.239', '2019-05-16 15:21:18');
INSERT INTO `sys_log` VALUES (11546, 1, 'admin', '请求访问主页', 47, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.239', '2019-05-16 15:21:18');
INSERT INTO `sys_log` VALUES (11547, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:21:44');
INSERT INTO `sys_log` VALUES (11548, 1, 'admin', '添加用户', 16, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:23:15');
INSERT INTO `sys_log` VALUES (11549, 1, 'admin', '保存用户', 16, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:23:40');
INSERT INTO `sys_log` VALUES (11550, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:23:42');
INSERT INTO `sys_log` VALUES (11551, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:23:46');
INSERT INTO `sys_log` VALUES (11552, 1, 'admin', '编辑用户', 31, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:23:52');
INSERT INTO `sys_log` VALUES (11553, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:23:55');
INSERT INTO `sys_log` VALUES (11554, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:23:58');
INSERT INTO `sys_log` VALUES (11555, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.23.239', '2019-05-16 15:24:01');
INSERT INTO `sys_log` VALUES (11556, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:24:22');
INSERT INTO `sys_log` VALUES (11557, 1, 'admin', '编辑角色', 15, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.23.239', '2019-05-16 15:24:23');
INSERT INTO `sys_log` VALUES (11558, 1, 'admin', '更新用户', 15, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:24:28');
INSERT INTO `sys_log` VALUES (11559, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:24:31');
INSERT INTO `sys_log` VALUES (11560, 1, 'admin', '更新用户', 16, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:24:34');
INSERT INTO `sys_log` VALUES (11561, 1, 'admin', '添加用户', 16, 'com.wjystem.controller.UserController.add()', NULL, '192.168.23.63', '2019-05-16 15:25:08');
INSERT INTO `sys_log` VALUES (11562, 1, 'admin', '编辑角色', 15, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.23.63', '2019-05-16 15:25:19');
INSERT INTO `sys_log` VALUES (11563, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:26:04');
INSERT INTO `sys_log` VALUES (11564, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:27:22');
INSERT INTO `sys_log` VALUES (11565, 1, 'admin', '更新角色', 15, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:27:59');
INSERT INTO `sys_log` VALUES (11566, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:28:57');
INSERT INTO `sys_log` VALUES (11567, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:30:29');
INSERT INTO `sys_log` VALUES (11568, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:31:10');
INSERT INTO `sys_log` VALUES (11569, 1, 'admin', '更新角色', 15, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:31:36');
INSERT INTO `sys_log` VALUES (11570, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:31:52');
INSERT INTO `sys_log` VALUES (11571, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.23.63', '2019-05-16 15:32:04');
INSERT INTO `sys_log` VALUES (11572, 1, 'admin', '更新角色', 31, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:32:22');
INSERT INTO `sys_log` VALUES (11573, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:32:25');
INSERT INTO `sys_log` VALUES (11574, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:33:16');
INSERT INTO `sys_log` VALUES (11575, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:33:43');
INSERT INTO `sys_log` VALUES (11576, 1, 'admin', '编辑角色', 16, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:33:47');
INSERT INTO `sys_log` VALUES (11577, 1, 'admin', '更新角色', 15, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:33:57');
INSERT INTO `sys_log` VALUES (11578, 1, 'admin', '编辑角色', 16, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:33:58');
INSERT INTO `sys_log` VALUES (11579, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:35:03');
INSERT INTO `sys_log` VALUES (11580, 1, 'admin', '编辑角色', 15, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:35:04');
INSERT INTO `sys_log` VALUES (11581, 1, 'admin', '更新角色', 0, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:35:20');
INSERT INTO `sys_log` VALUES (11582, 1, 'admin', '编辑角色', 15, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:35:32');
INSERT INTO `sys_log` VALUES (11583, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:35:36');
INSERT INTO `sys_log` VALUES (11584, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:35:39');
INSERT INTO `sys_log` VALUES (11585, 1, 'admin', '更新角色', 15, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:35:51');
INSERT INTO `sys_log` VALUES (11586, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:35:53');
INSERT INTO `sys_log` VALUES (11587, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:36:04');
INSERT INTO `sys_log` VALUES (11588, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:36:07');
INSERT INTO `sys_log` VALUES (11589, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:36:11');
INSERT INTO `sys_log` VALUES (11590, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:36:22');
INSERT INTO `sys_log` VALUES (11591, 1, 'admin', '添加角色', 0, 'com.wjystem.controller.RoleController.add()', NULL, '192.168.22.25', '2019-05-16 15:37:04');
INSERT INTO `sys_log` VALUES (11592, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:37:20');
INSERT INTO `sys_log` VALUES (11593, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:37:26');
INSERT INTO `sys_log` VALUES (11594, 1, 'admin', '添加角色', 0, 'com.wjystem.controller.RoleController.add()', NULL, '192.168.22.25', '2019-05-16 15:37:31');
INSERT INTO `sys_log` VALUES (11595, 1, 'admin', '保存角色', 16, 'com.wjystem.controller.RoleController.save()', NULL, '192.168.22.25', '2019-05-16 15:38:22');
INSERT INTO `sys_log` VALUES (11596, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:38:27');
INSERT INTO `sys_log` VALUES (11597, 1, 'admin', '更新用户', 15, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:38:32');
INSERT INTO `sys_log` VALUES (11598, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:38:34');
INSERT INTO `sys_log` VALUES (11599, 1, 'admin', '更新用户', 16, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:38:37');
INSERT INTO `sys_log` VALUES (11600, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:38:55');
INSERT INTO `sys_log` VALUES (11601, 159, 'fengyuhuan', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:39:04');
INSERT INTO `sys_log` VALUES (11602, 159, 'fengyuhuan', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:39:05');
INSERT INTO `sys_log` VALUES (11603, 1, 'admin', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:39:19');
INSERT INTO `sys_log` VALUES (11604, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:39:19');
INSERT INTO `sys_log` VALUES (11605, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:39:36');
INSERT INTO `sys_log` VALUES (11606, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:40:00');
INSERT INTO `sys_log` VALUES (11607, 1, 'admin', '编辑角色', 15, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:40:03');
INSERT INTO `sys_log` VALUES (11608, 1, 'admin', '更新角色', 15, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:40:13');
INSERT INTO `sys_log` VALUES (11609, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:40:29');
INSERT INTO `sys_log` VALUES (11610, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:40:34');
INSERT INTO `sys_log` VALUES (11611, 1, 'admin', '更新用户', 16, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:40:39');
INSERT INTO `sys_log` VALUES (11612, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:41:11');
INSERT INTO `sys_log` VALUES (11613, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:41:21');
INSERT INTO `sys_log` VALUES (11614, 1, 'admin', '编辑角色', 16, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:41:27');
INSERT INTO `sys_log` VALUES (11615, 1, 'admin', '更新角色', 0, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:41:52');
INSERT INTO `sys_log` VALUES (11616, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:42:21');
INSERT INTO `sys_log` VALUES (11617, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:42:49');
INSERT INTO `sys_log` VALUES (11618, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:42:55');
INSERT INTO `sys_log` VALUES (11619, 1, 'admin', '更新角色', 16, 'com.wjystem.controller.RoleController.update()', NULL, '192.168.22.25', '2019-05-16 15:43:25');
INSERT INTO `sys_log` VALUES (11620, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:28');
INSERT INTO `sys_log` VALUES (11621, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:31');
INSERT INTO `sys_log` VALUES (11622, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:35');
INSERT INTO `sys_log` VALUES (11623, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:37');
INSERT INTO `sys_log` VALUES (11624, 1, 'admin', '编辑角色', 0, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:40');
INSERT INTO `sys_log` VALUES (11625, 1, 'admin', '编辑角色', 16, 'com.wjystem.controller.RoleController.edit()', NULL, '192.168.22.25', '2019-05-16 15:43:43');
INSERT INTO `sys_log` VALUES (11626, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:46:17');
INSERT INTO `sys_log` VALUES (11627, 1, 'admin', '更新用户', 16, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:46:22');
INSERT INTO `sys_log` VALUES (11628, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:46:23');
INSERT INTO `sys_log` VALUES (11629, 1, 'admin', '更新用户', 15, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-16 15:46:27');
INSERT INTO `sys_log` VALUES (11630, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:48:35');
INSERT INTO `sys_log` VALUES (11631, 1, 'admin', '请求访问主页', 141, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:50:37');
INSERT INTO `sys_log` VALUES (11632, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:50:53');
INSERT INTO `sys_log` VALUES (11633, NULL, NULL, '登录', 47, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-16 15:51:35');
INSERT INTO `sys_log` VALUES (11634, NULL, NULL, '登录', 0, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-16 15:52:01');
INSERT INTO `sys_log` VALUES (11635, NULL, NULL, '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-16 15:52:05');
INSERT INTO `sys_log` VALUES (11636, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:53:23');
INSERT INTO `sys_log` VALUES (11637, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:53:32');
INSERT INTO `sys_log` VALUES (11638, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:53:33');
INSERT INTO `sys_log` VALUES (11639, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-16 15:53:46');
INSERT INTO `sys_log` VALUES (11640, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-16 15:53:46');
INSERT INTO `sys_log` VALUES (11641, 1, 'admin', '编辑用户', 31, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-16 15:56:31');
INSERT INTO `sys_log` VALUES (11642, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-16 15:57:25');
INSERT INTO `sys_log` VALUES (11643, 1, 'admin', '保存用户', 31, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-16 15:58:33');
INSERT INTO `sys_log` VALUES (11644, 165, 'zouliping', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:58:45');
INSERT INTO `sys_log` VALUES (11645, 165, 'zouliping', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:58:45');
INSERT INTO `sys_log` VALUES (11646, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 15:59:01');
INSERT INTO `sys_log` VALUES (11647, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 15:59:02');
INSERT INTO `sys_log` VALUES (11649, 159, 'fengyuhuan', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.128', '2019-05-16 16:31:47');
INSERT INTO `sys_log` VALUES (11650, 159, 'fengyuhuan', 'error', NULL, 'http://192.168.100.32:8080/index', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: No operations allowed after statement closed.', NULL, '2019-05-16 16:31:47');
INSERT INTO `sys_log` VALUES (11651, 159, 'fengyuhuan', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.128', '2019-05-16 16:31:54');
INSERT INTO `sys_log` VALUES (11652, 159, 'fengyuhuan', '请求访问主页', 0, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.128', '2019-05-16 16:31:54');
INSERT INTO `sys_log` VALUES (11653, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 16:32:17');
INSERT INTO `sys_log` VALUES (11654, 159, 'fengyuhuan', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.128', '2019-05-16 16:33:47');
INSERT INTO `sys_log` VALUES (11655, 159, 'fengyuhuan', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.128', '2019-05-16 16:33:47');
INSERT INTO `sys_log` VALUES (11656, 159, 'fengyuhuan', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-16 16:44:21');
INSERT INTO `sys_log` VALUES (11657, 159, 'fengyuhuan', '请求访问主页', 0, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-16 16:44:21');
INSERT INTO `sys_log` VALUES (11658, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-16 16:55:47');
INSERT INTO `sys_log` VALUES (11659, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', NULL, '2019-05-17 13:40:18');
INSERT INTO `sys_log` VALUES (11660, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', NULL, '2019-05-17 13:43:08');
INSERT INTO `sys_log` VALUES (11661, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', NULL, '2019-05-17 13:43:30');
INSERT INTO `sys_log` VALUES (11662, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', NULL, '2019-05-17 13:51:02');
INSERT INTO `sys_log` VALUES (11663, NULL, NULL, 'error', NULL, 'http://localhost:8080/login', 'redis.clients.jedis.exceptions.JedisNoReachableClusterNodeException: No reachable node in cluster', NULL, '2019-05-17 13:50:32');
INSERT INTO `sys_log` VALUES (11664, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', NULL, '2019-05-17 14:02:17');
INSERT INTO `sys_log` VALUES (11665, NULL, NULL, 'error', NULL, 'http://192.168.100.32:8080/login', 'redis.clients.jedis.exceptions.JedisClusterException: CLUSTERDOWN Hash slot not served', NULL, '2019-05-17 14:03:13');
INSERT INTO `sys_log` VALUES (11666, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-17 14:04:33');
INSERT INTO `sys_log` VALUES (11667, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 14:04:33');
INSERT INTO `sys_log` VALUES (11668, 1, 'admin', '编辑用户', 0, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-17 14:04:48');
INSERT INTO `sys_log` VALUES (11669, 1, 'admin', '登录', 32, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-17 14:04:48');
INSERT INTO `sys_log` VALUES (11670, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-17 14:04:48');
INSERT INTO `sys_log` VALUES (11671, 159, 'fengyuhuan', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.128', '2019-05-17 14:15:48');
INSERT INTO `sys_log` VALUES (11672, 159, 'fengyuhuan', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.128', '2019-05-17 14:15:49');
INSERT INTO `sys_log` VALUES (11673, 165, 'zouliping', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.175', '2019-05-17 16:05:52');
INSERT INTO `sys_log` VALUES (11674, 165, 'zouliping', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.175', '2019-05-17 16:05:52');
INSERT INTO `sys_log` VALUES (11675, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-17 16:27:27');
INSERT INTO `sys_log` VALUES (11676, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 16:27:27');
INSERT INTO `sys_log` VALUES (11677, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 16:55:13');
INSERT INTO `sys_log` VALUES (11678, 1, 'admin', '请求访问主页', 109, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-17 17:14:03');
INSERT INTO `sys_log` VALUES (11679, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 17:14:47');
INSERT INTO `sys_log` VALUES (11680, 165, 'zouliping', '登录', 46, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.175', '2019-05-17 17:25:45');
INSERT INTO `sys_log` VALUES (11681, 165, 'zouliping', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.175', '2019-05-17 17:25:45');
INSERT INTO `sys_log` VALUES (11682, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 17:57:59');
INSERT INTO `sys_log` VALUES (11683, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-17 17:58:09');
INSERT INTO `sys_log` VALUES (11684, 159, 'fengyuhuan', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.128', '2019-05-20 10:12:52');
INSERT INTO `sys_log` VALUES (11685, 159, 'fengyuhuan', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.128', '2019-05-20 10:12:52');
INSERT INTO `sys_log` VALUES (11686, NULL, NULL, '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.22', '2019-05-20 10:13:21');
INSERT INTO `sys_log` VALUES (11687, NULL, NULL, '登录', 0, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.22', '2019-05-20 10:13:23');
INSERT INTO `sys_log` VALUES (11688, NULL, NULL, '登录', 0, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.22', '2019-05-20 10:13:25');
INSERT INTO `sys_log` VALUES (11689, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.11', '2019-05-20 10:13:26');
INSERT INTO `sys_log` VALUES (11690, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.11', '2019-05-20 10:13:26');
INSERT INTO `sys_log` VALUES (11691, 1, 'admin', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 10:15:08');
INSERT INTO `sys_log` VALUES (11692, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 10:15:08');
INSERT INTO `sys_log` VALUES (11693, 164, 'zhouyijun', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 10:19:23');
INSERT INTO `sys_log` VALUES (11694, 164, 'zhouyijun', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 10:19:23');
INSERT INTO `sys_log` VALUES (11695, 1, 'admin', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 10:19:48');
INSERT INTO `sys_log` VALUES (11696, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 10:19:48');
INSERT INTO `sys_log` VALUES (11697, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-20 10:20:53');
INSERT INTO `sys_log` VALUES (11698, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-20 10:21:24');
INSERT INTO `sys_log` VALUES (11699, 1, 'admin', '更新用户', 31, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-20 10:21:25');
INSERT INTO `sys_log` VALUES (11700, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-20 10:21:48');
INSERT INTO `sys_log` VALUES (11701, 1, 'admin', '请求更改用户密码', 0, 'com.wjystem.controller.UserController.resetPwd()', NULL, '192.168.22.25', '2019-05-20 10:21:51');
INSERT INTO `sys_log` VALUES (11702, 163, 'wanping', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.209', '2019-05-20 10:21:57');
INSERT INTO `sys_log` VALUES (11703, 163, 'wanping', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.209', '2019-05-20 10:21:57');
INSERT INTO `sys_log` VALUES (11704, 1, 'admin', 'admin提交更改用户密码', 15, 'com.wjystem.controller.UserController.adminResetPwd()', NULL, '192.168.22.25', '2019-05-20 10:21:57');
INSERT INTO `sys_log` VALUES (11705, 161, 'chengsili', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 10:22:10');
INSERT INTO `sys_log` VALUES (11706, 161, 'chengsili', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 10:22:10');
INSERT INTO `sys_log` VALUES (11707, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 10:22:36');
INSERT INTO `sys_log` VALUES (11708, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 10:22:36');
INSERT INTO `sys_log` VALUES (11709, 161, 'chengsili', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.21.217', '2019-05-20 10:23:58');
INSERT INTO `sys_log` VALUES (11710, 161, 'chengsili', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.21.217', '2019-05-20 10:23:58');
INSERT INTO `sys_log` VALUES (11711, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.22', '2019-05-20 10:31:16');
INSERT INTO `sys_log` VALUES (11712, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.22', '2019-05-20 10:31:16');
INSERT INTO `sys_log` VALUES (11713, 163, 'wanping', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.209', '2019-05-20 10:44:26');
INSERT INTO `sys_log` VALUES (11714, NULL, NULL, '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 10:59:39');
INSERT INTO `sys_log` VALUES (11715, 1, 'admin', '登录', 189, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 10:59:43');
INSERT INTO `sys_log` VALUES (11716, 1, 'admin', '请求访问主页', 47, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 10:59:43');
INSERT INTO `sys_log` VALUES (11717, 1, 'admin', '登录', 141, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.23.63', '2019-05-20 11:08:46');
INSERT INTO `sys_log` VALUES (11718, 1, 'admin', '请求访问主页', 94, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.23.63', '2019-05-20 11:08:46');
INSERT INTO `sys_log` VALUES (11719, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 11:10:13');
INSERT INTO `sys_log` VALUES (11720, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 11:10:22');
INSERT INTO `sys_log` VALUES (11721, 161, 'chengsili', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.21.217', '2019-05-20 11:10:24');
INSERT INTO `sys_log` VALUES (11722, 163, 'wanping', '提交更改用户密码', 31, 'com.wjystem.controller.UserController.resetPwd()', NULL, '192.168.23.209', '2019-05-20 13:22:00');
INSERT INTO `sys_log` VALUES (11723, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 14:10:38');
INSERT INTO `sys_log` VALUES (11724, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 14:10:38');
INSERT INTO `sys_log` VALUES (11725, 1, 'admin', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 14:56:40');
INSERT INTO `sys_log` VALUES (11726, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 14:56:40');
INSERT INTO `sys_log` VALUES (11727, 164, 'zhouyijun', '登录', 63, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.24.201', '2019-05-20 14:56:44');
INSERT INTO `sys_log` VALUES (11728, 164, 'zhouyijun', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.24.201', '2019-05-20 14:56:44');
INSERT INTO `sys_log` VALUES (11729, 1, 'admin', '添加用户', 16, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-20 14:56:49');
INSERT INTO `sys_log` VALUES (11730, 1, 'admin', '保存用户', 15, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-20 14:57:21');
INSERT INTO `sys_log` VALUES (11731, 1, 'admin', '添加用户', 0, 'com.wjystem.controller.UserController.add()', NULL, '192.168.22.25', '2019-05-20 14:57:37');
INSERT INTO `sys_log` VALUES (11732, 1, 'admin', '保存用户', 15, 'com.wjystem.controller.UserController.save()', NULL, '192.168.22.25', '2019-05-20 14:58:09');
INSERT INTO `sys_log` VALUES (11733, 1, 'admin', '编辑用户', 16, 'com.wjystem.controller.UserController.edit()', NULL, '192.168.22.25', '2019-05-20 14:58:11');
INSERT INTO `sys_log` VALUES (11734, 1, 'admin', '更新用户', 15, 'com.wjystem.controller.UserController.update()', NULL, '192.168.22.25', '2019-05-20 14:58:13');
INSERT INTO `sys_log` VALUES (11735, 167, 'liying', '登录', 32, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.22.25', '2019-05-20 14:59:45');
INSERT INTO `sys_log` VALUES (11736, 167, 'liying', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.22.25', '2019-05-20 14:59:45');
INSERT INTO `sys_log` VALUES (11737, 166, 'zhangjiakuan', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.24.207', '2019-05-20 15:01:55');
INSERT INTO `sys_log` VALUES (11738, 166, 'zhangjiakuan', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.24.207', '2019-05-20 15:01:55');
INSERT INTO `sys_log` VALUES (11739, 167, 'liying', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.24.200', '2019-05-20 15:02:01');
INSERT INTO `sys_log` VALUES (11740, 167, 'liying', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.24.200', '2019-05-20 15:02:01');
INSERT INTO `sys_log` VALUES (11741, 166, 'zhangjiakuan', '提交更改用户密码', 16, 'com.wjystem.controller.UserController.resetPwd()', NULL, '192.168.24.207', '2019-05-20 15:03:45');
INSERT INTO `sys_log` VALUES (11742, 166, 'zhangjiakuan', '提交更改用户密码', 0, 'com.wjystem.controller.UserController.resetPwd()', NULL, '192.168.24.207', '2019-05-20 15:03:48');
INSERT INTO `sys_log` VALUES (11743, 166, 'zhangjiakuan', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '192.168.24.207', '2019-05-20 15:04:01');
INSERT INTO `sys_log` VALUES (11744, 166, 'zhangjiakuan', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '192.168.24.207', '2019-05-20 15:04:01');
INSERT INTO `sys_log` VALUES (11745, 166, 'zhangjiakuan', '保存磁盘信息', 31, 'com.wjysk.controller.DiskManageController.saveDiskInfo()', NULL, '192.168.24.207', '2019-05-20 15:10:01');
INSERT INTO `sys_log` VALUES (11746, 1, 'admin', '请求访问主页', 50, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:02:26');
INSERT INTO `sys_log` VALUES (11747, 1, 'admin', '编辑用户', 20, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:02:37');
INSERT INTO `sys_log` VALUES (11748, 1, 'admin', '更新用户', 64, 'com.wjystem.controller.UserController.update()', NULL, '127.0.0.1', '2019-05-20 16:02:46');
INSERT INTO `sys_log` VALUES (11749, 1, 'admin', '编辑用户', 10, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:04:32');
INSERT INTO `sys_log` VALUES (11750, 1, 'admin', '更新用户', 51, 'com.wjystem.controller.UserController.update()', NULL, '127.0.0.1', '2019-05-20 16:04:36');
INSERT INTO `sys_log` VALUES (11751, 1, 'admin', '添加用户', 4, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:05:08');
INSERT INTO `sys_log` VALUES (11752, 1, 'admin', '编辑用户', 13, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:05:32');
INSERT INTO `sys_log` VALUES (11753, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:05:44');
INSERT INTO `sys_log` VALUES (11754, 1, 'admin', '更新角色', 68, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:05:52');
INSERT INTO `sys_log` VALUES (11755, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:05:55');
INSERT INTO `sys_log` VALUES (11756, 1, 'admin', '更新角色', 223, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:05:59');
INSERT INTO `sys_log` VALUES (11757, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:07:09');
INSERT INTO `sys_log` VALUES (11758, 1, 'admin', '删除角色', 33, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:07:28');
INSERT INTO `sys_log` VALUES (11759, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:07:30');
INSERT INTO `sys_log` VALUES (11760, 1, 'admin', '更新角色', 90, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:07:47');
INSERT INTO `sys_log` VALUES (11761, 1, 'admin', '添加角色', 1, 'com.wjystem.controller.RoleController.add()', NULL, '127.0.0.1', '2019-05-20 16:08:43');
INSERT INTO `sys_log` VALUES (11762, 1, 'admin', '保存角色', 52, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:08:59');
INSERT INTO `sys_log` VALUES (11763, 1, 'admin', '添加角色', 1, 'com.wjystem.controller.RoleController.add()', NULL, '127.0.0.1', '2019-05-20 16:09:21');
INSERT INTO `sys_log` VALUES (11764, 1, 'admin', '保存角色', 42, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:09:32');
INSERT INTO `sys_log` VALUES (11765, 1, 'admin', '添加角色', 0, 'com.wjystem.controller.RoleController.add()', NULL, '127.0.0.1', '2019-05-20 16:09:45');
INSERT INTO `sys_log` VALUES (11766, 1, 'admin', '保存角色', 24, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:10:13');
INSERT INTO `sys_log` VALUES (11767, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:12:03');
INSERT INTO `sys_log` VALUES (11768, 1, 'admin', '添加用户', 4, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:12:12');
INSERT INTO `sys_log` VALUES (11769, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:13:54');
INSERT INTO `sys_log` VALUES (11770, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:15:02');
INSERT INTO `sys_log` VALUES (11771, 1, 'admin', '添加用户', 2, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:15:45');
INSERT INTO `sys_log` VALUES (11772, 1, 'admin', '保存用户', 28, 'com.wjystem.controller.UserController.save()', NULL, '127.0.0.1', '2019-05-20 16:16:15');
INSERT INTO `sys_log` VALUES (11773, 1, 'admin', '添加用户', 3, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:16:55');
INSERT INTO `sys_log` VALUES (11774, 1, 'admin', '保存用户', 65, 'com.wjystem.controller.UserController.save()', NULL, '127.0.0.1', '2019-05-20 16:17:42');
INSERT INTO `sys_log` VALUES (11775, 1, 'admin', '添加用户', 2, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:17:55');
INSERT INTO `sys_log` VALUES (11776, 1, 'admin', '添加角色', 1, 'com.wjystem.controller.RoleController.add()', NULL, '127.0.0.1', '2019-05-20 16:18:33');
INSERT INTO `sys_log` VALUES (11777, 1, 'admin', '保存角色', 44, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:18:43');
INSERT INTO `sys_log` VALUES (11778, 1, 'admin', '添加角色', 0, 'com.wjystem.controller.RoleController.add()', NULL, '127.0.0.1', '2019-05-20 16:18:45');
INSERT INTO `sys_log` VALUES (11779, 1, 'admin', '保存角色', 51, 'com.wjystem.controller.RoleController.save()', NULL, '127.0.0.1', '2019-05-20 16:18:56');
INSERT INTO `sys_log` VALUES (11780, 1, 'admin', '添加用户', 3, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:19:01');
INSERT INTO `sys_log` VALUES (11781, 1, 'admin', '保存用户', 66, 'com.wjystem.controller.UserController.save()', NULL, '127.0.0.1', '2019-05-20 16:19:29');
INSERT INTO `sys_log` VALUES (11782, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:19:42');
INSERT INTO `sys_log` VALUES (11783, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:20:10');
INSERT INTO `sys_log` VALUES (11784, 1, 'admin', '更新用户', 38, 'com.wjystem.controller.UserController.update()', NULL, '127.0.0.1', '2019-05-20 16:20:26');
INSERT INTO `sys_log` VALUES (11785, 1, 'admin', '添加用户', 5, 'com.wjystem.controller.UserController.add()', NULL, '127.0.0.1', '2019-05-20 16:20:40');
INSERT INTO `sys_log` VALUES (11786, 1, 'admin', '保存用户', 31, 'com.wjystem.controller.UserController.save()', NULL, '127.0.0.1', '2019-05-20 16:21:13');
INSERT INTO `sys_log` VALUES (11787, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:21:32');
INSERT INTO `sys_log` VALUES (11788, 1, 'admin', '更新角色', 51, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:21:51');
INSERT INTO `sys_log` VALUES (11789, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:21:53');
INSERT INTO `sys_log` VALUES (11790, 1, 'admin', '更新角色', 46, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:22:02');
INSERT INTO `sys_log` VALUES (11791, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:04');
INSERT INTO `sys_log` VALUES (11792, 1, 'admin', '更新角色', 50, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:22:12');
INSERT INTO `sys_log` VALUES (11793, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:14');
INSERT INTO `sys_log` VALUES (11794, 1, 'admin', '更新角色', 54, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:22:21');
INSERT INTO `sys_log` VALUES (11795, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:24');
INSERT INTO `sys_log` VALUES (11796, 1, 'admin', '更新角色', 168, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:22:30');
INSERT INTO `sys_log` VALUES (11797, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:31');
INSERT INTO `sys_log` VALUES (11798, 1, 'admin', '更新角色', 52, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:22:40');
INSERT INTO `sys_log` VALUES (11799, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:42');
INSERT INTO `sys_log` VALUES (11800, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:47');
INSERT INTO `sys_log` VALUES (11801, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:22:52');
INSERT INTO `sys_log` VALUES (11802, 1, 'admin', '更新角色', 63, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:23:00');
INSERT INTO `sys_log` VALUES (11803, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:23:03');
INSERT INTO `sys_log` VALUES (11804, 1, 'admin', '更新角色', 69, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 16:23:10');
INSERT INTO `sys_log` VALUES (11805, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:23:15');
INSERT INTO `sys_log` VALUES (11806, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:23:18');
INSERT INTO `sys_log` VALUES (11807, 1, 'admin', '请求访问主页', 19, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:23:48');
INSERT INTO `sys_log` VALUES (11808, 1, 'admin', '请求访问主页', 50, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:25:17');
INSERT INTO `sys_log` VALUES (11809, 1, 'admin', '请求访问主页', 19, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:26:00');
INSERT INTO `sys_log` VALUES (11810, 1, 'admin', '登录', 40, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:26:34');
INSERT INTO `sys_log` VALUES (11811, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:26:34');
INSERT INTO `sys_log` VALUES (11812, 1, 'admin', '编辑用户', 20, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:26:40');
INSERT INTO `sys_log` VALUES (11813, 1, 'admin', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:26:52');
INSERT INTO `sys_log` VALUES (11814, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:26:59');
INSERT INTO `sys_log` VALUES (11815, 1, 'admin', '请求更改用户密码', 1, 'com.wjystem.controller.UserController.resetPwd()', NULL, '127.0.0.1', '2019-05-20 16:27:06');
INSERT INTO `sys_log` VALUES (11816, 1, 'admin', 'admin提交更改用户密码', 91, 'com.wjystem.controller.UserController.adminResetPwd()', NULL, '127.0.0.1', '2019-05-20 16:27:08');
INSERT INTO `sys_log` VALUES (11817, 163, 'wanping', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:27:11');
INSERT INTO `sys_log` VALUES (11818, 163, 'wanping', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:27:11');
INSERT INTO `sys_log` VALUES (11819, 1, 'admin', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:27:59');
INSERT INTO `sys_log` VALUES (11820, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:27:59');
INSERT INTO `sys_log` VALUES (11821, 1, 'admin', '编辑用户', 15, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:28:03');
INSERT INTO `sys_log` VALUES (11822, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 16:28:14');
INSERT INTO `sys_log` VALUES (11823, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:28:55');
INSERT INTO `sys_log` VALUES (11824, 162, 'wangyi', '登录', 28, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:29:59');
INSERT INTO `sys_log` VALUES (11825, 162, 'wangyi', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:29:59');
INSERT INTO `sys_log` VALUES (11826, 1, 'admin', '登录', 31, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:30:34');
INSERT INTO `sys_log` VALUES (11827, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:30:34');
INSERT INTO `sys_log` VALUES (11828, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/400009/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 16:33:42');
INSERT INTO `sys_log` VALUES (11829, 1, 'admin', '请求访问主页', 66, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:45:28');
INSERT INTO `sys_log` VALUES (11830, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:46:37');
INSERT INTO `sys_log` VALUES (11831, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:46:49');
INSERT INTO `sys_log` VALUES (11832, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:46:54');
INSERT INTO `sys_log` VALUES (11833, 1, 'admin', '编辑用户', 11, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:46:56');
INSERT INTO `sys_log` VALUES (11834, 1, 'admin', '编辑用户', 13, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:03');
INSERT INTO `sys_log` VALUES (11835, 1, 'admin', '编辑用户', 7, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:06');
INSERT INTO `sys_log` VALUES (11836, 1, 'admin', '编辑用户', 11, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:13');
INSERT INTO `sys_log` VALUES (11837, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:16');
INSERT INTO `sys_log` VALUES (11838, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:20');
INSERT INTO `sys_log` VALUES (11839, 1, 'admin', '编辑用户', 7, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:24');
INSERT INTO `sys_log` VALUES (11840, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:28');
INSERT INTO `sys_log` VALUES (11841, 1, 'admin', '编辑用户', 11, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:33');
INSERT INTO `sys_log` VALUES (11842, 1, 'admin', '编辑用户', 7, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:38');
INSERT INTO `sys_log` VALUES (11843, 1, 'admin', '编辑用户', 9, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:42');
INSERT INTO `sys_log` VALUES (11844, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:45');
INSERT INTO `sys_log` VALUES (11845, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:47:48');
INSERT INTO `sys_log` VALUES (11846, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 16:48:06');
INSERT INTO `sys_log` VALUES (11847, 163, 'wanping', '登录', 39, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:48:20');
INSERT INTO `sys_log` VALUES (11848, 163, 'wanping', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:48:20');
INSERT INTO `sys_log` VALUES (11849, 1, 'admin', '登录', 17, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:50:25');
INSERT INTO `sys_log` VALUES (11850, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:50:26');
INSERT INTO `sys_log` VALUES (11851, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/400011/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 16:56:46');
INSERT INTO `sys_log` VALUES (11852, 163, 'wanping', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:57:45');
INSERT INTO `sys_log` VALUES (11853, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:57:45');
INSERT INTO `sys_log` VALUES (11854, 1, 'admin', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 16:58:02');
INSERT INTO `sys_log` VALUES (11855, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 16:58:02');
INSERT INTO `sys_log` VALUES (11856, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:02:24');
INSERT INTO `sys_log` VALUES (11857, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:04:32');
INSERT INTO `sys_log` VALUES (11858, 1, 'admin', '登录', 30, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:04:43');
INSERT INTO `sys_log` VALUES (11859, 1, 'admin', '请求访问主页', 25, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:04:43');
INSERT INTO `sys_log` VALUES (11860, 163, 'wanping', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:05:47');
INSERT INTO `sys_log` VALUES (11861, 163, 'wanping', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:05:47');
INSERT INTO `sys_log` VALUES (11862, 169, 'yulan', '登录', 28, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:06:33');
INSERT INTO `sys_log` VALUES (11863, 169, 'yulan', '请求访问主页', 59, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:06:33');
INSERT INTO `sys_log` VALUES (11864, 1, 'admin', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:07:15');
INSERT INTO `sys_log` VALUES (11865, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:07:15');
INSERT INTO `sys_log` VALUES (11866, 171, 'wujing', '登录', 16, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:07:39');
INSERT INTO `sys_log` VALUES (11867, 171, 'wujing', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:07:39');
INSERT INTO `sys_log` VALUES (11868, NULL, NULL, '登录', 4, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:08:00');
INSERT INTO `sys_log` VALUES (11869, NULL, NULL, '登录', 4, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:08:20');
INSERT INTO `sys_log` VALUES (11870, 1, 'admin', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:08:27');
INSERT INTO `sys_log` VALUES (11871, 1, 'admin', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:08:27');
INSERT INTO `sys_log` VALUES (11872, 1, 'admin', '编辑用户', 6, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 17:08:33');
INSERT INTO `sys_log` VALUES (11873, 1, 'admin', '请求更改用户密码', 1, 'com.wjystem.controller.UserController.resetPwd()', NULL, '127.0.0.1', '2019-05-20 17:08:38');
INSERT INTO `sys_log` VALUES (11874, 1, 'admin', 'admin提交更改用户密码', 39, 'com.wjystem.controller.UserController.adminResetPwd()', NULL, '127.0.0.1', '2019-05-20 17:08:40');
INSERT INTO `sys_log` VALUES (11875, 166, 'zhangjiakuan', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:08:44');
INSERT INTO `sys_log` VALUES (11876, 166, 'zhangjiakuan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:08:44');
INSERT INTO `sys_log` VALUES (11877, 1, 'admin', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:09:31');
INSERT INTO `sys_log` VALUES (11878, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:09:31');
INSERT INTO `sys_log` VALUES (11879, 1, 'admin', '编辑用户', 8, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 17:09:56');
INSERT INTO `sys_log` VALUES (11880, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 17:10:05');
INSERT INTO `sys_log` VALUES (11881, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/405039/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 17:13:51');
INSERT INTO `sys_log` VALUES (11882, 163, 'wanping', '登录', 28, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:14:36');
INSERT INTO `sys_log` VALUES (11883, 163, 'wanping', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:14:36');
INSERT INTO `sys_log` VALUES (11884, 169, 'yulan', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:15:02');
INSERT INTO `sys_log` VALUES (11885, 169, 'yulan', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:15:02');
INSERT INTO `sys_log` VALUES (11886, 171, 'wujing', '登录', 34, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:15:20');
INSERT INTO `sys_log` VALUES (11887, 171, 'wujing', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:15:20');
INSERT INTO `sys_log` VALUES (11888, 166, 'zhangjiakuan', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:15:36');
INSERT INTO `sys_log` VALUES (11889, 166, 'zhangjiakuan', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:15:36');
INSERT INTO `sys_log` VALUES (11890, 1, 'admin', '登录', 43, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:15:59');
INSERT INTO `sys_log` VALUES (11891, 1, 'admin', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:15:59');
INSERT INTO `sys_log` VALUES (11892, 163, 'wanping', '登录', 17, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:17:14');
INSERT INTO `sys_log` VALUES (11893, 163, 'wanping', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:17:14');
INSERT INTO `sys_log` VALUES (11894, 169, 'yulan', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:17:43');
INSERT INTO `sys_log` VALUES (11895, 169, 'yulan', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:17:43');
INSERT INTO `sys_log` VALUES (11896, 171, 'wujing', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:18:03');
INSERT INTO `sys_log` VALUES (11897, 171, 'wujing', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:18:03');
INSERT INTO `sys_log` VALUES (11898, 166, 'zhangjiakuan', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:18:21');
INSERT INTO `sys_log` VALUES (11899, 166, 'zhangjiakuan', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:18:21');
INSERT INTO `sys_log` VALUES (11900, 1, 'admin', '登录', 27, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:19:25');
INSERT INTO `sys_log` VALUES (11901, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:19:25');
INSERT INTO `sys_log` VALUES (11902, 163, 'wanping', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:20:33');
INSERT INTO `sys_log` VALUES (11903, 163, 'wanping', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:20:33');
INSERT INTO `sys_log` VALUES (11904, 169, 'yulan', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:21:02');
INSERT INTO `sys_log` VALUES (11905, 169, 'yulan', '请求访问主页', 8, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:21:02');
INSERT INTO `sys_log` VALUES (11906, 171, 'wujing', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:21:18');
INSERT INTO `sys_log` VALUES (11907, 171, 'wujing', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:21:18');
INSERT INTO `sys_log` VALUES (11908, 166, 'zhangjiakuan', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:21:36');
INSERT INTO `sys_log` VALUES (11909, 166, 'zhangjiakuan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:21:36');
INSERT INTO `sys_log` VALUES (11910, 1, 'admin', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:23:20');
INSERT INTO `sys_log` VALUES (11911, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:23:20');
INSERT INTO `sys_log` VALUES (11912, 163, 'wanping', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:24:36');
INSERT INTO `sys_log` VALUES (11913, 163, 'wanping', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:24:36');
INSERT INTO `sys_log` VALUES (11914, 169, 'yulan', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:25:02');
INSERT INTO `sys_log` VALUES (11915, 169, 'yulan', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:25:02');
INSERT INTO `sys_log` VALUES (11916, 171, 'wujing', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:25:16');
INSERT INTO `sys_log` VALUES (11917, 171, 'wujing', '请求访问主页', 17, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:25:16');
INSERT INTO `sys_log` VALUES (11918, 1, 'admin', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:26:31');
INSERT INTO `sys_log` VALUES (11919, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:26:31');
INSERT INTO `sys_log` VALUES (11920, 163, 'wanping', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:30:32');
INSERT INTO `sys_log` VALUES (11921, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:30:32');
INSERT INTO `sys_log` VALUES (11922, 169, 'yulan', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:30:57');
INSERT INTO `sys_log` VALUES (11923, 169, 'yulan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:30:57');
INSERT INTO `sys_log` VALUES (11924, 171, 'wujing', '登录', 44, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:31:12');
INSERT INTO `sys_log` VALUES (11925, 171, 'wujing', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:31:12');
INSERT INTO `sys_log` VALUES (11926, 166, 'zhangjiakuan', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:31:40');
INSERT INTO `sys_log` VALUES (11927, 166, 'zhangjiakuan', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:31:40');
INSERT INTO `sys_log` VALUES (11928, 1, 'admin', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:32:56');
INSERT INTO `sys_log` VALUES (11929, 1, 'admin', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:32:56');
INSERT INTO `sys_log` VALUES (11930, 1, 'admin', '请求访问主页', 20, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:38:43');
INSERT INTO `sys_log` VALUES (11931, 163, 'wanping', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:42:19');
INSERT INTO `sys_log` VALUES (11932, 163, 'wanping', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:42:19');
INSERT INTO `sys_log` VALUES (11933, 169, 'yulan', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:42:48');
INSERT INTO `sys_log` VALUES (11934, 169, 'yulan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:42:48');
INSERT INTO `sys_log` VALUES (11935, 171, 'wujing', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:43:09');
INSERT INTO `sys_log` VALUES (11936, 171, 'wujing', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:43:09');
INSERT INTO `sys_log` VALUES (11937, 166, 'zhangjiakuan', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:43:27');
INSERT INTO `sys_log` VALUES (11938, 166, 'zhangjiakuan', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:43:27');
INSERT INTO `sys_log` VALUES (11939, 1, 'admin', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 17:44:36');
INSERT INTO `sys_log` VALUES (11940, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 17:44:36');
INSERT INTO `sys_log` VALUES (11941, 166, 'zhangjiakuan', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:05:06');
INSERT INTO `sys_log` VALUES (11942, 166, 'zhangjiakuan', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:05:07');
INSERT INTO `sys_log` VALUES (11943, 1, 'admin', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:07:03');
INSERT INTO `sys_log` VALUES (11944, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:07:04');
INSERT INTO `sys_log` VALUES (11945, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:16');
INSERT INTO `sys_log` VALUES (11946, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:27');
INSERT INTO `sys_log` VALUES (11947, 1, 'admin', '更新角色', 186, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:07:36');
INSERT INTO `sys_log` VALUES (11948, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:38');
INSERT INTO `sys_log` VALUES (11949, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:45');
INSERT INTO `sys_log` VALUES (11950, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:49');
INSERT INTO `sys_log` VALUES (11951, 1, 'admin', '更新角色', 189, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:07:54');
INSERT INTO `sys_log` VALUES (11952, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:07:59');
INSERT INTO `sys_log` VALUES (11953, 1, 'admin', '更新角色', 76, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:03');
INSERT INTO `sys_log` VALUES (11954, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:05');
INSERT INTO `sys_log` VALUES (11955, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:08');
INSERT INTO `sys_log` VALUES (11956, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:12');
INSERT INTO `sys_log` VALUES (11957, 1, 'admin', '更新角色', 71, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:15');
INSERT INTO `sys_log` VALUES (11958, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:17');
INSERT INTO `sys_log` VALUES (11959, 1, 'admin', '更新角色', 216, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:21');
INSERT INTO `sys_log` VALUES (11960, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:23');
INSERT INTO `sys_log` VALUES (11961, 1, 'admin', '更新角色', 64, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:26');
INSERT INTO `sys_log` VALUES (11962, 1, 'admin', '编辑角色', 1, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:28');
INSERT INTO `sys_log` VALUES (11963, 1, 'admin', '更新角色', 71, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:31');
INSERT INTO `sys_log` VALUES (11964, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:33');
INSERT INTO `sys_log` VALUES (11965, 1, 'admin', '更新角色', 98, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:36');
INSERT INTO `sys_log` VALUES (11966, 1, 'admin', '编辑角色', 2, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:38');
INSERT INTO `sys_log` VALUES (11967, 1, 'admin', '更新角色', 224, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-20 18:08:42');
INSERT INTO `sys_log` VALUES (11968, 1, 'admin', '编辑用户', 6, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 18:08:48');
INSERT INTO `sys_log` VALUES (11969, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/405221/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 18:09:48');
INSERT INTO `sys_log` VALUES (11970, 163, 'wanping', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:10:41');
INSERT INTO `sys_log` VALUES (11971, 163, 'wanping', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:10:41');
INSERT INTO `sys_log` VALUES (11972, 169, 'yulan', '登录', 17, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:11:14');
INSERT INTO `sys_log` VALUES (11973, 169, 'yulan', '请求访问主页', 8, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:11:14');
INSERT INTO `sys_log` VALUES (11974, 171, 'wujing', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:11:36');
INSERT INTO `sys_log` VALUES (11975, 171, 'wujing', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:11:36');
INSERT INTO `sys_log` VALUES (11976, 166, 'zhangjiakuan', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:12:08');
INSERT INTO `sys_log` VALUES (11977, 166, 'zhangjiakuan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:12:08');
INSERT INTO `sys_log` VALUES (11978, 1, 'admin', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:13:14');
INSERT INTO `sys_log` VALUES (11979, 1, 'admin', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:13:14');
INSERT INTO `sys_log` VALUES (11980, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:13:19');
INSERT INTO `sys_log` VALUES (11981, 166, 'zhangjiakuan', '登录', 50, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:19:10');
INSERT INTO `sys_log` VALUES (11982, 166, 'zhangjiakuan', '请求访问主页', 30, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:19:10');
INSERT INTO `sys_log` VALUES (11983, 166, 'zhangjiakuan', 'error', NULL, 'http://localhost:8080/act/cgrk/db/list', 'java.lang.IllegalArgumentException: Name for argument type [int] not available, and parameter name information not found in class file either.', NULL, '2019-05-20 18:20:10');
INSERT INTO `sys_log` VALUES (11984, 166, 'zhangjiakuan', 'error', NULL, 'http://localhost:8080/act/cgrk/db/list', 'java.lang.IllegalArgumentException: Name for argument type [int] not available, and parameter name information not found in class file either.', NULL, '2019-05-20 18:20:12');
INSERT INTO `sys_log` VALUES (11985, 166, 'zhangjiakuan', '请求访问主页', 46, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:25:01');
INSERT INTO `sys_log` VALUES (11986, 1, 'admin', '登录', 41, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:25:11');
INSERT INTO `sys_log` VALUES (11987, 1, 'admin', '请求访问主页', 19, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:25:11');
INSERT INTO `sys_log` VALUES (11988, 163, 'wanping', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:27:24');
INSERT INTO `sys_log` VALUES (11989, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:27:24');
INSERT INTO `sys_log` VALUES (11990, 1, 'admin', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:28:37');
INSERT INTO `sys_log` VALUES (11991, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:28:37');
INSERT INTO `sys_log` VALUES (11992, 163, 'wanping', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:30:11');
INSERT INTO `sys_log` VALUES (11993, 163, 'wanping', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:30:11');
INSERT INTO `sys_log` VALUES (11994, 1, 'admin', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:31:23');
INSERT INTO `sys_log` VALUES (11995, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:31:23');
INSERT INTO `sys_log` VALUES (11996, 1, 'admin', '编辑用户', 21, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-20 18:31:29');
INSERT INTO `sys_log` VALUES (11997, 1, 'admin', '请求访问主页', 17, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:31:45');
INSERT INTO `sys_log` VALUES (11998, 163, 'wanping', '登录', 28, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:35:01');
INSERT INTO `sys_log` VALUES (11999, 163, 'wanping', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:35:01');
INSERT INTO `sys_log` VALUES (12000, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:36:00');
INSERT INTO `sys_log` VALUES (12001, NULL, NULL, '登录', 8, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:36:07');
INSERT INTO `sys_log` VALUES (12002, 1, 'admin', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:36:09');
INSERT INTO `sys_log` VALUES (12003, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:36:09');
INSERT INTO `sys_log` VALUES (12004, 1, 'admin', '请求访问主页', 19, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:36:26');
INSERT INTO `sys_log` VALUES (12005, 1, 'admin', '请求访问主页', 18, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:36:49');
INSERT INTO `sys_log` VALUES (12006, 163, 'wanping', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:37:16');
INSERT INTO `sys_log` VALUES (12007, 163, 'wanping', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:37:16');
INSERT INTO `sys_log` VALUES (12008, 1, 'admin', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:38:19');
INSERT INTO `sys_log` VALUES (12009, 1, 'admin', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:38:19');
INSERT INTO `sys_log` VALUES (12010, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/407542/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 18:38:40');
INSERT INTO `sys_log` VALUES (12011, 163, 'wanping', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:39:11');
INSERT INTO `sys_log` VALUES (12012, 163, 'wanping', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:39:11');
INSERT INTO `sys_log` VALUES (12013, 1, 'admin', '登录', 44, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:51:08');
INSERT INTO `sys_log` VALUES (12014, 1, 'admin', '请求访问主页', 40, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:51:08');
INSERT INTO `sys_log` VALUES (12015, 1, 'admin', '请求访问主页', 30, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:51:24');
INSERT INTO `sys_log` VALUES (12016, 1, 'admin', '请求访问主页', 23, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:51:54');
INSERT INTO `sys_log` VALUES (12017, 163, 'wanping', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:52:22');
INSERT INTO `sys_log` VALUES (12018, 163, 'wanping', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:52:22');
INSERT INTO `sys_log` VALUES (12019, 169, 'yulan', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:53:11');
INSERT INTO `sys_log` VALUES (12020, 169, 'yulan', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:53:11');
INSERT INTO `sys_log` VALUES (12021, 171, 'wujing', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:53:41');
INSERT INTO `sys_log` VALUES (12022, 171, 'wujing', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:53:41');
INSERT INTO `sys_log` VALUES (12023, 166, 'zhangjiakuan', '登录', 27, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:54:15');
INSERT INTO `sys_log` VALUES (12024, 166, 'zhangjiakuan', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:54:15');
INSERT INTO `sys_log` VALUES (12025, 1, 'admin', '登录', 38, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:57:25');
INSERT INTO `sys_log` VALUES (12026, 1, 'admin', '请求访问主页', 31, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:57:26');
INSERT INTO `sys_log` VALUES (12027, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/410005/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 18:57:55');
INSERT INTO `sys_log` VALUES (12028, 163, 'wanping', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 18:58:30');
INSERT INTO `sys_log` VALUES (12029, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 18:58:30');
INSERT INTO `sys_log` VALUES (12030, 169, 'yulan', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:01:13');
INSERT INTO `sys_log` VALUES (12031, 169, 'yulan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:01:13');
INSERT INTO `sys_log` VALUES (12032, 171, 'wujing', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:02:24');
INSERT INTO `sys_log` VALUES (12033, 171, 'wujing', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:02:24');
INSERT INTO `sys_log` VALUES (12034, 166, 'zhangjiakuan', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:03:36');
INSERT INTO `sys_log` VALUES (12035, 166, 'zhangjiakuan', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:03:36');
INSERT INTO `sys_log` VALUES (12036, 1, 'admin', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:05:28');
INSERT INTO `sys_log` VALUES (12037, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:05:28');
INSERT INTO `sys_log` VALUES (12038, 163, 'wanping', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:09:18');
INSERT INTO `sys_log` VALUES (12039, 163, 'wanping', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:09:18');
INSERT INTO `sys_log` VALUES (12040, 169, 'yulan', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:09:33');
INSERT INTO `sys_log` VALUES (12041, 169, 'yulan', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:09:33');
INSERT INTO `sys_log` VALUES (12042, 171, 'wujing', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:09:45');
INSERT INTO `sys_log` VALUES (12043, 171, 'wujing', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:09:45');
INSERT INTO `sys_log` VALUES (12044, 166, 'zhangjiakuan', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:11:53');
INSERT INTO `sys_log` VALUES (12045, 166, 'zhangjiakuan', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:11:53');
INSERT INTO `sys_log` VALUES (12046, 1, 'admin', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:13:21');
INSERT INTO `sys_log` VALUES (12047, 1, 'admin', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:13:21');
INSERT INTO `sys_log` VALUES (12048, 1, 'admin', '请求访问主页', 61, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:20:58');
INSERT INTO `sys_log` VALUES (12049, 166, 'zhangjiakuan', '登录', 41, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:21:12');
INSERT INTO `sys_log` VALUES (12050, 166, 'zhangjiakuan', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:21:12');
INSERT INTO `sys_log` VALUES (12051, 166, 'zhangjiakuan', '请求访问主页', 35, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:24:31');
INSERT INTO `sys_log` VALUES (12052, 1, 'admin', '登录', 30, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:25:53');
INSERT INTO `sys_log` VALUES (12053, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:25:53');
INSERT INTO `sys_log` VALUES (12054, 1, 'admin', '登录', 37, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:29:52');
INSERT INTO `sys_log` VALUES (12055, 1, 'admin', '请求访问主页', 21, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:29:52');
INSERT INTO `sys_log` VALUES (12056, 163, 'wanping', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:30:18');
INSERT INTO `sys_log` VALUES (12057, 163, 'wanping', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:30:18');
INSERT INTO `sys_log` VALUES (12058, 169, 'yulan', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:30:51');
INSERT INTO `sys_log` VALUES (12059, 169, 'yulan', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:30:51');
INSERT INTO `sys_log` VALUES (12060, 171, 'wujing', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:31:06');
INSERT INTO `sys_log` VALUES (12061, 171, 'wujing', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:31:06');
INSERT INTO `sys_log` VALUES (12062, 166, 'zhangjiakuan', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:32:28');
INSERT INTO `sys_log` VALUES (12063, 166, 'zhangjiakuan', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:32:28');
INSERT INTO `sys_log` VALUES (12064, 166, 'zhangjiakuan', 'error', NULL, 'http://localhost:8080/act/cgrk/update', 'org.springframework.transaction.UnexpectedRollbackException: Transaction rolled back because it has been marked as rollback-only', NULL, '2019-05-20 19:35:06');
INSERT INTO `sys_log` VALUES (12065, 1, 'admin', '登录', 41, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:37:39');
INSERT INTO `sys_log` VALUES (12066, 1, 'admin', '请求访问主页', 24, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:37:39');
INSERT INTO `sys_log` VALUES (12067, 1, 'admin', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:37:42');
INSERT INTO `sys_log` VALUES (12068, 163, 'wanping', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:38:37');
INSERT INTO `sys_log` VALUES (12069, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:38:37');
INSERT INTO `sys_log` VALUES (12070, 169, 'yulan', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:39:08');
INSERT INTO `sys_log` VALUES (12071, 169, 'yulan', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:39:08');
INSERT INTO `sys_log` VALUES (12072, 171, 'wujing', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:39:22');
INSERT INTO `sys_log` VALUES (12073, 171, 'wujing', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:39:22');
INSERT INTO `sys_log` VALUES (12074, 166, 'zhangjiakuan', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:39:50');
INSERT INTO `sys_log` VALUES (12075, 166, 'zhangjiakuan', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:39:51');
INSERT INTO `sys_log` VALUES (12076, 166, 'zhangjiakuan', '请求访问主页', 59, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:40:47');
INSERT INTO `sys_log` VALUES (12077, 1, 'admin', '登录', 57, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:45:26');
INSERT INTO `sys_log` VALUES (12078, 1, 'admin', '请求访问主页', 35, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:45:26');
INSERT INTO `sys_log` VALUES (12079, 163, 'wanping', '登录', 39, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:45:55');
INSERT INTO `sys_log` VALUES (12080, 163, 'wanping', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:45:55');
INSERT INTO `sys_log` VALUES (12081, 163, 'wanping', 'error', NULL, 'http://localhost:8080/act/cgrk/update', 'org.springframework.transaction.UnexpectedRollbackException: Transaction rolled back because it has been marked as rollback-only', NULL, '2019-05-20 19:47:39');
INSERT INTO `sys_log` VALUES (12082, 163, 'wanping', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:51:17');
INSERT INTO `sys_log` VALUES (12083, 1, 'admin', '登录', 33, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:51:22');
INSERT INTO `sys_log` VALUES (12084, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:51:22');
INSERT INTO `sys_log` VALUES (12085, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/422525/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-20 19:52:53');
INSERT INTO `sys_log` VALUES (12086, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:53:26');
INSERT INTO `sys_log` VALUES (12087, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:53:41');
INSERT INTO `sys_log` VALUES (12088, 171, 'wujing', '登录', 28, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:55:29');
INSERT INTO `sys_log` VALUES (12089, 171, 'wujing', '请求访问主页', 20, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:55:29');
INSERT INTO `sys_log` VALUES (12090, 171, 'wujing', '请求访问主页', 48, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:58:55');
INSERT INTO `sys_log` VALUES (12091, 169, 'yulan', '登录', 45, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 19:59:36');
INSERT INTO `sys_log` VALUES (12092, 169, 'yulan', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 19:59:36');
INSERT INTO `sys_log` VALUES (12093, 163, 'wanping', '登录', 36, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:00:40');
INSERT INTO `sys_log` VALUES (12094, 163, 'wanping', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:00:40');
INSERT INTO `sys_log` VALUES (12095, 171, 'wujing', '登录', 19, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:01:35');
INSERT INTO `sys_log` VALUES (12096, 171, 'wujing', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:01:35');
INSERT INTO `sys_log` VALUES (12097, 169, 'yulan', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:01:50');
INSERT INTO `sys_log` VALUES (12098, 169, 'yulan', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:01:50');
INSERT INTO `sys_log` VALUES (12099, 171, 'wujing', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:02:04');
INSERT INTO `sys_log` VALUES (12100, 171, 'wujing', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:02:04');
INSERT INTO `sys_log` VALUES (12101, 166, 'zhangjiakuan', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:02:23');
INSERT INTO `sys_log` VALUES (12102, 166, 'zhangjiakuan', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:02:24');
INSERT INTO `sys_log` VALUES (12103, 1, 'admin', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:03:17');
INSERT INTO `sys_log` VALUES (12104, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:03:17');
INSERT INTO `sys_log` VALUES (12105, NULL, NULL, '登录', 13, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:03:47');
INSERT INTO `sys_log` VALUES (12106, NULL, NULL, '登录', 9, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:03:53');
INSERT INTO `sys_log` VALUES (12107, NULL, NULL, '登录', 6, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:04:02');
INSERT INTO `sys_log` VALUES (12108, 163, 'wanping', '登录', 30, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:04:10');
INSERT INTO `sys_log` VALUES (12109, 163, 'wanping', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:04:10');
INSERT INTO `sys_log` VALUES (12110, 169, 'yulan', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:04:46');
INSERT INTO `sys_log` VALUES (12111, 169, 'yulan', '请求访问主页', 8, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:04:46');
INSERT INTO `sys_log` VALUES (12112, 171, 'wujing', '登录', 21, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:09:00');
INSERT INTO `sys_log` VALUES (12113, 171, 'wujing', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:09:00');
INSERT INTO `sys_log` VALUES (12114, 1, 'admin', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-20 20:09:08');
INSERT INTO `sys_log` VALUES (12115, 1, 'admin', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-20 20:09:08');
INSERT INTO `sys_log` VALUES (12116, 1, 'admin', '登录', 76, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 08:55:03');
INSERT INTO `sys_log` VALUES (12117, 1, 'admin', '请求访问主页', 48, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 08:55:04');
INSERT INTO `sys_log` VALUES (12118, 1, 'admin', '请求访问主页', 21, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 08:55:42');
INSERT INTO `sys_log` VALUES (12119, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/427505/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-21 08:56:09');
INSERT INTO `sys_log` VALUES (12120, 1, 'admin', '请求访问主页', 23, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 08:56:40');
INSERT INTO `sys_log` VALUES (12121, 162, 'wangyi', '登录', 33, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:22:06');
INSERT INTO `sys_log` VALUES (12122, 162, 'wangyi', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:22:06');
INSERT INTO `sys_log` VALUES (12123, 168, 'wangyili', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:22:37');
INSERT INTO `sys_log` VALUES (12124, 168, 'wangyili', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:22:37');
INSERT INTO `sys_log` VALUES (12125, 167, 'liying', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:23:03');
INSERT INTO `sys_log` VALUES (12126, 167, 'liying', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:23:03');
INSERT INTO `sys_log` VALUES (12127, 163, 'wanping', '登录', 24, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:23:25');
INSERT INTO `sys_log` VALUES (12128, 163, 'wanping', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:23:25');
INSERT INTO `sys_log` VALUES (12129, 1, 'admin', '登录', 25, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:23:39');
INSERT INTO `sys_log` VALUES (12130, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:23:39');
INSERT INTO `sys_log` VALUES (12131, 1, 'admin', '编辑用户', 13, 'com.wjystem.controller.UserController.edit()', NULL, '127.0.0.1', '2019-05-21 09:23:53');
INSERT INTO `sys_log` VALUES (12132, 1, 'admin', '编辑角色', 3, 'com.wjystem.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-05-21 09:24:00');
INSERT INTO `sys_log` VALUES (12133, 1, 'admin', '更新角色', 107, 'com.wjystem.controller.RoleController.update()', NULL, '127.0.0.1', '2019-05-21 09:24:54');
INSERT INTO `sys_log` VALUES (12134, 1, 'admin', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:28:15');
INSERT INTO `sys_log` VALUES (12135, 162, 'wangyi', '登录', 17, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:29:17');
INSERT INTO `sys_log` VALUES (12136, 162, 'wangyi', '请求访问主页', 11, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:29:17');
INSERT INTO `sys_log` VALUES (12137, 168, 'wangyili', '登录', 15, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:29:54');
INSERT INTO `sys_log` VALUES (12138, 168, 'wangyili', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:29:54');
INSERT INTO `sys_log` VALUES (12139, 1, 'admin', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:30:07');
INSERT INTO `sys_log` VALUES (12140, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:30:07');
INSERT INTO `sys_log` VALUES (12141, 162, 'wangyi', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:30:50');
INSERT INTO `sys_log` VALUES (12142, 162, 'wangyi', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:30:50');
INSERT INTO `sys_log` VALUES (12143, 168, 'wangyili', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:31:05');
INSERT INTO `sys_log` VALUES (12144, 168, 'wangyili', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:31:05');
INSERT INTO `sys_log` VALUES (12145, 167, 'liying', '登录', 20, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:31:23');
INSERT INTO `sys_log` VALUES (12146, 167, 'liying', '请求访问主页', 9, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:31:23');
INSERT INTO `sys_log` VALUES (12147, 1, 'admin', '登录', 22, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:31:39');
INSERT INTO `sys_log` VALUES (12148, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:31:39');
INSERT INTO `sys_log` VALUES (12149, 1, 'admin', '请求访问主页', 52, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:35:07');
INSERT INTO `sys_log` VALUES (12150, 162, 'wangyi', '登录', 30, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:36:04');
INSERT INTO `sys_log` VALUES (12151, 162, 'wangyi', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:36:04');
INSERT INTO `sys_log` VALUES (12152, 167, 'liying', '登录', 26, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:36:24');
INSERT INTO `sys_log` VALUES (12153, 167, 'liying', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:36:24');
INSERT INTO `sys_log` VALUES (12154, 168, 'wangyili', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:36:41');
INSERT INTO `sys_log` VALUES (12155, 168, 'wangyili', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:36:41');
INSERT INTO `sys_log` VALUES (12156, 1, 'admin', '登录', 23, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 09:36:56');
INSERT INTO `sys_log` VALUES (12157, 1, 'admin', '请求访问主页', 17, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:36:56');
INSERT INTO `sys_log` VALUES (12158, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:37:13');
INSERT INTO `sys_log` VALUES (12159, 1, 'admin', '请求访问主页', 26, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:38:23');
INSERT INTO `sys_log` VALUES (12160, 1, 'admin', '请求访问主页', 17, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:39:19');
INSERT INTO `sys_log` VALUES (12161, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:39:25');
INSERT INTO `sys_log` VALUES (12162, 1, 'admin', '请求访问主页', 15, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 09:39:55');
INSERT INTO `sys_log` VALUES (12163, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/430037/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-21 09:53:40');
INSERT INTO `sys_log` VALUES (12164, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/deploy/430037', 'org.activiti.bpmn.exceptions.XMLException: cvc-id.2: There are multiple occurrences of ID value \'sjgly\'.', NULL, '2019-05-21 09:54:32');
INSERT INTO `sys_log` VALUES (12165, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/430029/save', 'org.activiti.engine.ActivitiException: Error saving model', NULL, '2019-05-21 09:56:39');
INSERT INTO `sys_log` VALUES (12166, 1, 'admin', 'error', NULL, 'http://localhost:8080/activiti/model/deploy/430037', 'org.activiti.bpmn.exceptions.XMLException: cvc-id.2: There are multiple occurrences of ID value \'sjgly\'.', NULL, '2019-05-21 09:58:08');
INSERT INTO `sys_log` VALUES (12167, 1, 'admin', '请求访问主页', 32, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 10:04:27');
INSERT INTO `sys_log` VALUES (12168, 162, 'wangyi', '登录', 18, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-05-21 10:05:22');
INSERT INTO `sys_log` VALUES (12169, 162, 'wangyi', '请求访问主页', 10, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-05-21 10:05:22');
INSERT INTO `sys_log` VALUES (12170, 1, 'admin', '登录', 106, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-07-02 11:16:05');
INSERT INTO `sys_log` VALUES (12171, 1, 'admin', '请求访问主页', 36, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:16:05');
INSERT INTO `sys_log` VALUES (12172, 1, 'admin', '删除菜单', 21, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:14');
INSERT INTO `sys_log` VALUES (12173, 1, 'admin', '删除菜单', 38, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:21');
INSERT INTO `sys_log` VALUES (12174, 1, 'admin', '删除菜单', 28, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:24');
INSERT INTO `sys_log` VALUES (12175, 1, 'admin', '删除菜单', 20, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:27');
INSERT INTO `sys_log` VALUES (12176, 1, 'admin', '删除菜单', 27, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:31');
INSERT INTO `sys_log` VALUES (12177, 1, 'admin', '删除菜单', 34, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:37');
INSERT INTO `sys_log` VALUES (12178, 1, 'admin', '删除菜单', 34, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:41');
INSERT INTO `sys_log` VALUES (12179, 1, 'admin', '删除菜单', 35, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:43');
INSERT INTO `sys_log` VALUES (12180, 1, 'admin', '删除菜单', 28, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:47');
INSERT INTO `sys_log` VALUES (12181, 1, 'admin', '删除菜单', 31, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:49');
INSERT INTO `sys_log` VALUES (12182, 1, 'admin', '删除菜单', 45, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:52');
INSERT INTO `sys_log` VALUES (12183, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:54');
INSERT INTO `sys_log` VALUES (12184, 1, 'admin', '删除菜单', 27, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:57');
INSERT INTO `sys_log` VALUES (12185, 1, 'admin', '删除菜单', 29, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:16:59');
INSERT INTO `sys_log` VALUES (12186, 1, 'admin', '删除菜单', 27, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:02');
INSERT INTO `sys_log` VALUES (12187, 1, 'admin', '删除菜单', 40, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:04');
INSERT INTO `sys_log` VALUES (12188, 1, 'admin', '删除菜单', 30, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:07');
INSERT INTO `sys_log` VALUES (12189, 1, 'admin', '删除菜单', 21, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:12');
INSERT INTO `sys_log` VALUES (12190, 1, 'admin', '删除菜单', 36, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:18');
INSERT INTO `sys_log` VALUES (12191, 1, 'admin', '删除菜单', 32, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:22');
INSERT INTO `sys_log` VALUES (12192, 1, 'admin', '删除菜单', 33, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:26');
INSERT INTO `sys_log` VALUES (12193, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:29');
INSERT INTO `sys_log` VALUES (12194, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:34');
INSERT INTO `sys_log` VALUES (12195, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:38');
INSERT INTO `sys_log` VALUES (12196, 1, 'admin', '删除菜单', 26, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:41');
INSERT INTO `sys_log` VALUES (12197, 1, 'admin', '删除菜单', 68, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:45');
INSERT INTO `sys_log` VALUES (12198, 1, 'admin', '删除菜单', 39, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:50');
INSERT INTO `sys_log` VALUES (12199, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:53');
INSERT INTO `sys_log` VALUES (12200, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:17:56');
INSERT INTO `sys_log` VALUES (12201, 1, 'admin', '删除菜单', 33, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:00');
INSERT INTO `sys_log` VALUES (12202, 1, 'admin', '删除菜单', 48, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:03');
INSERT INTO `sys_log` VALUES (12203, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:07');
INSERT INTO `sys_log` VALUES (12204, 1, 'admin', '删除菜单', 19, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:09');
INSERT INTO `sys_log` VALUES (12205, 1, 'admin', '删除菜单', 29, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:13');
INSERT INTO `sys_log` VALUES (12206, 1, 'admin', '删除菜单', 50, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:16');
INSERT INTO `sys_log` VALUES (12207, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:18');
INSERT INTO `sys_log` VALUES (12208, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:21');
INSERT INTO `sys_log` VALUES (12209, 1, 'admin', '删除菜单', 25, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:26');
INSERT INTO `sys_log` VALUES (12210, 1, 'admin', '删除菜单', 19, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:31');
INSERT INTO `sys_log` VALUES (12211, 1, 'admin', '删除菜单', 54, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:36');
INSERT INTO `sys_log` VALUES (12212, 1, 'admin', '删除菜单', 29, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:40');
INSERT INTO `sys_log` VALUES (12213, 1, 'admin', '删除菜单', 28, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:43');
INSERT INTO `sys_log` VALUES (12214, 1, 'admin', '删除菜单', 36, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:47');
INSERT INTO `sys_log` VALUES (12215, 1, 'admin', '删除菜单', 48, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:52');
INSERT INTO `sys_log` VALUES (12216, 1, 'admin', '删除菜单', 26, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:54');
INSERT INTO `sys_log` VALUES (12217, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:56');
INSERT INTO `sys_log` VALUES (12218, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:18:58');
INSERT INTO `sys_log` VALUES (12219, 1, 'admin', '删除菜单', 61, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:06');
INSERT INTO `sys_log` VALUES (12220, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:09');
INSERT INTO `sys_log` VALUES (12221, 1, 'admin', '删除菜单', 20, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:11');
INSERT INTO `sys_log` VALUES (12222, 1, 'admin', '删除菜单', 29, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:14');
INSERT INTO `sys_log` VALUES (12223, 1, 'admin', '删除菜单', 23, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:16');
INSERT INTO `sys_log` VALUES (12224, 1, 'admin', '删除菜单', 21, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:19');
INSERT INTO `sys_log` VALUES (12225, 1, 'admin', '删除菜单', 16, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:21');
INSERT INTO `sys_log` VALUES (12226, 1, 'admin', '删除菜单', 47, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:23');
INSERT INTO `sys_log` VALUES (12227, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:26');
INSERT INTO `sys_log` VALUES (12228, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:28');
INSERT INTO `sys_log` VALUES (12229, 1, 'admin', '删除菜单', 17, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:30');
INSERT INTO `sys_log` VALUES (12230, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:32');
INSERT INTO `sys_log` VALUES (12231, 1, 'admin', '删除菜单', 21, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:34');
INSERT INTO `sys_log` VALUES (12232, 1, 'admin', '删除菜单', 38, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:36');
INSERT INTO `sys_log` VALUES (12233, 1, 'admin', '删除菜单', 49, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:38');
INSERT INTO `sys_log` VALUES (12234, 1, 'admin', '删除菜单', 61, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:47');
INSERT INTO `sys_log` VALUES (12235, 1, 'admin', '删除菜单', 28, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:51');
INSERT INTO `sys_log` VALUES (12236, 1, 'admin', '删除菜单', 33, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:53');
INSERT INTO `sys_log` VALUES (12237, 1, 'admin', '删除菜单', 26, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:55');
INSERT INTO `sys_log` VALUES (12238, 1, 'admin', '删除菜单', 35, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:57');
INSERT INTO `sys_log` VALUES (12239, 1, 'admin', '删除菜单', 25, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:19:59');
INSERT INTO `sys_log` VALUES (12240, 1, 'admin', '删除菜单', 17, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:20:03');
INSERT INTO `sys_log` VALUES (12241, 1, 'admin', '删除菜单', 20, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:20:11');
INSERT INTO `sys_log` VALUES (12242, 1, 'admin', '删除菜单', 22, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:20:15');
INSERT INTO `sys_log` VALUES (12243, 1, 'admin', '删除菜单', 42, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:20:19');
INSERT INTO `sys_log` VALUES (12244, 1, 'admin', '删除菜单', 24, 'com.wjystem.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-07-02 11:20:22');
INSERT INTO `sys_log` VALUES (12245, 1, 'admin', '登录', 30, 'com.wjystem.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-07-02 11:20:59');
INSERT INTO `sys_log` VALUES (12246, 1, 'admin', '请求访问主页', 14, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:20:59');
INSERT INTO `sys_log` VALUES (12247, 1, 'admin', '请求访问主页', 28, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:23:02');
INSERT INTO `sys_log` VALUES (12248, 1, 'admin', '请求访问主页', 16, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:24:38');
INSERT INTO `sys_log` VALUES (12249, 1, 'admin', '请求访问主页', 18, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:25:09');
INSERT INTO `sys_log` VALUES (12250, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:25:42');
INSERT INTO `sys_log` VALUES (12251, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:26:11');
INSERT INTO `sys_log` VALUES (12252, 1, 'admin', '请求访问主页', 22, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:26:39');
INSERT INTO `sys_log` VALUES (12253, 1, 'admin', '请求访问主页', 12, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:27:18');
INSERT INTO `sys_log` VALUES (12254, 1, 'admin', '请求访问主页', 13, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:27:56');
INSERT INTO `sys_log` VALUES (12255, 1, 'admin', '请求访问主页', 21, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:28:28');
INSERT INTO `sys_log` VALUES (12256, 1, 'admin', '请求访问主页', 79, 'com.wjystem.controller.LoginController.index()', NULL, '127.0.0.1', '2019-07-02 11:42:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '基础管理', '', '', 0, 'fa fa-bars', 0, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 1, '数据字典', '/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (97, 0, '图表管理', '', '', 0, 'fa fa-bar-chart', 7, NULL, NULL);
INSERT INTO `sys_menu` VALUES (98, 97, '百度chart', '/chart/graph_echarts.html', '', 1, 'fa fa-area-chart', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'cjgly', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (59, '普通用户', 'ptyh', '基本用户权限', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (60, '内业组长', 'zyzz', '内业组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (61, '内业组员', 'zyzy', '内业组员', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (62, '质检组长', 'zjzz', '质检组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (63, '质检组员', 'zjzy', '质检组员', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (64, '部检组长', 'bjzz', '部检组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (65, '部检组员', 'bjzy', '部检组员', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (66, '审计组长', 'sjzz', '审计组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (67, '审计组员', 'sjzy', '审计组员', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (70, '数据管理员', 'sjgly', '运维部', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (71, '质量组长', 'zlzz', '质量组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (73, '质量组员', 'zlzy', '质量组员', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (74, '项目管理', 'xmgl', '项目管理', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (75, '项目经理', 'xmjl', '项目经理', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (76, '外业组长', 'wyzz', '外业组长', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (77, '外业组员', 'wyzy', '外业组员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15641 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (3731, 68, 97);
INSERT INTO `sys_role_menu` VALUES (3732, 68, 98);
INSERT INTO `sys_role_menu` VALUES (3733, 68, -1);
INSERT INTO `sys_role_menu` VALUES (15207, 70, 134);
INSERT INTO `sys_role_menu` VALUES (15208, 70, 213);
INSERT INTO `sys_role_menu` VALUES (15209, 70, 194);
INSERT INTO `sys_role_menu` VALUES (15210, 70, 193);
INSERT INTO `sys_role_menu` VALUES (15211, 70, 212);
INSERT INTO `sys_role_menu` VALUES (15212, 70, 211);
INSERT INTO `sys_role_menu` VALUES (15213, 70, 209);
INSERT INTO `sys_role_menu` VALUES (15214, 70, 208);
INSERT INTO `sys_role_menu` VALUES (15215, 70, 207);
INSERT INTO `sys_role_menu` VALUES (15216, 70, 206);
INSERT INTO `sys_role_menu` VALUES (15217, 70, 183);
INSERT INTO `sys_role_menu` VALUES (15218, 70, 182);
INSERT INTO `sys_role_menu` VALUES (15219, 70, 181);
INSERT INTO `sys_role_menu` VALUES (15220, 70, 210);
INSERT INTO `sys_role_menu` VALUES (15221, 70, 166);
INSERT INTO `sys_role_menu` VALUES (15222, 70, 156);
INSERT INTO `sys_role_menu` VALUES (15223, 70, 155);
INSERT INTO `sys_role_menu` VALUES (15224, 70, 133);
INSERT INTO `sys_role_menu` VALUES (15225, 70, 184);
INSERT INTO `sys_role_menu` VALUES (15226, 70, 175);
INSERT INTO `sys_role_menu` VALUES (15227, 70, 174);
INSERT INTO `sys_role_menu` VALUES (15228, 70, 159);
INSERT INTO `sys_role_menu` VALUES (15229, 70, 214);
INSERT INTO `sys_role_menu` VALUES (15230, 70, 205);
INSERT INTO `sys_role_menu` VALUES (15231, 70, 138);
INSERT INTO `sys_role_menu` VALUES (15232, 70, 139);
INSERT INTO `sys_role_menu` VALUES (15233, 70, 140);
INSERT INTO `sys_role_menu` VALUES (15234, 70, 141);
INSERT INTO `sys_role_menu` VALUES (15235, 70, 153);
INSERT INTO `sys_role_menu` VALUES (15236, 70, 198);
INSERT INTO `sys_role_menu` VALUES (15237, 70, 196);
INSERT INTO `sys_role_menu` VALUES (15238, 70, 137);
INSERT INTO `sys_role_menu` VALUES (15239, 70, -1);
INSERT INTO `sys_role_menu` VALUES (15240, 70, 132);
INSERT INTO `sys_role_menu` VALUES (15266, 59, 153);
INSERT INTO `sys_role_menu` VALUES (15267, 59, 141);
INSERT INTO `sys_role_menu` VALUES (15268, 59, 140);
INSERT INTO `sys_role_menu` VALUES (15269, 59, 139);
INSERT INTO `sys_role_menu` VALUES (15270, 59, 136);
INSERT INTO `sys_role_menu` VALUES (15271, 59, -1);
INSERT INTO `sys_role_menu` VALUES (15272, 59, 132);
INSERT INTO `sys_role_menu` VALUES (15285, 62, 153);
INSERT INTO `sys_role_menu` VALUES (15286, 62, 141);
INSERT INTO `sys_role_menu` VALUES (15287, 62, 140);
INSERT INTO `sys_role_menu` VALUES (15288, 62, 139);
INSERT INTO `sys_role_menu` VALUES (15289, 62, 205);
INSERT INTO `sys_role_menu` VALUES (15290, 62, 198);
INSERT INTO `sys_role_menu` VALUES (15291, 62, 136);
INSERT INTO `sys_role_menu` VALUES (15292, 62, 121);
INSERT INTO `sys_role_menu` VALUES (15293, 62, 120);
INSERT INTO `sys_role_menu` VALUES (15294, 62, -1);
INSERT INTO `sys_role_menu` VALUES (15295, 62, 132);
INSERT INTO `sys_role_menu` VALUES (15296, 62, 138);
INSERT INTO `sys_role_menu` VALUES (15297, 62, 137);
INSERT INTO `sys_role_menu` VALUES (15298, 62, 93);
INSERT INTO `sys_role_menu` VALUES (15299, 63, 153);
INSERT INTO `sys_role_menu` VALUES (15300, 63, 141);
INSERT INTO `sys_role_menu` VALUES (15301, 63, 140);
INSERT INTO `sys_role_menu` VALUES (15302, 63, 139);
INSERT INTO `sys_role_menu` VALUES (15303, 63, 136);
INSERT INTO `sys_role_menu` VALUES (15304, 63, 205);
INSERT INTO `sys_role_menu` VALUES (15305, 63, -1);
INSERT INTO `sys_role_menu` VALUES (15306, 63, 132);
INSERT INTO `sys_role_menu` VALUES (15307, 63, 138);
INSERT INTO `sys_role_menu` VALUES (15308, 61, 153);
INSERT INTO `sys_role_menu` VALUES (15309, 61, 141);
INSERT INTO `sys_role_menu` VALUES (15310, 61, 140);
INSERT INTO `sys_role_menu` VALUES (15311, 61, 139);
INSERT INTO `sys_role_menu` VALUES (15312, 61, 205);
INSERT INTO `sys_role_menu` VALUES (15313, 61, 136);
INSERT INTO `sys_role_menu` VALUES (15314, 61, 121);
INSERT INTO `sys_role_menu` VALUES (15315, 61, 120);
INSERT INTO `sys_role_menu` VALUES (15316, 61, -1);
INSERT INTO `sys_role_menu` VALUES (15317, 61, 132);
INSERT INTO `sys_role_menu` VALUES (15318, 61, 138);
INSERT INTO `sys_role_menu` VALUES (15319, 61, 93);
INSERT INTO `sys_role_menu` VALUES (15441, 60, 153);
INSERT INTO `sys_role_menu` VALUES (15442, 60, 141);
INSERT INTO `sys_role_menu` VALUES (15443, 60, 140);
INSERT INTO `sys_role_menu` VALUES (15444, 60, 139);
INSERT INTO `sys_role_menu` VALUES (15445, 60, 205);
INSERT INTO `sys_role_menu` VALUES (15446, 60, 198);
INSERT INTO `sys_role_menu` VALUES (15447, 60, 136);
INSERT INTO `sys_role_menu` VALUES (15448, 60, 121);
INSERT INTO `sys_role_menu` VALUES (15449, 60, 120);
INSERT INTO `sys_role_menu` VALUES (15450, 60, -1);
INSERT INTO `sys_role_menu` VALUES (15451, 60, 132);
INSERT INTO `sys_role_menu` VALUES (15452, 60, 138);
INSERT INTO `sys_role_menu` VALUES (15453, 60, 137);
INSERT INTO `sys_role_menu` VALUES (15454, 60, 93);
INSERT INTO `sys_role_menu` VALUES (15455, 64, 153);
INSERT INTO `sys_role_menu` VALUES (15456, 64, 141);
INSERT INTO `sys_role_menu` VALUES (15457, 64, 140);
INSERT INTO `sys_role_menu` VALUES (15458, 64, 139);
INSERT INTO `sys_role_menu` VALUES (15459, 64, 205);
INSERT INTO `sys_role_menu` VALUES (15460, 64, 198);
INSERT INTO `sys_role_menu` VALUES (15461, 64, 196);
INSERT INTO `sys_role_menu` VALUES (15462, 64, 136);
INSERT INTO `sys_role_menu` VALUES (15463, 64, 137);
INSERT INTO `sys_role_menu` VALUES (15464, 64, -1);
INSERT INTO `sys_role_menu` VALUES (15465, 64, 132);
INSERT INTO `sys_role_menu` VALUES (15466, 64, 138);
INSERT INTO `sys_role_menu` VALUES (15467, 65, 153);
INSERT INTO `sys_role_menu` VALUES (15468, 65, 141);
INSERT INTO `sys_role_menu` VALUES (15469, 65, 140);
INSERT INTO `sys_role_menu` VALUES (15470, 65, 139);
INSERT INTO `sys_role_menu` VALUES (15471, 65, 205);
INSERT INTO `sys_role_menu` VALUES (15472, 65, 198);
INSERT INTO `sys_role_menu` VALUES (15473, 65, 196);
INSERT INTO `sys_role_menu` VALUES (15474, 65, 136);
INSERT INTO `sys_role_menu` VALUES (15475, 65, 137);
INSERT INTO `sys_role_menu` VALUES (15476, 65, -1);
INSERT INTO `sys_role_menu` VALUES (15477, 65, 132);
INSERT INTO `sys_role_menu` VALUES (15478, 65, 138);
INSERT INTO `sys_role_menu` VALUES (15479, 71, 153);
INSERT INTO `sys_role_menu` VALUES (15480, 71, 141);
INSERT INTO `sys_role_menu` VALUES (15481, 71, 140);
INSERT INTO `sys_role_menu` VALUES (15482, 71, 139);
INSERT INTO `sys_role_menu` VALUES (15483, 71, 205);
INSERT INTO `sys_role_menu` VALUES (15484, 71, 198);
INSERT INTO `sys_role_menu` VALUES (15485, 71, 196);
INSERT INTO `sys_role_menu` VALUES (15486, 71, 136);
INSERT INTO `sys_role_menu` VALUES (15487, 71, 137);
INSERT INTO `sys_role_menu` VALUES (15488, 71, -1);
INSERT INTO `sys_role_menu` VALUES (15489, 71, 132);
INSERT INTO `sys_role_menu` VALUES (15490, 71, 138);
INSERT INTO `sys_role_menu` VALUES (15491, 73, 153);
INSERT INTO `sys_role_menu` VALUES (15492, 73, 141);
INSERT INTO `sys_role_menu` VALUES (15493, 73, 140);
INSERT INTO `sys_role_menu` VALUES (15494, 73, 139);
INSERT INTO `sys_role_menu` VALUES (15495, 73, 205);
INSERT INTO `sys_role_menu` VALUES (15496, 73, 198);
INSERT INTO `sys_role_menu` VALUES (15497, 73, 196);
INSERT INTO `sys_role_menu` VALUES (15498, 73, 136);
INSERT INTO `sys_role_menu` VALUES (15499, 73, 137);
INSERT INTO `sys_role_menu` VALUES (15500, 73, -1);
INSERT INTO `sys_role_menu` VALUES (15501, 73, 132);
INSERT INTO `sys_role_menu` VALUES (15502, 73, 138);
INSERT INTO `sys_role_menu` VALUES (15503, 74, 153);
INSERT INTO `sys_role_menu` VALUES (15504, 74, 141);
INSERT INTO `sys_role_menu` VALUES (15505, 74, 140);
INSERT INTO `sys_role_menu` VALUES (15506, 74, 139);
INSERT INTO `sys_role_menu` VALUES (15507, 74, 205);
INSERT INTO `sys_role_menu` VALUES (15508, 74, 198);
INSERT INTO `sys_role_menu` VALUES (15509, 74, 196);
INSERT INTO `sys_role_menu` VALUES (15510, 74, 136);
INSERT INTO `sys_role_menu` VALUES (15511, 74, 137);
INSERT INTO `sys_role_menu` VALUES (15512, 74, -1);
INSERT INTO `sys_role_menu` VALUES (15513, 74, 132);
INSERT INTO `sys_role_menu` VALUES (15514, 74, 138);
INSERT INTO `sys_role_menu` VALUES (15515, 75, 153);
INSERT INTO `sys_role_menu` VALUES (15516, 75, 141);
INSERT INTO `sys_role_menu` VALUES (15517, 75, 140);
INSERT INTO `sys_role_menu` VALUES (15518, 75, 139);
INSERT INTO `sys_role_menu` VALUES (15519, 75, 205);
INSERT INTO `sys_role_menu` VALUES (15520, 75, 198);
INSERT INTO `sys_role_menu` VALUES (15521, 75, 196);
INSERT INTO `sys_role_menu` VALUES (15522, 75, 136);
INSERT INTO `sys_role_menu` VALUES (15523, 75, 137);
INSERT INTO `sys_role_menu` VALUES (15524, 75, -1);
INSERT INTO `sys_role_menu` VALUES (15525, 75, 132);
INSERT INTO `sys_role_menu` VALUES (15526, 75, 138);
INSERT INTO `sys_role_menu` VALUES (15527, 76, 141);
INSERT INTO `sys_role_menu` VALUES (15528, 76, 140);
INSERT INTO `sys_role_menu` VALUES (15529, 76, 139);
INSERT INTO `sys_role_menu` VALUES (15530, 76, 205);
INSERT INTO `sys_role_menu` VALUES (15531, 76, 198);
INSERT INTO `sys_role_menu` VALUES (15532, 76, 196);
INSERT INTO `sys_role_menu` VALUES (15533, 76, 136);
INSERT INTO `sys_role_menu` VALUES (15534, 76, 137);
INSERT INTO `sys_role_menu` VALUES (15535, 76, -1);
INSERT INTO `sys_role_menu` VALUES (15536, 76, 132);
INSERT INTO `sys_role_menu` VALUES (15537, 76, 138);
INSERT INTO `sys_role_menu` VALUES (15538, 77, 153);
INSERT INTO `sys_role_menu` VALUES (15539, 77, 141);
INSERT INTO `sys_role_menu` VALUES (15540, 77, 140);
INSERT INTO `sys_role_menu` VALUES (15541, 77, 139);
INSERT INTO `sys_role_menu` VALUES (15542, 77, 205);
INSERT INTO `sys_role_menu` VALUES (15543, 77, 198);
INSERT INTO `sys_role_menu` VALUES (15544, 77, 196);
INSERT INTO `sys_role_menu` VALUES (15545, 77, 136);
INSERT INTO `sys_role_menu` VALUES (15546, 77, 137);
INSERT INTO `sys_role_menu` VALUES (15547, 77, -1);
INSERT INTO `sys_role_menu` VALUES (15548, 77, 132);
INSERT INTO `sys_role_menu` VALUES (15549, 77, 138);
INSERT INTO `sys_role_menu` VALUES (15550, 1, 210);
INSERT INTO `sys_role_menu` VALUES (15551, 1, 213);
INSERT INTO `sys_role_menu` VALUES (15552, 1, 194);
INSERT INTO `sys_role_menu` VALUES (15553, 1, 193);
INSERT INTO `sys_role_menu` VALUES (15554, 1, 212);
INSERT INTO `sys_role_menu` VALUES (15555, 1, 211);
INSERT INTO `sys_role_menu` VALUES (15556, 1, 209);
INSERT INTO `sys_role_menu` VALUES (15557, 1, 208);
INSERT INTO `sys_role_menu` VALUES (15558, 1, 207);
INSERT INTO `sys_role_menu` VALUES (15559, 1, 206);
INSERT INTO `sys_role_menu` VALUES (15560, 1, 183);
INSERT INTO `sys_role_menu` VALUES (15561, 1, 182);
INSERT INTO `sys_role_menu` VALUES (15562, 1, 181);
INSERT INTO `sys_role_menu` VALUES (15563, 1, 184);
INSERT INTO `sys_role_menu` VALUES (15564, 1, 175);
INSERT INTO `sys_role_menu` VALUES (15565, 1, 174);
INSERT INTO `sys_role_menu` VALUES (15566, 1, 192);
INSERT INTO `sys_role_menu` VALUES (15567, 1, 191);
INSERT INTO `sys_role_menu` VALUES (15568, 1, 190);
INSERT INTO `sys_role_menu` VALUES (15569, 1, 180);
INSERT INTO `sys_role_menu` VALUES (15570, 1, 179);
INSERT INTO `sys_role_menu` VALUES (15571, 1, 178);
INSERT INTO `sys_role_menu` VALUES (15572, 1, 153);
INSERT INTO `sys_role_menu` VALUES (15573, 1, 140);
INSERT INTO `sys_role_menu` VALUES (15574, 1, 139);
INSERT INTO `sys_role_menu` VALUES (15575, 1, 214);
INSERT INTO `sys_role_menu` VALUES (15576, 1, 205);
INSERT INTO `sys_role_menu` VALUES (15577, 1, 198);
INSERT INTO `sys_role_menu` VALUES (15578, 1, 196);
INSERT INTO `sys_role_menu` VALUES (15579, 1, 136);
INSERT INTO `sys_role_menu` VALUES (15580, 1, 165);
INSERT INTO `sys_role_menu` VALUES (15581, 1, 164);
INSERT INTO `sys_role_menu` VALUES (15582, 1, 163);
INSERT INTO `sys_role_menu` VALUES (15583, 1, 121);
INSERT INTO `sys_role_menu` VALUES (15584, 1, 119);
INSERT INTO `sys_role_menu` VALUES (15585, 1, 118);
INSERT INTO `sys_role_menu` VALUES (15586, 1, 204);
INSERT INTO `sys_role_menu` VALUES (15587, 1, 203);
INSERT INTO `sys_role_menu` VALUES (15588, 1, 202);
INSERT INTO `sys_role_menu` VALUES (15589, 1, 99);
INSERT INTO `sys_role_menu` VALUES (15590, 1, 201);
INSERT INTO `sys_role_menu` VALUES (15591, 1, 200);
INSERT INTO `sys_role_menu` VALUES (15592, 1, 199);
INSERT INTO `sys_role_menu` VALUES (15593, 1, 95);
INSERT INTO `sys_role_menu` VALUES (15594, 1, 76);
INSERT INTO `sys_role_menu` VALUES (15595, 1, 75);
INSERT INTO `sys_role_menu` VALUES (15596, 1, 74);
INSERT INTO `sys_role_menu` VALUES (15597, 1, 62);
INSERT INTO `sys_role_menu` VALUES (15598, 1, 56);
INSERT INTO `sys_role_menu` VALUES (15599, 1, 55);
INSERT INTO `sys_role_menu` VALUES (15600, 1, 15);
INSERT INTO `sys_role_menu` VALUES (15601, 1, 26);
INSERT INTO `sys_role_menu` VALUES (15602, 1, 25);
INSERT INTO `sys_role_menu` VALUES (15603, 1, 24);
INSERT INTO `sys_role_menu` VALUES (15604, 1, 14);
INSERT INTO `sys_role_menu` VALUES (15605, 1, 13);
INSERT INTO `sys_role_menu` VALUES (15606, 1, 12);
INSERT INTO `sys_role_menu` VALUES (15607, 1, 61);
INSERT INTO `sys_role_menu` VALUES (15608, 1, 22);
INSERT INTO `sys_role_menu` VALUES (15609, 1, 21);
INSERT INTO `sys_role_menu` VALUES (15610, 1, 20);
INSERT INTO `sys_role_menu` VALUES (15611, 1, 83);
INSERT INTO `sys_role_menu` VALUES (15612, 1, 81);
INSERT INTO `sys_role_menu` VALUES (15613, 1, 80);
INSERT INTO `sys_role_menu` VALUES (15614, 1, 79);
INSERT INTO `sys_role_menu` VALUES (15615, 1, 166);
INSERT INTO `sys_role_menu` VALUES (15616, 1, 156);
INSERT INTO `sys_role_menu` VALUES (15617, 1, 155);
INSERT INTO `sys_role_menu` VALUES (15618, 1, 134);
INSERT INTO `sys_role_menu` VALUES (15619, 1, 159);
INSERT INTO `sys_role_menu` VALUES (15620, 1, 133);
INSERT INTO `sys_role_menu` VALUES (15621, 1, 157);
INSERT INTO `sys_role_menu` VALUES (15622, 1, 154);
INSERT INTO `sys_role_menu` VALUES (15623, 1, 138);
INSERT INTO `sys_role_menu` VALUES (15624, 1, 137);
INSERT INTO `sys_role_menu` VALUES (15625, 1, 135);
INSERT INTO `sys_role_menu` VALUES (15626, 1, 131);
INSERT INTO `sys_role_menu` VALUES (15627, 1, 120);
INSERT INTO `sys_role_menu` VALUES (15628, 1, 96);
INSERT INTO `sys_role_menu` VALUES (15629, 1, 94);
INSERT INTO `sys_role_menu` VALUES (15630, 1, 93);
INSERT INTO `sys_role_menu` VALUES (15631, 1, 73);
INSERT INTO `sys_role_menu` VALUES (15632, 1, 7);
INSERT INTO `sys_role_menu` VALUES (15633, 1, 6);
INSERT INTO `sys_role_menu` VALUES (15634, 1, 2);
INSERT INTO `sys_role_menu` VALUES (15635, 1, 3);
INSERT INTO `sys_role_menu` VALUES (15636, 1, 78);
INSERT INTO `sys_role_menu` VALUES (15637, 1, 1);
INSERT INTO `sys_role_menu` VALUES (15638, 1, 141);
INSERT INTO `sys_role_menu` VALUES (15639, 1, 132);
INSERT INTO `sys_role_menu` VALUES (15640, 1, -1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'xiashenbao@wjy.com.cn', '17699999999', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES (159, 'fengyuhuan', '冯玉环', 'e10e3ec3840654f3330f8189ea3b356a', 19, 'fengyuhuan@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (160, 'wangmiao', '王苗', 'f81393fb7dca6f6e53df18068b4db08f', 19, 'wangmiao@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (161, 'chengsili', '程思丽', 'b07bf354e9789ac801c969d554daa76c', 16, 'chengsili@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (162, 'wangyi', '王宜', '2eae3d6373e6f05cecddde750f7dfbc7', 10, 'wangyi@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (163, 'wanping', '万萍', 'e378843a0de876b279f3af7a1d6bf025', 17, 'wanping@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (164, 'zhouyijun', '周亦军', '70ba3bfaf723217b552bdf12d54620d5', 18, 'zhouyijun@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (165, 'zouliping', '邹利平', '2593b12e3d244da2d9b2323bfae40411', 6, 'zouliping@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (166, 'zhangjiakuan', '张家宽', '6150c08f2a319b933c2912180411e9bc', 18, 'zhangjiakuan@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (167, 'liying', '李瑛', '1d286836ae2fefefdb21908362f7721c', 18, 'liying@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (168, 'wangyili', '王毅力', '0e70dddb938caa77f25b3d1dee947baf', 21, 'wangyili@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (169, 'yulan', '余兰', 'c31797df5f443bb52132ed40b54158b1', 20, 'yulan@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (170, 'linyong', '林勇', '633dde3fbfed1dda8d84ad7463d74240', 10, 'linyong@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (171, 'wujing', '吴静', '0d807b000d3e8b487e0348e40ff71df0', 17, 'wujing@wjy.com.cn', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (137, 1, 1);
INSERT INTO `sys_user_role` VALUES (176, 162, 60);
INSERT INTO `sys_user_role` VALUES (178, 164, 70);
INSERT INTO `sys_user_role` VALUES (186, 165, 1);
INSERT INTO `sys_user_role` VALUES (187, 161, 60);
INSERT INTO `sys_user_role` VALUES (189, 167, 70);
INSERT INTO `sys_user_role` VALUES (191, 166, 70);
INSERT INTO `sys_user_role` VALUES (193, 168, 75);
INSERT INTO `sys_user_role` VALUES (194, 169, 74);
INSERT INTO `sys_user_role` VALUES (195, 170, 76);
INSERT INTO `sys_user_role` VALUES (196, 163, 64);
INSERT INTO `sys_user_role` VALUES (197, 171, 71);

SET FOREIGN_KEY_CHECKS = 1;
