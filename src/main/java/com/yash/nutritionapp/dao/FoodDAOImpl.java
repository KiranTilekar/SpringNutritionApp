package com.yash.nutritionapp.dao;

import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Meal;
import com.yash.nutritionapp.rm.FoodRowMapper;
import com.yash.nutritionapp.rm.GetUserMealRowMapper;
import com.yash.nutritionapp.rm.MealRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FoodDAOImpl extends BaseDAO implements FoodDAO {

    @Override
    public void save(Food c) {
        String sql = "INSERT INTO contact(userId, name, phone, email, address, remark) VALUES(:userId, :name, :phone, :email, :address, :remark)";
        Map m = new HashMap();
        m.put("userId", c.getUserId());
        m.put("name", c.getName());
//        m.put("phone", c.getPhone());
//        m.put("email", c.getEmail());
//        m.put("address", c.getAddress());
//        m.put("remark", c.getRemark());
        SqlParameterSource ps = new MapSqlParameterSource(m);
        KeyHolder kh = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, ps, kh);
//        c.setContactId(kh.getKey().intValue());
    }

    @Override
    public void update(Food c) {
        String sql = "UPDATE contact " +
                "SET name=:name, phone=:phone, email=:email, address=:address, remark=:remark WHERE contactId=:contactId";
        Map m = new HashMap();
//        m.put("contactId", c.getContactId());
//        m.put("name", c.getName());
//        m.put("phone", c.getPhone());
//        m.put("email", c.getEmail());
//        m.put("address", c.getAddress());
//        m.put("remark", c.getRemark());
        getNamedParameterJdbcTemplate().update(sql, m);
    }

//    @Override
//    public void delete(Food c) {
//        this.delete(c.getContactId());
//    }

    @Override
    public void delete(Integer foodId) {
        String sql = "DELETE FROM userMeal WHERE foodId=?";
        getJdbcTemplate().update(sql, foodId);
        System.out.println("meal deleted");
    }

    @Override
    public Food findById(Integer userId) {
        String sql = "SELECT mealId, userId, foodId FROM usermeal WHERE "+userId+"=?";
        return getJdbcTemplate().queryForObject(sql, new FoodRowMapper(), userId);
    }

    @Override
    public List<Food> findAll() {
        String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact";
        return getJdbcTemplate().query(sql, new FoodRowMapper());
    }

    @Override
    public List<Food> findByProperty(String propName, Object propValue) {
        System.out.println(propName + propValue);
        String sql = "SELECT f.foodId, f.name AS foodName FROM nutritionapp.usermeal um " +
                "JOIN nutritionapp.food f ON um.foodId = f.foodId WHERE um." + propName + "=?";

        return getJdbcTemplate().query(sql, new GetUserMealRowMapper(), propValue);
    }


}
