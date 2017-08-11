package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.CashDTO;

public class SeelistRegDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	
	public SeelistRegDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public String seelistreg(String user_id) {
		
		String sql = "SELECT MAX(reg_date) reg_date FROM cashtable WHERE user_id = ?";
		ResultSet rs = null;
		String reg = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if(rs.next()){
				reg = rs.getString("reg_date");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reg;
	}
}