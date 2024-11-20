package com.yash.nutritionapp.domain;

public class Food {

    private Integer foodId;
    private Integer userId;
    private String name;
    private String carbohydrate;
    private String protein;
    private String fat;
    private String iron;
    private String magnesium;
    private String phosphorous;
    private String category;

    public Food() {

    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCarbohydrate() {
        return carbohydrate;
    }

    public void setCarbohydrate(String carbohydrate) {
        this.carbohydrate = carbohydrate;
    }

    public String getProtein() {
        return protein;
    }

    public void setProtein(String protein) {
        this.protein = protein;
    }

    public String getFat() {
        return fat;
    }

    public void setFat(String fat) {
        this.fat = fat;
    }

    public String getIron() {
        return iron;
    }

    public void setIron(String iron) {
        this.iron = iron;
    }

    public String getMagnesium() {
        return magnesium;
    }

    public void setMagnesium(String magnesium) {
        this.magnesium = magnesium;
    }

    public String getPhosphorous() {

        return phosphorous;
    }

    public void setPhosphorous(String phosphorous) {

        this.phosphorous = phosphorous;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodId=" + foodId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", carbohydrate='" + carbohydrate + '\'' +
                ", protein='" + protein + '\'' +
                ", fat='" + fat + '\'' +
                ", iron='" + iron + '\'' +
                ", magnesium='" + magnesium + '\'' +
                ", phosphorous='" + phosphorous + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
