/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StartupDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Administrator
 */
public class StartupDAO implements IDAO <StartupDTO,String>{

    @Override
    public boolean create(StartupDTO entity) {
        return false;
    }

    @Override
    public List<StartupDTO> readAll() {
        return null;
    }

    @Override
    public StartupDTO readbyID(String id) {
        return null;
    }

    @Override
    public boolean update(StartupDTO entity) {
        return false;
    }

    @Override
    public List<StartupDTO> search(String searchTerm) {
        return null;
    }
    


 public List<StartupDTO> searchbyTitle2(String searchTerm) {
        List<StartupDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblBooks WHERE title LIKE ? ";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StartupDTO b = new StartupDTO(
                        rs.getString("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getInt("PublishYear"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                );
                result.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    
}