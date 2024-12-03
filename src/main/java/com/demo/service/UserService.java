package com.demo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.demo.dto.UserDto;
import com.demo.entity.User;

public interface UserService {

    /**
     * 注册
     * @param user
     * @return
     */
    boolean register(User user);

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    boolean login(String username, String password);

    IPage<User> page(UserDto dto);
}
