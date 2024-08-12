
package DAO;

import util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
        
public class UsuarioDAO {

    public boolean validarUsuario(String username, String password) {
        String sql = "SELECT * FROM Usuario WHERE IDUsuario = ? AND clave = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // Si hay un resultado, las credenciales son válidas
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
