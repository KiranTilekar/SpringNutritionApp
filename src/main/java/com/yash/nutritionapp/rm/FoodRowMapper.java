package com.yash.nutritionapp.rm;

import com.yash.nutritionapp.domain.Food;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FoodRowMapper implements RowMapper<Food> {

    @Override
    public Food mapRow(ResultSet rs, int i) throws SQLException {
        Food f = new Food();

        // Map both columns from the result set
        f.setFoodId(rs.getInt("foodId"));
        f.setName(rs.getString("name"));
        f.setCarbohydrate(rs.getFloat("carbohydrate"));
        f.setProtein(rs.getFloat("protein"));
        f.setFat(rs.getFloat("fat"));
        f.setIron(rs.getFloat("iron"));
        f.setMagnesium(rs.getFloat("magnesium"));
        f.setPhosphorous(rs.getFloat("phosphorous"));
        f.setCalories(rs.getInt("calories"));
        f.setCategory(rs.getString("category"));
        f.setFoodImage(rs.getString("foodImage"));
        f.setPreference(rs.getString("preference"));

        return f;
    }
}
