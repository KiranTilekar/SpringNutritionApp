package com.yash.nutritionapp.model;

import org.springframework.web.multipart.MultipartFile;

public class ImageModel {

    private MultipartFile image;

    public ImageModel(MultipartFile image) {

        this.image = image;
    }

    public MultipartFile getImage() {

        return image;
    }

    public void setImage(MultipartFile image) {

        this.image = image;
    }
}
