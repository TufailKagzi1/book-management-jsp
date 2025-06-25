<%-- 
    Document   : addbook
    Created on : 24-May-2023, 19:18:09
    Author     : 123
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add Book</title>
    <!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body style="padding: 20px; margin: 10px; ">
    <input type="hidden" id="status" value = "<%= request.getAttribute("status") %>"

	<!-- Navigation-->
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
                    <div class="container">
                        <a class="navbar-brand" href="#page-top">Book Record</a>
                       
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"
                                        href="index.jsp">Home</a></li>
                                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"
                                        href="#about">About</a></li>
                                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"
                                        href="#contact">Contact</a></li>
                                

                                <div class="btn-group">
                                            <button type="button" style="background-color: #2C3E50;" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                              Books
                                            </button>
                                            <ul class="dropdown-menu">
                                              <li><a class="dropdown-item" href="displayBook.jsp">Avaliable Books</a></li>
                                              <li><hr class="dropdown-divider"></li>
                                              <li><a class="dropdown-item" href="updatebook.jsp">Update Book Detail</a></li>
                                              <li><hr class="dropdown-divider"></li>
                                              <li><a class="dropdown-item" href="addbook.jsp">Add New Books</a></li>
                                              <li><hr class="dropdown-divider"></li>
                                              <li><a class="dropdown-item" href="deletebook.jsp">Delete Books</a></li>
                                            </ul>
                                          </div>  
                                          <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"
                                        href="Logout">Logout</a></li>
                                        
                                        <li class="nav-item mx-0 mx-lg-1 bg-danger"><a
                                                class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%= session.getAttribute("name") %></a></li>
                           
                            </ul>
                        </div>
                    </div>
        </nav>
                                <br> <br><br><br>
    
    <h1>Add Book Details</h1>
    <form class="row g-3" method="post" action="addbook" style="margin: 5px">
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Book Name</label>
          <input type="text" name="name" class="form-control" id="inputEmail4">
        </div>
        <div class="col-md-6">
          <label for="inputPassword4" class="form-label">Author</label>
          <input type="text" name="author" class="form-control" id="inputPassword4">
        </div>
        <div class="col-md-6">
          <label for="inputCity" class="form-label">Publication</label>
          <input type="text" name="publication" class="form-control" id="inputCity">
        </div>
        <div class="col-md-4">
          <label for="inputState" class="form-label">Version</label>
          <input id="inputState" name="version" type="text" class="form-select">
        </div>
        <div class="col-md-2">
          <label for="inputZip" class="form-label">Prize</label>
          <input type="text" name="prize" class="form-control" id="inputZip">
        </div>
        <div class="col-12">
            <label for="inputAddress" class="form-label">Short Description</label>
            <input type="text" name="desc" class="form-control" id="inputAddress">
          </div>
        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Add</button>
        </div>
      </form>

      <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
        
        <script>
            var status = document.getElementById("status").value;
            if(status=="success"){
                swal("Done","Book Added","success");
            }
        </script>
        <!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
</body>
</html>
