package com.equipo6.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.equipo6.modelos.Pedido;
import com.equipo6.modelos.Producto;
import com.equipo6.modelos.ProductoEnPedido;
import com.equipo6.modelos.Usuario;
import com.equipo6.servicios.ServicioPedido;
import com.equipo6.servicios.ServicioProductoEnPedido;
import com.equipo6.servicios.ServicioProductos;
import com.equipo6.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RequestMapping("/empresa")
@Controller
public class ControladorEmpresas {

	@Autowired
	private ServicioUsuarios sUsuarios;

	@Autowired
	private ServicioProductos sProductos;

	@Autowired
	private ServicioPedido sPedidos;
	
	@Autowired
	private ServicioProductoEnPedido sProdEnP;

//EMPRESAhome.jsp
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		return "EMPRESAhome.jsp";
	}

//ElistaProductos.jsp
	@GetMapping("/productos")
	public String listaProductos(HttpSession session, Model model) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}
		// Para conseguir los productos de LA EMPRESA EN SESION
		Usuario usuario = sUsuarios.buscarUsuario(usuarioEnSesion.getId());
		model.addAttribute("usuario", usuario);

		List<Producto> productos = sProductos.buscarProductosPorEmpresa(usuario);
		model.addAttribute("productos", productos);
		return "ACElistaProductos.jsp";
	}

//ACEdetalleProducto.jsp
	@GetMapping("/productos/{id}")
	public String detalleProducto(@PathVariable("id") Long id, Model model, HttpSession session) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		String cliente = "CLIENTE";// para comparacion en jsp
		model.addAttribute("cliente", cliente);
		String admin = "ADMIN";
		model.addAttribute("admin", admin);

		Producto producto = sProductos.buscarProducto(id);
		if (producto == null) {
			return "redirect:/empresa/productos";
		}

		model.addAttribute("producto", producto);

		return "ACEdetalleProducto.jsp";
	}

//nuevoProducto.jsp    
	@GetMapping("/nuevo/producto")
	public String nuevoProducto(@ModelAttribute("nuevoProducto") Producto nuevoProducto, HttpSession session) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		return "nuevoProducto.jsp";
	}

//POSTmapping    
	@PostMapping("/agregar/producto")
	public String agregarProducto(@Valid @ModelAttribute("nuevoProducto") Producto nuevoProducto, BindingResult result) {

		if (result.hasErrors()) {
			return "nuevoProducto.jsp";
		} else {
			sProductos.guardarProducto(nuevoProducto);
		}
		return "redirect:/empresa/productos";
	}

	// AEeditarProducto.jsp
	@GetMapping("/editar/producto/{id}")
	public String editarProducto(@PathVariable("id") Long id, Model model, HttpSession session) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}
		
		String admin = "ADMIN";
		model.addAttribute("admin", admin);
		
		Producto producto = sProductos.buscarProducto(id);

		if (producto == null) {
			return "redirect:/empresa/productos";
		}

		model.addAttribute("producto", producto);

		return "AEeditarProducto.jsp";
	}

	// PUTmapping
	@PutMapping("/actualizar/producto/{id}")
	public String actualizarProducto(@PathVariable("id") Long id, @Valid @ModelAttribute("producto") Producto producto,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			model.addAttribute("producto", producto);
			return "AEeditarProducto.jsp";
		}
		
		String admin = "ADMIN";
		model.addAttribute("admin", admin);
		
		sProductos.guardarProducto(producto);
		Producto productoActualizado = sProductos.buscarProducto(id);
		return "redirect:/empresa/productos/" + productoActualizado.getId();
	}

	// DELETEmapping
	@DeleteMapping("/borrar/producto/{id}")
	public String borrarProducto(@PathVariable("id") Long id) {
		sProductos.borrarProducto(id);
		return "redirect:/empresa/productos";
	}

//ACEpedidos.jsp   *************************************************************** 
	@GetMapping("/ventas")
	public String listaVentas(HttpSession session, Model model) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		String cliente = "CLIENTE";// para comparacion en jsp
		model.addAttribute("cliente", cliente);
		String admin = "ADMIN";
		model.addAttribute("admin", admin);

		// Para conseguir las ventas de LA EMPRESA EN SESION
		Long idEmpresa = usuarioEnSesion.getId();
		List <Pedido> ventas = sPedidos.pedidosDeLaEmpresa(idEmpresa);
		model.addAttribute("ventas", ventas);

		return "ACElistaPedidos.jsp";
	}

//ACEdetallePedido.jsp 
	@GetMapping("/ventas/{id}")
	public String detalleVenta(@PathVariable("id") Long id, HttpSession session, Model model) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		Pedido pedido = sPedidos.buscarPedido(id);
		model.addAttribute("pedido", pedido);
		
		String cliente = "CLIENTE";// para comparacion en jsp
 		model.addAttribute("cliente", cliente);
 		String admin = "ADMIN";
 		model.addAttribute("admin", admin);
 		String empresa = "EMPRESA";
 		model.addAttribute("empresa", empresa);
		
		Long pedidoId = pedido.getId();
		//busco la lista con el id del pedido
		List<ProductoEnPedido> productosEnElPedido = sProdEnP.buscarProdxPedido(pedidoId);
		model.addAttribute("pEp", productosEnElPedido);
		
		Usuario usuarioActualizado = sUsuarios.buscarUsuario(usuarioEnSesion.getId());
		model.addAttribute("usuario", usuarioActualizado);

		return "ACEdetallePedido.jsp";
	}

	// DELETEmapping
	@DeleteMapping("/borrar/pedido/{id}")
	public String borrarPedido(@PathVariable("id") Long id) {

		sPedidos.borrarPedido(id);

		return "redirect:/empresa/ventas";
	}

//AEdetalleEmpresa.jsp    
	@GetMapping("/{id}")
	public String detalleEmpresa(@PathVariable("id") Long id, Model model, HttpSession session) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		String admin = "ADMIN";
		model.addAttribute("admin", admin);

		Usuario empresa = sUsuarios.buscarUsuario(id);

		if (empresa == null) {
			return "redirect:/empresa/home";
		}

		model.addAttribute("empresa", empresa);
		return "AEdetalleEmpresa.jsp";
	}

//AEeditarEmpresa.jsp   
	@GetMapping("/editar/{id}")
	public String editar(@ModelAttribute("empresa") Usuario empresa, @PathVariable("id") Long id, Model model,
			HttpSession session) {

		Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

		if (session.getAttribute("usuarioEnSesion") == null || !usuarioEnSesion.getTipoDeUsuario().equals("EMPRESA")) {
			return "redirect:/";
		}

		Usuario empresaActual = sUsuarios.buscarUsuario(id);

		if (empresaActual == null || !empresaActual.getId().equals(usuarioEnSesion.getId())) {
			return "redirect:/empresa/" + usuarioEnSesion.getId();
		}

		String admin = "ADMIN";// para comparacion en jsp
		model.addAttribute("admin", admin);

		model.addAttribute("empresa", empresaActual);
		return "AEeditarEmpresa.jsp";
	}
	
	@PutMapping("/actualizar/{id}")
    public String actualizarEmpresa(@PathVariable("id") Long id, @ModelAttribute("empresa")Usuario empresa,
            BindingResult result, Model model, HttpSession session) {

		String admin = "ADMIN";// para comparacion en jsp
		model.addAttribute("admin", admin);
		
        Usuario empresapwd = sUsuarios.buscarUsuario(id);
        empresapwd.setNombre(empresa.getNombre());
        empresapwd.setApellido(empresa.getApellido());
        empresapwd.setEmail(empresa.getEmail());
        empresapwd.setDireccion(empresa.getDireccion());

        if (result.hasErrors()) {

            model.addAttribute("empresa", empresapwd);;
            return "AEeditarEmpresa.jsp";
        }

        sUsuarios.guardarUsuario(empresapwd);
        
        Usuario usuarioActualizado = sUsuarios.buscarUsuario(id);
        session.setAttribute("usuarioEnSesion", usuarioActualizado);
        return "redirect:/empresa/"+usuarioActualizado.getId() ;
    

}

}