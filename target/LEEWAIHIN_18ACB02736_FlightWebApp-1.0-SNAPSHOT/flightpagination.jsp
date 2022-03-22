<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Flight" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wai Hin(Darkin)
  Date: 24/02/2022
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>AirLines | Flights Schedule</title>
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
<%--                        <ul id="menu">--%>
                        <ul id="menu">
                            <li><a style="padding:6px 20px;" href="successLogin.jsp">Home</a></li>
                            <li id="menu_active"><a style="padding:6px 20px;" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Schedule</a></li>
                            <li><a  style="padding:6px 20px;" href="BookingServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Bookings</a></li>
                            <li><a  style="padding:6px 20px;" href="TicketServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">Flight Tickets</a></li>
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
            <h2>Flight Schedule Listing</h2>
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
                                        <li><a  class="dropdown-item" type="submit" value="20" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=20">20</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="50" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=50">50</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="70" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=70">70</a></li>
                                        <li><a  class="dropdown-item" type="submit" value="100" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=100">100</a></li>
                                    </ul>
                                </div>
                            </div>
<%--                            End of Records Function--%>
                        </td>
                        <td>
                                <%--            Start of Search Function--%>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                    <form class="form-inline md-form mr-auto mb-4"
                                          action="FlightServlet" method="get">
                                        <label style="margin:10px;" for="keyword">Enter Keyword:</label>
                                        <div class="input-group" style="width:200px;">
                                            <input class="form-control mr-sm-2" type="text" aria-label="Search" id="keyword" name="keyword"/>
                                            <button class="btn aqua-gradient btn btn-outline-primary" type="submit">Search</button>
                                        </div>
                                        <input type="hidden" name="currentPage" value="<%=currentPage%>" />
                                        <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />
                                        <input type="hidden" name="direction" value="<%=direction%>" />
                                    </form>
                                <%--            End of Search Function--%>
                            </div>
                        </td>
                        <td>
                            <%--            Start of Sorting Function--%>
                                <div class="mb-3" style="margin-left:30px; margin-top: 36px;">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            Records Sorting:
                                        </button>
                                        <ul class="dropdown-menu" name="recordsPerPage">
                                            <li><a  class="dropdown-item" type="submit" value="ASC" href="FlightServlet?currentPage=1&keyword=&direction=ASC&recordsPerPage=50">Ascending</a></li>
                                            <li><a  class="dropdown-item" type="submit" value="DESC" href="FlightServlet?currentPage=1&keyword=&direction=DESC&recordsPerPage=50">Descending</a></li>
                                        </ul>
                                    </div>
                                </div>
                            <%--            End of Sorting Function--%>
                        </td>
                        <td>
                            <!-- Button trigger modal -->
                            <div class="mb-3" style="width:400px; margin-top:36px; margin-left:30px; margin-bottom: 20px;">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 0px; margin-bottom: 20px">
                                Add New Flight
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
                            <h5 class="modal-title" id="exampleModalLabel">New Flight Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div  class="container" style="margin-left:-15px; width:100%;">
                            <form action="FlightController" method="post">
                                <table class="container" style="width:max-content;">
                                    <tr>
                                        <td colspan="2">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="col-form-label">Flight Number:</label>
                                                <input required type="text" name="flightno" class="form-control" id="exampleFormControlInput1"pattern="^([P]{1}[G]{1}[0-9]{4})$" title="Example: PG0001 to PG9999" placeholder="PG0001"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="col-form-label">Scheduled Departure DateTime:</label>
                                                <input required type="datetime-local" name="scheddep" class="form-control" aria-label="readonly input example" aria-describedby="inputGroup-sizing-default" value=""/>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="mb-3" style="margin-left:20px;">
                                                <label for="exampleFormControlInput1" class="col-form-label">Scheduled Arrival DateTime:</label>
                                                <input required type="datetime-local" name="schedarr" class="form-control" aria-label="readonly input example" aria-describedby="inputGroup-sizing-default" value=""/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput2" class="col-form-label">Departure Airport:</label>
                                                <input required type="text" name="depairport" class="form-control" id="exampleFormControlInput2"
                                                       pattern="^([A-Z]{3})$" title="Please ensure your input similar as example: DME" value=""/>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="mb-3" style="margin-left:20px;">
                                                <label for="exampleFormControlInput3" class="col-form-label">Arrival Airport:</label>
                                                <input required type="text" name="arrairport" class="form-control" id="exampleFormControlInput3"
                                                       pattern="^([A-Z]{3})$" title="Please ensure your input similar as example: LED" value=""/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput4" class="col-form-label">Status:</label>
                                                <select required id="exampleFormControlInput4" class="form-control" name="status" id="status"/>
                                                <option value="Departed" selected>Departed</option>
                                                <option value="Arrived">Arrived</option>
                                                <option value="On Time">On Time</option>
                                                <option value="Cancelled">Cancelled</option>
                                                <option value="Delayed">Delayed</option>
                                                <option value="Scheduled">Scheduled</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="mb-3" style="margin-left:20px;">
                                                <label for="exampleFormControlInput5" class="col-form-label">Aircraft Code:</label>
                                                <select required id="exampleFormControlInput5" class="form-control" name="aircraftcode" id="aircraftcode"/>
                                                <option value="CN1" selected>CN1</option>
                                                <option value="CR2">CR2</option>
                                                <option value="773">773</option>
                                                <option value="763">763</option>
                                                <option value="319">319</option>
                                                <option value="733">733</option>
                                                <option value="321">733</option>
                                                <option value="SU9">733</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="col-form-label">Actual Departure DateTime:</label>
                                                <input type="datetime-local" name="actdep" class="form-control" aria-label="readonly input example" aria-describedby="inputGroup-sizing-default" value=""/>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="mb-3" style="margin-left:20px;">
                                                <label for="exampleFormControlInput1" class="col-form-label">Actual Arrival DateTime:</label>
                                                <input type="datetime-local" name="actarr" class="form-control" aria-label="readonly input example" aria-describedby="inputGroup-sizing-default" value=""/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Add New Flight</button>
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
                        <th scope="col">ID</th>
                        <th scope="col">Flight No</th>
                        <th scope="col">Scheduled Departure</th>
                        <th scope="col">Scheduled Arrival</th>
                        <th scope="col">Departure Airport</th>
                        <th scope="col">Arrival Airport</th>
                        <th scope="col">Flight Status</th>
                        <th scope="col">Aircraft Code</th>
                        <th scope="col">Actual Departure</th>
                        <th scope="col">Actual Arrival</th>
                        <th scope="col">EDIT</th>
                        <th scope="col">DELETE</th>
                    </tr>
                    </thead>
                    <tbody>
<%
        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        if (flights.size() != 0) {
            for (Flight t : flights) {
                out.println("<tr>");
                out.println("<th scope=\"row\">" + t.getId() + "</th>");
                out.println("<td>" + t.getFlightNo() + "</td>");
                out.println("<td>" + t.getScheduledDeparture() + "</td>");
                out.println("<td>" + t.getScheduledArrival() + "</td>");
                out.println("<td>" + t.getAirportsData() + "</td>");
                out.println("<td>" + t.getAirportsData1() + "</td>");
                out.println("<td>" + t.getStatus() + "</td>");
                out.println("<td>" + t.getAircraftsData() + "</td>");
                if (t.getActualDeparture() == null) {
                    out.println("<td>NO DATE</td>");
                } else {
                    out.println("<td>" + t.getActualDeparture() + "</td>");
                }
                if (t.getActualArrival() == null) {
                    out.println("<td>NO DATE</td>");
                } else {
                    out.println("<td>" + t.getActualArrival() + "</td>");
                }
                out.println("<td><button type=\"button\" class=\"btn btn-success\"><a style=\"color:white; text-decoration:none\" href=\"FlightController?id=" + t.getId() + "\">EDIT</a></button></td>");
                out.println("<td><button type=\"button\" class=\"btn btn-warning\"><a style=\"color:white; text-decoration:none\" href=\"FlightController?id=" + t.getId() + "\">DELETE</a></button></td>");
                out.println("</tr>");
            }
    } else {
            out.println("<tr>");
            String status = "No records";
            for (int i = 0; i < 10; i++) {
                out.println("<td>" + status + "</td>");
            }
            out.println("</tr>");
        }

    %>
                    </tbody>
                </table>
            </div>

            <%--            Start of Bottom Pagination Table Change Page--%>
            <nav class="container" aria-label="Navigation for flights">
                <ul class="pagination" style="justify-content: center;">
                        <%
                            if (currentPage != 1 && nOfPages != 0) {
                        %>

                        <%
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "FlightServlet?recordsPerPage=" + recordsPerPage + "&currentPage=1" + "&keyword=" + keyword + "&direction=" + direction + "\">First</a>");
                            out.println("</li>");
                        %>
                            <li class="page-item">
                                <%
                                    out.println("<a class=\"page-link\" href=\"" + "FlightServlet?recordsPerPage=" + recordsPerPage
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
                            out.println("<a class=\"page-link\" href=\"" + "FlightServlet?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>");
                            out.println("</li>");
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "FlightServlet?recordsPerPage=" + recordsPerPage
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
