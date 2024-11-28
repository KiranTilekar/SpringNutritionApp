package com.yash.nutritionapp.service;

import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Meal;

import java.sql.Blob;
import java.util.List;

public interface FoodService {
    public void save(Food c);
    public void update(Food c);
    public void delete(Integer foodId);
    public void delete(Integer[] contactIds);

    public List<Food> findUserMeal(Integer userId);

    public List<Food> findUserContact(Integer userId, String txt);

    public Food findById(Integer contactId);

    public List<Food> getFoodList();

    public Food getFoodById(Integer foodId);

    public void setFoodById(Integer foodId, Integer userId);

    public List<Food> getRecommendedMeal(String category, String preference);

    Food getNutritionSummary(List<Food> recommendedMeal);

    void addFood(Food food);

    public void updateImage(int foodId, Blob foodImage);

    public List<Food> viewAllFood();
}