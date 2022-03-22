<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Flight" %>
<%@ page import="java.time.OffsetDateTime" %><%--
  Created by IntelliJ IDEA.
  User: Wai Hin(Darkin)
  Date: 27/02/2022
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>AirLines | Update Flight</title>
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
        .glow {
            font-size: 17px;
            color: ghostwhite;
            text-align: center;
            -webkit-animation: glow 1s ease-in-out infinite alternate;
            -moz-animation: glow 1s ease-in-out infinite alternate;
            animation: glow 1s ease-in-out infinite alternate;
        }

        @-webkit-keyframes glow {
            from {
                text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #00dee6, 0 0 40px #0096e6, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
            }

            to {
                text-shadow: 0 0 20px #fff, 0 0 30px #0f00e6, 0 0 40px #0f00e6, 0 0 50px #0f00e6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
            }
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        /*tr:nth-child(even) {*/
        /*    background-color: #dddddd;*/
        /*}*/
        .pageref {
            text-align: center;
            font-weight: bold;
        }
        .wrapper .bg option {
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
                <h1><a id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
            </div>
        </header>
    </div>
</div>
<div class="main" style="background-color: ghostwhite">
    <section id="content">
<%--        Start Update Form--%>
        <%
            if(session.getAttribute("tempname") == null ) {
                response.sendRedirect("index.html");
            }

            Flight flight = (Flight) request.getAttribute("selectedflight");
            String choice = flight.getStatus();
            Boolean v1 = null, v2 = null;
            switch (choice) {
                case "Departed":
                    v1 = true;
                    v2 = false;
                    break;
                case "On Time":
                    v1 = true;
                    v2 = false;
                    break;
                case "Arrived":
                    v1 = true;
                    v2 = true;
                    break;
                case "Cancelled":
                    v1 = true;
                    v2 = true;
                    break;
                case "Delayed":
                    v1 = false;
                    v2 = false;
                    break;
                case "Scheduled":
                    v1 = false;
                    v2 = false;
                    break;
            }
        %>
        <div class="container" style="margin:15px;">
            <h1 style="color:black; font-size:35px; margin-bottom:10px;">Status Update/Delete</h1> <br><br><br><br>
        </div>

        <div  class="container" style="margin-bottom: 20px;">
            <form action="FlightController" method="post">
                <br><br>
                <table>
                    <tr>
                        <td>
                            <div class="mb-3" style="margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Flight ID</label>");
                                    out.println("<input required=\"\" type=\"text\" class=\"form-control\" name=\"flightid\" id=\"exampleFormControlInput1\" readonly value=" + flight.getId());
                                %>
                            </div>
                        </td>
                        <td>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Flight No</label>");
                                    out.println("<input required=\"\" type=\"text\" class=\"form-control\" name=\"flightno\" id=\"exampleFormControlInput1\" readonly value=" + flight.getFlightNo());
                                %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
<%--                            Scheduled Departure--%>
                            <div class="mb-3" style="margin-bottom: 20px;">
                                <%
                                    OffsetDateTime wantDate = flight.getScheduledDeparture();
                                    String stringdate = wantDate.toString();
                                    stringdate.substring(0,16);

                                    // Current
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Scheduled Departure DateTime</label>");
                                    out.println("<div class=\"input-group mb-3\">" +
                                            "<div class=\"input-group-prepend\">" +
                                            "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                            "  </div>" +
                                            "<input required=\"\" type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                            "readonly value=" + stringdate.substring(0,16));
                                    out.print("> </div>");

                                    // New
                                    if (v1 || v2) {
                                        // Grey Out
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"text\" name=\"scheddep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=" + stringdate.substring(0,16));
                                        out.print("> </div>");
                                    } else {
                                        // Passing through
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"datetime-local\" name=\"scheddep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "value=" + stringdate.substring(0,16));
                                        out.print("> </div>");
                                    }
                                %>
                            </div>
                        </td>
                        <td>
<%--                            Scheduled Arrival--%>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <%
                                    OffsetDateTime wantDateSecond = flight.getScheduledArrival();
                                    String stringdateSecond = wantDateSecond.toString();
                                    stringdateSecond.substring(0,16);

                                    // Current
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Scheduled Arrival DateTime</label>");
                                    out.println("<div class=\"input-group mb-3\">" +
                                            "<div class=\"input-group-prepend\">" +
                                            "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                            "  </div>" +
                                            "<input required=\"\" type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                            "readonly value=" + stringdateSecond.substring(0,16));
                                    out.print("> </div>");

                                    // New
                                    if (v1 || v2) {
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"text\" name=\"schedarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=" + stringdateSecond.substring(0,16));
                                        out.print("> </div>");
                                    } else {
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"datetime-local\" name=\"schedarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "value=" + stringdateSecond.substring(0,16));
                                        out.print("> </div>");
                                    }
                                %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="mb-3" style="margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Departure Airport</label>");
                                    out.println("<input type=\"text\" class=\"form-control\" name=\"depairport\" id=\"exampleFormControlInput1\" readonly value=" + flight.getAirportsData());
                                %>
                            </div>
                        </td>
                        <td>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Arrival Airport</label>");
                                    out.println("<input type=\"text\" class=\"form-control\" name=\"arrairport\" id=\"exampleFormControlInput1\" readonly value=" + flight.getAirportsData1());
                                %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="mb-3" style="margin-bottom: 20px;">
                                <%
                                    String choicetwo = flight.getStatus();
                                    String op1 = null, op2 = null, op3 = null, op4 = null, op5 = null, op6 = null;
                                    switch (choicetwo) {
                                        case "Departed":
                                            op1 = "selected";
                                            break;
                                        case "Arrived":
                                            op2 = "selected";
                                            break;
                                        case "On Time":
                                            op3 = "selected";
                                            break;
                                        case "Cancelled":
                                            op4 = "selected";
                                            break;
                                        case "Delayed":
                                            op5 = "selected";
                                            break;
                                        case "Scheduled":
                                            op6 = "selected";
                                            break;
                                    }

                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Status</label>");
                                    out.println("<div class=\"input-group mb-3\">" +
                                            "<div class=\"input-group-prepend\">" +
                                            "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                            "  </div>\n");
                                    %>
                                <input type="text" class="form-control" aria-label="readonly input example" aria-describedby="inputGroup-sizing-default" readonly value="<%= flight.getStatus() %>">
                                <%
                                    out.println("</div>");
                                    if (v1 && v2) {
                                        // Grey out
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\" ><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input type=\"text\" name=\"status\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=" + flight.getStatus() + ">");
                                        out.println("</div>");
                                    } else {
                                        // Passing through
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\" ><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<select required=\"\" name=\"status\" class=\"form-control\" aria-describedby=\"inputGroup-sizing-default\">");
                                        out.println("<option value=\"Departed\"" + op1 + ">Departed</option>" +
                                                "<option value=\"Arrived\"" + op2 + ">Arrived</option>" +
                                                "<option value=\"On Time\"" + op3 + ">On Time</option>" +
                                                "<option value=\"Cancelled\"" + op4 + ">Cancelled</option>" +
                                                "<option value=\"Delayed\"" + op5 + ">Delayed</option>" +
                                                "<option value=\"Scheduled\"" + op6 + ">Scheduled</option>" +
                                                "</select>" +
                                                "</div>");
                                    }
                                %>
                            </div>
                        </td>
                        <td>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Aircraft Code</label>");
                                    out.println("<input type=\"text\" class=\"form-control\" name=\"aircraftcode\" id=\"exampleFormControlInput1\" readonly value=" + flight.getAircraftsData());
                                %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
<%--                            Actual Departure--%>
                            <div class="mb-3" style="margin-bottom: 20px;">
                                <%
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Actual Departure DateTime</label>");
                                    //Current
                                    out.println("<div class=\"input-group mb-3\">" +
                                            "<div class=\"input-group-prepend\">" +
                                            "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                            "  </div>");
                                    OffsetDateTime actDepdate = flight.getActualDeparture();
                                    if (actDepdate == null) {
                                        OffsetDateTime nullactDepDate = actDepdate;
                                        out.println("<input type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                " readonly value=\"NO DATE\"" +
                                                "> </div>");
                                    } else {
                                        String stringactDepDate = actDepdate.toString();
                                        String newactDepDate = stringactDepDate.substring(0,16);
                                        out.println("<input type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                " readonly value=" + newactDepDate +
                                                "> </div>");
                                    }

//
//                                    out.println("<input type=\"text\" name=\"actdep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
//                                            "value=" + flight.getActualDeparture() +
//                                    "> </div>");

                                    //New
                                    if (v1 && v2) {
                                        // Grey Out
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>");

                                        OffsetDateTime actDepdatenew = flight.getActualDeparture();
                                        if (actDepdatenew == null) {
                                            OffsetDateTime nullactDepDate = actDepdatenew;
                                            out.println("<input type=\"text\" name=\"actdep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    " readonly value=\"NO DATE\"" +
                                                    "> </div>");
                                        } else {
                                            String stringactDepDate = actDepdatenew.toString();
                                            String newactDepDate = stringactDepDate.substring(0,16);
                                            out.println("<input type=\"text\" name=\"actdep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    "readonly value=" + newactDepDate +
                                                    "> </div>");
                                        }
                                    } else {
                                        // Passing Through
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>");

                                        OffsetDateTime actDepdatenew = flight.getActualDeparture();
                                        if (actDepdatenew == null) {
                                            OffsetDateTime nullactDepDate = actDepdatenew;
                                            out.println("<input type=\"datetime-local\" name=\"actdep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    "value=" + nullactDepDate +
                                                    "> </div>");
                                        } else {
                                            String stringactDepDate = actDepdatenew.toString();
                                            String newactDepDate = stringactDepDate.substring(0,16);
                                            out.println("<input type=\"datetime-local\" name=\"actdep\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    "value=" + newactDepDate +
                                                    "> </div>");
                                        }
                                    }
                                %>
                            </div>
                        </td>
                        <td>
<%--                            Actual Arrival--%>
                            <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                <%
                                    // Current
                                    out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Actual Arrival DateTime</label>");
                                    out.println("<div class=\"input-group mb-3\">" +
                                            "<div class=\"input-group-prepend\">" +
                                            "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                            "  </div>");
                                    OffsetDateTime actArrdate = flight.getActualArrival();
                                    if (actArrdate == null) {
                                        OffsetDateTime nullactArrDate = actArrdate;
                                        out.println("<input type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=\"NO DATE\"" +
                                                "> </div>");
                                    } else {
                                        String stringactArrDate = actArrdate.toString();
                                        String newactArrDate = stringactArrDate.substring(0,16);
                                        out.println("<input type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=" + newactArrDate +
                                                "> </div>");
                                        }
//                                            "<input type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
//                                            "readonly value=" + flight.getActualArrival() + ">" +
//                                            "</div>");

                                    // New
                                    if (v1 && v2) {
                                        // Grey Out
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>");
                                        OffsetDateTime actArrdatenew = flight.getActualArrival();
                                        if (actArrdatenew == null) {
                                            OffsetDateTime nullactArrDatenew = actArrdatenew;
                                            out.println("<input type=\"text\" name=\"actarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    " readonly value=\"NO DATE\"" +
                                                    "> </div>");
                                        } else {
                                            String stringactArrDatenew = actArrdatenew.toString();
                                            String newactArrDatenew = stringactArrDatenew.substring(0,16);
                                            out.println("<input type=\"text\" name=\"actarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    " readonly value=" + newactArrDatenew +
                                                    "> </div>");
                                        }
                                    } else {
                                        // Pass through
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>");
                                        OffsetDateTime actArrdatenew = flight.getActualArrival();
                                        if (actArrdatenew == null) {
                                            OffsetDateTime nullactArrDatenew = actArrdatenew;
                                            out.println("<input type=\"datetime-local\" name=\"actarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    "value=" + nullactArrDatenew +
                                                    "> </div>");
                                        } else {
                                            String stringactArrDatenew = actArrdatenew.toString();
                                            String newactArrDatenew = stringactArrDatenew.substring(0,16);
                                            out.println("<input type=\"datetime-local\" name=\"actarr\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +

                                                    "value=" + newactArrDatenew +
                                                    "> </div>");
                                        }
                                    }
                                %>
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-success" name="UPDATE" VALUE="UPDATE">SAVE</button>
                <button type="submit" class="btn btn-danger" data-bs-dismiss="modal" name="DELETE" value="DELETE">DELETE</button>
                <button type="reset" class="btn btn-secondary">RESET</button>
<%--                <input type="submit" name="UPDATE" value="UPDATE" />--%>
<%--                <input type="submit" name="DELETE" value="DELETE" />--%>
            </form>
        </div>
<%--        End of Update Form--%>
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
