package com.yash.nutritionapp.rm;

import com.yash.nutritionapp.domain.Food;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GetUserMealRowMapper implements RowMapper<Food> {

    @Override
    public Food mapRow(ResultSet rs, int i) throws SQLException {
        Food f = new Food();

        // Map both columns from the result set
        f.setFoodId(rs.getInt("foodId"));
        f.setName(rs.getString("foodName"));

        return f;
    }
}

