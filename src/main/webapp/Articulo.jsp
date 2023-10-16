<%@page import="java.util.List"%>
<%@page import="Modelo.Articulo"%> <!-- Asegúrate de que la ubicación sea correcta -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.Negocio"%>

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
        <title>ARTICULOS</title>
    </head>
    <body>
        <% 
            Negocio negocio = new Negocio();  // Instancia de tu clase Negocio
            List<Articulo> lista = negocio.listArt("tu_codigo_de_categoria");  // Reemplaza con la lógica adecuada para obtener los artículos
        %>
    <center>
        <h2>Lista de Articulos</h2>
        <a href="#" onclick="history.back()">Retornar</a><br><br>
        
        <table border="1" cellspacing="15" cellpadding="15">
        <%  
                int cuenta = 0;
                for(Articulo x: lista){
        %>
            <td onmouseover="bgColor='red' " onmouseout="bgColor='white' ">
            <a href="control?opc=2&cod=<%=x.getCoda()%>">
                <img src="images/<%=x.getImagen()%>" width="150" height="150"><br><%=x.getNomart()%>
            </a>
        <%  
                cuenta++;
                if(cuenta % 3 == 0) {
                    out.print("<tr>");
                }
            }
        %>
        </table>
    </center>
    </body>
</html>
