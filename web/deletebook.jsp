<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/min_project", "root", "");;
    Statement st = con.createStatement();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Book Record</title>
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

        <input type="hidden" id="status" value = "<%= request.getAttribute("status")%>">


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

        <!--main Code-->

        <%--<jsp:include page="displayBook.jsp" />--%>  
        <hr><br>
    <center>
        <h1>Delete Book</h1>

        <form action="bookdelete" method="post"  class="form-inline">
            <label class="my-1 mr-2" for="inlineFormCustomSelectPref">select book</label>
            <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="book">
                <option selected>Choose...</option>
                <%
                    ResultSet rs = st.executeQuery("SELECT name FROM books;");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<option value='" + rs.getString("name") + "' >" + rs.getString("name") + "</option>");
                    }
                %>
            </select>

            <button type="submit" class="btn btn-primary my-1">Submit</button>
        </form>

    </center>

    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">


    <script>
        var status = document.getElementById("status").value;
        if (status == "success") {
            swal("Deleted", "Book Deleted", "success");
        } else if (status == "failed") {
            swal("Failed", "Please Choose One book", "error");
        }
    </script>
</body>
</html>
