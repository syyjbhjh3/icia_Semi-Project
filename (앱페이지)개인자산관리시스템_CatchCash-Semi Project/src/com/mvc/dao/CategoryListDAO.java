package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.CategoryListDTO;

public class CategoryListDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	public CategoryListDAO(){
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<CategoryListDTO> list(String id, String mon) {
			String sql = "SELECT kind,money FROM cashtable WHERE user_id=? AND reg_date LIKE ?";
			int hab=0;
			int money=0;
			String kind="";
			int foodhab = 0;
			int companyhab = 0;
			int carhab = 0;
			int guitarhab = 0;
			int tongsinhab = 0;
			int clotheshab = 0;
			int sooibhab = 0;
			int moonhwahab = 0;
			ArrayList<CategoryListDTO> categorylist = new ArrayList<>();
			try{
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, mon+"%");
			rs = ps.executeQuery();
			CategoryListDTO dto = new CategoryListDTO();
			
			while(rs.next()){
				kind = rs.getString("kind");
				System.out.println(kind);
				money = rs.getInt("money");
				System.out.println(money);
				switch(kind){
					case "식비":
						foodhab += money;
						break;
					case "회비":
						companyhab += money;
						break;
					case "교통":
						carhab += money;
						break;
					case "기타":
						guitarhab += money;
						break;
					case "문화":
						moonhwahab += money;
						break;
					case "통신":
						tongsinhab += money;
						break;
					case "수입":
						sooibhab += money;
						break;
					case "의류":
						clotheshab += money;
						break;
						
				}}
				dto.setFoodhab(foodhab);
				dto.setCarhab(carhab);
				dto.setClotheshab(clotheshab);
				dto.setCompanyhab(companyhab);
				dto.setGuitarhab(guitarhab);
				dto.setMoonhwahab(moonhwahab);
				dto.setSooibhab(sooibhab);
				dto.setTongsinhab(tongsinhab);
				categorylist.add(dto);
			
			
			}catch (Exception e) {
				e.printStackTrace();
			}finally{ //에러가 생겨도 이어하려고.
				try {
					ps.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return categorylist;
			
		
	}
}
