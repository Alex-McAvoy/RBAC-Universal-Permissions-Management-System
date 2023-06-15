# RBAC-Universal-Permissions-Management-System

## 说明

基于 RBAC 的通用权限管理系统，当开发各种管理系统需进行权限管理时，将整个项目作为一个微服务接入后简单修改即可
- `VueAdmin`：前端，基于 vue-admin-template 开发
- `SpringCloudAuth`：后端，采用 SpringBoot 开发，服务注册与发现采用 SpringCloud(Alibaba) 的 Nacos，权限管理采用 SpringSecurity，缓存采用 Redis

## 后端模块说明

- CommonAPI：通用 API，包括各配置文件、自定义异常处理类、统一结果返回类、工具类
- LogModule：日志模块
- Model：实体类模块
- UserManageModule：用户管理模块，基于 RBAC 模型对角色、用户、菜单进行管理，负责与数据库交互
- SecurityModule：Spring Security 安全模块，使用了 UserManageModule 模块，在实现单点登录 SSO 时，将该模块导入进相应的微服务即可
- SystemService8001：通用权限管理微服务模块，包含各控制器，使用了 SecurityModule 模块

## 端口号
- 后端：8001
- 前端：8080（Nginx代理）
