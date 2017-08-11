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
import com.mvc.dto.MonthpayDTO;

public class CCDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DataSource ds = null;

	public CCDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int budget(String id, String budgetmoney, String budgetstart, String budgetend) {
		System.out.println("예산금등록단계 id를 가져왔습니까?id="+id);
		String sql="INSERT INTO budget (user_id,budgetmoney,budgetstart,budgetend)"
				+"VALUES(?,?,?,?)";
		int success =0;
		try{
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, budgetmoney);
		ps.setString(3, budgetstart);
		ps.setString(4, budgetend);
		success = ps.executeUpdate();
		
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
		return success;
	}
	/*
	public void delete() {
		String sql = "DELETE FROM  budget";
		System.out.println("삭제쿼리까지는 왔습니다.");
		try {
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	*/
	public int delete(String id) {
		String sql = "DELETE FROM budget WHERE user_id=?";
		int success = 0;
		System.out.println("예산삭제여기까지는 와집니까?");
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			System.out.println("예산삭제여기까지는요??");
			success = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{ //에러가 생겨도 이어하려고.
			try {
				conn.close();
				ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		return success;
	}
	//mainlist 저장된 초기값 가져오기용
	public ArrayList<CashDTO> list(String id) {
		System.out.println("list출력까지id를 가져왔습니까id="+id);
		String sql ="select budgetmoney,budgetstart,budgetend from(select * from budget order by budgetend desc) where rownum = 1 AND user_id=?";
		ArrayList<CashDTO> list = new ArrayList<CashDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				CashDTO dto = new CashDTO();
				dto.setBudgetmoney(rs.getString("budgetmoney"));
				dto.setBudgetstart(rs.getString("budgetstart"));
				dto.setBudgetend(rs.getString("budgetend"));
				list.add(dto);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<CashDTO> list2(String id) {
		System.out.println("list2출력까지id를 가져왔습니까id="+id);
		String sql ="select * from cashtable WHERE user_id=? ORDER BY reg_date desc";
		ArrayList<CashDTO> list2 = new ArrayList<CashDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				CashDTO dto = new CashDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setPart(rs.getString("part"));
				dto.setWay(rs.getString("way"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setMoney(rs.getInt("money"));
				list2.add(dto);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return list2;
		}
	public ArrayList<CashDTO> list3(String id) {
		System.out.println(id);
		//butdetmoney랑 비교 안됐음.
		//String sql = "select SUM(c.money) from cashtable c, budget b WHERE c.reg_date BETWEEN b.budgetstart AND b.budgetend AND b.user_id=? and c.user_id=? and c.part='지출'";
		String sql = "select b.budgetmoney + sum(decode(part, '수입', 1*c.money, '지출', -1*c.money, c.money)) AS hap from budget b, cashtable c where b.user_id=? and c.user_id=? and c.reg_date between b.budgetstart and b.budgetend group by b.budgetmoney";
		ArrayList<CashDTO> list3 = new ArrayList<CashDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			rs = ps.executeQuery();
			while(rs.next()){
				CashDTO dto = new CashDTO();
				dto.setMoney(rs.getInt("hap"));
				list3.add(dto);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list3;
	}
	
	public ArrayList<CashDTO> list4(String id) {
		String sql = "select SUM(c.money) from cashtable c, budget b WHERE c.reg_date BETWEEN b.budgetstart AND b.budgetend AND b.user_id=? and c.user_id=? and c.part='수입'";
		ArrayList<CashDTO> list4 = new ArrayList<CashDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			rs = ps.executeQuery();
			while(rs.next()){
				CashDTO dto = new CashDTO();
				dto.setMoney(rs.getInt("SUM(c.money)"));
				list4.add(dto);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list4;
	}
	
	public int resist(String id, String reg_date, String part, String way, String kind, String content, int money) {
		int success=0;
		String sql="INSERT INTO cashtable (idx,user_id,reg_date,part,way,kind,content,money) VALUES(admin_seq.NEXTVAL,?,?,?,?,?,?,?)";
		try{
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, reg_date);
		ps.setString(3, part);
		ps.setString(4, way);
		ps.setString(5, kind);
		ps.setString(6, content);
		ps.setInt(7, money);
		success = ps.executeUpdate();
		
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
		return success;
	}
	public CashDTO detail(String idx) {
		String sql ="SELECT * from cashtable where idx=?";
		CashDTO dto = new CashDTO();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(idx));
			rs = ps.executeQuery();
			while(rs.next()){
				dto.setIdx(rs.getInt("idx"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setPart(rs.getString("part"));
				dto.setWay(rs.getString("way"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setMoney(rs.getInt("money"));
				
			}
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
	
	return dto;
	}
	public int update(String id,int idx, String reg_date, String part, String way, String kind, String content, int money) {
		String sql ="UPDATE cashtable SET reg_date=?,part=?,way=?,kind=?,content=?,money=? WHERE idx=?";
		int success =0;
		try {
			ps =conn.prepareStatement(sql);
			ps.setString(1, reg_date);
			ps.setString(2, part);
			ps.setString(3, way);
			ps.setString(4, kind);
			ps.setString(5, content);
			ps.setInt(6, money);
			ps.setInt(7, idx);
			success = ps.executeUpdate();
		} catch (SQLException e) {
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
	public int cashdelete(String id,int idx) {
		System.out.println("가계부삭제의 id="+id);
		String sql = "DELETE FROM cashtable WHERE idx=?";
		CashDTO dto = new CashDTO();
		int success =0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			success = ps.executeUpdate(); 
			
		} catch (SQLException e) {
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
	
	public ArrayList<MonthpayDTO> list1(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list1 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-01%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list1.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list1;
	}
	public ArrayList<MonthpayDTO> list5(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list5 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-05%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list5.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list5;
	}
	public ArrayList<MonthpayDTO> list2(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list2 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-02%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list2.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list2;
	
	}
	public ArrayList<MonthpayDTO> list3(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list3 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-03%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list3.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list3;
	
	}
	public ArrayList<MonthpayDTO> list4(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list4 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-04%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list4.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list4;
	
	}
	public ArrayList<MonthpayDTO> list6(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list6 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-06%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list6.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list6;
	
	}
	public ArrayList<MonthpayDTO> list7(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list7 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-07%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list7.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list7;
	}
	public ArrayList<MonthpayDTO> list8(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list8 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-08%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list8.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list8;
	}
	public ArrayList<MonthpayDTO> list9(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list9 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-09%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list9.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list9;
	}
	public ArrayList<MonthpayDTO> list10(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list10 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-10%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list10.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list10;
	}
	public ArrayList<MonthpayDTO> list11(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list11 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-11%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list11.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list11;
	}
	public ArrayList<MonthpayDTO> list12(String id, String month) {
		String sql = "select sum(decode(part,'수입',1*money)) as ihap  , sum(decode(part,'지출',1*money)) as ehap from cashtable where user_id=? and reg_date LIKE ? ";
		ArrayList<MonthpayDTO> list12 = new ArrayList<MonthpayDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, month+"-12%");
			rs = ps.executeQuery();
			while(rs.next()){
				MonthpayDTO dto = new MonthpayDTO();
				dto.setImporthap(rs.getInt("ihap"));
				dto.setExpensehap(rs.getInt("ehap"));
				list12.add(dto);
			}
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
		return list12;
	}
}
