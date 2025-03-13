<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halus</title>
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css?version=0.2">
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
		        <li><a class="navlink montserrat" href="/admin/home">Inicio</a></li>
		        <li><a class="navlink montserrat" href="/admin/empresas">Empresas</a></li>
		        <li><a class="navlink montserrat" href="/admin/productos">Productos</a></li>
		        <li><a class="navlink montserrat" href="/admin/clientes">Clientes</a></li>
		        <li><a class="navlink montserrat" href="/admin/pedidos">Pedidos</a></li>
		        <li><a class="navlink montserrat" href="/nuevaEmpresa">Agregar Empresa</a></li>
		        <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
		   	</ul>
        </header>
        <main class="main">
            <div class="flex">
                <img src="${producto.urlImagen }" class="imagen flex-2" alt="${producto.nombre}">
                <div class="info flex-3">
                    <h2 class="outfit">${producto.nombre}</h2>
                    <p class="montserrat">${producto.descripcion}</p>
                    <p class="montserrat"> <i class="fa-solid fa-dollar-sign"></i> ${producto.pVenta}</p>
                    <p class="montserrat"> <i class="fa-solid fa-dollar-sign"></i> ${producto.pArriendo}</p>
                    <p class="montserrat g-p">Proveedor: ${producto.creador.nombre}</p>
                    <a href="/empresa/editar/producto/${producto.id}" class="btn montserrat mt-05" > <i class="fa-solid fa-pen"></i> Editar Producto</a>
                    <form action="/empresa/borrar/producto/${producto.id}" method="POST">
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" class="btn-danger montserrat mt-05">
                            <span> <i class="fa-solid fa-xmark"></i> Eliminar Producto </span>
                        </button>
                    </form>
                </div>
            </div>
        </main>    
        <footer class="mt-3">
            <div class="footer">
                <h5 class="outfit"> <i class="fa-regular fa-copyright"></i> Halus</h5>
                <p class="montserrat">Main font "Biko" <a href="http://www.jesuismonreve.org/biko-font-family/"> <i class="fa-regular fa-copyright"></i> Marco Ugolini </a></p>
                <p class="montserrat">Logo and design are property of this proyect.</p>
                <p class="montserrat">This site is prototype-only. Any images, fonts, texts, etc. are being used for this single prototype without any revenue. All rights to their respective owners.</p>
            </div>
        </footer>
    </body>
</html>