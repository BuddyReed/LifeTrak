package com.buddy.lifetrak.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "lifetasks")
public class LifeTask {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty
	@Size(min=3, max=40)
	private String lifeTask;
	
    @Future 
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dueBy;
	
	@NotEmpty
	private String trakTask;
	
	@NotEmpty
	@Size(min = 5, max = 200)
	private String description;
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
	
//    RELATIONSHIP 
    
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User creator;

	public LifeTask() {}
	
	public LifeTask(@NotEmpty @Size(min = 3, max = 40) String lifeTask, @Past Date dueBy, @NotEmpty String trakTask,
			@NotEmpty @Size(min = 5, max = 200) String description) {
	super();
	this.lifeTask = lifeTask;
	this.dueBy = dueBy;
	this.trakTask = trakTask;
	this.description = description;
}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLifeTask() {
		return lifeTask;
	}

	public void setLifeTask(String lifeTask) {
		this.lifeTask = lifeTask;
	}

	public Date getDueBy() {
		return dueBy;
	}

	public void setDueBy(Date dueBy) {
		this.dueBy = dueBy;
	}

	public String getTrakTask() {
		return trakTask;
	}

	public void setTrakTask(String trakTask) {
		this.trakTask = trakTask;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}
	    
}
