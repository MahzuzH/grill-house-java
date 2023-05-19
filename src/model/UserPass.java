/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import db.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
/**
 *
 * @author MahzuzH
 */
public class UserPass {
    private ConnectionManager conman;
    String user;
    String pass;
    public Connection con;
    public Statement stat;
    public ResultSet rs;

    public UserPass() {
        conman = new ConnectionManager();
    }


    public ResultSet readUserpass(){
        try{
            conman.logOn();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        String query = "select * from userpass";

        ResultSet result = conman.fetchRows(query);
        return result;
    }
    
    
    public int saveUser(String user, String pass, String role){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "insert into userpass (username, password, role)"
                + "value('"+user+"', '"+pass+"', '"+role+"')";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Simpan User");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int deleteUser(String no){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "delete from userpass where no_akun = '"+no+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Hapus User");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int updateUser(String no, String user, String pass, String role){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "update userpass set username = '"+user+"', password = '"+pass+"'"
                + ", role = '"+role+"' where no_akun = '"+no+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Update User");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
}
