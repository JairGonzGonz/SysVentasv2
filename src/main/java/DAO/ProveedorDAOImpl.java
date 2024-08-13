package DAO;

import modelo.Proveedor;
import util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAOImpl implements ProveedorDAO {

    @Override
    public void insertar(Proveedor proveedor) {
        String sql = "INSERT INTO Proveedor (RUCProveedor, razonSocial, razonComercial, Correo, telefono, diasCredito, contacto_1, telefonoC_1, contacto_2, telefonoC_2, fechaRegistro, IDUsuario, IDUbigeo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, proveedor.getRUCProveedor());
            pstmt.setString(2, proveedor.getRazonSocial());
            pstmt.setString(3, proveedor.getRazonComercial());
            pstmt.setString(4, proveedor.getCorreo());
            pstmt.setString(5, proveedor.getTelefono());
            pstmt.setDouble(6, proveedor.getDiasCredito());
            pstmt.setString(7, proveedor.getContacto1());
            pstmt.setString(8, proveedor.getTelefonoC1());
            pstmt.setString(9, proveedor.getContacto2());
            pstmt.setString(10, proveedor.getTelefonoC2());
            pstmt.setTimestamp(11, Timestamp.valueOf(proveedor.getFechaRegistro()));
            pstmt.setString(12, proveedor.getIDUsuario());
            pstmt.setString(13, proveedor.getIDUbigeo());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void actualizar(Proveedor proveedor) {
        String sql = "UPDATE Proveedor SET razonSocial=?, razonComercial=?, Correo=?, telefono=?, diasCredito=?, contacto_1=?, telefonoC_1=?, contacto_2=?, telefonoC_2=?, fechaRegistro=?, IDUsuario=?, IDUbigeo=? WHERE RUCProveedor=?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, proveedor.getRazonSocial());
            pstmt.setString(2, proveedor.getRazonComercial());
            pstmt.setString(3, proveedor.getCorreo());
            pstmt.setString(4, proveedor.getTelefono());
            pstmt.setDouble(5, proveedor.getDiasCredito());
            pstmt.setString(6, proveedor.getContacto1());
            pstmt.setString(7, proveedor.getTelefonoC1());
            pstmt.setString(8, proveedor.getContacto2());
            pstmt.setString(9, proveedor.getTelefonoC2());
            pstmt.setTimestamp(10, Timestamp.valueOf(proveedor.getFechaRegistro()));
            pstmt.setString(11, proveedor.getIDUsuario());
            pstmt.setString(12, proveedor.getIDUbigeo());
            pstmt.setString(13, proveedor.getRUCProveedor());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void eliminar(String RUCProveedor) {
        String sql = "DELETE FROM Proveedor WHERE RUCProveedor = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, RUCProveedor);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Proveedor obtenerPorRUC(String RUCProveedor) {
        String sql = "SELECT * FROM Proveedor WHERE RUCProveedor = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, RUCProveedor);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return extraerProveedorDeResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Proveedor> obtenerTodos() {
        List<Proveedor> proveedores = new ArrayList<>();
        String sql = "SELECT * FROM Proveedor";
        try (Connection conn = DatabaseConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                proveedores.add(extraerProveedorDeResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proveedores;
    }

    private Proveedor extraerProveedorDeResultSet(ResultSet rs) throws SQLException {
        Proveedor proveedor = new Proveedor();
        proveedor.setRUCProveedor(rs.getString("RUCProveedor"));
        proveedor.setRazonSocial(rs.getString("razonSocial"));
        proveedor.setRazonComercial(rs.getString("razonComercial"));
        proveedor.setCorreo(rs.getString("Correo"));
        proveedor.setTelefono(rs.getString("telefono"));
        proveedor.setDiasCredito(rs.getDouble("diasCredito"));
        proveedor.setContacto1(rs.getString("contacto_1"));
        proveedor.setTelefonoC1(rs.getString("telefonoC_1"));
        proveedor.setContacto2(rs.getString("contacto_2"));
        proveedor.setTelefonoC2(rs.getString("telefonoC_2"));
        proveedor.setFechaRegistro(rs.getTimestamp("fechaRegistro").toLocalDateTime());
        proveedor.setIDUsuario(rs.getString("IDUsuario"));
        proveedor.setIDUbigeo(rs.getString("IDUbigeo"));
        return proveedor;
    }
}
