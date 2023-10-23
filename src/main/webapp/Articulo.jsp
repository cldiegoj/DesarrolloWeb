<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.*"%> <!-- Asegúrate de que la ubicación sea correcta -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloDAO.Negocio"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!--HEADER-->
        <header>
            <%@include file="header_footer/Header.jsp" %>
            <!--TAMBIEN PRODUCTOS-->
            <div class="header-content container">
                <div class="swiper mySwiper-1">
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </header>


    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>BEBIDAS</title>
        </head>
        <body>
            <%
                List<Bebidas> lista = (ArrayList<Bebidas>) request.getAttribute("dato");

            %>
        <center>
            <h2 class="textoxd">Lista de Bebidas</h2>
            <a href="#" onclick="history.back()">Retornar</a><br><br>

            <table border="1" cellspacing="15" cellpadding="15">
                <%                    int cuenta = 0;
                    for (Bebidas x : lista) {
                %>
                <td onmouseover="bgColor = 'brown'" onmouseout="bgColor = 'black'">
                    <a href="control?opc=2&cod=<%=x.getCod()%>">
                        <img src="imagenes/Bebidas/<%=x.getFoto()%>" width="150" height="150"><br><center><%=x.getNom()%></center>
                    </a>
                    <%
                            cuenta++;
                            if (cuenta % 4 == 0) {
                                out.print("<tr>");
                            }
                        }
                    %>
            </table>
        </center>

        <section>
            <footer class="footer container">
                <%@include file="header_footer/Footer.jsp" %>
            </footer>
        </section>
    </body>
</html>
