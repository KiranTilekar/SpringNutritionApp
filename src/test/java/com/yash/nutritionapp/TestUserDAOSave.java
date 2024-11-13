package com.yash.nutritionapp;

import com.yash.nutritionapp.config.SpringRootConfig;
import com.yash.nutritionapp.dao.UserDAO;
import com.yash.nutritionapp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.jws.soap.SOAPBinding;

public class TestUserDAOSave {
    public static void main(String[] args) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);

        User u = new User();
        u.setName("Kalyani");
//        u.setPhone("7890");
        u.setEmail("kalyani@yash.com");
//        u.setAddress("MP");
        u.setLoginName("Kalyani123");
        u.setPassword("Kalyani@7890");
        u.setRole(1);
//        u.setLoginStatus(1);
        userDAO.save(u);
        System.out.println("Done saving data");
    }
}
