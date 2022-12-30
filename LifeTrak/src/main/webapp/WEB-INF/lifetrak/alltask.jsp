<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeTask</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- NEW LINKS -->
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel = "stylesheet">  
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">  
</script> 
<!-- Bootstrap icons  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>



<!-- NAVBAR  --> 
<section>
	<div class="container">
		<nav class="navbar navbar-dark bg-info fixed-top p-2 navcolor">
		  <div class="container-fluid">
		  <div class="navbar-edit d-none d-sm-block">	  
		    <a class="navbar-brand" href="/">LifeTrak</a>
		  </div>
		   <div class="navbar-edit ">	
		 <!--   NAV BAR LOGO   -->
		    <a class="navbar-brand" href="/">
		    	<img  class="img-fluid logo " src="/img/lifelogo.png" width="60px" height="100px" />
		    </a>
		  </div>
		    <button class="navbar-toggler me-5" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
		      <div class="offcanvas-header">
		        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">LifeTrak</h5>
		        <button type="button" class="btn-close btn-close-dark" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		      </div>
		      <div class="offcanvas-body">
		        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		          <li class="nav-item">
		            	<a class="nav-link active text-dark" aria-current="page" href="/">Home</a>
		          </li>
		          <li class="nav-item">
		          	  		          	 		          	  
		           		<a class="nav-link text-dark" href="/alltask">Life Task</a>
					 
		          </li>
		          <li class="nav-item">
		          	  					  
		           		<a class="nav-link text-dark" href="/dashboard">Dashboard</a>
					 
		          </li>
				  <li class="nav-item">
				  	<c:if test="${user_id == oneUser.creator.id}">
		            	<a class="nav-link text-dark" href="/signup">Sign Up</a>
		            </c:if>
		          </li>
		          <li class="nav-item">
		          	<c:if test="${user_id == oneUser.creator.id}">
		            	<a class="nav-link text-dark" href="/signin">Sign In</a>
		            </c:if>
		          </li>
			      <li class="nav-item">
	
				            <a class="nav-link text-dark" href="/logout">Logout</a> 
						     
			      </li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</nav>
	</div>
</section>


<!-- Task Tabs -->

<section>

	<div class="container alltask">
	
<!-- COLUMN 1 -->	
	
	<!-- Task Create Form -->
		<div class="row">
			        <div class="col-lg-4 col-sm-12 mb-5">
			          <div class="card" style="border-radius: 15px;">
			            <div class="card-body p-5">
			              <h2 class="text-uppercase text-center mb-5">Create lifetask</h2>
			
			<!-- FORM STARTS HERE -->
			            <form:form modelAttribute="taskObj" action="/alltask/new" method="POST">
			              <form:input type="hidden" path="creator" value="${user_id}" />
			                
			                <div class="form-outline mb-4">
			                  <form:label path="lifeTask" class="form-label">LifeTask:</form:label>
			                  <form:errors path="lifeTask" class="text-danger" />
			                  <form:input path="lifeTask" type="text" id="form3Example1cg" class="form-control form-control-lg" />
			                </div>
			                
			                <div class="form-outline mb-4">
			                  <form:label path="dueBy" class="form-label" for="form3Example4cg">Due by:</form:label>
			                  <form:errors path="dueBy" class="text-danger" />
			                  <form:input path="dueBy" type="date" id="form3Example4cg" class="form-control form-control-lg" />
			                </div>			
			
			
							<div class="input-group mb-3">
							  	  <label class="input-group-text bg-info" for="inputGroupSelect01">TrakTask:</label>
								  <form:select path="trakTask" class="form-select" id="inputGroupSelect01">
								    <form:option value="Daily">Daily</form:option>
								    <form:option value="Weekly">Weekly</form:option>
								    <form:option value="Monthly">Monthly</form:option>
								    <form:option value="Yearly">Yearly</form:option>
								  </form:select>
							</div>
							
							
							<div class="mb-3">
							  <form:label path="description" for="exampleFormControlTextarea1" class="form-label">Description</form:label>
							  <form:errors path="description" class="text-danger" />
							  <form:textarea type="text" path="description" id="" class="form-control" rows="3" />
							  <%-- <form:textarea type="number" path="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></form:textarea> --%>
							</div>
							
			
			                <div class="form-outline mb-4">
								<h6 class="text-uppercase text-center ">Make your dreams a reality!</h6>
			                </div>
						
			                <div class="d-flex justify-content-center">
<!-- 			                  <a href="/alltask" class="btn btn-info btn-block btn-lg 
			                  gradient-custom-4 text-body">Create LifeTask
			                  </a> -->
							<input class="btn btn-info btn-block btn-lg 
			                  gradient-custom-4 text-body" type="submit" value="Create LifeTask"/>
			                  
			                </div>
			
			              </form:form>
			              
			            </div>
			          </div>
			        </div>		

<!-- COLUMN 2 -->

				<!-- Nav Tabs -->
			<div class="col-lg-8 col-sm-12">
				  <ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Yearly</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Monthly</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Weekly</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="about-tab" data-bs-toggle="tab" data-bs-target="#about-tab-pane" type="button" role="tab" aria-controls="about-tab-pane" aria-selected="false">Daily</button>
					  </li>				  
				  </ul>
				
				<!-- START THE TAB CONTENT -->
				<div class="tab-content p-2" id="myTabContent">
				<!-- TAB CONTENT 1 Yearly-->
					<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					  <!-- The table -->
					  <table class="table align-middle mb-0 bg-white">
						  <thead class="bg-light">
						    <tr>
						      <!-- <th>Name</th> -->
						      <th>LifeTask</th>
						      <th>Due By:</th>
						      <th>TrakTask</th>
						      <th>Actions</th>
						    </tr>
						  </thead>
							  <tbody>				  
								  <c:forEach var="task" items="${yearlyLifeTasks}">
									    <tr>
									    	<c:if test="${user_id == task.creator.id}">
										      <td>
										        	<p class="fw-normal mb-1"><c:out value="${task.lifeTask}" /></p>						      
										      </td>
										      
										      <td>
										        	<p class="fw-normal mb-1">
										        		<fmt:formatDate value="${task.dueBy}" type="date" pattern="MMMM dd , yyyy"/>	
										        	</p>
										      </td>
										      
										      <td>
										      		<p class="fw-normal mb-1"><c:out value="${task.trakTask}" /></p>						      
										      </td>
										      <td>	
										     																																																	        
										        <a class="text-info ms-2" href="/alltask/${task.id}/edit">
										        	 <i class="bi bi-pencil-square"></i>
										        </a>						        							   
										      	<a class="text-danger ms-2" href="/alltask/${task.id}/delete">
										      		<i class="bi bi-x-octagon"></i>
										      	</a>
										      </td>
										    </c:if>
									    </tr>
								  </c:forEach>
							  </tbody>
						</table>
					  </div>
					  
				<!-- TAB CONTENT 1 Monthly-->
					  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
						  <table class="table align-middle mb-0 bg-white">
							  <thead class="bg-light">
							    <tr>
							      <!-- <th>Name</th> -->
							      <th>LifeTask</th>
							      <th>Due By:</th>
							      <th>TrakTask</th>
							      <th>Actions</th>
							    </tr>
							  </thead>
								  <tbody>				  
									  <c:forEach var="task" items="${monthlyLifeTasks}">
										    <tr>
										    <c:if test="${user_id == task.creator.id}">
											      <td>
											        	<p class="fw-normal mb-1"><c:out value="${task.lifeTask}" /></p>						      
											      </td>
											      
											      <td>
										        	<p class="fw-normal mb-1">
										        		<fmt:formatDate value="${task.dueBy}" type="date" pattern="MMMM dd , yyyy"/>	
										        	</p>
											      </td>
											      
											      <td>
											      		<p class="fw-normal mb-1"><c:out value="${task.trakTask}" /></p>						      
											      </td>
											      <td>
										     																																																	        
												        <a class="text-info ms-2" href="/alltask/${task.id}/edit">
												        	 <i class="bi bi-pencil-square"></i>
												        </a>						        							   
												      	<a class="text-danger ms-2" href="/alltask/${task.id}/delete">
												      		<i class="bi bi-x-octagon"></i>
												      	</a>					        							   
											      </td>
											  </c:if>
										    </tr>
									  </c:forEach>
								  </tbody>
							</table>					  
					  </div>
					  
			<!-- TAB CONTENT 1 Weekly-->		  					  
					<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
						  <table class="table align-middle mb-0 bg-white">
							  <thead class="bg-light">
							    <tr>
							      <!-- <th>Name</th> -->
							      <th>LifeTask</th>
							      <th>Due By:</th>
							      <th>TrakTask</th>
							      <th>Actions</th>
							    </tr>
							  </thead>
								  <tbody>				  
									  <c:forEach var="task" items="${weeklyLifeTasks}">
										    <tr>
										    	<c:if test="${user_id == task.creator.id}">
											      <td>
											        	<p class="fw-normal mb-1"><c:out value="${task.lifeTask}" /></p>						      
											      </td>
											      
											      <td>
										        	<p class="fw-normal mb-1">
										        		<fmt:formatDate value="${task.dueBy}" type="date" pattern="MMMM dd , yyyy"/>	
										        	</p>
											      </td>
											      
											      <td>
											      		<p class="fw-normal mb-1"><c:out value="${task.trakTask}" /></p>						      
											      </td>
											      <td>
										     																																																	        
												        <a class="text-info ms-2" href="/alltask/${task.id}/edit">
												        	 <i class="bi bi-pencil-square"></i>
												        </a>						        							   
												      	<a class="text-danger ms-2" href="/alltask/${task.id}/delete">
												      		<i class="bi bi-x-octagon"></i>
												      	</a>						        							   
											      </td>
											  </c:if>
										    </tr>
									  </c:forEach>
								  </tbody>
							</table>										
					</div>

				<!-- TAB CONTENT 1 Weekly-->
					<div class="tab-pane fade" id="about-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
						  <table class="table align-middle mb-0 bg-white">
							  <thead class="bg-light">
							    <tr>
							      <!-- <th>Name</th> -->
							      <th>LifeTask</th>
							      <th>Due By:</th>
							      <th>TrakTask</th>
							      <th>Actions</th>
							    </tr>
							  </thead>
								  <tbody>				  
									  <c:forEach var="task" items="${dailyLifeTasks}">
										    <tr>
										    	<c:if test="${user_id == task.creator.id}">
											      <td>
											        	<p class="fw-normal mb-1"><c:out value="${task.lifeTask}" /></p>						      
											      </td>
											      
											      <td>
										        	<p class="fw-normal mb-1">
										        		<fmt:formatDate value="${task.dueBy}" type="date" pattern="MMMM dd , yyyy"/>	
										        	</p>
											      </td>
											      
											      <td>
											      		<p class="fw-normal mb-1"><c:out value="${task.trakTask}" /></p>						      
											      </td>
											      <td>
										     																																																	        
												        <a class="text-info ms-2" href="/alltask/${task.id}/edit">
												        	 <i class="bi bi-pencil-square"></i>
												        </a>						        							   
												      	<a class="text-danger ms-2" href="/alltask/${task.id}/delete">
												      		<i class="bi bi-x-octagon"></i>
												      	</a>					        							   
											      </td>
											  </c:if>
										    </tr>
									  </c:forEach>
								  </tbody>
							</table>										
					</div>					
				</div>
			</div>			
		</div>
	</div>
</section>




 
 
 
 


<!--  Footer -->
<section>
	<footer class="bg-info text-center text-white">
	  <!-- Grid container -->
	  <div class="container p-4 pb-0">
	    <!-- Section: Form -->
	    <section class="">
	      <form action="">
	        <!--Grid row-->
	        <div class="row d-flex justify-content-center">
	          <!--Grid column-->
	          <div class="col-auto">
	            <p class="pt-2">
	              <strong>Sign up for our newsletter</strong>
	            </p>
	          </div>
	          <!--Grid column-->
	
	          <!--Grid column-->
	          <div class="col-md-5 col-12">
	            <!-- Email input -->
	            <div class="form-outline form-white mb-4">
	              <input type="email" id="form5Example29" class="form-control" />
	              <label class="form-label" for="form5Example29">Email address</label>
	            </div>
	          </div>
	          <!--Grid column-->
	
	          <!--Grid column-->
	          <div class="col-auto">
	            <!-- Submit button -->
	            <button type="submit" class="btn btn-outline-light mb-4">
	              Subscribe
	            </button>
	          </div>
	          <!--Grid column-->
	        </div>
	        <!--Grid row-->
	      </form>
	    </section>
	    <!-- Section: Form -->
	  </div>
	  <!-- Grid container -->
	
	  <!-- Copyright -->
	  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
	    © 2020 Copyright:
	    <a class="text-white" href="https://mdbootstrap.com/">LifeTrak.com</a>
	  </div>
	  <!-- Copyright -->
	</footer>


</section>



<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>