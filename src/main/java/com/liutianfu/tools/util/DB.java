package com.liutianfu.tools.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {//���ݿ⹤����
	
	static{//��Ϊÿ�η������ݿⶼҪͨ��Class.forName()����������Ϊ��̬ģ��
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){//��ȡ��һ������
		Connection conn = null;
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:33333/J2EE?characterEncoding=utf8","root","123456");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return conn;
	}
	
	public static void closeConnection(Connection conn){//�ر����ݿ�����
		try {
			if(conn != null){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Statement getStatement(Connection conn){//����һ�����
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
	}
	
	//����һ��Ԥ�������
	public static PreparedStatement getPreparedStatement(Connection conn,String sql){
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public static PreparedStatement getPreparedStatement(Connection conn,String sql,boolean generatedKey){
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
	}
	
	
	public static void closeStatement(Statement stmt){//�ر����
		try {
			if(stmt != null){
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static ResultSet executeQuery(Statement stmt,String sql){//��ȡ�����
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static ResultSet executeQuery(Connection conn,String sql){//��ȡ�����
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static boolean executeUpdate(Connection conn,String sql){//��ȡ�����
		
		try {
			conn.createStatement().executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static void closeResultSet(ResultSet rs){//�رս����
		try {
			if(rs != null){
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
