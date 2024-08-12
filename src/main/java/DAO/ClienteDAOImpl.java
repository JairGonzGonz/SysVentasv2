package DAO;

import modelo.Cliente;
import util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAOImpl implements ClienteDAO {

    private Connection connection;

    public ClienteDAOImpl() {
        this.connection = DatabaseConnection.getConnection();
    }

    @Override
    public List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM Cliente";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Cliente cliente = new Cliente(
                        rs.getInt("IDCliente"),
                        rs.getString("RazonSocial"),
                        rs.getString("RazonComercial"),
                        rs.getString("Nombres"),
                        rs.getString("Apellidos"),
                        rs.getString("IdTributario"),
                        rs.getString("Correo"),
                        rs.getString("IDUsuario")                        
                );
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientes;
    }

    @Override
    public void registrarCliente(Cliente cliente) {
        String sql = "INSERT INTO Cliente (RazonSocial, RazonComercial, Nombres, Apellidos, IdTributario, Correo, IDUsuario) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, cliente.getRazonSocial());
            pstmt.setString(2, cliente.getRazonComercial());
            pstmt.setString(3, cliente.getNombres());
            pstmt.setString(4, cliente.getApellidos());
            pstmt.setString(5, cliente.getIdTributario());
            pstmt.setString(6, cliente.getCorreo());
            pstmt.setString(7, cliente.getIDUsuario());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void actualizar(Cliente cliente) {
        String sql = "UPDATE Cliente SET RazonSocial=?, RazonComercial=?, Nombres=?, Apellidos=?, IdTributario=?, Correo=?, IDUsuario=? WHERE IDCliente=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, cliente.getRazonSocial());
            pstmt.setString(2, cliente.getRazonComercial());
            pstmt.setString(3, cliente.getNombres());
            pstmt.setString(4, cliente.getApellidos());
            pstmt.setString(5, cliente.getIdTributario());
            pstmt.setString(6, cliente.getCorreo());
            pstmt.setString(7, cliente.getIDUsuario());
            pstmt.setInt(8, cliente.getIDCliente());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void eliminar(int id) {
        String sql = "DELETE FROM Cliente WHERE IDCliente=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Cliente obtenerPorId(int id) {
        String sql = "SELECT * FROM Cliente WHERE IDCliente=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Cliente(
                        rs.getInt("IDCliente"),
                        rs.getString("RazonSocial"),
                        rs.getString("RazonComercial"),
                        rs.getString("Nombres"),
                        rs.getString("Apellidos"),
                        rs.getString("IdTributario"),
                        rs.getString("Correo"),
                        rs.getString("IDUsuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
