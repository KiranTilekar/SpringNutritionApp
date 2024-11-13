package com.yash.nutritionapp.domain;

import javax.persistence.criteria.CriteriaBuilder;

public class Meal {

    private Integer mealID;
    private Integer userId;
    private Integer foodId;

    public Integer getMealID() {
        return mealID;
    }

    public void setMealID(Integer mealID) {
        this.mealID = mealID;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    @Override
    public String toString() {
        return "Meal{" +
                "mealID=" + mealID +
                ", userId=" + userId +
                ", foodId=" + foodId +
                '}';
    }
}
