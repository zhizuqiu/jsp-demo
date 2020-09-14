package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.mapper.JdbcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("pack")
public class PackController {

    @Autowired
    JdbcMapper packMapper;

    @RequestMapping("list")
    public List<Map> list() {
        return packMapper.list();
    }


    @PostMapping("update")
    public int update(@RequestBody Map pack) {
        return packMapper.update(pack);
    }

    @PostMapping("delete")
    public int delete(@RequestBody Map pack) {
        return packMapper.delete(pack);
    }
}
