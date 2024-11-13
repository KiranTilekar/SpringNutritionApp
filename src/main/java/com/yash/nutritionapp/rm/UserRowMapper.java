package com.yash.nutritionapp.rm;

import com.yash.nutritionapp.domain.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        User u = new User();
        u.setUserId(rs.getInt("userId"));
        u.setName(rs.getString("name"));
        u.setEmail(rs.getString("email"));
        u.setLoginName(rs.getString("loginName"));
        u.setHeight(rs.getFloat("height"));
        u.setWeight(rs.getInt("weight"));
        u.setBMI(rs.getFloat("BMI"));
        u.setRole(rs.getInt("role"));

        return u;
    }
}
