package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnection {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver"; // 사용하는 DB에 맞게 수정 (예: MySQL)
    private static final String URL = "jdbc:mysql://localhost:3306/kin_project?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() throws SQLException {
        try {
            // JDBC 드라이버 로드
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로드 실패!");
            e.printStackTrace();
            throw new SQLException("JDBC 드라이버 로드 실패", e);
        }
        // DB 연결
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
