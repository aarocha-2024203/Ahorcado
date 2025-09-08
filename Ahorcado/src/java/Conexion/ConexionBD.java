package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {

    // Datos de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/DB_Ahorcado?useSSL=false&serverTimezone=UTC";
    private static final String USER = "quintom";  // tu usuario de MySQL
    private static final String PASSWORD = "admin"; // tu contraseña de MySQL

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Registrar el driver de MySQL 8
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer conexión
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a la base de datos");
        } catch (Exception e) {
            System.out.println("❌ Error de conexión a la base de datos");
            e.printStackTrace();
        }
        return conn;
    }
}
