package com.hotel.common.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class GeneralUtil {

	static  String[] seed={"0","1","2","3","4","5","6","7","8","9"};
	
	static int verifCodeLength=4;

	public static String createVerifCode(){
		
		String result="";
		
		for(int i=0;i<verifCodeLength;i++){
			result +=Math.round(Math.random() * 9);
		}
		return result;
	}

	public static Map<String,Object> getSerialNoPars(Integer orderType){
		Calendar  calendar=Calendar.getInstance();
		
		DateFormat fmt=new SimpleDateFormat("yyMMdd");
		String d=fmt.format(calendar.getTime());
		
		Integer orderDate=Integer.valueOf(d);
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("orderType", orderType);
		map.put("orderDate", orderDate);
		
		return map;
	}
}
