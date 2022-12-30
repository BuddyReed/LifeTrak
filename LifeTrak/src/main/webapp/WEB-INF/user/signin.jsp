<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- NEW LINKS -->
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel = "stylesheet">  
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">  
</script>  
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
		          	  <c:if test="${user_id != oneUser.creator.id}">		          	 		          	  
		           		<a class="nav-link text-dark" href="/alltask">Life Task</a>
					  </c:if>
		          </li>
		          <li class="nav-item">
		          	  <c:if test="${user_id != oneUser.creator.id}">					  
		           		<a class="nav-link text-dark" href="/dashboard">Dashboard</a>
					  </c:if>
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
			          <c:if test="${user_id != oneUser.creator.id}">
				            <a class="nav-link text-dark" href="/logout">Logout</a> 
					  </c:if>			     
			      </li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</nav>
	</div>
</section>


<!--Sign Up -->

<section class="h-100 h-custom">
  <div class="container signup py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
          <img src="/img/signin.png"
            class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
            alt="Sample photo">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2 text-center">LifeTrak Log In!</h3>
		<!-- FORM STARTS -->
            <form:form action="/login" method="post" modelAttribute="newLogin" class="px-md-2">
             
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">Email</label>
                <form:input path="email" type="text" class="form-control" />
                <form:errors path="email" />
              </div>
              
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">Password</label>
                <form:input path="password" type="password" class="form-control" />
                <form:errors path="password" />
              </div>
              
              <button type="submit" class="btn btn-info btn-lg bg-gradient-custom-4 mb-1 ">Submit</button>
                <p class="text-center text-muted mt-5 mb-0">Need to Sign Up? <a href="/signup"
                    class="fw-bold text-body">Sign Up here</a></p>                           
            </form:form>

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