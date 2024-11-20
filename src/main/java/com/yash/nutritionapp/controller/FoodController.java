package com.yash.nutritionapp.controller;

import com.yash.nutritionapp.command.FoodCommand;
import com.yash.nutritionapp.domain.Food;
import com.yash.nutritionapp.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;

@Controller
public class FoodController {

    @Autowired
    private FoodService foodService;

    @RequestMapping(value="/makeYourMeal")
    public String foodForm(Model m) {
        FoodCommand cmd = new FoodCommand();
        m.addAttribute("command", cmd);
        m.addAttribute("foodList", foodService.getFoodList());
        return "food_form";
    }

    @RequestMapping(value = "/user_edit_contact")
    public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer contactId) {
        session.setAttribute("aContactId", contactId);
        Food c = foodService.findById(contactId);
        m.addAttribute("command", c);
        return "contact_form";//JSP form view
    }

    @RequestMapping(value = "/user_save_contact")
    public String saveOrUpdateContact(@ModelAttribute("command") Food c, Model m, HttpSession session) {
        Integer contactId = (Integer) session.getAttribute("aContactId");
//        System.out.println("contactId in user_save_contact:" + contactId);
        if (contactId == null) {
            //save task
            try {
                Integer userId = (Integer) session.getAttribute("userId");
                c.setUserId(userId);//FK ; logged in userId
                foodService.save(c);
                return "redirect:user_clist?act=sv";//redirect user to contact list url
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("err", "Failed to save contact");
                return "contact_form";
            }
        } else {
            //update task
            try {
//                c.setContactId(contactId); //PK
                foodService.update(c);
                session.removeAttribute("aContactId");
                return "redirect:user_clist?act=ed";//redirect user to contact list url
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("err", "Failed to Edit contact");
                return "contact_form";
            }
        }
    }

    @RequestMapping(value="/seeMeal")
    public String userMealList(Model m, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        m.addAttribute("mealList", foodService.findUserMeal(userId));
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
//        return "demo";
    }

    @RequestMapping(value="/recommendedMeal")
    public String getFoodById(Model m, HttpSession session) {
        String category = session.getAttribute("category").toString();
        System.out.println("category = " + category);
        m.addAttribute("recommendedMeal", foodService.getRecommendedMeal(category));
        return "customMeal";
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