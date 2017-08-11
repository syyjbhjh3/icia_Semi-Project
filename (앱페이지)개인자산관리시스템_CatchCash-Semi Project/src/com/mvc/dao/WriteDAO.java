package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WriteDAO {

	Connection conn;
	DataSource ds;
	PreparedStatement ps;
	
	public WriteDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public int write(String writer, String subject, String content) {
		
		String sql = "INSERT INTO bbs(bbsno, user_id, subject, content) VALUES(bbs_seq.NEXTVAL,?,?,?)";
		int result = 0;
		
		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, subject);
			ps.setString(3, content);
			result = ps.executeUpdate();
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
		
		return result;
	}
}
