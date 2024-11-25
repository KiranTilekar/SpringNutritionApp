package com.yash.nutritionapp.controller;

import com.yash.nutritionapp.Exception.UserBlockedException;
import com.yash.nutritionapp.command.LoginCommand;
import com.yash.nutritionapp.command.TempCommand;
import com.yash.nutritionapp.command.UserCommand;
import com.yash.nutritionapp.domain.User;
import com.yash.nutritionapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m) {
        System.out.println("temp command loading...");
        TempCommand cmd = new TempCommand();
        m.addAttribute("command", cmd);
        return "index1"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/login_form")
    public String loginPage() {
        return "login_form"; // /WEB-INF/view/login_form.jsp
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("command") LoginCommand cmd,Model m, HttpSession session) {
        try {
            User loggedInUser = userService.login(cmd.getLoginName(), cmd.getPassword());

            if(loggedInUser == null) {
                m.addAttribute("err", "Login failed enter valid credentials");
                return "login_form";
            }
            else {
                //success
                // check role and redirect to appropriate dashboard

                if(loggedInUser.getRole().equals(UserService.ROLE_ADMIN)) {
                    addUserInSession(loggedInUser, session);
                    return "redirect:admin_dashboard";
                }
                else if (loggedInUser.getRole().equals(UserService.ROLE_USER)) {
                    addUserInSession(loggedInUser, session);
                    return "redirect:user_dashboard";
                }
                else {
                    m.addAttribute("err", "invalid user role");
                    return "login_form";
                }
            }
        }
        catch (Exception ex) {
            m.addAttribute("error while login user");
            ex.printStackTrace();
            return "login_form";
        }
    }

    @RequestMapping(value = {"/logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        return "index1";
    }

    @RequestMapping(value = "/user_dashboard")
    public String userDashboard(HttpSession session) {
        if(session.getAttribute("user") == null) {
            return "redirect:login_form";
        }
        return "dashboard_user"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/admin_dashboard")
    public String adminDashboard() {
        return "dashboard_admin"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/reg_form")
    public String registrationForm(Model m) {
        UserCommand cmd = new UserCommand();
        m.addAttribute("command", cmd);
        return "reg_form";//JSP
    }

    @RequestMapping(value = "/register")
    public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m) {
        try {
            User user = cmd.getUser();
            user.setRole(UserService.ROLE_USER);
            userService.register(user);
            return "redirect:login_form?act=reg"; //Login Page
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            m.addAttribute("err", "Username is already registered. Please select another username.");
            return "reg_form";//JSP
        }
    }

    @RequestMapping(value = "/admin_users")
    public String getUserList(Model m) {
        m.addAttribute("userList", userService.getUserList());
        return "users"; //JSP
    }

    @RequestMapping(value = "/check_avail")
    @ResponseBody
    public String checkAvailability(@RequestParam String username) {
        if(userService.isUsernameExist(username)){
            return "This username is already taken. Choose another name";
        }else{
            return "Yes! You can take this";
        }
    }

    @RequestMapping(value = "/change_status")
    @ResponseBody
    public String changeLoginStatus(@RequestParam Integer userId, @RequestParam Integer loginStatus) {
        try {
            userService.changeLoginStatus(userId, loginStatus);
            return "SUCCESS: Status Changed";
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR: Unable to Change Status";
        }
    }

    @RequestMapping(value = "/bmiCalculator")
    public String bmiCalculator() {
        return "bmiCalculator"; // /WEB-INF/view/index.jsp
    }

    private void addUserInSession(User u, HttpSession session) {
        session.setAttribute("user", u);
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
        session.setAttribute("preference", u.getPreference());
        session.setAttribute("category", u.getCategory());
    }
}
