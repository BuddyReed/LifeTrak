package com.buddy.lifetrak.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.buddy.lifetrak.models.LifeTask;


@Repository
public interface LifeTaskRepository extends CrudRepository<LifeTask, Long> {
	List<LifeTask> findAll();
	
	List<LifeTask> findByTrakTask(String search);

}
