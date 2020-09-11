package com.zhizuqiu.demo.mapper;

import com.zhizuqiu.demo.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    User login(User user);

}
