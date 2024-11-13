package com.yash.nutritionapp.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan (basePackages = {"com.yash.nutritionapp.dao", "com.yash.nutritionapp.service"})
public class SpringRootConfig {
    //TODO: Services, DAO, DataSource, Email Sender or some other business layer beans
    @Bean
    public BasicDataSource getDataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/nutritionApp");
        ds.setUsername("root");
        ds.setPassword("root");
        ds.setMaxTotal(2); // maximum number of connections we can do
        ds.setInitialSize(1); // initially we can do 1 connection
        ds.setTestOnBorrow(true); // connection will tested by validation query when borrowed
        ds.setValidationQuery("SELECT 1"); // test query to check connection
        ds.setDefaultAutoCommit(true); // by default query will run
        return ds;
    }
}
