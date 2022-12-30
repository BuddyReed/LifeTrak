package com.buddy.lifetrak.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.buddy.lifetrak.models.LifeTask;
import com.buddy.lifetrak.services.LifeTaskService;
import com.buddy.lifetrak.services.UserService;

@Controller
public class LifeTrakController {

	@Autowired
	UserService userServ;
	
	@Autowired
	LifeTaskService taskServ;
	
	@GetMapping("/")
	public String index() {
		return "/lifetrak/home.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(
			@ModelAttribute("taskObj")LifeTask emptyLifeTask,
	HttpSession session, Model model 
	) {
		Long userId = (Long) session.getAttribute("user_id");// WE ARE CASTING TO LONG BECAUSE WE NEED TO CHANGE FROM A OBJECT
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		// THIS ALLOW USE TO SHOW THE USER NAME ON THE PAGE
		model.addAttribute("oneUser", userServ.getOneUser(userId));
		return "/lifetrak/dashboard.jsp";
	}
	
	// CREATE FOR DASHBOARD
	
	@PostMapping("/dashboard/new")
	public String processDashTask(
		@Valid @ModelAttribute("taskObj") LifeTask filledLifeTask,
		BindingResult results
	) {
		// VALIDATIONS FAIL
		if(results.hasErrors()) {
			return "/lifetrak/dashboard.jsp";
		}
		
		taskServ.createLifeTask(filledLifeTask);
		return "redirect:/alltask";
	}
	
	
// CREATE LIFETASK AND SHOW ALL TASK
	
	@GetMapping("/alltask")
	public String allTask(
			@ModelAttribute("taskObj") LifeTask emptyLifeTask,
			HttpSession session, Model model
	) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		model.addAttribute("yearlyLifeTasks", taskServ.getYearlyTask());
		model.addAttribute("monthlyLifeTasks", taskServ.getMonthlyTask());
		model.addAttribute("weeklyLifeTasks", taskServ.getWeeklyTask());
		model.addAttribute("dailyLifeTasks", taskServ.getDailyTask());
		return "/lifetrak/alltask.jsp";
	}
	
	@PostMapping("/alltask/new")
	public String processBaby(
		@Valid @ModelAttribute("taskObj") LifeTask filledLifeTask,
		BindingResult results, Model model
	) {
		// VALIDATIONS FAIL
		model.addAttribute("yearlyLifeTasks", taskServ.getYearlyTask());
		model.addAttribute("monthlyLifeTasks", taskServ.getMonthlyTask());
		if(results.hasErrors()) {
			return "/lifetrak/alltask.jsp";
		}
		
		taskServ.createLifeTask(filledLifeTask);
		return "redirect:/alltask";
	}
	
	
	// EDIT/UPDATE TASK
	
	@GetMapping("/alltask/{id}/edit")
	public String edit(
		@PathVariable("id") Long id,
		Model model, HttpSession session
	) {
		model.addAttribute("yearlyLifeTasks", taskServ.getYearlyTask());
		model.addAttribute("monthlyLifeTasks", taskServ.getMonthlyTask());
		model.addAttribute("weeklyLifeTasks", taskServ.getWeeklyTask());
		model.addAttribute("dailyLifeTasks", taskServ.getDailyTask());
		model.addAttribute("taskObj", taskServ.getOneLifeTask(id));
		return "/lifetrak/edit.jsp";
	}
	
	@PutMapping("/alltask/{id}/edit")
	public String update(
		@Valid @ModelAttribute("taskObj") LifeTask filledLifeTask,
		BindingResult results
	) {
		if(results.hasErrors()) {
			return "/lifetrak/edit.jsp";
		}
		taskServ.createLifeTask(filledLifeTask);
		return "redirect:/alltask";
	}
	
	
	// DELETE TASK
	@GetMapping("/alltask/{id}/delete")
	public String delete(
		@PathVariable("id") Long id
	) {
		taskServ.deleteLifeTask(id);
		return "redirect:/alltask";
	}
	
	

	
}
