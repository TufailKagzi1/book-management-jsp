<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>

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
    
        <input type="hidden" id="status" value = "<%= request.getAttribute("status")%>"

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
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%= session.getAttribute("name")%></a></li>

                    </ul>
                </div>
            </div>
        </nav>
<br> <br><br><br><br>

        <%!
            Connection con;
            PreparedStatement ps;

            public void jspInit() {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/min_project", "root", "");
              
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>
        <h1>Update Details</h1>
        <form class="row g-3" method="post" action="bookupdate" style="margin: 5px">
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Book Name</label>
               
        <%
            String book= request.getParameter("book");
            Statement st = con.createStatement();
            ResultSet rsl = st.executeQuery("SELECT * FROM books where name='"+book+"';");
            while (rsl.next()) {
                
                String name= rsl.getString("name");
                String author=  rsl.getString("author");
                String publication= rsl.getString("publication");
                String version= rsl.getString("version");
                String prize= rsl.getString("prize");
                String description= rsl.getString("description");
                
                out.print("<input type='text' name='name' value='"+name+"' class='form-control' id='inputEmail4'>");
               %>
               </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">Author</label>
                <%
                    out.print("<input type='text' name='author' value='"+author+"' class='form-control' >");
                  
            %>
            
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">Publication</label><%
                out.print("<input type='text' name='publication' value='"+publication+"' class='form-control' >"); %>
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">Version</label>
                <% out.print("<input type='text' name='version' value='"+version+"' class='form-control' >"); %>
            </div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">Prize</label>
                <% out.print("<input type='text' name='prize' value='"+prize+"' class='form-control' >"); %>
            </div>
            <div class="col-12">
                <label for="inputAddress" class="form-label">Short Description</label>
                <% out.print("<input type='text' name='desc' value='"+description+"' class='form-control' >"); %>
            </div>
            </div>
            <% out.print("<input type='hidden' name='book' value='"+name+"' class='form-control' >"); %>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
 <%
       }
         %> 

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">


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

    

