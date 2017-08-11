package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.CalrendarDTO;

public class CalrendarDAO {

	DataSource ds= null;
	Connection conn = null;
	PreparedStatement ps =null;
	ResultSet rs = null;
	
	public CalrendarDAO(){
		try {
			Context ctx = new InitialContext();
			ds= (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CalrendarDTO> list(String id) {
		
		String sql = "SELECT calendarno,title,startdate FROM calrendar WHERE user_id=?";
		ArrayList<CalrendarDTO> list = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				CalrendarDTO dto = new CalrendarDTO();
				dto.setCalrendarno(rs.getInt("calendarno"));
				dto.setTitle(rs.getString("title"));
				dto.setStartdate(rs.getString("startdate"));
				list.add(dto);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
		
		
	}

	public int write(String title, String start, String id) {
		String sql = "INSERT INTO calrendar VALUES(seq_calrendarno.NEXTVAL,?,?,?)";
		int success = 0 ;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, start);
			ps.setString(3, id);
			success = ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;

		
		
	
	}

	public int delete(String calrendarno) {
		String sql = "DELETE FROM calrendar WHERE calendarno=?";
		int success = 0 ;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, calrendarno);
			success = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

}
