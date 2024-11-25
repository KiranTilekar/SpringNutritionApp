package com.yash.nutritionapp.service;

import com.yash.nutritionapp.dao.BaseDAO;
import com.yash.nutritionapp.dao.FoodDAO;
import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Meal;
import com.yash.nutritionapp.domain.User;
import com.yash.nutritionapp.rm.FoodRowMapper;
import com.yash.nutritionapp.rm.UserRowMapper;
import com.yash.nutritionapp.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FoodServiceImpl extends BaseDAO implements FoodService {

    @Autowired
    private FoodDAO foodDAO;

    @Override
    public void save(Food c) {
        foodDAO.save(c);
    }

    @Override
    public void update(Food c) {
        foodDAO.update(c);
    }

    @Override
    public void delete(Integer foodId) {
        foodDAO.delete(foodId);
    }

    @Override
    public void delete(Integer[] contactIds) {
        String ids = StringUtil.toCommaSeparatedString(contactIds);
        String sql = "DELETE FROM contact WHERE contactId IN("+ids+")";
        getJdbcTemplate().update(sql);
    }

    @Override
    public List<Food> findUserMeal(Integer userId) {
        return foodDAO.findByProperty("userId", userId);
    }

    @Override
    public List<Food> findUserContact(Integer userId, String txt) {

        String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact WHERE userId=? AND (name LIKE '%"+txt+"%' OR address LIKE '%"+txt+"%' OR phone LIKE '%"+txt+"%' OR email LIKE '%"+txt+"%' OR remark LIKE '%"+txt+"%')";
        return getJdbcTemplate().query(sql, new FoodRowMapper(),userId);
    }

    @Override
    public Food findById(Integer contactId) {
        return foodDAO.findById(contactId);
    }

    @Override
    public List<Food> getFoodList() {
        String sql = "select * from food";
        return getJdbcTemplate().query(sql, new FoodRowMapper());
    }

    @Override
    public Food getFoodById(Integer foodId) {
        String sql = "select * from food where foodId=?";
        Food f = getJdbcTemplate().queryForObject(sql, new FoodRowMapper(), foodId);
        return f;
    }

    @Override
    public void setFoodById(Integer foodId, Integer userId) {
        String sql = "insert into userMeal (userId, foodId) VALUES (:userId, :foodId)";

        Map m = new HashMap();
        m.put("userId", userId);
        m.put("foodId", foodId);

        KeyHolder kh = new GeneratedKeyHolder(); // bind auto-incremented value
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer mealId = kh.getKey().intValue();

    }

    @Override
    public List<Food> getRecommendedMeal(String category, String preference) {
        String sql;
        System.out.println(category + preference);
        if(Objects.equals(preference, "Veg")) {
            sql = "SELECT * FROM food WHERE category = '" + category + "' and preference = 'Veg'";
            System.out.println();
        } else {
            sql = "SELECT * FROM food WHERE category = '" + category + "'";
        }
        List<Food> food = getJdbcTemplate().query(sql, new FoodRowMapper());
        return food;
    }

    @Override
    public Food getNutritionSummary(List<Food> recommendedMeal) {

        System.out.println("inside getNutritionSummary" + recommendedMeal);
        float carbohydrate = 0;
        float protein = 0;
        float fat = 0;
        float iron = 0;
        float magnesium = 0;
        float phosphorous = 0;
        Integer calories = 0;

        for(Food f: recommendedMeal) {
            carbohydrate += f.getCarbohydrate();
            protein += f.getProtein();
            fat += f.getFat();
            iron += f.getIron();
            magnesium += f.getMagnesium();
            phosphorous += f.getPhosphorous();
            calories += f.getCalories();
        }

        Food foodSummary = new Food(carbohydrate, protein, fat, iron, magnesium, phosphorous, calories);
        System.out.println("total food nutrient: " + foodSummary);
        return foodSummary;
    }

    @Override
    public void addFood(Food f) {
        System.out.println("inside food service impl ");
        String sql = "INSERT INTO Food(name, carbohydrate, protein, fat, iron, magnesium, phosphorous, calories, category, foodImage, preference)"
                + "VALUES(:name, :carbohydrate, :protein, :fat, :iron, :magnesium, :phosphorous, :calories, :category, :foodImage, :preference)";

        Map m = new HashMap();
        m.put("name", f.getName());
        m.put("carbohydrate", f.getCarbohydrate());
        m.put("protein", f.getProtein());
        m.put("fat", f.getFat());
        m.put("iron", f.getIron());
        m.put("magnesium", f.getMagnesium());
        m.put("phosphorous", f.getPhosphorous());
        m.put("calories", f.getCalories());
        m.put("category", f.getCategory());
        m.put("foodImage", f.getFoodImage());
        m.put("preference", f.getPreference());

        KeyHolder kh = new GeneratedKeyHolder(); // bind auto-incremented value
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer foodId = kh.getKey().intValue();
        f.setUserId(foodId);
    }


}