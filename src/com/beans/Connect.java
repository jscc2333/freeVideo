package com.beans;

import java.sql.*;
import javax.sql.*;

public class Connect {
	
	public static Connection getConnection(){
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost:3306/video";
			conn = DriverManager.getConnection(dburl,"root","302434");
		}catch(Exception e){
			return null;
		}
		return conn;
	}
}
