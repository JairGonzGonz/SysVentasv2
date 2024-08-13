package DAO;

import modelo.Proveedor;
import java.util.List;

public interface ProveedorDAO {
    void insertar(Proveedor proveedor);
    void actualizar(Proveedor proveedor);
    void eliminar(String RUCProveedor);
    Proveedor obtenerPorRUC(String RUCProveedor);
    List<Proveedor> obtenerTodos();
}