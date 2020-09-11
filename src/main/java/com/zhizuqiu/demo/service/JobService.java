package com.zhizuqiu.demo.service;

import com.zhizuqiu.demo.entity.User;
import com.zhizuqiu.demo.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class JobService implements JobMapper {

    @Autowired
    JobMapper jobMapper;

    @Override
    public List<Map> sel(User user) {
        return jobMapper.sel(user);
    }

    @Override
    public List<Map> getPack(int jobId) {
        return jobMapper.getPack(jobId);
    }

    @Override
    public int getNum(int jobId) {
        return jobMapper.getNum(jobId);
    }
}
