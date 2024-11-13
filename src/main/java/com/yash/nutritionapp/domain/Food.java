package com.yash.nutritionapp.domain;

public class Food {

    private Integer foodId;
    private Integer userId;
    private String name;
    private String carbohydrate;
    private String protien;
    private String fat;
    private String iron;
    private String magnesium;
    private String phosphorous;

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

    public String getProtien() {
        return protien;
    }

    public void setProtien(String protien) {
        this.protien = protien;
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

    @Override
    public String toString() {
        return "Contact{" +
                "foodId=" + foodId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", carbohydrate='" + carbohydrate + '\'' +
                ", protien='" + protien + '\'' +
                ", fat='" + fat + '\'' +
                ", iron='" + iron + '\'' +
                ", magnesium='" + magnesium + '\'' +
                ", phosphorous='" + phosphorous + '\'' +
                '}';
    }
}
