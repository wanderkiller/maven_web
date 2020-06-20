package com.liutianfu.tools;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.liutianfu.tools.util.DB;

public class UserManager {

	public static List<User> getUsers(){
		List<User> users = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String sql = "select * from ruser";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setrDate(rs.getTimestamp("rdate"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return users;
	}

	public static User userExits(String username,String password) throws UserNotFoundException, PasswordNotCorrectException{
		User u = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String sql = "select * from ruser where username ='"+username+"'";
			rs = DB.executeQuery(conn, sql);
			if(!rs.next()){
				throw new UserNotFoundException();//抛出自定的异常类
			}else if(!rs.getString("password").equals(password)){
				throw new PasswordNotCorrectException();//抛出自定义的异常类
			}else{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setrDate(rs.getTimestamp("rdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return u;
	}



}
