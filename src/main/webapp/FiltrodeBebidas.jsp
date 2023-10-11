<%-- 
    Document   : FiltrodeBebidas
    Created on : 11 oct. 2023, 16:25:13
    Author     : lissy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtro de Bebidas</title>
    </head>
    <body>
        <h1>Filtrar Bebidas</h1>
        <label>Ingrese nombre de la bebida :</label>
        <input id="txtbeb">
        <br>
        <div id="tablares"></div>
        <script>
        function pasaSeleccion(nomb){    
          NOMBRE=nomb;
          location="control?opc=1&coda="+nomb+"&nom="+NOMBRE;
         }
        </script>    
        
    </body>
</html>
