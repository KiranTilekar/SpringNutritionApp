package com.yash.nutritionapp.service;

import com.yash.nutritionapp.dao.BaseDAO;
import com.yash.nutritionapp.dao.FoodDAO;
import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Meal;
import com.yash.nutritionapp.rm.FoodRowMapper;
import com.yash.nutritionapp.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

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


}