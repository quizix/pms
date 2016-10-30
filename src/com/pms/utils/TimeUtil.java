package com.pms.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static String getCurrentTimeStr(){
		return formatter.format( new Date());
	}
}
