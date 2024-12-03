package com.demo.dto;

import lombok.Data;

@Data
public class UserDto {
    private int page = 1;
    private int limit = 5;
    private String usernameParam;
    private String contactParam;
}
