<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isErrorPage="true" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halus | Editar información</title>
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="/css/style.css?version=0.4.5">
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
				        <li><a class="navlink montserrat" href="/cliente/carrito">Carrito</a></li>
				        <li><a class="navlink montserrat" href="/cliente/${usuarioEnSesion.id}">Perfil</a></li>
				        <li><a href="/logout" class="btn montserrat">Cerrar Sesión</a></li>
				    </ul>
			    </c:otherwise>
            </c:choose> 
        </header>
        <main class="main">
	        <c:choose>
	        	<c:when test="${usuarioEnSesion.tipoDeUsuario == admin }">
		        	<h1 class="outfit m-1">Editar Cliente </h1>
		            <div class="r-cont mb-1">
		                <form:form action="/admin/actualizar/cliente/${cliente.id}" method="POST" modelAttribute="cliente">
		                    <input type="hidden" name="_method" value="PUT"><!-- SOBREESCRIBO METODO -->
		                    <div class="mt-05">
		                        <form:label class="montserrat" path="nombre">Nombre:</form:label>
		                        <form:input id="nombre" path="nombre" class="txt-input montserrat" placeholder="Nombre cliente" required="required"/>
		                        <form:errors path="nombre" class="txt-danger montserrat"/>
		                    </div>
		                    <div class="mt-05">
		                        <form:label class="montserrat" path="apellido">Apellido:</form:label>
		                        <form:input id="apellido" path="apellido" class="txt-input montserrat" placeholder="Apellido cliente" required="required"/>
		                        <form:errors path="apellido" class="txt-danger montserrat"/>
		                    </div>
		                    <div class="mt-05">
		                        <form:label class="montserrat" path="email">Email:</form:label>
		                        <form:input id="email" path="email" class="txt-input montserrat" placeholder="Email cliente" required="required"/>
		                        <form:errors path="email" class="txt-danger montserrat"/>
		                    </div>	
		                    <div class="mt-05">
		                        <form:label class="montserrat" path="direccion">Direccion:</form:label>
		                        <form:input id="direccion" path="direccion" class="txt-input montserrat" placeholder="Direccion cliente" required="required"/>
		                        <form:errors path="direccion" class="txt-danger montserrat"/>
		                    </div>	
		                    <div class="mt-05">
								<form:label class="montserrat" for="tipoDeUsuario" path="tipoDeUsuario">Tipo de Usuario:</form:label>
						        <form:select class="txt-input montserrat" path="tipoDeUsuario">
						            <form:option path="tipoDeUsuario" class="txt-input montserrat" value="CLIENTE">Cliente</form:option>
						            <form:option path="tipoDeUsuario" class="txt-input montserrat" value="EMPRESA">Empresa</form:option>
						        </form:select>
				                <form:errors path="tipoDeUsuario" class="txt-danger montserrat" />
				            </div>	
		                    <button type="submit" class="btn montserrat mt-05">
		                        <span> Guardar </span>
		                    </button>
		                </form:form>
		                <form action="/admin/borrar/usuario/${cliente.id}" method="POST">
							<input type="hidden" name="_method" value="DELETE">
							<button type="submit" class="btn-danger montserrat mt-05">
		                        <span> <i class="fa-solid fa-xmark"></i> Eliminar cliente </span>
		                    </button>
		                </form> 
		            </div>
	        	</c:when>
	        	<c:otherwise>
	        	<h1 class="outfit m-1">Editar mi información</h1>
		            <div class="r-cont mb-1">
						<div id="error"></div>
		                <form:form id="form" action="/cliente/actualizar/${usuarioEnSesion.id}" method="POST" modelAttribute="cliente">
		                    <input type="hidden" name="_method" value="PUT"><!-- SOBREESCRIBO METODO -->
		                    <div class="mt-05">
		                        <form:label for="nombre" class="montserrat" path="nombre">Nombre:</form:label>
		                        <form:input id="nombre" name="nombre" type="text" path="nombre" class="txt-input montserrat" placeholder="Nombre" required="required"/>
		                        <form:errors path="nombre" class="txt-danger montserrat"/>
		                    </div>
		                    <div class="mt-05">
		                        <form:label for="apellido" class="montserrat" path="apellido">Apellido:</form:label>
		                        <form:input id="apelleido" name="apellido" type="text" path="apellido" class="txt-input montserrat" placeholder="Apellido" required="required"/>
		                        <form:errors path="apellido" class="txt-danger montserrat"/>
		                    </div>
		                    <div class="mt-05">
		                        <form:label for="email" class="montserrat" path="email">Email:</form:label>
		                        <form:input id="email" name="email" type="email" path="email" class="txt-input montserrat" placeholder="Email" required="required"/>
		                        <form:errors path="email" class="txt-danger montserrat"/>
		                    </div>	
		                    <div class="mt-05">
		                        <form:label for="direccion" class="montserrat" path="direccion">Direccion:</form:label>
		                        <form:input id="direccion" name="direccion" type="direccion" path="direccion" class="txt-input montserrat" placeholder="Direccion" required="required"/>
		                        <form:errors path="direccion" class="txt-danger montserrat"/>
		                    </div>	
		                    <button type="submit" class="btn montserrat mt-05">
		                        <span> Guardar </span>
		                    </button>
		                </form:form>
		            </div>
	        	</c:otherwise>
	        </c:choose>
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