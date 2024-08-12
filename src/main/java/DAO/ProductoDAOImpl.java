package DAO;

import modelo.Producto;
import modelo.Combo;
import util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

public class ProductoDAOImpl implements ProductoDAO {

    private Connection connection;

    public ProductoDAOImpl() {
        this.connection = DatabaseConnection.getConnection();
    }

    @Override
    public List<Producto> listarProductos() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT IDProducto, Descripcion, Resumida, IDunidadMedida, IDClasificacion, porcentajeImpuesto1, porcentajeImpuesto2, precioCosto, precioVenta, stockMinimo, stock, Observacion, fechaRegistro, IDUsuario, Activo, UnidadMedida, clasificacion FROM dbo.vProducto";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Producto producto;
                producto = new Producto(
                        rs.getInt("IDProducto"),
                        rs.getString("Descripcion"),
                        rs.getString("Resumida"),
                        rs.getInt("IDunidadMedida"),
                        rs.getInt("IDClasificacion"),
                        rs.getFloat("porcentajeImpuesto1"),
                        rs.getFloat("porcentajeImpuesto2"),
                        rs.getFloat("precioCosto"),
                        rs.getFloat("precioVenta"),
                        rs.getFloat("stockMinimo"),
                        rs.getFloat("stock"),
                        rs.getString("Observacion"),
                        rs.getTimestamp("fechaRegistro"),
                        rs.getString("IDUsuario"),
                        rs.getBoolean("Activo"),
                        rs.getString("UnidadMedida"),
                        rs.getString("clasificacion")
                );
                productos.add(producto);                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }

    @Override
    public void registrarProducto(Producto producto) {
        String sql = "INSERT INTO dbo.Producto(Descripcion, Resumida, IDunidadMedida, IDClasificacion, porcentajeImpuesto1, porcentajeImpuesto2, precioCosto, precioVenta, stockMinimo, stock, Observacion, fechaRegistro, IDUsuario, Activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, producto.getDescripcion());
            pstmt.setString(2, producto.getResumida());
            pstmt.setInt(3, producto.getIdUnidadMedida());
            pstmt.setInt(4, producto.getIdClasificacion());
            pstmt.setFloat(5, producto.getPorcentajeImpuesto1());
            pstmt.setFloat(6, producto.getPorcentajeImpuesto2());
            pstmt.setFloat(7, producto.getPrecioCosto());
            pstmt.setFloat(8, producto.getPrecioVenta());
            pstmt.setFloat(9, producto.getStockMinimo());
            pstmt.setFloat(10, producto.getStock());
            pstmt.setString(11, producto.getObservacion());
            pstmt.setTimestamp(12, producto.getFechaRegistro());
            pstmt.setString(13, producto.getIdUsuario());
            pstmt.setBoolean(14, producto.isActivo());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void actualizar(Producto producto) {
        String sql = "UPDATE dbo.Producto SET Descripcion=?, Resumida=?, IDunidadMedida=?, IDClasificacion=?, porcentajeImpuesto1=?, porcentajeImpuesto2=?, precioCosto=?, precioVenta=?, stockMinimo=?, Observacion=?, IDUsuario=?, Activo=? WHERE IDProducto=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, producto.getDescripcion());
            pstmt.setString(2, producto.getResumida());
            pstmt.setInt(3, producto.getIdUnidadMedida());
            pstmt.setInt(4, producto.getIdClasificacion());
            pstmt.setFloat(5, producto.getPorcentajeImpuesto1());
            pstmt.setFloat(6, producto.getPorcentajeImpuesto2());
            pstmt.setFloat(7, producto.getPrecioCosto());
            pstmt.setFloat(8, producto.getPrecioVenta());
            pstmt.setFloat(9, producto.getStockMinimo());
            pstmt.setString(10, producto.getObservacion());
            pstmt.setString(11, producto.getIdUsuario());
            pstmt.setBoolean(12, producto.isActivo());
            pstmt.setInt(14, producto.getIdProducto());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Producto obtenerPorId(int id) {
        String sql = "SELECT IDProducto, Descripcion, Resumida, IDunidadMedida, IDClasificacion, porcentajeImpuesto1, porcentajeImpuesto2, precioCosto, precioVenta, stockMinimo, stock, Observacion, fechaRegistro, IDUsuario, Activo, UnidadMedida, clasificacion FROM dbo.Producto WHERE IDProducto=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Producto(
                        rs.getInt("IDProducto"),
                        rs.getString("Descripcion"),
                        rs.getString("Resumida"),
                        rs.getInt("IDunidadMedida"),
                        rs.getInt("IDClasificacion"),
                        rs.getFloat("porcentajeImpuesto1"),
                        rs.getFloat("porcentajeImpuesto2"),
                        rs.getFloat("precioCosto"),
                        rs.getFloat("precioVenta"),
                        rs.getFloat("stockMinimo"),
                        rs.getFloat("stock"),
                        rs.getString("Observacion"),
                        rs.getTimestamp("fechaRegistro"),
                        rs.getString("IDUsuario"),
                        rs.getBoolean("Activo"),
                        rs.getString("UnidadMedida"),
                        rs.getString("clasificacion")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Combo> ComboUnidadMedida(){
        List<Combo> ComboUM = new ArrayList<>();
        String sql = "SELECT IDunidadMedida AS Codigo, Descripcion FROM UnidadMedida";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int codigo = rs.getInt("Codigo");
                String descripcion = rs.getString("Descripcion");
                ComboUM.add(new Combo(codigo, descripcion));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ComboUM;
    }

    public List<Combo> ComboClasificacion(){
        List<Combo> ComboCl = new ArrayList<>();
        String sql = "SELECT IDClasificacion AS Codigo, clasificacion AS Descripcion FROM Clasificacion";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int codigo = rs.getInt("Codigo");
                String descripcion = rs.getString("Descripcion");
                ComboCl.add(new Combo(codigo, descripcion));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ComboCl;
    }
}
