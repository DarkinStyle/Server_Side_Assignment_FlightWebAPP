<!DOCTYPE html>
<html lang="en">
<head>
    <title>AirLines</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-replace.js"></script>
    <script type="text/javascript" src="js/Myriad_Pro_italic_600.font.js"></script>
    <script type="text/javascript" src="js/Myriad_Pro_italic_400.font.js"></script>
    <script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/ie6_script_other.js"></script>
    <script type="text/javascript" src="js/html5.js"></script>
    <![endif]-->
</head>
<body id="page1">
<!-- START PAGE SOURCE -->
<div class="body1">
    <div class="anothermain">
        <header>
            <div class="topwrapper">
                <h1><a href="successLogin.jsp" id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
                <div class="right">
                    <nav>
                        <ul id="top_nav">
                            <li><a href="#"><img src="images/img1.gif" alt=""></a></li>
                            <li><a href="#"><img src="images/img2.gif" alt=""></a></li>
                            <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>
                        </ul>
                    </nav>
                    <nav>
                        <ul id="menu">
                            <li id="menu_active"><a href="successLogin.jsp">Home</a></li>
                            <li><a href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Schedule</a></li>
                            <li><a href="BookingServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Bookings</a></li>
                            <li><a href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Tickets</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
    </div>
</div>
<div class="mainindex">
    <div id="banner">
        <div class="text1"> Best AirLine<span>Guaranteed</span>
            <p style="margin-top:-30px;">Comfort Offered <br> Best Experience Ever With Us <br> Come Fly With Us Now </p>
        </div>
        <!--    <a class="button_top"> Order Tickets Online </a>-->
    </div>
</div>
<div class="mainindex">
    <section id="content">
        <div class="container">
            <%
                if(session.getAttribute("tempname") == null ) {
                    response.sendRedirect("index.html");
                }

                String tempname = (String) session.getAttribute("tempname");
            %>
            <%
                out.println("<h2>WELCOME ABOARD" + ", " + tempname + "</h2>");
            %>
        </div>
        <div class="container" style="margin:20px 0 30px 30px;">
            <form action="Logout.jsp" >
<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            <div class="mb-3" style="margin-bottom: 20px;">--%>
<%--                                <label for="formControlInput" class="form-label">Email address</label>--%>
<%--                                <input required type="email" name="email" class="form-control" id="formControlInput"--%>
<%--                                       placeholder="name@example.com" readonly value=<%= tempname%>>--%>
<%--                            </div>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
                <button type="submit" class="btn btn-secondary" name="" VALUE="">LOGOUT</button>
            </form>
        </div>
    </section>
</div>
<div class="body2">
    <div class="mainindex">
        <footer>
            <div class="footerlink">
                <p class="lf">Copyright &copy; 2010 <a href="#">Domain Name</a> - All Rights Reserved</p>
                <p class="rf">Design by <a href="http://www.templatemonster.com/">TemplateMonster</a></p>
                <div style="clear:both;"></div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript"> Cufon.now(); </script>
<!-- END PAGE SOURCE -->
</body>
</html>