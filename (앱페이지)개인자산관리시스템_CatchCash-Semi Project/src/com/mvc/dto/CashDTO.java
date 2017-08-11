package com.mvc.dto;

import java.util.Date;

public class CashDTO {
	
	private String user_id;
	private String budgetmoney;
	private String budgetstart;
	private String budgetend;
	
	private int idx;
	private String reg_date;
	private String part;
	private String way;
	private String kind;
	private String content;
	private int money;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBudgetmoney() {
		return budgetmoney;
	}
	public void setBudgetmoney(String budgetmoney) {
		this.budgetmoney = budgetmoney;
	}
	public String getBudgetstart() {
		return budgetstart;
	}
	public void setBudgetstart(String budgetstart) {
		this.budgetstart = budgetstart;
	}
	public String getBudgetend() {
		return budgetend;
	}
	public void setBudgetend(String budgetend) {
		this.budgetend = budgetend;
	}
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	

}
