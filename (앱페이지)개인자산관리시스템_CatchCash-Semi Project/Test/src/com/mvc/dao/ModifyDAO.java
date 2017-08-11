package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ModifyDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	
	public ModifyDAO(){
		try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public int modify(String subject, String content, String bbsno) {
		
		String sql = "UPDATE bbs SET subject=?, content=? WHERE bbsno=?";
		
		int result = 0;
        
        try {
            conn = ds.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, content);
            ps.setString(3, bbsno);
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
