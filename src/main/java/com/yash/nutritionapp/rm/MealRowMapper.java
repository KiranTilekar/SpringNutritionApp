package com.yash.nutritionapp.rm;

import com.yash.nutritionapp.domain.Meal;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MealRowMapper implements RowMapper<Meal> {

    @Override
    public Meal mapRow(ResultSet rs, int i) throws SQLException {

        Meal m = new Meal();

        m.setMealID(rs.getInt("mealId"));
        m.setUserId(rs.getInt("userId"));
        m.setFoodId(rs.getInt("foodId"));

        return m;
    }
}