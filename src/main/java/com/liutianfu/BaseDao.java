package com.liutianfu;

import org.junit.jupiter.api.Test;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

//操作数据库的基础类
public class BaseDao {
    private static String driver;
    private static String url;
    private static String userName;
    private static String passWord;

    //    静态码块,加载时进行初始化赋值
    static {
        Properties properties = new Properties();
        InputStream is = BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver = properties.getProperty("jdbc.driver");
        url = properties.getProperty("jdbc.url");
        userName = properties.getProperty("jdbc.userName");
        passWord = properties.getProperty("jdbc.passWord");
    }

    //    获取和数据库建立的连接
    public static Connection getcon() {
        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, userName, passWord);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    //    编译查询公共方法
    public static ResultSet queryexecute(Connection connection, String sql, Object[] params) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(i + 1, params[i]);
            }
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    @Test
    public void test() throws SQLException {
        Connection getcon = getcon();
        String sql = "select * from EMP where ENAME = ?";
        Object[] params = {"SMITH"};
        ResultSet queryexecute = queryexecute(getcon, sql, params);
        while (queryexecute.next()) {
            System.out.println(queryexecute.getString(1));
            System.out.println(queryexecute.getString("ENAME"));
        }
    }

    //    增删改查
    public static int updateExecute(Connection connection, String sql, Object[] params) {
        PreparedStatement preparedStatement = null;
        int result = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(i + 1, params[i]);
            }
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

