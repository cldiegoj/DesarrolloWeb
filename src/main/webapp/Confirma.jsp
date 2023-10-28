<%@page import="Modelo.Compra"%>
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
            HttpSession ses = request.getSession();
            List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
            Usuario cli = (Usuario) ses.getAttribute("estado");
            String apenom = cli.getApe() + "," + cli.getNom() ;
        %>
    <center>
        <h2>Lista de Compras del cliente: <%=apenom%></h2><br>
        <a href="control?opc=5" class="btn btn-success">Grabar Factura</a>&nbsp;&nbsp;&nbsp;
        <a href="control?opc=7" class="btn btn-success">Cancelar la compra</a>&nbsp;&nbsp;&nbsp;<br><br>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark textoxd">
                    <th>Codigo<td>Descripcion<th>Precio<th>Cantidad<th>Total
            </thead>
            <%
                double acu = 0;
                for (Compra x : lista) {
                    acu = acu + x.total();
                    out.print("<tr class='textoxd'><td>" + x.getCod() + "<td>" + x.getNom() + "<td>" + x.getPrecio() + "<td>" + x.getCantidad() + "<td>" + x.total());
                }
            %>
            <tr class="textoxd"><td><b>Total de Compra:</b><td><td><td><td><%=acu%>
        </table>
    </center>  
    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>

</body>
</html>