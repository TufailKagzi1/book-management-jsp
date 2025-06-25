<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<% 
    if(session.getAttribute("name")== null){
        response.sendRedirect("login.jsp");
    }  
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Book Display</title>
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
<body id="page-top">
    <%!
    Connection con;
    PreparedStatement ps;
    public void jspInit()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/min_project", "root", "");
            ps = con.prepareStatement("select * from books");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
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
    <!--main section-->
     <!--table section-->
     <br><br><br><br><br>
     

        <div class="row" style="margin-top: 100px">
                        <center>
                            <div class="col-md-8 col-sm-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover mb-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 44%;">#</th>
                                                <th style="width: 44%;">Name</th>
                                                <th style="width: 6%;">Author</th>
                                                <th style="width: 6%;">Publication</th>   
                                                <th style="width: 6%;">version</th>   
                                                <th style="width: 6%;">Prize</th>   
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Statement st =con.createStatement();
                                                ResultSet rsl = st.executeQuery("SELECT * FROM books;");
                                                while(rsl.next()){
                                                    out.print("<td>"+rsl.getInt("id")+"</td>");
                                                    out.print("<td>"+rsl.getString("name")+"</td>");
                                                    out.print("<td>"+rsl.getString("author")+"</td>");
                                                    out.print("<td>"+rsl.getString("publication")+"</td>");
                                                    out.print("<td>"+rsl.getString("version")+"</td>");
                                                    out.print("<td>"+rsl.getString("prize")+"</td>");
                                                    out.print("</tr>");
                                                }
                                            %>
                                        
                                        </tbody>
                                    </table>
                                            
        <!--table over-->
        
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