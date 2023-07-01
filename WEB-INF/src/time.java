package OTHER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.time.format.DateTimeFormatter;
import DTO.*;
import jdk.nashorn.internal.ir.IfNode;
import java.time.LocalDateTime;
import java.util.ArrayList;



public class time{
	
	private String time;
	
	private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	
	public time() {}
	public time(String time){
		this.time = time;
		}
	
	
	public String customTime(String time){
		String nowTime = LocalDateTime.now().format(DATE_TIME_FORMATTER);
		this.time=time;
		if (time.substring(0,11).equals(nowTime.substring(0, 11))){
			return time.substring(11,13)+":"+time.substring(14,16);
		} else {
			return time.substring(0,4)+"."+time.substring(5,7)+"."+time.substring(8,10)+". "+time.substring(11,13)+":"+time.substring(14,16);
		}
	}		
	public boolean customNewTime(String time){
		String nowTime = LocalDateTime.now().format(DATE_TIME_FORMATTER);
		this.time=time;
		if (time.substring(0,11).equals(nowTime.substring(0, 11))){
			return true;
		} else {
			return false;
		}
	}		
			
			
	}