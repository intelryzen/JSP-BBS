	package DAO;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;

	import DTO.*;
	import jdk.nashorn.internal.ir.IfNode;

	public class userDao{
		private Connection conn =null;
		private PreparedStatement pstmt=null;
		private ResultSet rs=null;

		public userDao() {
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
		public int login(String userId, String userPassword){
			String query = "select userPassword from user where userId =?";
			int result = -1; //아이디가 없음.
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
			if(rs.next()){
					if(rs.getString(1).equals(userPassword)){
						result= 1; //로그인 성공.
					}
					else {
						result= 0; //비번 틀림.
					}
			}

			}
			catch (Exception e){
				e.printStackTrace();
				result= -2; //db 오류임.
			}
		finally {
			try{
				//자원 반환(공통)
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
			return result; //db오류든 뭐든 모두 최종결과 리턴
			}
		}
		}


		public int join(userDto user){
			String query = "insert into user values(?,?,?,?,?)";
			int result= -1;
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPw());
				pstmt.setString(3, user.getName());
				pstmt.setString(4, user.getGender());
				pstmt.setString(5, user.getEmail());
				result= pstmt.executeUpdate(); //회원가입 성공
			} catch (Exception e){
				e.printStackTrace();
				result = -1; //이미 존재하는 아이디임.
			}
		finally{
			try{
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			} 
			return result;
		}	 
		}
			public int modifyinfo(userDto modifiedInfo){
			String query = "update user set userPassword=?, userName=?, userEmail=? where userId=?";
			int result= -1;//DB 오류
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, modifiedInfo.getPw());
				pstmt.setString(2, modifiedInfo.getName());
				pstmt.setString(3, modifiedInfo.getEmail());
				pstmt.setString(4, modifiedInfo.getId());
				result= pstmt.executeUpdate(); //수정 성공
			} catch (Exception e){
				e.printStackTrace();
				result = -1; //DB 오류
			}
		finally{
			try{
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			} 
			return result;
		}	 
	}

		public userDto selectinfo(String userId){
			String query = "select * from user where userId =?";
			userDto DTO=null;
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
			if(rs.next()){
				String id=rs.getString(1);
				String pw=rs.getString(2);
				String name=rs.getString(3);
				String gender=rs.getString(4);
				String email=rs.getString(5);
				DTO = new userDto(id, pw, name, gender, email);
					}
			} catch (Exception e){
				e.printStackTrace();
			}
		finally {
			try{
				//자원 반환(공통)
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
			return DTO; //db오류든 뭐든 모두 최종결과 리턴
			}
		}
		}


		//아래 unicode 화인데 안먹힘
		/*private static String toLatinl(String str){
			try {
				byte[] b = str.getBytes();
				return new String(b, "ISO-8859-1");
		} catch (Exception uee){
				System.out.println(uee.getMessage());
				return null;
			}
		}	

		private static String toUnicode(String str){
			try {
				byte[] b = str.getBytes("ISO-8859-1");
				return new String(b);
		} catch (Exception uee){
				System.out.println(uee.getMessage());
				return null;
			}
		}	
		*/
	}


