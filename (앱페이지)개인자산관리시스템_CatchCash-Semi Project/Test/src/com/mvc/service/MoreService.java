package com.mvc.service;

import com.sun.beans.editors.IntegerEditor;

public class MoreService {

	public String moreread(String end) {
		
		int end2 = Integer.parseInt(end);
		
		System.out.println(end2);
		end2 = end2 + 5;
		
		end = String.valueOf(end2);
		
		return end;
	}

	

}
