package com.buddy.lifetrak.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.buddy.lifetrak.models.LoginUser;
import com.buddy.lifetrak.models.User;
import com.buddy.lifetrak.services.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
//	SHOW SIGN UP ROUTE
	@GetMapping("/signup")
	public String index(
		@ModelAttribute("newUser") User emptyUser,
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "/user/signup.jsp";
	}
	
	
	
	// PROCESS REGISTER
	@PostMapping("/register")
	public String register(
		@Valid @ModelAttribute("newUser") User filledUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User createdUser = userServ.register(filledUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "/user/signup.jsp";
		}
		// SAVE THE USERS ID IN SESSION
		session.setAttribute("user_id", createdUser.getId());
		return "redirect:/dashboard";
	}
	
	
	
//	SHOW LOG IN ROUTE
	
	@GetMapping("/signin")
	public String login(
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "/user/signin.jsp";
	}
	
	
	// PROCESS LOGIN
	@PostMapping("/login")
	public String loginProcess(
		@Valid @ModelAttribute("newLogin") LoginUser filledLoginUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User loggedUser = userServ.login(filledLoginUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/user/signin.jsp";
		}
		session.setAttribute("user_id", loggedUser.getId()); 
		return "redirect:/dashboard";
	}
	
	
	
	
	
//	LOGOUT 
	
	@GetMapping("/logout")
	public String logout(
		HttpSession session
	) {
		session.invalidate();
		return "redirect:/";
	}

	
	
	
	// THIS ROUTE ALLOWS YOU TO DISPLAY USERS NAME AS WELL.
	
//	@GetMapping("/homepage")
//	public String homepage(
//		HttpSession session,
//		Model model // VIEW MODEL ANY INFO FROM CONTROLLER TO JSP
//	) {		
//		Long userId = (Long) session.getAttribute("user_id");// WE ARE CASTING TO LONG BECAUSE WE NEED TO CHANGE FROM A OBJECT
//		if(session.getAttribute("user_id") == null) {
//			return "redirect:/";
//		}
//		model.addAttribute("oneUser", userServ.getOneUser(userId));
//		return "dashboard.jsp";
//		
//	}
	
	
//	Original LOG and REG Route
	
//	
//	@GetMapping("/signup")
//	public String index(
//		@ModelAttribute("newUser") User emptyUser,
//		@ModelAttribute("newLogin") LoginUser emptyLoginUser
//	) {
//		return "/user/signup.jsp";
//	}
	
	
}
