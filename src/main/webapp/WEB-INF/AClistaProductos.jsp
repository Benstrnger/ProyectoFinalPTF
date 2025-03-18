<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halus | Productos</title>
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="/css/style.css?version=0.2">
        <!--FAFA-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--FONT FAMILY@Outfit/@Montserrat-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Outfit:wght@100..900&display=swap" rel="stylesheet">
        <!--FAVICON-->
        <link rel="icon" type="image/x-icon" href="/img/icon.webp">
    </head>
    <body>
        <header class="head">
            <a href="/"><img src="/img/logo.webp" alt="Halus" class="logo-n" title="HALUS"></a>
            <c:choose>
            	<c:when test="${usuarioEnSesion.tipoDeUsuario == admin }">
            		<ul class="navbar">
				        <li><a class="navlink montserrat" href="/admin/home">Inicio</a></li>
				        <li><a class="navlink montserrat" href="/admin/empresas">Empresas</a></li>
				        <li><a class="navlink montserrat" href="/admin/productos">Productos</a></li>
				        <li><a class="navlink montserrat" href="/admin/clientes">Clientes</a></li>
				        <li><a class="navlink montserrat" href="/admin/pedidos">Pedidos</a></li>
				        <li><a class="navlink montserrat" href="/admin/agregar/empresa">Agregar Empresa</a></li>
				        <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
				   	</ul>
			    </c:when>
			    <c:otherwise>
				    <ul class="navbar">
						<li><a class="navlink montserrat" href="/cliente/home">Inicio</a></li>
				        <li><a class="navlink montserrat" href="/cliente/pedidos">Mis Pedidos</a></li>
				        <li><a class="navlink montserrat" href="/cliente/carrito/${usuarioEnSesion.id}">Carrito</a></li>
				        <li><a class="navlink montserrat" href="/cliente/${usuarioEnSesion.id}">Perfil</a></li>
				        <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
				    </ul>
			    </c:otherwise>
            </c:choose>         
        </header>
        <main id="main">
            <div id="c-header">
                <img src="/img/header-image.webp" class="c-img">
                <div id="c-header-txt">
                    <h1 class="outfit">Todos los productos</h1>
                    <p class="montserrat mb-1">Explora nuestras opciones para avanzar hacia la energia sustentable.</p>
                </div>
            </div>
            <section class="l-prod flex">
                <c:forEach var="producto" items="${productos}">
                    <div class="c-cont">
                        <img src="${producto.urlImagen}" class="flex-2">
                        <div class="flex-4 c-div-h">
                            <h2 class="outfit mb-1">${producto.nombre}</h2>
                            <p class="montserrat"><i class="fa-solid fa-dollar-sign"></i> ${producto.pVenta}</p>
                            <p class="montserrat mb-1"><i class="fa-solid fa-dollar-sign"></i> ${producto.pArriendo}</p>
                            <div class="b-2 a-s-e">
                                <a href="/cliente/productos/${producto.id}" class="btn montserrat"> Detalles</a>
                                <c:choose>
                                	<c:when test="${usuarioEnSesion.tipoDeUsuario == admin }">
                                		<a href="/admin/editar/producto/${producto.id }" class="btn montserrat">Editar</a>
                                	</c:when>
                                	<c:otherwise>
                                		<a href="/cliente/carrito/${usuarioEnSesion.id}/${producto.id}" class="btn montserrat"><i class="fa-solid fa-cart-plus"></i> Agregar al carrito</a>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </section>
        </main>    
        <footer>
            <div class="footer mt-4">
                <h5 class="outfit"> <i class="fa-regular fa-copyright"></i> Halus</h5>
                <p class="montserrat">Main font "Biko" <a href="http://www.jesuismonreve.org/biko-font-family/"> <i class="fa-regular fa-copyright"></i> Marco Ugolini </a></p>
                <p class="montserrat">Logo and design are property of this project.</p>
                <p class="montserrat">This site is prototype-only. Any images, fonts, texts, etc. are being used for this single prototype without any revenue. All rights to their respective owners.</p>
            </div>
        </footer>
    </body>
</html>