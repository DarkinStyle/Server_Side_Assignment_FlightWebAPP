<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Ticket" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.utar.flightwebapp_18acb02736.model.content.ContactData" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Wai Hin(Darkin)
  Date: 28/02/2022
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>AirLines | Update Ticket</title>
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
<%--START PAGE SOURCE--%>
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

            Ticket ticket = (Ticket) request.getAttribute("selectedticket");
            String contactdata = ticket.getContactData();
            ObjectMapper contdata = new ObjectMapper();
            ContactData ctd = contdata.readValue(contactdata, ContactData.class);

        %>
            <div class="container" style="margin:15px;">
                <h1 style="color:black; font-size:35px; margin-bottom:10px;">Status Update/Delete</h1> <br><br><br><br>
            </div>
            <div class="container" style="margin-bottom: 20px;">
                <form action="TicketController" method="post">
                    <br><br>
                    <table>
                        <tr>
                            <td>
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Ticket Number</label>");
                                        out.println("<input type=\"text\" required=\"\" class=\"form-control\" name=\"ticketno\" id=\"exampleFormControlInput1\" readonly value=" + ticket.getId());
                                    %>
                                </div>
                            </td>
                            <td>
                                <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Booking Reference</label>");
                                        out.println("<input type=\"text\" required=\"\" class=\"form-control\" name=\"bookref\" id=\"exampleFormControlInput1\" readonly value=" + ticket.getBookings().getId());
                                    %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Passenger ID</label>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> CURRENT </span></h3> </span>\n" +
                                                "  </div>\n");
                                    %>
                                    <input type="text" required="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" readonly value="<%= ticket.getPassengerId() %>">
                                    <%
                                        out.println("</div>" + "<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> NEW </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input type=\"text\" required=\"\" class=\"form-control\" name=\"passengerid\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" pattern=\"^([0-9]{4} [0-9]{6})$\"\n" +
                                                "  title=\" Please ensure your input passenger ID is similar as the example: 0101 101010\" value=\"" + ticket.getPassengerId() +  "\">\n" +
                                                "</div>");
                                    %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        String passname = ticket.getPassengerName();
                                        String[] componentname = passname.split(" ");
//                                        System.out.println(passname);
//                                        System.out.println(componentname[0]);
                                    %>

                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Passenger Name</label>");
                                        out.println("<div class=\"input-group\">\n" +
                                                "                                    <span class=\"input-group-text\"><h3> <span class=\"glow\"> CURRENT </span> First & Last Name</h3> </span>\n" +
                                                "                                    <input type=\"text\" aria-label=\"First name\" class=\"form-control\" pattern=\"^([A-Z]{1,})$\" " +
                                                "title=\"Please ensure your input first name is in all Capital Letter\" readonly value=" + componentname[0] + ">\n" +
                                                "                                    <input type=\"text\" aria-label=\"Last name\" class=\"form-control\" " +
                                                "pattern=\"^([A-Z]{1,})$\" title=\"Please ensure your input first name is in all Capital Letter\" readonly value=" + componentname[1] + ">\n" +
                                                "                                </div>");
                                        out.println("<div class=\"input-group\" style=\"margin-top:15px;\">\n" +
                                                "                                    <span class=\"input-group-text\"><h3> <span class=\"glow\"> NEW </span> First & Last Name</h3> </span>\n" +
                                                "                                    <input type=\"text\" required=\"\" name=\"passengerfname\" aria-label=\"First name\" class=\"form-control\" pattern=\"^([A-Z]{1,})$\" " +
                                                "title=\"Please ensure your input first name is in all Capital Letter\" value=\"" + componentname[0] + "\">\n" +
                                                "                                    <input type=\"text\" required=\"\" name=\"passengerlname\" aria-label=\"Last name\" class=\"form-control\" pattern=\"^([A-Z]{1,})$\" " +
                                                "title=\"Please ensure your input first name is in all Capital Letter\" value=\"" + componentname[1] + "\">\n" +
                                                "                                </div>");
                                    %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Passenger Email</label>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> CURRENT </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"email\" class=\"form-control\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" readonly value=" + ctd.getEmail() + ">\n" +
                                                "</div>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> NEW </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"email\" class=\"form-control\" name=\"contactemail\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" value=\"" + ctd.getEmail() + "\">\n" +
                                                "</div>");
                                    %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Passenger Phone Number</label>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> CURRENT </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"text\" class=\"form-control\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" readonly value=" + ctd.getPhone() + ">\n" +
                                                "</div>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> NEW </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"text\" class=\"form-control\" name=\"contactphone\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" " +
                                                "  pattern=\"^(\\+[7]{1}[0]{1}[0-9]{9})$\" title=\" Please ensure your input phone number similar to this example: +70127117011\"value=\"" + ctd.getPhone() + "\">\n" +
                                                "</div>");
                                    %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" class="btn btn-success" name="UPDATE" VALUE="UPDATE">SAVE</button>
                    <button type="submit" class="btn btn-danger" name="DELETE" VALUE="DELETE">DELETE</button>
                    <button type="reset" class="btn btn-secondary">RESET</button>
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
