<!DOCTYPE html>
<html lang="es">

<head>
    <?php include("helpers/header.php") ?>
    <link rel="stylesheet" href="./../public/css/principal.css">
    <script src="./../public/js/principal.js"></script>
    <title>Inicio</title>
</head>

<body>
    <?php include("helpers/headerIndex.php"); ?>
    <main>
        <div class="baner" style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff">
            <div class="swiper" id="banerPrincipal">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="./../public/img/baner1.jpg" alt="">
                        <div class="container h-100" style="position: relative;">
                            <div class="contenido-escrito">
                                <h3 class="titulo">MELAMISERVICE S.A.C.</h3>
                                <p>!Bienvenido a la plataforma de Melamiservice!<br>Empresa dedicada a la venta de Melamina y servicios de acabado de acuerdo a tus necesidades.</p>
                            </div>
                        </div>

                    </div>
                    <div class="swiper-slide">
                        <img src="./../public/img/baner2.jpg" alt="">
                        <div class="container h-100" style="position: relative;">
                            <div class="contenido-escrito">
                                <h3 class="titulo">Productos de calidad</h3>
                                <p>Descubriendo la alta calidad, con variedad de colores y acabados</p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="./../public/img/baner3.jpg" alt="">
                        <div class="container h-100" style="position: relative;">
                            <div class="contenido-escrito">
                                <h3 class="titulo">Variedad de Marcas</h3>
                                <p>Contamos con una gran cantidad de marcas para las necesidades de nuestros clientes</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>

    </main>
    <?php include("helpers/footerIndex.php"); ?>

</body>

</html>