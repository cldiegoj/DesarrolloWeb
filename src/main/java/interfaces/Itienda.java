/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import Modelo.Articulo;
import Modelo.Categoria;
import Modelo.Cliente;
import Modelo.Compra;
import java.util.List;

public interface Itienda {

    List<Categoria> listCat(); // Lista de todas las categorías de productos.

    List<Articulo> listArt(String id); // Lista de artículos por categoría.

    Articulo busArt(String id); // Buscar un artículo por su código.

    Cliente busCli(String usr, String pas); // Buscar un cliente por usuario y contraseña.

    String grabaFac(String codc, List<Compra> lista); // Registrar una factura en la base de datos.
}