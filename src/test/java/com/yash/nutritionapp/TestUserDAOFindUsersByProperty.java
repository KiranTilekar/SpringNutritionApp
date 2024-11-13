package com.yash.nutritionapp;

import com.yash.nutritionapp.config.SpringRootConfig;
import com.yash.nutritionapp.dao.UserDAO;
import com.yash.nutritionapp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class TestUserDAOFindUsersByProperty {
    public static void main(String[] args) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);

        List<User> users = userDAO.findByProperty("userId",1);

        System.out.println("------ Done fetching user by property ----------");
        System.out.println(users);
    }
}
