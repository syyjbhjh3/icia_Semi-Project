package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.Iddto;



public class Maindao {
	
	DataSource ds= null;
	Connection conn = null;
	PreparedStatement ps =null;
	DataSource ds2= null;
	Connection conn2 = null;
	PreparedStatement ps2 =null;
	public Maindao(){
		try {
			Context ctx = new InitialContext();
			ds= (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int join(String name, String gender, String id, String pw, String rpw, String yang, String birth, String email,
			String usernum, String fownumber, String backnumber) {
		String sql = "INSERT INTO members VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		int success = 0;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, rpw);
			ps.setString(4, name);
			ps.setString(5, email);
			ps.setString(6,fownumber);
			ps.setString(7, backnumber);
			ps.setString(8, gender);
			ps.setString(9, birth);
			ps.setString(10, yang);
			ps.setString(11, usernum);
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
		/*
		String sql2 = "CREATE TABLE"+id+"(idx number(6,0) PRIMARY KEY,user_id VARCHAR2(50),budgetmoney NUMBER(10,0), budgetstart VARCHAR2(25),budgetend VARCHAR2(25))";
		try {
			conn2 = ds.getConnection();
			ps2 = conn2.prepareStatement(sql2);
			ps2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps2.close();
				conn2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		*/
		return success;
	}
	
	public boolean login(String id, String pw) {
		boolean success = false;
		String sql="SELECT user_id FROM members WHERE user_id=? AND user_pw=?";
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs=ps.executeQuery();
			success=rs.next();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public int Idcheck(String id) {
		String sql="SELECT * FROM members WHERE user_id=?";
		int success = 0;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				success=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return success;
	}

	public boolean Pwcha(String name, String id, String email) {
		String sql="SELECT user_pw FROM members WHERE user_name=? AND user_id=? AND email=?";
		boolean success = false;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, email);
			rs = ps.executeQuery();
			success = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public int modify(String id,String pw, String rpw) {
		String sql = "UPDATE members SET user_pw=? WHERE user_id=?";
		int success = 0;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, id);
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

	public boolean Idfind(String name, String email, String birth) {
		String sql="SELECT user_id FROM members WHERE user_name=? AND email=? AND birth=?";
		boolean success = false;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, birth);
			rs = ps.executeQuery();
			success = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public ArrayList<Iddto> list(String id, String name, String email, String birth) {
		String sql = "SELECT user_id FROM members where user_name=? and email=? and birth=?";
		ArrayList<Iddto> lists = new ArrayList<Iddto>();
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, birth);
			rs = ps.executeQuery();
			while(rs.next()){
			Iddto dto = new Iddto();
			dto.setUser_id(rs.getString("user_id"));
			lists.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return lists;
	}
}

	
