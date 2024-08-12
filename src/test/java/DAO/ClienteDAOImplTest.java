
package DAO;

import java.util.List;
import modelo.Cliente;
import org.junit.Test;
import static org.junit.Assert.*;


public class ClienteDAOImplTest {
    
    public ClienteDAOImplTest() {
    }

    
    @Test
    public void testListarClientes() {
        System.out.println("listarClientes");
        ClienteDAOImpl instance = new ClienteDAOImpl();
        List<Cliente> expResult = null;
        List<Cliente> result = instance.listarClientes();
        assertFalse("Deberia salir la lista", result.isEmpty());
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testRegistrarCliente() {
        System.out.println("registrarCliente");
        Cliente cliente = new Cliente(); // Asegúrate de inicializar correctamente el objeto Cliente
        cliente.setRazonSocial("Jaret Ynoñan");
        cliente.setRazonComercial("");
        cliente.setNombres("Yaret");
        cliente.setApellidos("Ynoñan");
        cliente.setIdTributario("73747673");
        cliente.setCorreo("vi73747673@zegel.pe");
        cliente.setIDUsuario("MASTER");
        
        // Configura otros atributos necesarios del cliente

        ClienteDAOImpl instance = new ClienteDAOImpl();
        instance.registrarCliente(cliente);

        // Verifica que el cliente se haya registrado correctamente
        Cliente clienteRegistrado = instance.obtenerPorId(6);
        assertNotNull("El cliente debería haberse registrado", clienteRegistrado);
        assertEquals("El nombre del cliente debería coincidir", "Jaret Ynoñan", clienteRegistrado.getRazonSocial());
    }
    
    @Test
    public void testActualizar() {
        System.out.println("actualizar");
        Cliente cliente = new Cliente(); // Asegúrate de inicializar correctamente el objeto Cliente
        cliente.setRazonSocial("Jaret Ynoñan");
        cliente.setRazonComercial("");
        cliente.setNombres("Yaret Geferson");
        cliente.setApellidos("Ynoñan");
        cliente.setIdTributario("73747673");
        cliente.setCorreo("vi73747673@zegel.pe");
        cliente.setIDUsuario("JairGonz");
        cliente.setIDCliente(6);
        // Configura otros atributos necesarios del cliente

        ClienteDAOImpl instance = new ClienteDAOImpl();
        instance.actualizar(cliente);

        // Verifica que el cliente se haya actualizado correctamente
        Cliente clienteActualizado = instance.obtenerPorId(6);
        assertNotNull("El cliente debería haberse actualizado", clienteActualizado);
        assertEquals("El nombre del cliente debería coincidir", "Yaret Geferson", clienteActualizado.getNombres());
    }

    @Test
    public void testEliminar() {
        System.out.println("eliminar");
        int id = 6;
        ClienteDAOImpl instance = new ClienteDAOImpl();
        instance.eliminar(id);

        Cliente clienteEliminado = instance.obtenerPorId(id);
        assertNull("El cliente debería haberse eliminado", clienteEliminado);
        //fail("The test case is a prototype.");
    }
}
