package com.yash.nutritionapp.controller;

import com.yash.nutritionapp.command.FoodCommand;
import com.yash.nutritionapp.command.TempCommand;
import com.yash.nutritionapp.command.UserCommand;
import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.domain.Image;
import com.yash.nutritionapp.domain.User;
import com.yash.nutritionapp.service.FoodService;
import com.yash.nutritionapp.service.ImageService;
import com.yash.nutritionapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

@Controller
public class FoodController {

    @Autowired
    private FoodService foodService;

    @Autowired
    private ImageService imageService;

    @RequestMapping(value="/makeYourMeal")
    public String foodForm(Model m) {
        FoodCommand cmd = new FoodCommand();
        m.addAttribute("command", cmd);
        m.addAttribute("foodList", foodService.getFoodList());
        System.out.println("food list: " + foodService.getFoodList());
        return "food_form";
    }

    @GetMapping("/displayFoodImage/{foodId}")
    public void showFoodImage(@PathVariable int foodId,
                              HttpServletResponse response) throws IOException, SQLException {
        Food food = foodService.getFoodById(foodId);
        System.out.println("food" + food);
        if (food != null && food.getFoodImage() != null) {
            Blob imageBlob = food.getFoodImage();

            response.setContentType("image/jpeg");
            ServletOutputStream outputStream = response.getOutputStream();

            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
            outputStream.write(imageBytes);
            outputStream.flush();
            outputStream.close();
        }
    }



    @RequestMapping(value = "/user_edit_contact")
    public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer contactId) {
        session.setAttribute("aContactId", contactId);
        Food c = foodService.findById(contactId);
        m.addAttribute("command", c);
        return "contact_form";//JSP form view
    }

//    @RequestMapping(value = "/user_save_contact")
//    public String saveOrUpdateContact(@ModelAttribute("command") Food c, Model m, HttpSession session) {
//        Integer contactId = (Integer) session.getAttribute("aContactId");
////        System.out.println("contactId in user_save_contact:" + contactId);
//        if (contactId == null) {
//            //save task
//            try {
//                Integer userId = (Integer) session.getAttribute("userId");
//                c.setUserId(userId);//FK ; logged in userId
//                foodService.save(c);
//                return "redirect:user_clist?act=sv";//redirect user to contact list url
//            } catch (Exception e) {
//                e.printStackTrace();
//                m.addAttribute("err", "Failed to save contact");
//                return "contact_form";
//            }
//        } else {
//            //update task
//            try {
////                c.setContactId(contactId); //PK
//                foodService.update(c);
//                session.removeAttribute("aContactId");
//                return "redirect:user_clist?act=ed";//redirect user to contact list url
//            } catch (Exception e) {
//                e.printStackTrace();
//                m.addAttribute("err", "Failed to Edit contact");
//                return "contact_form";
//            }
//        }
//    }

    @RequestMapping(value="/seeMeal")
    public String userMealList(Model m, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        List<Food> mealList = foodService.findUserMeal(userId);
        System.out.println("mealList: " + mealList);
        m.addAttribute("mealList", mealList);
//        m.addAttribute("totalNutrient", foodService.getNutritionSummary(mealList));
        return "userMeal";
    }

    @RequestMapping(value="/remove_food")
    public String deleteContact(@RequestParam("fid") Integer foodId) {
        foodService.delete(foodId);
        return "redirect:seeMeal?act=del";
    }

    @RequestMapping(value = "/user_bulk_cdelete")
    public String deleteBulkContact(@RequestParam("cid") Integer[] contactIds) {
        foodService.delete(contactIds);
        return "redirect:user_clist?act=del";
    }

    @RequestMapping(value = "/user_contact_search")
    public String contactSearch(Model m, HttpSession session, @RequestParam("freeText") String freeText) {
        Integer userId = (Integer) session.getAttribute("userId");
        m.addAttribute("contactList", foodService.findUserContact(userId, freeText));
        return "clist"; //JSP
    }

    @RequestMapping(value="/getFoodById")
    public String getFoodById(Model m, @RequestParam("foodId") Integer foodId) {
        m.addAttribute("foodById", foodService.getFoodById(foodId));
        return "foodDetails";
    }

    @RequestMapping(value="/setFoodById")
    public String setFoodById(@RequestParam("foodId") Integer foodId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        foodService.setFoodById(foodId,userId);
        return "redirect:makeYourMeal?ac=sv";
    }

    @RequestMapping(value="/recommendedMeal")
    public String getFoodById(Model m, HttpSession session) {
        String category = session.getAttribute("category").toString();
        String preference = session.getAttribute("preference").toString();
        System.out.println("preference"  + preference);
        List<Food> recommendedMeal = foodService.getRecommendedMeal(category, preference);
        m.addAttribute("recommendedMeal", recommendedMeal);
        m.addAttribute("nutritionSummary", foodService.getNutritionSummary(recommendedMeal));
        return "recommendedMeal";
    }

    @RequestMapping(value = "/addFoodForm")
    public String addFoodForm(Model m) {
        System.out.println("inside addFoodForm");
        FoodCommand foodCommand = new FoodCommand();
//        foodCommand.setFood(new Food());
        m.addAttribute("command", foodCommand);
        return "uploadImagePage";
    }



    @PostMapping(value = "/addFood")
    public String addFood(@ModelAttribute("command") FoodCommand cmd,  @RequestParam("file") MultipartFile file) {
        Food food = cmd.getFood();
        try {
            food.setFoodImage(new SerialBlob(file.getBytes()));
            System.out.println(food);
            foodService.addFood(food);
            return "redirect:admin_dashboard?act=add"; //Admin dashboard

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/updateFoodForm")
    public String updateFoodForm(Model m) {
        System.out.println("inside update food form");
        FoodCommand foodCommand = new FoodCommand();
        m.addAttribute("command", foodCommand);
        return "editFood";
    }

    @PostMapping(value="/updateFood")
    public String updateImage(@ModelAttribute("command") FoodCommand cmd, @RequestParam("file") MultipartFile file) {
        try {
            System.out.println("inside updat food...");
            int foodId = cmd.getFood().getFoodId();
            System.out.println("foodId" + foodId);
            Blob image = new SerialBlob(file.getBytes());
            System.out.println("image: " + image);
            foodService.updateImage(foodId, image);
            return "redirect:admin_dashboard";
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value="/learnMore")
    public String getNutrient(@RequestParam("id") Integer id) {

        if (id == 1) {
            return "protein";
        }
        else if (id == 2) {
            return "carbohydrates";
        }
        else if (id == 3) {
            return "fats";
        }
        else if (id == 4) {
            return "vitamins";
        }
        else if (id == 5) {
            return "iron";
        }
        else if (id == 6) {
            return "magnesium";
        }
        else if (id == 7) {
            return "phosphorous";
        }
        else if (id == 8) {
            return "water";
        }
        else {
            return null;
        }
    }
}