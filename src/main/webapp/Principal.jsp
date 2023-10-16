<!DOCTYPE html>
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
<!--HEADER-->
    <header>
        <%@include file="header_footer/Header.jsp" %>
<!--TAMBIEN PRODUCTOS-->
        <div class="header-content container">

            <div class="swiper mySwiper-1">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="slider">
                            <div class="slider-txt">
                                <h1>Vinos</h1>
                                <p>
                                    El vino es una bebida alcohólica procedente de la fermentación del zumo de uva, la cual se produce gracias a la acción de las levaduras presentes en el hollejo de las uvas.
                                </p>
                                <div class="botones">
                                    <a href="#" class="btn-1">Comprar</a>
                                    <a href="#" class="btn-1">Menu</a>
                                </div>
                            </div>
                            <div class="slider-img">
                                <img src="imagenes/slider1.jpg" alt="">

                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider">
                            <div class="slider-txt">
                                <h1>Cervezas</h1>
                                <p>
                                    Bebida alcohólica de sabor amargo y color amarillento, más o menos oscuro, que se obtiene por fermentación de la cebada y se aromatiza con lúpulo.
                                </p>
                                <div class="botones">
                                    <a href="#" class="btn-1">Comprar</a>
                                    <a href="#" class="btn-1">Menu</a>
                                </div>
                            </div>
                            <div class="slider-img">
                                <img src="imagenes/slider3.png" alt="">

                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider">
                            <div class="slider-txt">
                                <h1>Rones</h1>
                                <p>
                                    Es una bebida con alcohol que se elabora al fermentar y destilar la caña de azúcar. Los primeros registros de la preparación del ron datan del siglo XVII.
                                </p>
                                <div class="botones">
                                    <a href="#" class="btn-1">Comprar</a>
                                    <a href="#" class="btn-1">Menu</a>
                                </div>
                            </div>
                            <div class="slider-img">
                                <img src="imagenes/slider2.jpg" alt="">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </header>
<!--PRODUCTOS-->
    <main class="products">
        <div class="tabs container">

            <input type="radio" name="tabs" id="tab1" checked="checked" class="tabInput" value="1">
            <label for="tab1">Vinos</label>
            <div class="tab">
                <div class="swiper mySwiper-2" id="swiper1">

                    <div class="swiper-wrapper">
                        
                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food1.png" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Vino Borgoña</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.120</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food2.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Vino Catena</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.180</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food3.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Vino Penfolds</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.210</span>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>

                </div>

            </div>

            <input type="radio" name="tabs" id="tab2" checked="checked" class="tabInput" value="2">
            <label for="tab2">Cervezas</label>
            <div class="tab">
                <div class="swiper mySwiper-2" id="swiper2">
                    <div class="swiper-wrapper">
                        
                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food4.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Cerveza Cristal</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.12</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food5.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Cerveza Pilsen</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.18</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food6.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Cerveza Brahma</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.21</span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>

            <input type="radio" name="tabs" id="tab3" checked="checked" class="tabInput" value="3">
            <label for="tab3">Rones</label>
            <div class="tab">
                <div class="swiper mySwiper-2" id="swiper3">
                    <div class="swiper-wrapper">
                        
                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food7.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Ron Abuelo</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.120</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food8.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Ron Appleton</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.180</span>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="product">
                                <div class="product-img">
                                    <h4>Nuevo</h4>
                                    <img src="imagenes/food9.jpg" alt="">
                                </div>
                                <div class="product-txt">
                                    <h4>Ron Dos Maderos</h4>
                                    <p>Calidad Premium</p>
                                    <span class="price">S/.210</span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div><!-- comment -->
            
        </div>
        
        <div class="buttton">
            <a href="FiltrodeBebidas.jsp" class="textoxd">Filtra tus chelas!!</a>
            </div>
    </main>

<!--INFORMACIÓN-->
    <section class="info container">

        <div class="info-img">
            <img src="imagenes/slider1.jpg" alt="">
        </div>

        <div class="info-txt">
            <h2>Información </h2>
            <p>
                Consumir vino tinto de forma regular y moderada ayuda a reducir el deterioro cognitivo propio de la edad y, con él, demencias y enfermedades degenerativas cerebrales.Asi mismo, reduce las probabilidades de contraer artritis reumática en un 50%.
            </p>
            <a href="FiltrodeUsuarios.jsp" class="btn-2">CONOCE NUESTRA FAMILIA!</a>
        </div><br><!-- comment --><br>

    </section>
<!--HORARIO-->    
    <section class="horario">
        <div class="horario-info container">

            <h2>Horario</h2>
            <div class="horario-txt">
                <div class="txt">
                    <h4>Dirección</h4>
                    <p>
                        Ca. Enrique Palacios 725, Miraflores 15074
                    </p>
                    <p>
                         Av. Sta. Cruz 1115, Miraflores 15074
                    </p>
                </div>
                <div class="txt">
                    <h4>Horario</h4>
                    <p>
                        Lunes-Viernes : 9 am a 8 pm
                    </p>
                    <p>
                        Sabado-Domingo : 11 am a 7 pm
                    </p>
                </div>
                <div class="txt">
                    <h4>Telefono</h4>
                    <p>
                        +51 969846123
                    </p>
                    <p>
                        +57 123 51588 23
                    </p>
                </div>
                <div class="txt">
                    <h4>Redes Sociales</h4>
                    <div class="socials">
                        <a href="#">
                            <div class="social">
                                <img src="otros recursos/s1.svg" alt="">
                            </div>
                        </a>
                        <a href="#">
                            <div class="social">
                                <img src="otros recursos/s2.svg" alt="">
                            </div>
                        </a>
                        <a href="#">
                            <div class="social">
                                <img src="otros recursos/s3.svg" alt="">
                            </div>
                        </a>

                    </div>
                </div>

            </div>
        </div>
    </section>
<!--UBICACIÓN-->
    <section>
        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d249743.68803786347!2d-76.98777915!3d-12.0266383!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c5f619ee3ec7%3A0x14206cb9cc452e4a!2sLima!5e0!3m2!1ses!2spe!4v1682724384969!5m2!1ses!2spe" width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
<!--FOOTER-->
    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>

</body>
</html>
