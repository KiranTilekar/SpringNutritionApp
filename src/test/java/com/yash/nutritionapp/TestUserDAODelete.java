package com.yash.nutritionapp;

import com.yash.nutritionapp.config.SpringRootConfig;
import com.yash.nutritionapp.dao.UserDAO;
import com.yash.nutritionapp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAODelete {
    public static void main(String[] args) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO = ctx.getBean(UserDAO.class);
        userDAO.delete(1);

        System.out.println("------ Done deleting data ----------");
    }
}
