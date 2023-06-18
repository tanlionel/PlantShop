/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Categories;
import sample.utils.DBUtils;
/**
 *
 * @author NGUYEN TAN
 */
public class CategoriesDAO {
    public static ArrayList<Categories> getAllCategories(){
        Connection cn=null;
        ArrayList<Categories> list=new ArrayList<>();
        try {
            cn=DBUtils.makeConnection();
            if (cn!=null) {
                String sql="select * from Categories";
                PreparedStatement pst=cn.prepareStatement(sql);
                ResultSet rs=pst.executeQuery();
                while (rs.next()) {                    
                    list.add(new Categories(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return list;
    }
    
}
