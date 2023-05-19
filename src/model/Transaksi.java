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
public class Transaksi {
    private ConnectionManager conman; 
    public Transaksi(){
        conman = new ConnectionManager();
    }

    public ResultSet readTrans(){
        try{
            conman.logOn();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        String query = "select * from transaksi";

        ResultSet result = conman.fetchRows(query);
        return result;
    }
    
    public int saveTrans(String user, String kode, String matang, String harga, String stok, String total){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "insert into transaksi (username, kode_daging, tingkat_kematangan, harga, stok, total)"
                + "value('"+user+"', '"+kode+"', '"+matang+"', '"+harga+"', '"+stok+"', '"+total+"')";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Simpan Transaksi");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int deleteTrans(String id){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "delete from transaksi where id_transaksi = '"+id+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Hapus Transaksi");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
    
    public int updateTrans(String id, String user, String kode, String matang, String harga, String stok, String total){
        int hasil = 0;
        ConnectionManager conman = new ConnectionManager();
        Connection conn = conman.logOn();
        String sql = "update transaksi set username = '"+user+"', kode_daging = '"+kode+"'"
                + ", tingkat_kematangan = '"+matang+"', harga = '"+harga+"', "
                + "stok = '"+stok+"', total = '"+total+"' where id_transaksi = '"+id+"'";
        try {
            Statement stm = conn.createStatement();
            hasil = stm.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Berhasil Update Transaksi");
        } catch (SQLException ex) {
            Logger.getLogger(UserPass.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return hasil;
    }
}
