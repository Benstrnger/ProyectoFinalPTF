<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halus | Detalle Empresa</title>
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="/css/style.css?version=0.4">
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
				          <li><a class="navlink montserrat" href="/empresa/home">Inicio</a></li>
				          <li><a class="navlink montserrat" href="/empresa/productos">Mis productos</a></li>
				          <li><a class="navlink montserrat" href="/empresa/nuevo/producto">Agregar Producto</a></li>
				          <li><a class="navlink montserrat" href="/empresa/ventas">Mis ventas</a></li>
				          <li><a class="navlink montserrat" href="/empresa/${usuarioEnSesion.id}">Mi empresa</a></li>
				          <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
				    </ul>
			    </c:otherwise>
            </c:choose> 
        </header>
        <main class="main">
        	<c:choose>
        		<c:when test="${usuarioEnSesion.tipoDeUsuario == admin }">
        			<h1 class="outfit">Admin | Detalle de usuario</h1>
        			<h2 class="outfit">${empresa.nombre }</h2>
        		</c:when>
        		<c:otherwise>
        			<h1 class="outfit">${usuarioEnSesion.nombre} </h1>
        		</c:otherwise>
        	</c:choose>
            <div class="h-25">
	            <c:choose>
	                <c:when test="${usuarioEnSesion.tipoDeUsuario == admin}">
	                	<p class="montserrat mt-05" >Id empresa: ${empresa.id}</p>
	                    <p class="montserrat mt-05" >Representante Legal: ${empresa.apellido}</p>
                        <p class="montserrat mt-05" >Direccion: ${empresa.direccion}</p>
                        <p class="montserrat mt-05" >Correo Electronico: ${empresa.email}</p>
                        <p class="montserrat mt-05 mb-1">Tipo de usuario: ${empresa.tipoDeUsuario }</p>
	                    <a href="/admin/editar/empresa/${empresa.id }" class="btn montserrat"> Editar Empresa </a>
	                </c:when>
	                <c:otherwise>
	                	<p class="montserrat mt-05" >Representante Legal: ${usuarioEnSesion.apellido}</p>
                        <p class="montserrat mt-05" >Direccion: ${usuarioEnSesion.direccion}</p>
                        <p class="montserrat mt-05 mb-1" >Correo Electronico: ${usuarioEnSesion.email}</p>
	                    <a href="/empresa/editar/${usuarioEnSesion.id}" class="btn montserrat">Editar mi información</a>
	                </c:otherwise>
	            </c:choose>
             </div>
        </main>
        <footer>
            <div class="footer">
                <h5 class="outfit"> <i class="fa-regular fa-copyright"></i> Halus</h5>
                <p class="montserrat">Main font "Biko" <a href="http://www.jesuismonreve.org/biko-font-family/" target="_blank"> <i class="fa-regular fa-copyright"></i> Marco Ugolini </a></p>
                <p class="montserrat">Logo and design are property of this project.</p>
                <p class="montserrat">This site is prototype-only. Any images, fonts, texts, etc. are being used for this single prototype without any revenue. All rights to their respective owners.</p>
            </div>
        </footer>
    </body>
</html>