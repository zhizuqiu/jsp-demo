package com.zhizuqiu.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.util.Date;

@Controller
@RequestMapping("/")
public class JspController {

    @RequestMapping("/hello")
    public String hello(Model m) {
        m.addAttribute("now", DateFormat.getDateTimeInstance().format(new Date()));
        return "hello";  //视图重定向hello.jsp
    }

    @RequestMapping("/list")
    public String list() {
        return "list";
    }

    @RequestMapping("/do")
    public String doJ() {
        return "do";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/do2")
    public String doJ2() {
        return "do2";
    }

    @RequestMapping("/login2")
    public String login2() {
        return "login2";
    }

    @RequestMapping("/index2")
    public String index2() {
        return "index2";
    }


}