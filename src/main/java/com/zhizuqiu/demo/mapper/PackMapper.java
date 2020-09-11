package com.zhizuqiu.demo.mapper;

import com.zhizuqiu.demo.entity.Pack;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PackMapper {

    List<Pack> list();

    int update(Pack pack);

    int delete(Pack pack);

}
