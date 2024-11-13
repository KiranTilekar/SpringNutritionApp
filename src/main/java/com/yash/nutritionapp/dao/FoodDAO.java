package com.yash.nutritionapp.dao;

import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Meal;

import java.util.List;

public interface FoodDAO {

    public void save(Food c);
    public void update(Food c);
//    public void delete(Food c);
    public void delete(Integer foodId);
    public Food findById(Integer userId);
    public List<Food> findAll();
    public List<Food> findByProperty(String propName, Object propValue);
}
