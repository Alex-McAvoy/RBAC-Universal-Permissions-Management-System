package com.auth.system;

import com.auth.system.model.entity.SysRole;
import com.auth.system.service.SysRoleService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

/**
 * 角色测试类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 14:26
 **/
@SpringBootTest
public class SysRoleDaoTest {
    @Autowired
    private SysRoleService service;

    @Test
    public void testSelect() {
        System.out.println(service.getById(5));
    }

    @Test
    public void testAdd() {
        SysRole sysRole = new SysRole("测试角色", "test", "测试角色");
        boolean flag = service.save(sysRole);
        System.out.println(flag);
    }

    @Test
    public void testUpdate() {
        SysRole sysRole = service.getById(9);
        sysRole.setRoleCode("TEST");
        sysRole.setUpdateTime(new Date());
        boolean flag = service.updateById(sysRole);
        System.out.println(flag);
    }

    @Test
    public void testDelete() {
        boolean flag = service.removeById(5);
        System.out.println(flag);
    }
}
