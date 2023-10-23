/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import Modelo.*;
import java.util.List;

public interface Itienda {

    List<Categoria> listCat(); // Lista de todas las categorías de productos.

    List<Bebidas> listBeb (String id); // Lista de artículos por categoría.

    Bebidas busBeb(String id); // Buscar un artículo por su código.

    Cliente busCli(String usr, String pas); // Buscar un cliente por usuario y contraseña.

    String grabaFac(String codc, List<Compra> lista); // Registrar una factura en la base de datos.
}