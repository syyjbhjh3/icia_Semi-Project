package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.BoardDTO;

public class BoardDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	
	public BoardDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public ArrayList<BoardDTO> board() {
		System.out.println("db연결");
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "SELECT * FROM bbs ORDER BY bbsno DESC";
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println(conn);
			while(rs.next()){
				BoardDTO dto = new BoardDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setBhit(rs.getInt("bhit"));
				dto.setDate(rs.getString("reg_date"));
				list.add(dto);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}