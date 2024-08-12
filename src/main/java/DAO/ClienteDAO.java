package DAO;

import modelo.Cliente;
import java.util.List;

public interface ClienteDAO {
    
    void registrarCliente(Cliente cliente);
    void actualizar(Cliente cliente);
    void eliminar(int id);
    Cliente obtenerPorId(int id);
    List<Cliente> listarClientes();
    
}
