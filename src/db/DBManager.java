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
public class DBManager {
    public Connection conn;
    public Statement stm;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/db_tokodaging"; 
    private String username = "root";   
    private String password = ""; 
    
    public void Connect() throws SQLException{        
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            stm = conn.createStatement();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
    }
    
    public ResultSet fetchRows(String sql) {
        ResultSet rs = null;
        
        try{
            Statement st = conn.createStatement();
            rs = st.executeQuery(sql);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
    
    boolean executeSQL(String sql) {
        boolean result = true;
        
        try{
            Statement st = conn.createStatement();
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
