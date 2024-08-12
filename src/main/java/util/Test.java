package util;

import java.sql.Connection;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args) {
        System.out.println("Intentando conectar a la base de datos...");
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                System.out.println("¡Conexion exitosa!");
                System.out.println("Detalles de la conexion:");
                System.out.println("URL: " + conn.getMetaData().getURL());
                System.out.println("Usuario: " + conn.getMetaData().getUserName());
                System.out.println("Nombre del producto de base de datos: " + conn.getMetaData().getDatabaseProductName());
                System.out.println("Version del producto de base de datos: " + conn.getMetaData().getDatabaseProductVersion());
            } else {
                System.out.println("La conexión fallo. Verifique sus credenciales y la configuración de la base de datos.");
            }
        } catch (SQLException e) {
            System.out.println("Error al conectar o obtener metadatos de la base de datos:");
            e.printStackTrace();
        }
    }
}