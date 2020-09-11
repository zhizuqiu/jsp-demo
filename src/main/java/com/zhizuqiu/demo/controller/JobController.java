package com.zhizuqiu.demo.controller;

import com.zhizuqiu.demo.entity.User;
import com.zhizuqiu.demo.service.JobService;
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
    JobService jobService;

    @RequestMapping("sel")
    public List<Map> sel(@RequestParam("id") int id) {

        List<Map> jobList = jobService.sel(new User(id));

        List<Map> jobListResule = new ArrayList<>();
        for (Map map : jobList) {
            int num = jobService.getNum(Integer.valueOf(map.get("id").toString()));
            map.put("num", num);
            jobListResule.add(map);
        }

        return jobListResule;
    }

    @RequestMapping("getPack")
    public List<Map> getPack(@RequestParam("jobId") int jobId) {
        return jobService.getPack(jobId);
    }

    @RequestMapping("getNum")
    public int getNum(@RequestParam("jobId") int jobId) {
        return jobService.getNum(jobId);
    }
}


