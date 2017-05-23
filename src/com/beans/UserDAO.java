package com.beans;

import com.beans.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.util.ArrayList;

import com.entity.UserBean;


public class UserDAO {
	private static InitialContext context = null;
	private DataSource dataSource = null;
	
//	private Connect getConnection(){
//		Connect conn = null;
//		try{
//			Class.forName("com.mysql.jdbc.Driver");
//			String dburl = "jdbc:mysql://localhost:3306/video";
//			conn = DriverManager.getConnection(dburl,"root","302434");
//		}catch(Exception e){
//			return null;
//		}
//		return conn;
//	}
	
	public String searchUser(UserBean user){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String message = "";
		String recStr =  "";
		String recStrId = "";
		try{
			pstmt = conn.prepareStatement("SELECT *FROM user WHERE name=?");
			pstmt.setString(1, user.getName());
			rst = pstmt.executeQuery();
			if(rst.next()){
				String inPw = user.getPassword();
				String dbPw = rst.getString("password");
				 if(inPw.equals(dbPw)){
					recStr = rst.getString("record");
					recStrId = rst.getString("recordId");
					message = "密码正确&";
				}else{
					message = "用户密码不正确&";
				}
			}else{
				message = "当前用户名不存在&";
			}
			message = message+recStr+"&"+recStrId;
//			System.out.println(message);
		}catch(Exception e){
			return null;
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.print(e);
			}
		}
		return message;
	}
	
	public String addUser(UserBean user){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		String message = "";
		int result = 0;
		
		try{
			pstmt = conn.prepareStatement("INSERT INTO user(name,password) values(?,?)");
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPassword());
			result = pstmt.executeUpdate();
			if(result>0){
				message = "成功注册用户&";
			}
		}catch(Exception e){
			System.out.print(e);
			return null;
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.print(e);
			}
		}
		return message;
	}
}
