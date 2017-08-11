package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.CashDTO;

public class SeelistDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	
	public SeelistDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public ArrayList<CashDTO> seelist(String reg, String user_id) {
		
		String sql = "SELECT * FROM cashtable WHERE reg_date = ? AND user_id = ?";
		ArrayList<CashDTO> list = new ArrayList<CashDTO>();
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, reg);
			ps.setString(2, user_id);
			rs = ps.executeQuery();
			while(rs.next()){
				CashDTO dto = new CashDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setContent(rs.getString("content"));
				dto.setKind(rs.getString("kind"));
				dto.setMoney(rs.getInt("money"));
				dto.setPart(rs.getString("part"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setWay(rs.getString("way"));
				list.add(dto);
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
		return list;
	}

	public HashSet<String> seelistreg(String user_id) {
		
		String sql = "SELECT DISTINCT reg_date FROM cashtable WHERE user_id = ? order by reg_date asc";

		HashSet<String> reglist = new HashSet<String>();
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			while(rs.next()){
				reglist.add(rs.getString("reg_date"));
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
		return reglist;
	}
}