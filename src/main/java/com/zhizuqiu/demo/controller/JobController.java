package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.mapper.JdbcMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("job")
public class JobController {

    @Autowired
    JdbcMapper jobMapper;


    @RequestMapping("sel")
    public List<Map> sel(@RequestParam("id") int id) {

        List<Map> jobList = jobMapper.sel(id);

        List<Map> jobListResule = new ArrayList<>();
        for (Map map : jobList) {
            int num = jobMapper.getNum(Integer.valueOf(map.get("id").toString()));
            map.put("num", num);
            jobListResule.add(map);
        }

        return jobListResule;
    }

    @RequestMapping("getPack")
    public List<Map> getPack(@RequestParam("jobId") int jobId) {
        return jobMapper.getPack(jobId);
    }

    @RequestMapping("getNum")
    public int getNum(@RequestParam("jobId") int jobId) {
        return jobMapper.getNum(jobId);
    }
}


