package com.buddy.lifetrak.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buddy.lifetrak.models.LifeTask;
import com.buddy.lifetrak.repositories.LifeTaskRepository;
import com.buddy.lifetrak.repositories.UserRepository;

@Service
public class LifeTaskService {

	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	LifeTaskRepository lifetaskRepo;
	
	// ------------- CRUD FOR MANY FROM THE ONE TO MANY SIDE (MANY NINJAS ----------------//	
	// CREATE
	public LifeTask createLifeTask(LifeTask lifetask) {
		return lifetaskRepo.save(lifetask);
	}
	// READ ONE
	public LifeTask getOneLifeTask(Long id) {
		return lifetaskRepo.findById(id).orElse(null);
	}
	// READ ALL
	public List<LifeTask> getAllLifeTasks(){
		return lifetaskRepo.findAll();
	}
	// UPDATE
	public LifeTask updateLifeTask(LifeTask updatedLifeTask) {
		return lifetaskRepo.save(updatedLifeTask);
	}
	// DELETE
	public void deleteLifeTask(Long id) {
		lifetaskRepo.deleteById(id);
	}
	
	public List<LifeTask> getYearlyTask(){
		return lifetaskRepo.findByTrakTask("Yearly");
	}
	
	public List<LifeTask> getMonthlyTask(){
		return lifetaskRepo.findByTrakTask("Monthly");
	}
	
	public List<LifeTask> getWeeklyTask(){
		return lifetaskRepo.findByTrakTask("Weekly");
	}
	
	public List<LifeTask> getDailyTask(){
		return lifetaskRepo.findByTrakTask("Daily");
	}
	
}
