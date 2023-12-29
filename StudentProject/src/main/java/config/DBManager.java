package config;

import java.sql.*;

public class DBManager {
	private static DBManager instance=new DBManager();
	
	private Connection Conn;
	
	private DBManager() {
		try {
			Class.forName(DBconfig.DB_DRIVER);
			Conn=DriverManager.getConnection(DBconfig.DB_URL,DBconfig.DB_USER,DBconfig.DB_PASSWD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static DBManager getInstance() {
		if(instance==null)
			instance= new DBManager();
		return instance;
	}

	public Connection getConn() {
		return Conn;
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt) {
		try {
			if(rs!=null)
				rs.close();
			if(pstmt !=null)
				pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
