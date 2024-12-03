package com.demo.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("user")
public class User {
    @TableId
    private Integer id;
    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 联系方式
     */
    private String contact;

    /**
     * 地址
     */
    private String address;

    private double score;
}
