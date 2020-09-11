package com.zhizuqiu.demo.service;

import com.zhizuqiu.demo.entity.Pack;
import com.zhizuqiu.demo.mapper.PackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackService implements PackMapper {

    @Autowired
    PackMapper packMapper;

    @Override
    public List<Pack> list() {
        return packMapper.list();
    }

    @Override
    public int update(Pack pack) {
        return packMapper.update(pack);
    }

    @Override
    public int delete(Pack pack) {
        return packMapper.delete(pack);
    }
}
