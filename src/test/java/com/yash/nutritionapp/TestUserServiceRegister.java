package com.yash.nutritionapp;

import com.yash.nutritionapp.config.SpringRootConfig;
import com.yash.nutritionapp.dao.UserDAO;
import com.yash.nutritionapp.domain.User;
import com.yash.nutritionapp.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class TestUserServiceRegister {
    public static void main(String[] args) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService userService = ctx.getBean(UserService.class);

        User u = new User();
        u.setName("Nitin");
//        u.setPhone("987654");
        u.setEmail("nitin@yash.com");
//        u.setAddress("Delhi");
        u.setLoginName("Nitin123");
        u.setPassword("Nitin@98765");
        u.setRole(1);
//        u.setLoginStatus(1);
        userService.register(u);
        System.out.println("User register succsessfully");
    }
}
