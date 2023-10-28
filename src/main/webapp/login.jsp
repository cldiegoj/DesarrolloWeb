<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header>
            <%@include file="header_footer/Header.jsp" %>
        </header>

        <%
            HttpSession ses = request.getSession();
            Usuario n = (Usuario) ses.getAttribute("estado");

            if (n != null) {
                request.getRequestDispatcher("/Principal.jsp").forward(request, response);
            };
        %>

        <main class="carrito">
            <div class="header-content container">

                <div class="row justify-content-md-center align-items-center">
                    <!--Esto es lo que se repetirá para cada producto-->
                    <div class="col-5">
                        <div class="card">
                            <img title="Título producto" alt="Título" class="card-img-top" src="imagenes/logo2.PNG">
                            <div>
                                <form method="POST" action="ctrlUsuario">
                                    <input type="hidden" name="opc" value="2">
                                    <div class="mb-3">
                                        <label name="usr" class="form-label">Usuario</label>
                                        <input type="text" class="form-control" name="usrname">
                                    </div>
                                    <div class="mb-3">
                                        <label name="pwd" class="form-label">Contraseña</label>
                                        <input type="password" class="form-control" name="pass">
                                    </div>
                                    <div class="mb-3">
                                        <input type="submit" class="btn btn-primary">
                                    </div>
                                    <label>¿Todavía no te has registrado?</label><a href="Registrar.jsp" class="card-link">Regístrate</a>
                                    <%
                                        String x = (String) request.getAttribute("mensaje");
                                        if (x != null){
                                            out.print("<br><label>" + x + "</label>");
                                        }
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- ---------------------------------- -->
                </div>
            </div>
        </main>
        <section>
            <footer class="footer container">
                <%@include file="header_footer/Footer.jsp" %>
            </footer>
        </section>



        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

        <script src="js/script.js"></script>
    </body>
</html>