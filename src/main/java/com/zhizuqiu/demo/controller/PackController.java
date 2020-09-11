package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.entity.Pack;
import com.zhizuqiu.demo.service.PackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("pack")
public class PackController {

    @Autowired
    PackService packService;

    @RequestMapping("list")
    public List<Pack> list() {
        return packService.list();
    }


    @PostMapping("update")
    public int update(@RequestBody Pack pack) {
        return packService.update(pack);
    }

    @PostMapping("delete")
    public int delete(@RequestBody Pack pack) {
        return packService.delete(pack);
    }
}
