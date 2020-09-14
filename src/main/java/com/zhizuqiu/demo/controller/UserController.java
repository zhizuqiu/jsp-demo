package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.mapper.JdbcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    JdbcMapper userMapper;

    @PostMapping("login")
    public Map login(@RequestBody Map user) {
        System.out.println(user);
        Map result = userMapper.login(user);
        System.out.println(result);
        if (result != null) {
            result.put("password", "");
        }
        return result;
    }

}
