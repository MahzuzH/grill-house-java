/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author MahzuzH
 */
public class ConnectionManager {
    public Connection con;
    public Statement stm;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/db_tokodaging";  // myDB --> nama database 
    private String username = "root";       // user name DMBS
    private String password = "";    // pswd DMBS

    public Connection logOn(){
        try {
            //Load JDBC Driver
            Class.forName( driver ).newInstance();
            //Buat object Connection
            con = DriverManager.getConnection( url, username, password );
            stm = con.createStatement();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return con;
    }

    public void logOff(){
        try {
            //Tutup Koneksi
            con.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public ResultSet fetchRows(String sql) {
        ResultSet rs = null;
        
        try{
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
    
    boolean executeSQL(String sql) {
        boolean result = true;
        
        try{
            Statement st = con.createStatement();
            if(st.execute(sql)) {
                result = true;
            }
            
        } catch(SQLException e) {
            System.out.println(e);
            result = false;
        }
        return result;
    }
}
