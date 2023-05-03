/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : springboot_auth

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 03/05/2023 19:55:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', '2022-06-10 11:24:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (2, 'admin', '127.0.0.1', 1, '登录成功', '2022-06-10 11:53:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (3, 'test', '172.17.252.177', 1, '登录成功', '2023-03-04 16:31:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (4, 'test', '172.17.252.177', 1, '登录成功', '2023-03-04 16:50:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (5, 'root', '172.17.252.177', 1, '登录成功', '2023-03-04 17:11:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (6, 'root', '127.0.0.1', 1, '登录成功', '2023-03-04 18:31:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (7, 'root', '172.17.252.177', 1, '登录成功', '2023-03-04 18:39:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (8, 'root', '127.0.0.1', 1, '登录成功', '2023-03-04 20:09:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (9, 'test', '127.0.0.1', 1, '登录成功', '2023-03-04 21:11:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (10, 'test', '127.0.0.1', 1, '登录成功', '2023-03-04 21:34:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (11, 'root', '127.0.0.1', 1, '登录成功', '2023-03-04 21:47:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (12, 'root', '127.0.0.1', 1, '登录成功', '2023-03-04 22:19:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (13, 'root', '172.17.252.177', 1, '登录成功', '2023-03-07 20:30:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (14, 'root', '172.17.252.177', 1, '登录成功', '2023-03-21 18:29:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (15, 'root', '172.17.252.177', 1, '登录成功', '2023-03-21 18:31:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (16, 'root', '127.0.0.1', 1, '登录成功', '2023-03-21 18:33:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (17, 'root', '127.0.0.1', 1, '登录成功', '2023-04-10 10:06:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (18, 'root', '127.0.0.1', 1, '登录成功', '2023-04-10 10:06:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (19, 'root', '127.0.0.1', 1, '登录成功', '2023-04-10 10:10:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (20, 'root', '127.0.0.1', 1, '登录成功', '2023-04-10 10:38:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (21, 'root', '127.0.0.1', 1, '登录成功', '2023-04-28 21:45:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (22, 'root', '127.0.0.1', 1, '登录成功', '2023-04-28 21:46:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (23, 'root', '172.17.252.177', 1, '登录成功', '2023-05-03 15:36:47', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:23:24', 0);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', 1, 'sysUser', 'system/sysUser/list', '', 'el-icon-s-custom', 1, 1, '2021-05-31 18:05:37', '2023-03-04 18:34:28', 0);
INSERT INTO `sys_menu` VALUES (4, 2, '角色管理', 1, 'sysRole', 'system/sysRole/list', '', 'el-icon-user-solid', 2, 1, '2021-05-31 18:05:37', '2023-03-04 18:34:40', 0);
INSERT INTO `sys_menu` VALUES (5, 2, '菜单管理', 1, 'sysMenu', 'system/sysMenu/list', '', 'el-icon-s-unfold', 3, 1, '2021-05-31 18:05:37', '2023-03-04 18:34:41', 0);
INSERT INTO `sys_menu` VALUES (6, 3, '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2021-05-31 18:05:37', '2023-03-01 20:03:03', 0);
INSERT INTO `sys_menu` VALUES (7, 3, '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (8, 3, '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (9, 3, '删除', 2, NULL, NULL, 'bnt.sysUser.delete', NULL, 1, 1, '2021-05-31 18:05:37', '2023-02-27 14:38:52', 0);
INSERT INTO `sys_menu` VALUES (10, 4, '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2021-05-31 18:05:37', '2023-03-01 20:03:04', 0);
INSERT INTO `sys_menu` VALUES (11, 4, '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (12, 4, '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (13, 4, '删除', 2, NULL, NULL, 'bnt.sysRole.delete', NULL, 1, 1, '2021-05-31 18:05:37', '2023-02-27 14:49:22', 0);
INSERT INTO `sys_menu` VALUES (14, 5, '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2021-05-31 18:05:37', '2023-03-01 20:03:05', 0);
INSERT INTO `sys_menu` VALUES (15, 5, '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (16, 5, '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (17, 5, '删除', 2, NULL, NULL, 'bnt.sysMenu.delete', NULL, 1, 1, '2021-05-31 18:05:37', '2023-02-27 14:57:04', 0);
INSERT INTO `sys_menu` VALUES (18, 3, '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-05-23 17:14:32', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (19, 4, '分配权限', 2, 'assignMenuAuth', 'system/sysRole/assignMenuAuth', 'bnt.sysRole.assignMenuAuth', NULL, 1, 1, '2022-05-23 17:18:14', '2023-02-27 14:50:33', 0);
INSERT INTO `sys_menu` VALUES (30, 34, '操作日志', 1, 'sysOperLog', 'system/sysOperLog/list', '', 'el-icon-document-remove', 7, 1, '2022-05-26 16:09:59', '2022-06-09 09:39:23', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (32, 34, '登录日志', 1, 'sysLoginLog', 'system/sysLoginLog/list', '', 'el-icon-s-goods', 8, 1, '2022-05-26 16:36:13', '2022-06-09 09:39:24', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2022-06-09 09:36:36', 0);
INSERT INTO `sys_menu` VALUES (34, 2, '日志管理', 0, 'log', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-05-31 13:23:07', '2022-06-09 09:39:22', 0);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (80, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 14:49:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (81, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 14:49:06', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (82, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 14:54:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (83, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 14:59:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (84, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:24:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (85, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:24:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (86, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/1', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:24:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (87, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/1', '172.17.252.177', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:29:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (88, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/1', '172.17.252.177', '3 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:30:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (89, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '172.17.252.177', '3 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:31:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (90, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/1', '172.17.252.177', '3 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-03 15:31:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (91, '角色管理', 'UPDATE', 'com.auth.system.controller.SysRoleController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysRole/update', '127.0.0.1', '{\"createTime\":\"2023-02-26 22:21:25\",\"id\":45,\"isDeleted\":0,\"param\":{},\"roleCode\":\"test2\",\"roleName\":\"test\",\"updateTime\":\"2023-02-26 22:21:25\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 19:38:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (92, '角色管理', 'UPDATE', 'com.auth.system.controller.SysRoleController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysRole/update', '127.0.0.1', '{\"createTime\":\"2023-02-26 22:21:25\",\"id\":45,\"isDeleted\":0,\"param\":{},\"roleCode\":\"test\",\"roleName\":\"test\",\"updateTime\":\"2023-02-26 22:21:25\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 19:38:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (93, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'test', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,4,10,19,5,14,17],\"roleId\":45}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 21:34:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (94, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:10:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (95, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:10:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (96, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:14:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (97, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:14:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (98, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:14:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (99, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '127.0.0.1', '3 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:14:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/0', '127.0.0.1', '3 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:14:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:16:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/1', '127.0.0.1', '17 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:16:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/3/1', '127.0.0.1', '3 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-03-04 22:16:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/0', '127.0.0.1', '17 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-04-28 21:47:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/17/1', '127.0.0.1', '17 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-04-28 21:48:00', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2023-02-15 14:22:29', 0);
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'COMMON', '普通管理员', '2021-06-01 08:38:40', '2023-02-15 14:22:30', 0);
INSERT INTO `sys_role` VALUES (3, '测试角色', 'TEST', '测试角色', '2023-02-14 15:22:07', '2023-02-19 17:54:24', 0);
INSERT INTO `sys_role` VALUES (45, 'test', 'test', NULL, '2023-02-26 22:21:25', '2023-02-26 22:21:25', 0);
INSERT INTO `sys_role` VALUES (49, 'root', 'root', 'root', '2023-02-27 21:47:30', '2023-02-27 23:06:59', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `menu_id` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2, 2, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 3, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (3, 2, 6, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (4, 2, 7, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (5, 2, 8, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (6, 2, 9, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (7, 2, 18, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (8, 2, 4, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (9, 2, 10, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (10, 2, 11, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (11, 2, 12, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (12, 2, 13, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (13, 2, 19, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 5, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (15, 2, 14, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (16, 2, 15, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (17, 2, 16, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (18, 2, 17, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (19, 2, 2, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (20, 2, 3, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (21, 2, 6, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (22, 2, 7, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (23, 2, 8, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (24, 2, 2, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (25, 2, 3, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (26, 2, 6, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (27, 2, 7, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (28, 2, 8, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (29, 2, 5, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (30, 2, 14, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (31, 2, 20, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (32, 2, 21, '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES (39, 3, 2, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (40, 3, 3, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (41, 3, 6, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (42, 3, 7, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (43, 3, 8, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (44, 3, 9, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (45, 3, 18, '2023-02-21 21:49:13', '2023-02-21 21:49:13', 0);
INSERT INTO `sys_role_menu` VALUES (46, 1, 2, '2023-02-21 21:49:30', '2023-02-21 21:49:30', 0);
INSERT INTO `sys_role_menu` VALUES (47, 1, 4, '2023-02-21 21:49:30', '2023-02-21 21:49:30', 0);
INSERT INTO `sys_role_menu` VALUES (48, 1, 10, '2023-02-21 21:49:30', '2023-02-21 21:49:30', 0);
INSERT INTO `sys_role_menu` VALUES (49, 1, 11, '2023-02-21 21:49:31', '2023-02-21 21:49:31', 0);
INSERT INTO `sys_role_menu` VALUES (50, 1, 12, '2023-02-21 21:49:31', '2023-02-21 21:49:31', 0);
INSERT INTO `sys_role_menu` VALUES (51, 1, 13, '2023-02-21 21:49:31', '2023-02-21 21:49:31', 0);
INSERT INTO `sys_role_menu` VALUES (52, 1, 19, '2023-02-21 21:49:31', '2023-02-21 21:49:31', 0);
INSERT INTO `sys_role_menu` VALUES (53, 45, 2, '2023-02-27 14:06:02', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (54, 45, 3, '2023-02-27 14:06:03', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (55, 45, 6, '2023-02-27 14:06:03', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (56, 45, 8, '2023-02-27 14:06:03', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (57, 45, 9, '2023-02-27 14:06:03', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (58, 45, 18, '2023-02-27 14:06:03', '2023-02-27 14:40:03', 1);
INSERT INTO `sys_role_menu` VALUES (59, 45, 2, '2023-02-27 14:40:03', '2023-02-27 14:40:44', 1);
INSERT INTO `sys_role_menu` VALUES (60, 45, 3, '2023-02-27 14:40:03', '2023-02-27 14:40:44', 1);
INSERT INTO `sys_role_menu` VALUES (61, 45, 6, '2023-02-27 14:40:03', '2023-02-27 14:40:44', 1);
INSERT INTO `sys_role_menu` VALUES (62, 45, 2, '2023-02-27 14:40:44', '2023-02-27 14:42:37', 1);
INSERT INTO `sys_role_menu` VALUES (63, 45, 3, '2023-02-27 14:40:45', '2023-02-27 14:42:37', 1);
INSERT INTO `sys_role_menu` VALUES (64, 45, 6, '2023-02-27 14:40:45', '2023-02-27 14:42:37', 1);
INSERT INTO `sys_role_menu` VALUES (65, 45, 8, '2023-02-27 14:40:45', '2023-02-27 14:42:37', 1);
INSERT INTO `sys_role_menu` VALUES (66, 45, 2, '2023-02-27 14:42:37', '2023-02-27 14:44:31', 1);
INSERT INTO `sys_role_menu` VALUES (67, 45, 3, '2023-02-27 14:42:37', '2023-02-27 14:44:31', 1);
INSERT INTO `sys_role_menu` VALUES (68, 45, 6, '2023-02-27 14:42:37', '2023-02-27 14:44:31', 1);
INSERT INTO `sys_role_menu` VALUES (69, 45, 9, '2023-02-27 14:42:37', '2023-02-27 14:44:31', 1);
INSERT INTO `sys_role_menu` VALUES (70, 45, 18, '2023-02-27 14:42:37', '2023-02-27 14:44:31', 1);
INSERT INTO `sys_role_menu` VALUES (71, 45, 2, '2023-02-27 14:44:31', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (72, 45, 3, '2023-02-27 14:44:32', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (73, 45, 7, '2023-02-27 14:44:32', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (74, 45, 8, '2023-02-27 14:44:32', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (75, 45, 9, '2023-02-27 14:44:32', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (76, 45, 18, '2023-02-27 14:44:32', '2023-02-27 14:46:24', 1);
INSERT INTO `sys_role_menu` VALUES (77, 45, 2, '2023-02-27 14:46:24', '2023-02-27 14:53:56', 1);
INSERT INTO `sys_role_menu` VALUES (78, 45, 3, '2023-02-27 14:46:24', '2023-02-27 14:53:56', 1);
INSERT INTO `sys_role_menu` VALUES (79, 45, 6, '2023-02-27 14:46:24', '2023-02-27 14:53:56', 1);
INSERT INTO `sys_role_menu` VALUES (80, 45, 18, '2023-02-27 14:46:24', '2023-02-27 14:53:56', 1);
INSERT INTO `sys_role_menu` VALUES (81, 45, 2, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (82, 45, 3, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (83, 45, 6, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (84, 45, 18, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (85, 45, 4, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (86, 45, 11, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (87, 45, 13, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (88, 45, 19, '2023-02-27 14:53:56', '2023-02-27 14:58:50', 1);
INSERT INTO `sys_role_menu` VALUES (89, 45, 2, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (90, 45, 3, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (91, 45, 6, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (92, 45, 18, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (93, 45, 4, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (94, 45, 11, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (95, 45, 13, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (96, 45, 19, '2023-02-27 14:58:50', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (97, 45, 5, '2023-02-27 14:58:51', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (98, 45, 15, '2023-02-27 14:58:51', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (99, 45, 16, '2023-02-27 14:58:51', '2023-02-27 15:01:26', 1);
INSERT INTO `sys_role_menu` VALUES (100, 45, 2, '2023-02-27 15:01:26', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (101, 45, 3, '2023-02-27 15:01:26', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (102, 45, 6, '2023-02-27 15:01:26', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (103, 45, 18, '2023-02-27 15:01:26', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (104, 45, 4, '2023-02-27 15:01:26', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (105, 45, 11, '2023-02-27 15:01:27', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (106, 45, 13, '2023-02-27 15:01:27', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (107, 45, 19, '2023-02-27 15:01:27', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (108, 45, 5, '2023-02-27 15:01:27', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (109, 45, 15, '2023-02-27 15:01:27', '2023-02-27 15:02:24', 1);
INSERT INTO `sys_role_menu` VALUES (110, 45, 2, '2023-02-27 15:02:24', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (111, 45, 3, '2023-02-27 15:02:24', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (112, 45, 6, '2023-02-27 15:02:24', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (113, 45, 18, '2023-02-27 15:02:24', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (114, 45, 4, '2023-02-27 15:02:24', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (115, 45, 11, '2023-02-27 15:02:25', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (116, 45, 13, '2023-02-27 15:02:25', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (117, 45, 19, '2023-02-27 15:02:25', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (118, 45, 5, '2023-02-27 15:02:25', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (119, 45, 15, '2023-02-27 15:02:25', '2023-02-27 15:06:33', 1);
INSERT INTO `sys_role_menu` VALUES (120, 45, 2, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (121, 45, 3, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (122, 45, 6, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (123, 45, 18, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (124, 45, 4, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (125, 45, 11, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (126, 45, 13, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (127, 45, 19, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (128, 45, 5, '2023-02-27 15:06:33', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (129, 45, 15, '2023-02-27 15:06:34', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (130, 45, 17, '2023-02-27 15:06:34', '2023-02-27 16:45:17', 1);
INSERT INTO `sys_role_menu` VALUES (131, 45, 2, '2023-02-27 16:45:17', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (132, 45, 3, '2023-02-27 16:45:17', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (133, 45, 18, '2023-02-27 16:45:17', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (134, 45, 4, '2023-02-27 16:45:17', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (135, 45, 11, '2023-02-27 16:45:18', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (136, 45, 12, '2023-02-27 16:45:18', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (137, 45, 13, '2023-02-27 16:45:18', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (138, 45, 19, '2023-02-27 16:45:18', '2023-02-27 23:07:09', 1);
INSERT INTO `sys_role_menu` VALUES (139, 45, 2, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (140, 45, 3, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (141, 45, 18, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (142, 45, 4, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (143, 45, 11, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (144, 45, 12, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (145, 45, 13, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (146, 45, 19, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (147, 45, 5, '2023-02-27 23:07:09', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (148, 45, 15, '2023-02-27 23:07:10', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (149, 45, 16, '2023-02-27 23:07:10', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (150, 45, 17, '2023-02-27 23:07:10', '2023-02-27 23:21:42', 1);
INSERT INTO `sys_role_menu` VALUES (151, 45, 2, '2023-02-27 23:21:42', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (152, 45, 3, '2023-02-27 23:21:42', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (153, 45, 18, '2023-02-27 23:21:42', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (154, 45, 4, '2023-02-27 23:21:43', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (155, 45, 11, '2023-02-27 23:21:43', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (156, 45, 12, '2023-02-27 23:21:43', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (157, 45, 13, '2023-02-27 23:21:43', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (158, 45, 19, '2023-02-27 23:21:43', '2023-03-01 20:16:06', 1);
INSERT INTO `sys_role_menu` VALUES (159, 45, 2, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (160, 45, 3, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (161, 45, 18, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (162, 45, 4, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (163, 45, 10, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (164, 45, 11, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (165, 45, 12, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (166, 45, 13, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (167, 45, 19, '2023-03-01 20:16:07', '2023-03-01 20:16:21', 1);
INSERT INTO `sys_role_menu` VALUES (168, 45, 2, '2023-03-01 20:16:21', '2023-03-01 20:19:23', 1);
INSERT INTO `sys_role_menu` VALUES (169, 45, 3, '2023-03-01 20:16:21', '2023-03-01 20:19:23', 1);
INSERT INTO `sys_role_menu` VALUES (170, 45, 18, '2023-03-01 20:16:21', '2023-03-01 20:19:23', 1);
INSERT INTO `sys_role_menu` VALUES (171, 45, 4, '2023-03-01 20:16:21', '2023-03-01 20:19:23', 1);
INSERT INTO `sys_role_menu` VALUES (172, 45, 10, '2023-03-01 20:16:21', '2023-03-01 20:19:23', 1);
INSERT INTO `sys_role_menu` VALUES (173, 45, 2, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (174, 45, 3, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (175, 45, 8, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (176, 45, 18, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (177, 45, 5, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (178, 45, 14, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (179, 45, 15, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (180, 45, 16, '2023-03-01 20:19:23', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (181, 45, 17, '2023-03-01 20:19:24', '2023-03-02 17:03:40', 1);
INSERT INTO `sys_role_menu` VALUES (182, 45, 2, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (183, 45, 3, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (184, 45, 8, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (185, 45, 18, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (186, 45, 4, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (187, 45, 10, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (188, 45, 19, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (189, 45, 5, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (190, 45, 14, '2023-03-02 17:03:40', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (191, 45, 17, '2023-03-02 17:03:41', '2023-03-02 17:06:58', 1);
INSERT INTO `sys_role_menu` VALUES (192, 45, 2, '2023-03-02 17:06:58', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (193, 45, 3, '2023-03-02 17:06:58', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (194, 45, 6, '2023-03-02 17:06:58', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (195, 45, 8, '2023-03-02 17:06:58', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (196, 45, 18, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (197, 45, 4, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (198, 45, 10, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (199, 45, 19, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (200, 45, 5, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (201, 45, 14, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (202, 45, 17, '2023-03-02 17:06:59', '2023-03-04 21:34:01', 1);
INSERT INTO `sys_role_menu` VALUES (203, 45, 2, '2023-03-04 21:34:01', '2023-03-04 21:34:01', 0);
INSERT INTO `sys_role_menu` VALUES (204, 45, 4, '2023-03-04 21:34:01', '2023-03-04 21:34:01', 0);
INSERT INTO `sys_role_menu` VALUES (205, 45, 10, '2023-03-04 21:34:01', '2023-03-04 21:34:01', 0);
INSERT INTO `sys_role_menu` VALUES (206, 45, 19, '2023-03-04 21:34:01', '2023-03-04 21:34:01', 0);
INSERT INTO `sys_role_menu` VALUES (207, 45, 5, '2023-03-04 21:34:01', '2023-03-04 21:34:01', 0);
INSERT INTO `sys_role_menu` VALUES (208, 45, 14, '2023-03-04 21:34:02', '2023-03-04 21:34:02', 0);
INSERT INTO `sys_role_menu` VALUES (209, 45, 17, '2023-03-04 21:34:02', '2023-03-04 21:34:02', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', 'e10adc3949ba59abbe56e057f20f883e', 'root', '123456', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', 1, '2021-05-31 18:08:43', '2023-02-26 22:10:16', 0);
INSERT INTO `sys_user` VALUES (2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '123456', 'http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8', 1, '2022-02-08 10:35:38', '2023-02-26 22:10:27', 0);
INSERT INTO `sys_user` VALUES (3, 'tom', 'e10adc3949ba59abbe56e057f20f883e', 'tom', '123456789', NULL, 1, '2022-05-24 11:05:40', '2023-02-26 22:10:22', 0);
INSERT INTO `sys_user` VALUES (17, 'test', 'e10adc3949ba59abbe56e057f20f883e', '测试用户', 'testa', NULL, 1, '2023-02-26 22:20:57', '2023-03-02 17:04:12', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (15, 1, 3, '2023-02-19 17:55:12', '2023-02-19 18:27:04', 1);
INSERT INTO `sys_user_role` VALUES (16, 3, 3, '2023-02-19 17:55:12', '2023-02-26 22:16:44', 1);
INSERT INTO `sys_user_role` VALUES (17, 2, 3, '2023-02-19 17:55:12', '2023-02-26 22:16:44', 1);
INSERT INTO `sys_user_role` VALUES (18, 2, 1, '2023-02-19 18:25:54', '2023-02-26 22:16:38', 1);
INSERT INTO `sys_user_role` VALUES (19, 1, 3, '2023-02-19 18:27:05', '2023-02-19 19:48:47', 1);
INSERT INTO `sys_user_role` VALUES (20, 3, 3, '2023-02-19 18:27:05', '2023-02-19 19:48:47', 1);
INSERT INTO `sys_user_role` VALUES (21, 1, 3, '2023-02-19 19:48:47', '2023-02-19 19:52:27', 1);
INSERT INTO `sys_user_role` VALUES (22, 1, 3, '2023-02-19 19:52:27', '2023-02-19 19:52:36', 1);
INSERT INTO `sys_user_role` VALUES (23, 2, 3, '2023-02-19 19:52:27', '2023-02-19 19:52:36', 1);
INSERT INTO `sys_user_role` VALUES (24, 3, 3, '2023-02-19 19:52:27', '2023-02-19 19:52:36', 1);
INSERT INTO `sys_user_role` VALUES (25, 3, 3, '2023-02-19 20:02:00', '2023-02-19 20:02:03', 1);
INSERT INTO `sys_user_role` VALUES (26, 2, 3, '2023-02-19 20:02:00', '2023-02-19 20:02:03', 1);
INSERT INTO `sys_user_role` VALUES (27, 2, 1, '2023-02-26 22:16:38', '2023-02-26 22:16:38', 0);
INSERT INTO `sys_user_role` VALUES (28, 1, 1, '2023-02-26 22:16:39', '2023-02-26 22:16:39', 0);
INSERT INTO `sys_user_role` VALUES (29, 3, 1, '2023-02-26 22:16:39', '2023-02-26 22:16:39', 0);
INSERT INTO `sys_user_role` VALUES (30, 3, 3, '2023-02-26 22:16:44', '2023-02-27 23:06:50', 1);
INSERT INTO `sys_user_role` VALUES (31, 45, 17, '2023-02-26 22:21:43', '2023-02-26 22:21:43', 0);
INSERT INTO `sys_user_role` VALUES (32, 3, 3, '2023-02-27 23:06:50', '2023-02-27 23:06:53', 1);
INSERT INTO `sys_user_role` VALUES (33, 49, 3, '2023-02-27 23:06:50', '2023-02-27 23:06:53', 1);
INSERT INTO `sys_user_role` VALUES (34, 45, 3, '2023-02-27 23:06:50', '2023-02-27 23:06:53', 1);
INSERT INTO `sys_user_role` VALUES (35, 3, 3, '2023-02-27 23:06:53', '2023-02-27 23:06:53', 0);

SET FOREIGN_KEY_CHECKS = 1;
