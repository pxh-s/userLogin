package com.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.dto.UserDto;
import com.demo.entity.User;
import com.demo.mapper.UserMapper;
import com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public boolean login(String username, String password) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        List<User> users = userMapper.selectList(wrapper);

        for (User user : users) {
            if(StringUtils.pathEquals(user.getPassword(), password)){
                return true;
            }
        }

        return false;
    }

    @Override
    public IPage<User> page(UserDto dto) {
        LambdaQueryWrapper<User> userWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isEmpty(dto.getUsernameParam())){
            userWrapper.like(User::getUsername, dto.getUsernameParam());
        }
        if(!StringUtils.isEmpty(dto.getContactParam())){
            userWrapper.like(User::getContact, dto.getContactParam());
        }

        IPage<User> page = new Page<>(dto.getPage(), dto.getLimit());
        IPage<User> page1 = userMapper.selectPage(page, userWrapper);
        for (User record : page1.getRecords()) {
            record.setScore((int)(record.getScore() * Math.random()));
        }
        Long count = userMapper.selectCount(userWrapper);
        page1.setTotal(count);
        return page1;
    }

    @Override
    public boolean register(User user) {
        userMapper.insert(user);
        return true;
    }

}
