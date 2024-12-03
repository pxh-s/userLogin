package com.demo.controller;

import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;

public class BaseController {
    public <T> T resolverObject(HttpServletRequest request, Class<T> tClass){
        T result = null;
        try {
            result = tClass.newInstance();

            for (Field field : tClass.getDeclaredFields()) {
                field.setAccessible(true);
                String parameter = request.getParameter(field.getName());
                if(!StringUtils.isEmpty(parameter)) {
                    if(field.getType().getName().equals("int")){
                        field.set(result, Integer.parseInt(parameter));
                    }else if(field.getType().getName().equals("java.lang.String")){
                        field.set(result, parameter);
                    }
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
        return result;
    }
}
