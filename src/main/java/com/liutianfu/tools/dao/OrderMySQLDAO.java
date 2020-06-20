package com.liutianfu.tools.dao;

import java.sql.*;

import com.liutianfu.tools.*;
import com.liutianfu.tools.util.DB;


public class OrderMySQLDAO {

    public void save(SalesOrder so) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rsKey = null;

        try {
            conn = DB.getConnection();
            boolean flag = conn.getAutoCommit();
            conn.setAutoCommit(false);//添加事务处理
            String sql = "insert into salesorder values(null,?,?,?,?)";
            pstmt = DB.getPreparedStatement(conn, sql, true);
            pstmt.setInt(1, so.getUser().getId());
            pstmt.setString(2, so.getAddr());
            pstmt.setTimestamp(3, so.getOdate());
            pstmt.setInt(4, so.getStatus());
            pstmt.executeUpdate();
            conn.commit();//事务处理
            conn.setAutoCommit(flag);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.setAutoCommit(true);
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            DB.closeResultSet(rsKey);
            DB.closeStatement(pstmt);
            DB.closeConnection(conn);
        }
    }
}
