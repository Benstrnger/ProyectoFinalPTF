<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halus | Agregar un Producto</title>
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
            <ul class="navbar">
				  <li><a class="navlink montserrat" href="/empresa/home">Inicio</a></li>
		          <li><a class="navlink montserrat" href="/empresa/productos">Mis productos</a></li>
		          <li><a class="navlink montserrat" href="/empresa/nuevo/producto">Agregar Producto</a></li>
		          <li><a class="navlink montserrat" href="/empresa/ventas">Mis ventas</a></li>
		          <li><a class="navlink montserrat" href="/empresa/${usuarioEnSesion.id}">Mi empresa</a></li>
		          <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
            </ul>
        </header>
        <main class="main">
            <h1 class="outfit m-1">Añadir Producto</h1>
            <div class="r-cont">
                <form:form action="/empresa/agregar/producto" method="POST" modelAttribute="nuevoProducto">
                    <div class="mt-05">
                        <form:label class="montserrat" path="nombre">Nombre:</form:label>
                        <form:input path="nombre" class="txt-input montserrat"/>
                        <form:errors path="nombre" class="txt-danger montserrat sm-txt"/>
                    </div>
                    <div class="mt-05">
                        <form:label class="montserrat" path="urlImagen">URL de imagen:</form:label>
                        <form:input path="urlImagen" class="txt-input montserrat"/>
                        <form:errors path="urlImagen" class="txt-danger montserrat sm-txt"/>
                    </div>
                    <div class="mt-05">
                        <form:label class="montserrat" path="pVenta">Precio de Venta:</form:label>
                        <form:input path="pVenta" class="txt-input montserrat"/>
                        <form:errors path="pVenta" class="txt-danger montserrat sm-txt"/>
                    </div>
                    <div class="mt-05">
                        <form:label class="montserrat" path="pArriendo">Precio de Arriendo (mensual):</form:label>
                        <form:input path="pArriendo" class="txt-input montserrat"/>
                        <form:errors path="pArriendo" class="txt-danger montserrat sm-txt"/>
                    </div>			
                    <div class="mt-05">
                        <form:label class="montserrat" path="descripcion">Descripcion:</form:label>
                        <form:textarea path="descripcion" class="txt-input montserrat"/>
                        <form:errors path="descripcion" class="txt-danger montserrat sm-txt"/>
                    </div>
                    <div class="mt-05">
                        <form:label class="montserrat" path="garantia">Garantías:</form:label>
                        <form:textarea path="garantia" class="txt-input montserrat"/>
                        <form:errors path="garantia" class="txt-danger montserrat sm-txt"/>
                    </div>			
                    <form:hidden path="creador" value="${usuarioEnSesion.id}"/>
                    <button type="submit" class="btn montserrat mt-05">
                        <span> Añadir Producto </span>
                    </button>
                </form:form>
            </div>
        </main>
        <footer>
            <div class="footer">
                <h5 class="outfit"> <i class="fa-regular fa-copyright"></i> Halus</h5>
                <p class="montserrat">Main font "Biko" <a href="http://www.jesuismonreve.org/biko-font-family/"> <i class="fa-regular fa-copyright"></i> Marco Ugolini </a></p>
                <p class="montserrat">Logo and design are property of this project.</p>
                <p class="montserrat">This site is prototype-only. Any images, fonts, texts, etc. are being used for this single prototype without any revenue. All rights to their respective owners.</p>
            </div>
        </footer>
    </body>
</html>