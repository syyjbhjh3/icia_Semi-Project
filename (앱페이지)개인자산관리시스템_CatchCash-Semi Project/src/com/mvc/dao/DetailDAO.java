package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.BoardDTO;
import com.mvc.dto.CommentReadDTO;

public class DetailDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	
	public DetailDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public BoardDTO detail(String bbsno) {
		
		String sql = "SELECT * FROM bbs WHERE bbsno = ?";
		BoardDTO dto = new BoardDTO();
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbsno);
			rs = ps.executeQuery();
			while(rs.next()){
				dto.setUser_id(rs.getString("user_id"));
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setBhit(rs.getInt("bhit"));
				dto.setDate(rs.getString("reg_date"));
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
		
		return dto;
	}

	public ArrayList<CommentReadDTO> commentread(String bbsno) {
		
		ArrayList<CommentReadDTO> list = new ArrayList<CommentReadDTO>();
		
		System.out.println("댓글 달기 db 연결");

		String sql = "SELECT * FROM com WHERE bbsno = ?";
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbsno);
			rs = ps.executeQuery();
			while(rs.next()){
				CommentReadDTO dto = new CommentReadDTO();
				dto.setCommentno(rs.getInt("commentno"));
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComments(rs.getString("comments"));
				System.out.println(dto.getComments());
				list.add(dto);
			}
			
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
	
	public int uphit(String bbsno) {
		String sql = "UPDATE bbs SET bhit = bhit+1 WHERE bbsno = ?";
        int result = 0;
        
        try {
            conn = ds.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bbsno);
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                //닫아주기
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
	}

}
