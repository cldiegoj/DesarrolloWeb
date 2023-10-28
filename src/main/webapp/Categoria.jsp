<%@page import="Modelo.Usuario"%>
<%@page import="ModeloDAO.Negocio"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Categoria" %>
<%@ page import="ModeloDAO.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CATEGORIA</title>
    </head>
    <body>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
            <link rel="stylesheet" href="css/style.css">
        </head>
        <body>
            <%
                HttpSession ses = request.getSession();
                Usuario n = (Usuario) ses.getAttribute("estado");
                if (n == null) {
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                };
                if (n != null) {
            %> 
            <a href="ctrlUsuario?opc=3"><img src="imagenes/logout.png" width="30px" class="rounded float-end" alt="..."></a>
                <%
                    } else {
                        request.getRequestDispatcher("/Principal.jsp").forward(request, response);
                    }
                %> 
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
            <%
                Negocio negocio = new Negocio();
            %>

        <center>
            <h2 class="textoxd">Lista de Categorias</h2>
            <table border="1" cellspacing="15" cellpadding="15">
                <%
                    int cuenta = 0;
                    for (Categoria x : negocio.listCat()) {
                %>
                <td onmouseover="bgColor = 'brown'" onmouseout="bgColor = 'black'">
                    <a href="control?opc=1&cod=<%=x.getCodc()%>">
                        <img src="imagenes/categorias/<%=x.getImagen()%>.jpg" width="150" height="150"><br><center><%=x.getNomc()%></center>
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
