<?php
require_once("autoload.php");
require_once("Router.php");
require_once("Config/config.php");
$router = new Router();
$router->add("/", "Controllers\PaginaPrincipal@indexHome");
$router->add("/listar/productos", "Controllers\PaginaPrincipal@indexVerProductos");
$router->add("/login", "Controllers\Login@indexLogin");

$router->add("/intranet/ventas/pedidos", "Controllers\Ventas\Pedido@indexPedidos");
$router->add("/intranet/ventas/agregar-pedido", "Controllers\Ventas\Pedido@indexAgregarPedido");
$router->add("/intranet/inventario/materiales", "Controllers\Inventario\Materiales@indexMateriales");//Test

$router->add("/intranet/colaboradores/agregar-producto", "Controllers\Colaboradores\Producto@indexAdminProducto");
$router->add("/intranet/colaboradores/producto/historial", "Controllers\Colaboradores\Producto@indexHistorialProducto");
$router->add("/intranet/colaboradores/producto/histoarial", "Controllers\Colaboradores\Producto@indexHistorialProducto");
$router->add("/intranet/colaboradores/agregar-venta", "Controllers\Colaboradores\Venta@indexColaboradoresAgregarVenta");

// $router->add("/intranet/pedidos/reporte-ventas", "Controllers\Ventas\Pedidos@reporteVenta");

$router->add("/intranet/colaboradores/reporte-ventas", "Controllers\Colaboradores\Venta@reporteVenta");
$router->add("/intranet/colaboradores/mis-productos", "Controllers\Colaboradores\Producto@indexAdminMisProductos");
$router->add("/intranet/colaboradores/mis-ventas", "Controllers\Colaboradores\Venta@indexColaboradoresMisVentas");
$router->add("/intranet/administrador/categorias", "Controllers\Administrador\Categorias@indexCategorias");
$router->add("/intranet/administrador/colaboradores", "Controllers\Administrador\Colaboradores@indexColaboradores");//colas
$router->add("/intranet/administrador/marcas", "Controllers\Administrador\Marcas@indexMarcas");
$router->add("/intranet/inicio", "Controllers\Login@inicioIntranet");
$router->add("/usuario/cerrar-sesion", "Controllers\Login@cerrarSesion");
$router->add("/carrito/compras", "Controllers\Cliente\Compras@indexCarritoCompras");
$router->add("/correo", "Controllers\Correo@configurarCorreo");
$router->run();
?>