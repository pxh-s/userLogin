package com.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.dto.UserDto;
import com.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    List<User> selectUser(UserDto user);
}
