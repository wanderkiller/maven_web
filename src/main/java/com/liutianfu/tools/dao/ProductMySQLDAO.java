package com.liutianfu.tools.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.liutianfu.tools.Product;
import com.liutianfu.tools.util.DB;

public class ProductMySQLDAO implements ProductDAO {

	@Override
	public List<Product> getProducts() {
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DB.getConnection();
			String sql ="select * from product";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDescr(rs.getString(3));
				p.setNormalprice(rs.getDouble(4));
				p.setMemberprice(rs.getDouble(5));
				p.setPdate(rs.getTimestamp(6));
				p.setCategoryid(rs.getInt(7));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return list;
	}

	@Override
	public List<Product> getProducts(int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DB.getConnection();
			String sql ="select * from product limit "+(pageNo-1)*pageSize+","+pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDescr(rs.getString(3));
				p.setNormalprice(rs.getDouble(4));
				p.setMemberprice(rs.getDouble(5));
				p.setPdate(rs.getTimestamp(6));
				p.setCategoryid(rs.getInt(7));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return list;

	}

	@Override
	public List<Product> getRecentProducts(int count) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String sql = "select * from product order by pdate limit 1,"+count;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				products.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return products;
	}

}
