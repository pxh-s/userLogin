package com.demo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.demo.dto.UserDto;
import com.demo.entity.User;
import com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password")String password, HttpServletRequest request){
        boolean flag = userService.login(username, password);
        if(!flag){
            request.setAttribute("errMsg", "账号或密码输入错误，请重新输入。");
        }
        request.setAttribute("loginResult", flag);
        return "/index.jsp";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request){
        User userDto = resolverObject(request, User.class);
        System.out.println(request);
        userService.register(userDto);
        return "/index.jsp";
    }

    @RequestMapping("/search")
    public String search(HttpServletRequest request){
        UserDto userDto = resolverObject(request, UserDto.class);
        IPage<User> result = userService.page(userDto);

        request.setAttribute("userList", result);
        request.setAttribute("usernameParam", userDto.getUsernameParam());
        request.setAttribute("contactParam", userDto.getContactParam());
        return "/search.jsp";
    }
}
