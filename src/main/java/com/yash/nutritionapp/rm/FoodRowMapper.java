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
        f.setCarbohydrate(rs.getString("carbohydrate"));
        f.setProtein(rs.getString("protein"));
        f.setFat(rs.getString("fat"));
        f.setIron(rs.getString("iron"));
        f.setMagnesium(rs.getString("magnesium"));
        f.setPhosphorous(rs.getString("phosphorous"));
        f.setCategory(rs.getString("category"));
        f.setFoodImage(rs.getString("foodImage"));

        return f;
    }
}
