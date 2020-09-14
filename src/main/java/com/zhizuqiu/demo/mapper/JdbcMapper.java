package com.zhizuqiu.demo.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface JdbcMapper {

    List<Map> sel(int id);

    List<Map> getPack(int jobId);

    int getNum(int jobId);

    List<Map> list();

    int update(Map pack);

    int delete(Map pack);

    Map login(Map user);

}
