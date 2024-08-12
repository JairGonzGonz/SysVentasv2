package DAO;

import modelo.Producto;
import java.util.List;

public interface ProductoDAO {
    void registrarProducto(Producto producto);
    void actualizar(Producto producto);
    Producto obtenerPorId(int id);
    List<Producto> listarProductos();
}
