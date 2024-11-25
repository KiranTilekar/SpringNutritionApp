package com.yash.nutritionapp.service;

import com.yash.nutritionapp.dao.ImageDao;
import com.yash.nutritionapp.domain.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {

    @Autowired
    private ImageDao imageDao;

    public void saveImage(Image image) {
        imageDao.saveImage(image);
    }

    public Image getImage(Long id) {
        return imageDao.getImage(id);
    }
}