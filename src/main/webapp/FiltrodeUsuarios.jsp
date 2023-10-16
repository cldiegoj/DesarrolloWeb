<%-- 
    Document   : FiltrodeUsuarios
    Created on : 11 oct. 2023, 15:55:30
    Author     : lissy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtro de usuarios</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="js/filtrar_usuario.js" type="text/javascript"></script>

    </head>
    <body>
        <h1>Filtrar datos del usuario</h1>
        
        <a href="Principal.jsp">Regresar</a><!-- comment -->
        <br>
        <label>Ingrese DNI o Nombre :</label>
        <input id="txtnom">
        <br>
        <div id="tablares"></div>
        <script>
            function pasaSeleccion(dni, nom) {
                DNI = dni + "," + nom;
                location = "control?opc=4&coda=" + dni + "&nom=" + nom;
            }
        </script>    

    </body>
</html>