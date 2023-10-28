<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*,ModeloDAO.Negocio"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DETALLE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
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
        <%

            String apenom = (String) request.getAttribute("nombre");
            String factura = (String) request.getAttribute("factura");
            double total = (double) request.getAttribute("total");

        %>
    <center>
        <table class="table table-hover">
            <tr class="textoxd"><td> Gracias por su compra<td><%=apenom%>
            <tr class="textoxd"><td>Factura Generada<td><%=factura%>        
            <tr class="textoxd"><td>Total de Compra:<td><%=total%>
        </table>
        <a href="Categoria.jsp" class="btn btn-success">Retornar</a>

    </center>  
    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>
</body>
</html>