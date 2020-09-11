package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.entity.User;
import com.zhizuqiu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("login")
    public User login(@RequestBody User user) {
        System.out.println(user);
        User result = userService.login(user);
        System.out.println(result);
        if (result != null) {
            result.setPassword("");
        }
        return result;
    }

}
