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
public class Daging {
    private ConnectionManager conman; 
    public Daging(){
        conman = new ConnectionManager();
    }

    public ResultSet readDaging(){
        try{
            conman.logOn();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        String query = "select * from daging";

        ResultSet result = conman.fetchRows(query);
        return result;
    }
    
    public int saveDaging(String kode, String bagian, String grade, String stok, String harga){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "insert into daging (kode_daging, bagian_daging, grade, stok, harga)"
                + "value('"+kode+"', '"+bagian+"', '"+grade+"', '"+stok+"', '"+harga+"')";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Simpan Daging");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int deleteDaging(String kode){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "delete from daging where kode_daging = '"+kode+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Hapus Daging");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int updateDaging(String kode, String bagian, String grade, String stok, String harga){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "update daging set kode_daging = '"+kode+"', bagian_daging = '"+bagian+"', grade = '"+grade+"'"
                + ", stok = '"+stok+"', harga = '"+harga+"' where kode_daging = '"+kode+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Update Daging");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
}
