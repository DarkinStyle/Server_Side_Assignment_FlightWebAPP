<%@ page import="com.utar.flightwebapp_18acb02736.model.entity.Booking" %>
<%@ page import="java.time.OffsetDateTime" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Wai Hin(Darkin)
  Date: 28/02/2022
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>AirLines | Update Booking</title>
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

            Booking booking = (Booking) request.getAttribute("selectedbooking");
        %>
            <div class="container" style="margin:15px;">
                <h1 style="color:black; font-size:35px; margin-bottom:10px;">Status Update/Delete</h1> <br><br><br><br>
            </div>
            <div  class="container" style="margin-bottom: 20px;">
                <form action="BookingController" method="post">
                    <br><br>
                    <table>
                        <tr>
                            <td>
                                <div class="mb-3" style="margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Book Reference</label>");
                                        out.println("<input required=\"\" type=\"text\" class=\"form-control\" name=\"bookref\" id=\"exampleFormControlInput1\" readonly value=" + booking.getId());
                                    %>
                                </div>
                            </td>
                            <td>
                                <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                    <%
                                        OffsetDateTime wantDate = booking.getBookDate();
                                        String stringdate = wantDate.toString();
                                        stringdate.substring(0,16);

                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Booking Date</label>");
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> CURRENT </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"text\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "readonly value=" + stringdate.substring(0,16) + ">" +
                                                "</div>");
                                        out.println("<div class=\"input-group mb-3\">" +
                                                "<div class=\"input-group-prepend\">" +
                                                "<span class=\"input-group-text\" id=\"inputGroup-sizing-default\"><span class=\"glow\"> NEW </span></span>" +
                                                "  </div>" +
                                                "<input required=\"\" type=\"datetime-local\" name=\"bookdate\" class=\"form-control\" aria-label=\"readonly input example\" aria-describedby=\"inputGroup-sizing-default\"" +
                                                "value=" + stringdate.substring(0,16));
                                                out.println("</div>");
                                    %>
                                </div>
                            </td>
                            <td>
                                <div class="mb-3" style="margin-left:30px; margin-bottom: 20px;">
                                    <%
                                        out.println("<label for=\"exampleFormControlInput1\" class=\"form-label\">Total Amount</label>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> CURRENT </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"text\" class=\"form-control\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" readonly value=" + booking.getTotalAmount() + ">\n" +
                                                "</div>");
                                        out.println("<div class=\"input-group input-group-sm mb-3\">\n" +
                                                "  <div class=\"input-group-prepend\">\n" +
                                                "    <span class=\"input-group-text\" id=\"inputGroup-sizing-sm\"><h3> <span class=\"glow\"> NEW </span></h3> </span>\n" +
                                                "  </div>\n" +
                                                "  <input required=\"\" type=\"text\" class=\"form-control\" name=\"totalamt\" aria-label=\"Sizing example input\" aria-describedby=\"inputGroup-sizing-sm\" " +
                                                " pattern=\"^([1-9][0-9]{0,7}|([0-9]{1}))(.[0-9]{2})$\" title=\"Example: 0.00 to 99999999.99\" value=" + booking.getTotalAmount() + ">\n" +
                                                "</div>");
                                    %>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" class="btn btn-success" name="UPDATE" VALUE="UPDATE">SAVE</button>
                    <button type="submit" class="btn btn-danger" data-bs-dismiss="modal" name="DELETE" value="DELETE">DELETE</button>
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
