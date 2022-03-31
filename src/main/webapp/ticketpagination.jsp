
<%@ page import="java.util.List" %>
<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Ticket" %>
<%@ page import="org.hibernate.mapping.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.utar.flightwebapp_18acb02736.model.content.ContactData" %>
<%--
<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Booking" %><%--
  Created by IntelliJ IDEA.
  User: Wai Hin(Darkin)
  Date: 24/02/2022
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>AirLines | Flight Tickets</title>
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
    <style>
        .pageref {
            text-align: center;
            font-weight: bold;
        }
        .form-control option {
            color: #223254;
            display: flex;
        }
    </style>
</head>
<body id="page1">
<!-- START PAGE SOURCE -->
<div class="body1">
    <div class="main">
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
                            <li><a style="padding:6px 20px;" href="successLogin.jsp">Home</a></li>
                            <li><a style="padding:6px 20px;" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Schedule</a></li>
                            <li><a style="padding:6px 20px;" href="BookingServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Bookings</a></li>
                            <li id="menu_active"><a style="padding:6px 20px;" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Tickets</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
    </div>
</div>

<div class="main" style="background-color: ghostwhite">
    <section id="content">
        <%
            if(session.getAttribute("tempname") == null ) {
                response.sendRedirect("index.html");
            }

            int currentPage = (int) request.getAttribute("currentPage");
            int recordsPerPage = (int) request.getAttribute("recordsPerPage");
            int nOfPages = (int) request.getAttribute("nOfPages");
            String keyword = (String) request.getAttribute("keyword");
            String direction = (String) request.getAttribute("direction");
        %>
        <div class="container-fluid">
            <h2>Flight Ticket Listing</h2>
            <div class="container" style="margin:-11px;">
                <table>
                    <tr>
                        <td>
                            <%--            Start of Records Function--%>
                            <div class="mb-3" style="margin-top: 36px;">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Select records per page:
                                    </button>
                                    <ul class="dropdown-menu" name="recordsPerPage">
                                        <li><a  class="dropdown-item" type="submit" value="20" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">20</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="50" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=50">50</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="70" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=70">70</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="100" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=100">100</a></li>
                                    </ul>
                                </div>
                            </div>
                                <%--      End of Records Function--%>
                        </td>
                        <td>
                            <%--            Start of Search Function--%>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <form class="form-inline md-form mr-auto mb-4"
                                      action="TicketServlet" method="get">
                                    <label style="margin:10px;" for="keyword">Enter Keyword:</label>
                                    <div class="input-group" style="width:200px;">
                                        <input class="form-control mr-sm-2" type="text" aria-label="Search" id="keyword" name="keyword"/>
                                        <button class="btn aqua-gradient btn btn-outline-primary" type="submit">Search</button>
                                    </div>
                                    <input type="hidden" name="currentPage" value="<%=currentPage%>" />
                                    <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />
                                    <input type="hidden" name="direction" value="<%=direction%>" />
                                </form>
                            </div>
                                <%--            End of Search Function--%>
                        </td>
                        <td>
                            <%--            Start of Sorting Function--%>
                                <div class="mb-3" style="margin-left:30px; margin-top: 36px;">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Records Sorting:
                                    </button>
                                    <ul class="dropdown-menu" name="recordsPerPage">
                                        <li><a  class="dropdown-item" type="submit" value="ASC" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=50">Ascending</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="DESC" href="TicketServlet?currentPage=1&keyword=&direction=DESC&recordsPerPage=50">Descending</a></li>
                                    </ul>
                                </div>
                            </div>
                            <%--            End of Sorting Function--%>
                        </td>
                        <td>
                            <!-- Button trigger modal -->
                            <div class="mb-3" style="width:400px; margin-top:36px; margin-left:-65px; margin-bottom: 20px;">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 95px; margin-bottom: 20px">
                                    Add New Ticket
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="exampleModalLabel">New Ticket Details</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div  class="container" style="width:100%;">
                                <form action="TicketController" method="post">
                                    <table class="container" style="width:max-content;">
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="col-form-label">Ticket Number:</label>
                                                <input required="" class="form-control" type="text" name="ticketno" id="exampleFormControlInput1"
                                                       pattern="^([0]{3}[5]{1}[4]{1}[3]{1}[0-9]{7})$" title="Please ensure your input similar as this example: 0005435999874"
                                                       placeholder="0005435999874" value="0005435999874"/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput2" class="col-form-label">Booking Reference:</label>
                                                <input required="" type="text" class="form-control" name="bookref" id="exampleFormControlInput2"
                                                       pattern="^([A-Z0-9]{6})$" title="Please ensure your input similar as this example: A1AD46" value=""/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput3" class="col-form-label">Passenger ID:</label>
                                                <input required="" id="exampleFormControlInput3" type="text" class="form-control" pattern="^([0-9]{4} [0-9]{6})$"
                                                       title=" Please ensure your input passenger ID is similar as the example: 0101 101010" name="passengerid" value=""/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput4" class="col-form-label">Passenger First Name:</label>
                                                <input required="" id="exampleFormControlInput4" type="text" class="form-control" name="passengerfname"
                                                       pattern="^([A-Z]{1,})$" title="Please ensure your input first name is in all Capital Letter" value=""/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput5" class="col-form-label">Passenger Last Name:</label>
                                                <input required="" id="exampleFormControlInput5" type="text" class="form-control" name="passengerlname"
                                                       pattern="^([A-Z]{1,})$" title="Please ensure your input first name is in all Capital Letter" value=""/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput6" class="col-form-label">Passenger Email:</label>
                                                <input required="" id="exampleFormControlInput6" type="email" class="form-control" name="contactemail" value=""/>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput7" class="col-form-label">Passenger Phone Number:</label>
                                                <input required="" id="exampleFormControlInput7" type="text" class="form-control" name="contactphone"
                                                       pattern="^(\+[7]{1}[0]{1}[0-9]{9})$" title=" Please ensure your input phone number similar to this example: +70127117011"  value=""/>
                                            </div>
                                        </tr>
                                    </table>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success">Add New Ticket</button>
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                        <button type="reset" class="btn btn-secondary">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-curved table-bordered table-striped table-hover" >
                    <thead class="table-info">
                    <tr>
                        <th scope="col">Ticket No</th>
                        <th scope="col">Booking Reference No</th>
                        <th scope="col">Passenger ID</th>
                        <th scope="col">Passenger Name</th>
<%--                        <th scope="col">Passenger Contact Data</th>--%>
                        <th scope="col">Passenger Email Address</th>
                        <th scope="col">Passenger Phone Number</th>
                        <th scope="col">EDIT</th>
                        <th scope="col">DELETE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
                        if (tickets.size() != 0) {
                            for (Ticket t : tickets) {
                                String contactdata = t.getContactData();

                                ObjectMapper contdata = new ObjectMapper();
                                ContactData ctd = contdata.readValue(contactdata, ContactData.class);

                                out.println("<tr>");
                                out.println("<th scope=\"row\">" + t.getId() + "</th>");
                                out.println("<td>" + t.getBookings().getId() + "</td>");
                                out.println("<td>" + t.getPassengerId() + "</td>");
                                out.println("<td>" + t.getPassengerName() + "</td>");
                                if ( ctd.getEmail() == null) {
                                    out.println("<td>NOT AVAILABLE</td>");
                                } else {
                                    out.println("<td>" + ctd.getEmail() + "</td>");
                                }
                               if ( ctd.getPhone() == null) {
                                   out.println("<td>NOT AVAILABLE</td>");
                               } else {
                                   out.println("<td>" + ctd.getPhone() + "</td>");
                               }
                                out.println("<td><button type=\"button\" class=\"btn btn-success\"><a style=\"color:white; text-decoration:none\" href=\"TicketController?id=" + t.getId() + "\">EDIT</a></button></td>");
                                out.println("<td><button type=\"button\" class=\"btn btn-warning\"><a style=\"color:white; text-decoration:none\" href=\"TicketController?id=" + t.getId() + "\">Delete</a></button></td>");
                                out.println("</tr>");
                            }
                        } else {
                            out.println("<tr>");
                            String status = "No records";
                            for (int i = 0; i < 6; i++) {
                                out.println("<td>" + status + "</td>");
                            }
                            out.println("</tr>");
                        }

                    %>
                    </tbody>

                </table>
            </div>


            <%--            Start of Bottom Pagination Table Change Page--%>
                <nav class="container" aria-label="Navigation for tickets">
                    <ul class="pagination" style="justify-content: center;">
                        <%
                            if (currentPage != 1 && nOfPages != 0) {
                        %>

                        <%
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "TicketServlet?recordsPerPage=" + recordsPerPage + "&currentPage=1" + "&keyword=" + keyword + "&direction=" + direction + "\">First</a>");
                            out.println("</li>");
                        %>
                        <li class="page-item">
                            <%
                                out.println("<a class=\"page-link\" href=\"" + "TicketServlet?recordsPerPage=" + recordsPerPage
                                        + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>");
                            %>
                        </li>
                        <%
                            }
                        %>
                        <%
                        %>
                        <%
                            if (currentPage < nOfPages) {
                                out.println("<li class=\"page-item\">");
                                out.println("<a class=\"page-link\" href=\"" + "TicketServlet?recordsPerPage=" + recordsPerPage
                                        + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>");
                                out.println("</li>");
                                out.println("<li class=\"page-item\">");
                                out.println("<a class=\"page-link\" href=\"" + "TicketServlet?recordsPerPage=" + recordsPerPage
                                        + "&currentPage=" + nOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>");
                                out.println("</li>");
                            }
                        %>
                    </ul>
                </nav>

            <%
                out.println("<div class=\"container\" style=\"margin-top:10px;\">");
                if (nOfPages != 0) {
                    out.println("<p class=\"pageref\">");
                    out.println(currentPage + " of " + nOfPages);
                    out.println("</p>");
                }
                out.println("</div>");
            %>
            <%--            Start of Bottom Pagination Table Change Page--%>
        </div>
    </section>
</div>
<div class="body2">
    <div class="main">
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
