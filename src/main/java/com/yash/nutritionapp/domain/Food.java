package com.yash.nutritionapp.domain;

import com.sun.scenario.effect.impl.prism.PrImage;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import java.sql.Blob;

public class Food {

    private Integer foodId;
    private Integer userId;
    private String name;
    private float carbohydrate;
    private float protein;
    private float fat;
    private float iron;
    private float magnesium;
    private float phosphorous;
    private Integer calories;
    private String category;
    private String preference;
    private Blob foodImage;
    private String measurement;

    public Food() {
    }

    public Food(float carbohydrate, float protein, float fat, float iron, float magnesium, float phosphorous, Integer calories) {
        this.carbohydrate = carbohydrate;
        this.protein = protein;
        this.fat = fat;
        this.iron = iron;
        this.magnesium = magnesium;
        this.phosphorous = phosphorous;
        this.calories = calories;
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

    public float getCarbohydrate() {
        return carbohydrate;
    }

    public void setCarbohydrate(float carbohydrate) {
        this.carbohydrate = carbohydrate;
    }

    public float getProtein() {
        return protein;
    }

    public void setProtein(float protein) {
        this.protein = protein;
    }

    public float getFat() {
        return fat;
    }

    public void setFat(float fat) {
        this.fat = fat;
    }

    public float getIron() {
        return iron;
    }

    public void setIron(float iron) {
        this.iron = iron;
    }

    public float getMagnesium() {
        return magnesium;
    }

    public void setMagnesium(float magnesium) {
        this.magnesium = magnesium;
    }

    public float getPhosphorous() {
        return phosphorous;
    }

    public void setPhosphorous(float phosphorous) {
        this.phosphorous = phosphorous;
    }

    public Integer getCalories() {
        return calories;
    }

    public void setCalories(Integer calories) {
        this.calories = calories;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Blob getFoodImage() {
        return foodImage;
    }

    public void setFoodImage(Blob foodImage) {
        this.foodImage = foodImage;
    }

    public String getPreference() {
        return preference;
    }

    public void setPreference(String preference) {
        this.preference = preference;
    }

    public String getMeasurement() {
        return measurement;
    }

    public void setMeasurement(String measurement) {
        this.measurement = measurement;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodId=" + foodId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", carbohydrate=" + carbohydrate +
                ", protein=" + protein +
                ", fat=" + fat +
                ", iron=" + iron +
                ", magnesium=" + magnesium +
                ", phosphorous=" + phosphorous +
                ", calories=" + calories +
                ", category='" + category + '\'' +
                ", preference='" + preference + '\'' +
                ", foodImage=" + foodImage +
                ", measurement='" + measurement + '\'' +
                '}';
    }
}
