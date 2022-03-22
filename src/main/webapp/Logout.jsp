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
<%
        session.removeAttribute("tempname");
        session.invalidate();
%>
<!-- START PAGE SOURCE -->
<div class="body1">
    <div class="anothermain">
        <header>
            <div class="topwrapper">
                <h1><a href="Logout.jsp" id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
                <div class="right">
<%--                    <nav>--%>
<%--                        <ul id="top_nav">--%>
<%--                            <li><a href="#"><img src="images/img1.gif" alt=""></a></li>--%>
<%--                            <li><a href="#"><img src="images/img2.gif" alt=""></a></li>--%>
<%--                            <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
<%--                    <nav>--%>
<%--                        <ul id="menu">--%>
<%--                            <li id="menu_active"><a href="Logout.jsp">Home</a></li>--%>
<%--                            <li><a href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Schedule</a></li>--%>
<%--                            <li><a href="BookingServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Bookings</a></li>--%>
<%--                            <li><a href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Tickets</a></li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
                </div>
            </div>
        </header>
    </div>
</div>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    </symbol>
    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
    </symbol>
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
</svg>



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
        <div class="container" style="margin:20px 0 30px 30px;">
            <form action="index.html">
                <table>
                    <tr>
                        <td>
                            <div class="alert alert-success d-flex align-items-center" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
                                <div>
                                    You have successfully logged out
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-secondary" name="" VALUE="">LOGIN AGAIN</button>
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