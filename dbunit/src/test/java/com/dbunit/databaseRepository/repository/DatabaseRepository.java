package com.dbunit.databaseRepository.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Seller;

public class DatabaseRepository implements Repository {

    private final String driver = "org.apache.derby.jdbc.EmbeddedDriver";
    private final String protocol = "jdbc:derby:";
    private final String dbName = "shopdb";
    private Connection conn;

    public DatabaseRepository() throws Exception {
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(protocol + dbName);
    }

    @Override
    public Seller findById(String id) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Seller seller = null;

        try {

            String query = "select ID, name, email" + " from seller where ID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                throw new SQLException("No Data Found!");
            }

            seller = Seller.newInstance(rs.getString(1), rs.getString(2), rs.getString(3));

            rs.close();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return seller;
    }

    @Override
    public void add(Seller seller) {

    }

    @Override
    public void update(Seller seller) {

    }

    @Override
    public void remove(Seller seller) {

    }

}
