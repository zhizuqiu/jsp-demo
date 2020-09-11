package com.zhizuqiu.demo.mapper;

import com.zhizuqiu.demo.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface JobMapper {

    List<Map> sel(User user);

    List<Map> getPack(int jobId);

    int getNum(int jobId);

}
