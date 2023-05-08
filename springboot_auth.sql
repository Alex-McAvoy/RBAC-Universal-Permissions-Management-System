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

 Date: 08/05/2023 14:50:04
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
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_login_log` VALUES (24, 'root', '0:0:0:0:0:0:0:1', 1, '登录成功', '2023-05-04 16:05:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (25, 'root', '127.0.0.1', 1, '登录成功', '2023-05-04 22:28:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (26, 'root', '127.0.0.1', 1, '登录成功', '2023-05-04 22:35:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (27, 'root', '127.0.0.1', 1, '登录成功', '2023-05-04 23:16:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (28, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 00:25:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (29, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 00:28:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (30, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 00:28:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (31, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 01:00:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (32, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 01:01:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (33, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 14:14:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (34, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 14:43:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (35, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:24:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (36, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:28:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (37, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:31:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (38, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:44:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (39, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:46:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (40, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:47:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (41, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:49:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (42, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 15:50:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (43, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:21:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (44, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:23:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (45, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:24:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (46, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:29:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (47, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:31:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (48, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 16:52:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (49, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 17:04:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (50, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 17:05:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (51, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 17:06:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (52, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 17:23:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (53, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 17:23:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (54, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 17:24:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (55, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 17:38:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (56, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 17:44:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (57, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 19:54:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (58, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:00:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (59, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:02:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (60, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:04:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (61, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:06:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (62, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:10:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (63, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:12:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (64, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:14:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (65, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:18:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (66, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:18:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (67, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:19:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (68, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:21:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (69, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:23:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (70, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:26:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (71, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:29:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (72, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:30:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (73, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:31:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (74, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:33:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (75, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:33:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (76, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:37:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (77, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:38:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (78, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:41:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (79, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:45:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (80, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:47:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (81, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 20:47:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (82, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 21:31:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (83, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 21:47:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (84, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 21:49:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (85, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 21:50:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (86, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-05 21:50:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (87, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 21:50:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (88, 'tom', '127.0.0.1', 1, '登录成功', '2023-05-05 21:51:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (89, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 21:52:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (90, 'test', '127.0.0.1', 1, '登录成功', '2023-05-05 21:54:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (91, 'tom', '127.0.0.1', 1, '登录成功', '2023-05-05 21:55:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (92, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 21:57:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (93, 'tom', '127.0.0.1', 1, '登录成功', '2023-05-05 22:03:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (94, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 22:09:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (95, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-05 23:57:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (96, 'tom', '127.0.0.1', 1, '登录成功', '2023-05-05 23:59:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (97, 'root', '127.0.0.1', 1, '登录成功', '2023-05-05 23:59:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (98, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 00:01:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (99, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 00:26:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (100, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 00:45:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (101, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 00:45:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (102, 'tom', '127.0.0.1', 1, '登录成功', '2023-05-06 14:50:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (103, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 16:26:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (104, 'root', '172.17.252.177', 1, '登录成功', '2023-05-06 16:32:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (105, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 17:27:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (106, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 18:18:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (107, 'test1', '127.0.0.1', 1, '登录成功', '2023-05-06 22:02:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (108, 'test', '127.0.0.1', 1, '登录成功', '2023-05-06 22:04:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (109, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 22:04:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (110, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 23:41:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (111, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-06 23:41:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (112, 'root', '127.0.0.1', 1, '登录成功', '2023-05-06 23:44:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (113, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-06 23:44:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (114, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 00:13:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (115, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-07 00:29:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (116, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 16:50:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (117, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-07 17:23:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (118, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 17:26:07', NULL, 0);
INSERT INTO `sys_login_log` VALUES (119, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-07 17:28:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (120, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 17:28:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (121, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-07 17:30:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (122, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 17:33:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (123, 'test', '127.0.0.1', 1, '登录成功', '2023-05-07 21:19:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (124, 'test', '127.0.0.1', 1, '登录成功', '2023-05-07 21:19:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (125, 'test', '127.0.0.1', 1, '登录成功', '2023-05-07 21:19:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (126, 'admin', '127.0.0.1', 1, '登录成功', '2023-05-07 21:19:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (127, 'test', '127.0.0.1', 1, '登录成功', '2023-05-07 21:20:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (128, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:21:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (129, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:22:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (130, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:22:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (131, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:23:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (132, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:28:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (133, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:29:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (134, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:29:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (135, 'root', '127.0.0.1', 1, '登录成功', '2023-05-07 21:29:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (136, 'root', '172.17.252.177', 1, '登录成功', '2023-05-07 22:08:03', NULL, 0);

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
INSERT INTO `sys_menu` VALUES (30, 34, '登录日志', 1, 'loginLog', 'system/sysLog/loginLog/list', '', 'el-icon-s-goods', 7, 1, '2022-05-26 16:09:59', '2023-05-07 21:35:45', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2023-05-07 21:36:25', 0);
INSERT INTO `sys_menu` VALUES (32, 34, '操作日志', 1, 'operLog', 'system/sysLog/operLog/list', '', 'el-icon-document-remove', 8, 1, '2022-05-26 16:36:13', '2023-05-07 21:35:54', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2023-05-07 21:36:21', 0);
INSERT INTO `sys_menu` VALUES (34, 2, '日志管理', 0, 'sysLog', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-05-31 13:23:07', '2023-05-07 21:26:52', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 'DELETE', 'com.auth.system.controller.SysUserController.deleteRole()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysUser/delete/24', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 17:05:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (107, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[45,3,2],\"userId\":17}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 17:05:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15966608425\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 17:45:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"123456\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 17:46:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1234562234\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:31:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"123456\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:34:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1234\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:34:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"4312\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:42:45', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"4\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:44:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateRole()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"432\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 19:45:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[1,2,3,4],\"userId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:02:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[2],\"userId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:03:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[1,2,3,4],\"userId\":3}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:03:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"12345\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:30:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"123\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:31:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"12334\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:31:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"123\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:31:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (123, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15966608425\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:31:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"159666084\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:32:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15966608425\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:32:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:32:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"159000011112\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\r\\n### The error may exist in com/auth/system/dao/SysUserDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysUserDao.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE sys_user  SET username=?, password=?, name=?, phone=?, head_url=?, status=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\\r\\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\",\"message\":\"失败\"}', 1, '', '2023-05-05 22:37:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:37:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:37:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"159000011112\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\r\\n### The error may exist in com/auth/system/dao/SysUserDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysUserDao.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE sys_user  SET username=?, password=?, name=?, phone=?, head_url=?, status=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\\r\\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\",\"message\":\"失败\"}', 1, '', '2023-05-05 22:37:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:37:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"159000011111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\r\\n### The error may exist in com/auth/system/dao/SysUserDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysUserDao.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE sys_user  SET username=?, password=?, name=?, phone=?, head_url=?, status=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\\r\\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\",\"message\":\"失败\"}', 1, '', '2023-05-05 22:38:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (133, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"159000011111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\r\\n### The error may exist in com/auth/system/dao/SysUserDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysUserDao.updateById-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: UPDATE sys_user  SET username=?, password=?, name=?, phone=?, head_url=?, status=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\\r\\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\",\"message\":\"失败\"}', 1, '', '2023-05-05 22:38:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:38:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:41:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (136, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:41:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:42:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (138, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:42:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900011\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:47:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:47:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (141, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 22:48:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (142, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'admin', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2022-02-08 10:35:38\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8\",\"id\":2,\"isDeleted\":0,\"name\":\"管理员\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900002222\",\"status\":1,\"updateTime\":\"2023-02-26 22:10:27\",\"username\":\"admin\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-05 23:57:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:00:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:00:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (145, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:01:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:03:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:03:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (148, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:03:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (149, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:03:36', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (150, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:03:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:04:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900011\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:04:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900011\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:04:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (154, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:04:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"1590000111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:06:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (156, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2021-05-31 18:08:43\",\"headUrl\":\"http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc\",\"id\":1,\"isDeleted\":0,\"name\":\"根用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"15900001111\",\"status\":1,\"updateTime\":\"2023-05-05 16:52:02\",\"username\":\"root\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:09:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (157, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[1,\"passwordList1\",\"passwordList1\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:28:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (158, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[1,\"passwordList1\",\"passwordList1\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:29:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[1,\"passwordList1\",\"passwordList1\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:30:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[1,\"passwordList1\",\"passwordList1\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:31:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (161, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"a123456\",\"a1234565\"]', '{\"code\":211,\"message\":\"密码错误\"}', 1, '', '2023-05-06 00:39:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (162, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"123456\",\"a1234565\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:39:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (163, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"123456\",\"a1234567\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 00:44:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (164, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/0', '127.0.0.1', '2 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 14:29:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/1', '127.0.0.1', '2 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 14:29:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/0', '127.0.0.1', '2 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 14:29:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/1', '127.0.0.1', '2 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 14:29:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":25,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:18:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":3,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:19:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":3,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:20:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"test\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:21:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"test\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:21:31', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'tom', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":6,\"name\":\"123\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"test1\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:24:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":7,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:44:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:51:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":9,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"12312\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:52:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:52:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:52:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":12,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"4123142\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:52:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":13,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123123132312\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:54:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":14,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:55:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:58:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":16,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"12455125\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:58:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:59:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":18,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"5112125152\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 16:59:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:59:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 16:59:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":21,\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 17:04:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"name\":\"atg\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"username\":\"test\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 17:36:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 'DELETE', 'com.auth.system.controller.SysUserController.deleteUser()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysUser/delete/3', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:15:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"username\":\"test\"}', '{\"code\":230,\"message\":\"用户名重复\"}', 1, '', '2023-05-06 18:15:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":5,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:16:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"id\":3,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:19:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":4,\"name\":\"测试用户1\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"\",\"status\":1,\"username\":\"test1\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:22:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/0', '127.0.0.1', '2 0', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:27:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateStatus()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updateStatus/2/1', '127.0.0.1', '2 1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:27:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 'DELETE', 'com.auth.system.controller.SysUserController.batchDelete()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysUser/batchDelete', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 18:29:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 'INSERT', 'com.auth.system.controller.SysUserController.saveUser()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/save', '127.0.0.1', '{\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":5,\"name\":\"123\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"test2\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 21:06:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (199, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2023-05-06 21:06:43\",\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":5,\"isDeleted\":0,\"name\":\"123\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"13300001111\",\"status\":1,\"updateTime\":\"2023-05-06 21:06:43\",\"username\":\"test2\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:07:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2023-05-06 21:06:43\",\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":5,\"isDeleted\":0,\"name\":\"12345125\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"13300001111\",\"status\":1,\"updateTime\":\"2023-05-06 21:06:43\",\"username\":\"test2\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:07:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2023-05-06 21:06:43\",\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":5,\"isDeleted\":0,\"name\":\"12345125\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"13300001111\",\"status\":1,\"updateTime\":\"2023-05-06 21:06:43\",\"username\":\"test2\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:17:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2023-05-06 21:06:43\",\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":5,\"isDeleted\":0,\"name\":\"12345125asf\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"13300001111\",\"status\":1,\"updateTime\":\"2023-05-06 21:06:43\",\"username\":\"test2\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:17:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[1,2,3,4],\"userId\":5}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:22:19', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[],\"userId\":5}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:22:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 'DELETE', 'com.auth.system.controller.SysUserController.batchDelete()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysUser/batchDelete', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 22:26:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"123\",\"12345611a\"]', '{\"code\":211,\"message\":\"密码错误\"}', 1, '', '2023-05-06 23:17:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"123456\",\"12345611a\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:17:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updatePasswordByUserId()', 'PUT', 'MANAGE', 'root', '/admin/system/sysUser/updatePassword', '127.0.0.1', '[\"1\",\"123456\",\"1234561a\"]', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:24:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.resetPassword()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/resetPassword/1', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:25:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.resetPassword()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/resetPassword/1', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:27:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.resetPassword()', 'GET', 'MANAGE', 'root', '/admin/system/sysUser/resetPassword/1', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:27:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (212, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.resetPassword()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/resetPassword/1', '127.0.0.1', '1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:29:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.resetPassword()', 'POST', 'MANAGE', 'root', '/admin/system/sysUser/resetPassword/1', '127.0.0.1', '1', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:29:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,18,4,10,11,12,13,19,5,14,15,16,17,34,30,31,32,33],\"roleId\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:37:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,4,10,11],\"roleId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:39:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (216, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,18,4,10,11],\"roleId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-06 23:44:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'admin', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[3,4],\"userId\":3}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 00:06:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'admin', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[],\"userId\":3}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 00:06:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 'ASSIGN', 'com.auth.system.controller.SysUserRoleController.doAssign()', 'POST', 'MANAGE', 'admin', '/admin/system/sysUserRole/doAssign', '127.0.0.1', '{\"roleIdList\":[3,4],\"userId\":3}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 00:06:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (220, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,18,4,10,11,12,13,19],\"roleId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 00:14:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 'UPDATE', 'com.auth.system.controller.SysUserController.updateUser()', 'PUT', 'MANAGE', 'admin', '/admin/system/sysUser/update', '127.0.0.1', '{\"createTime\":\"2023-05-06 18:19:23\",\"headUrl\":\"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif\",\"id\":3,\"isDeleted\":0,\"name\":\"测试用户\",\"param\":{},\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"phone\":\"13011114444\",\"status\":1,\"updateTime\":\"2023-05-06 23:35:48\",\"username\":\"test\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 00:29:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 'UPDATE', 'com.auth.system.controller.SysRoleController.updateRole()', 'PUT', 'MANAGE', 'admin', '/admin/system/sysRole/update', '127.0.0.1', '{\"createTime\":\"2023-05-05 17:30:48\",\"description\":\"教师\",\"id\":4,\"isDeleted\":0,\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"updateTime\":\"2023-05-05 17:31:01\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 01:04:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (223, '角色管理', 'INSERT', 'com.auth.system.controller.SysRoleController.saveRole()', 'POST', 'MANAGE', 'admin', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{}}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in com/auth/system/dao/SysRoleDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysRoleDao.insert-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: INSERT INTO sys_role    VALUES\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"message\":\"失败\"}', 1, '', '2023-05-07 01:04:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 'INSERT', 'com.auth.system.controller.SysRoleController.saveRole()', 'POST', 'MANAGE', 'admin', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{}}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in com/auth/system/dao/SysRoleDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysRoleDao.insert-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: INSERT INTO sys_role    VALUES\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"message\":\"失败\"}', 1, '', '2023-05-07 01:04:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 'INSERT', 'com.auth.system.controller.SysRoleController.saveRole()', 'POST', 'MANAGE', 'admin', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{}}', '{\"code\":201,\"data\":\"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\r\\n### The error may exist in com/auth/system/dao/SysRoleDao.java (best guess)\\r\\n### The error may involve com.auth.system.dao.SysRoleDao.insert-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: INSERT INTO sys_role    VALUES\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\",\"message\":\"失败\"}', 1, '', '2023-05-07 01:05:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 'INSERT', 'com.auth.system.controller.SysMenuController.saveMenu()', 'POST', 'MANAGE', 'root', '/admin/system/sysMenu/save', '127.0.0.1', '{\"component\":\"Layout\",\"icon\":\"\",\"id\":52,\"name\":\"TEST\",\"param\":{},\"parentId\":0,\"path\":\"\",\"perms\":\"\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":0}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 16:54:45', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 'INSERT', 'com.auth.system.controller.SysMenuController.saveMenu()', 'POST', 'MANAGE', 'root', '/admin/system/sysMenu/save', '127.0.0.1', '{\"component\":\"Layout\",\"icon\":\"\",\"id\":53,\"name\":\"Test\",\"param\":{},\"parentId\":0,\"path\":\"/test\",\"perms\":\"\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":0}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 16:59:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (228, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,18,4,10,11,12,13,19,5,14,34,30,31,32,33],\"roleId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 17:27:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[2,3,6,7,8,9,18,4,10,11,12,13,19,34,30,31,32,33],\"roleId\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 17:29:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 'DELETE', 'com.auth.system.controller.SysMenuController.deleteMenuById()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysMenu/delete/53', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:17:45', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 'INSERT', 'com.auth.system.controller.SysMenuController.saveMenu()', 'POST', 'MANAGE', 'root', '/admin/system/sysMenu/save', '127.0.0.1', '{\"component\":\"Layout\",\"icon\":\"el-icon-s-tools\",\"id\":54,\"name\":\"Test\",\"param\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":0}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:18:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (232, '角色管理', 'ASSIGN', 'com.auth.system.controller.SysRoleMenuController.doAssign()', 'POST', 'MANAGE', 'root', '/admin/system/sysRoleMenu/doAssign', '127.0.0.1', '{\"menuIdList\":[],\"roleId\":3}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:18:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 'INSERT', 'com.auth.system.controller.SysMenuController.saveMenu()', 'POST', 'MANAGE', 'root', '/admin/system/sysMenu/save', '127.0.0.1', '{\"component\":\"\",\"icon\":\"el-icon-s-tools\",\"id\":55,\"name\":\"Test\",\"param\":{},\"parentId\":54,\"path\":\"test/test\",\"perms\":\"\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:22:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 'DELETE', 'com.auth.system.controller.SysMenuController.deleteMenuById()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysMenu/delete/55', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:23:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 'DELETE', 'com.auth.system.controller.SysMenuController.deleteMenuById()', 'DELETE', 'MANAGE', 'root', '/admin/system/sysMenu/delete/54', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:23:31', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 'UPDATE', 'com.auth.system.controller.SysMenuController.updateMenu()', 'PUT', 'MANAGE', 'root', '/admin/system/sysMenu/update', '127.0.0.1', '{\"children\":[{\"children\":[],\"createTime\":\"2022-05-26 16:36:31\",\"id\":33,\"isDeleted\":0,\"name\":\"查看\",\"param\":{},\"parentId\":32,\"perms\":\"bnt.sysLoginLog.list\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":2,\"updateTime\":\"2022-06-09 09:36:36\"}],\"component\":\"system/sysLog/loginLog/list\",\"createTime\":\"2022-05-26 16:36:13\",\"icon\":\"el-icon-s-goods\",\"id\":32,\"isDeleted\":0,\"name\":\"登录日志\",\"param\":{},\"parentId\":34,\"path\":\"loginLog\",\"perms\":\"\",\"select\":false,\"sortValue\":7,\"status\":1,\"type\":1,\"updateTime\":\"2023-05-07 21:29:20\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:34:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 'UPDATE', 'com.auth.system.controller.SysMenuController.updateMenu()', 'PUT', 'MANAGE', 'root', '/admin/system/sysMenu/update', '127.0.0.1', '{\"children\":[{\"children\":[],\"createTime\":\"2022-05-26 16:10:17\",\"id\":31,\"isDeleted\":0,\"name\":\"查看\",\"param\":{},\"parentId\":30,\"perms\":\"bnt.sysOperLog.list\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":2,\"updateTime\":\"2022-06-09 09:22:38\"}],\"component\":\"system/sysLog/operLog/list\",\"createTime\":\"2022-05-26 16:09:59\",\"icon\":\"el-icon-document-remove\",\"id\":30,\"isDeleted\":0,\"name\":\"操作日志\",\"param\":{},\"parentId\":34,\"path\":\"operLog\",\"perms\":\"\",\"select\":false,\"sortValue\":8,\"status\":1,\"type\":1,\"updateTime\":\"2023-05-07 21:29:31\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:34:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 'UPDATE', 'com.auth.system.controller.SysMenuController.updateMenu()', 'PUT', 'MANAGE', 'root', '/admin/system/sysMenu/update', '127.0.0.1', '{\"children\":[{\"children\":[],\"createTime\":\"2022-05-26 16:10:17\",\"id\":31,\"isDeleted\":0,\"name\":\"查看\",\"param\":{},\"parentId\":30,\"perms\":\"bnt.sysOperLog.list\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":2,\"updateTime\":\"2022-06-09 09:22:38\"}],\"component\":\"system/sysLog/operLog/list\",\"createTime\":\"2022-05-26 16:09:59\",\"icon\":\"el-icon-document-remove\",\"id\":30,\"isDeleted\":0,\"name\":\"操作日志\",\"param\":{},\"parentId\":34,\"path\":\"operLog\",\"perms\":\"\",\"select\":false,\"sortValue\":7,\"status\":1,\"type\":1,\"updateTime\":\"2023-05-07 21:29:31\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:34:32', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 'UPDATE', 'com.auth.system.controller.SysMenuController.updateMenu()', 'PUT', 'MANAGE', 'root', '/admin/system/sysMenu/update', '127.0.0.1', '{\"children\":[{\"children\":[],\"createTime\":\"2022-05-26 16:36:31\",\"id\":33,\"isDeleted\":0,\"name\":\"查看\",\"param\":{},\"parentId\":32,\"perms\":\"bnt.sysLoginLog.list\",\"select\":false,\"sortValue\":1,\"status\":1,\"type\":2,\"updateTime\":\"2022-06-09 09:36:36\"}],\"component\":\"system/sysLog/loginLog/list\",\"createTime\":\"2022-05-26 16:36:13\",\"icon\":\"el-icon-s-goods\",\"id\":32,\"isDeleted\":0,\"name\":\"登录日志\",\"param\":{},\"parentId\":34,\"path\":\"loginLog\",\"perms\":\"\",\"select\":false,\"sortValue\":8,\"status\":1,\"type\":1,\"updateTime\":\"2023-05-07 21:29:20\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2023-05-07 21:34:37', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2023-02-15 14:22:29', 0);
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'ADMIN', '普通管理员', '2021-06-01 08:38:40', '2023-05-07 17:33:46', 0);
INSERT INTO `sys_role` VALUES (3, '测试角色', 'TEST', '测试角色', '2023-02-14 15:22:07', '2023-02-19 17:54:24', 0);
INSERT INTO `sys_role` VALUES (4, '教师', 'TEACHER', '教师', '2023-05-05 17:30:48', '2023-05-07 01:05:02', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 265 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (210, 1, 2, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (211, 1, 3, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (212, 1, 6, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (213, 1, 7, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (214, 1, 8, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (215, 1, 9, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (216, 1, 18, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (217, 1, 4, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (218, 1, 10, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (219, 1, 11, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (220, 1, 12, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (221, 1, 13, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (222, 1, 19, '2023-05-06 23:37:13', '2023-05-06 23:37:13', 0);
INSERT INTO `sys_role_menu` VALUES (223, 1, 5, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (224, 1, 14, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (225, 1, 15, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (226, 1, 16, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (227, 1, 17, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (228, 1, 34, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (229, 1, 30, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (230, 1, 31, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (231, 1, 32, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (232, 1, 33, '2023-05-06 23:37:14', '2023-05-06 23:37:14', 0);
INSERT INTO `sys_role_menu` VALUES (285, 2, 2, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (286, 2, 3, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (287, 2, 6, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (288, 2, 7, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (289, 2, 8, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (290, 2, 9, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (291, 2, 18, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (292, 2, 4, '2023-05-07 17:29:16', '2023-05-07 17:29:16', 0);
INSERT INTO `sys_role_menu` VALUES (293, 2, 10, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (294, 2, 11, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (295, 2, 12, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (296, 2, 13, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (297, 2, 19, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (298, 2, 34, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (299, 2, 30, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (300, 2, 31, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (301, 2, 32, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);
INSERT INTO `sys_role_menu` VALUES (302, 2, 33, '2023-05-07 17:29:17', '2023-05-07 17:29:17', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', 'e10adc3949ba59abbe56e057f20f883e', '根用户', '15900001111', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 1, '2021-05-31 18:08:43', '2023-05-06 23:29:15', 0);
INSERT INTO `sys_user` VALUES (2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '15900002222', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 1, '2022-02-08 10:35:38', '2023-05-06 18:23:03', 0);
INSERT INTO `sys_user` VALUES (3, 'test', 'e10adc3949ba59abbe56e057f20f883e', '测试用户', '13011114444', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 1, '2023-05-06 18:19:23', '2023-05-06 23:35:48', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2023-02-26 22:16:39', '2023-05-05 22:02:59', 0);
INSERT INTO `sys_user_role` VALUES (2, 2, 2, '2023-05-05 22:03:24', '2023-05-05 22:03:24', 0);
INSERT INTO `sys_user_role` VALUES (5, 3, 3, '2023-05-07 00:06:28', '2023-05-07 00:06:28', 0);
INSERT INTO `sys_user_role` VALUES (6, 4, 3, '2023-05-07 00:06:28', '2023-05-07 00:06:28', 0);

SET FOREIGN_KEY_CHECKS = 1;
