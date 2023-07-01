package DAO;

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


public class product{
	private Connection conn =null;
	private ResultSet rs=null;
	private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	public product() {
		try{
		String dbUrl = "jdbc:mysql://localhost:3306/BBS";
		String dbId = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbId, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public ArrayList<productDto> showList(){
		    String query = "select * from product order by productId asc";
			ArrayList<productDto> list = new ArrayList<productDto>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
			int productId=rs.getInt(1);
			String productName=rs.getString(2);
			int productPrice=rs.getInt(3);
			String productInfo=rs.getString(4);
			productDto dto = new productDto(productId, productName, productPrice, productInfo);
			list.add(dto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
		public int countCart(String userId){
		    String query = "select count(*) from product where userId = ?";
			int count = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()){
			count=rs.getInt(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return count;
	}
		public int cartUser(String userId){
		    String query = "select * from product where userId = ?";
			int count = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()){
			count=rs.getInt(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return count;
	}
}