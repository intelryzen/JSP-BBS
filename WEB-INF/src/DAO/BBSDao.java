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


public class BBSDao{
	private Connection conn =null;
	private ResultSet rs=null;
	public static final int DEFAULT_BBS_ID=1;
	private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	public BBSDao() {
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
	/*public String getDate(){
		String query = "select NOW()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			rs= pstmt.executeQuery();
			if (rs.next()){
				return rs.getString(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return "";
	}	 
	//DB에서 시간함수를 쓰는 것이 아닌 서버 시간을 이용하는 것이 좋음.
	*/
	public int getNext(){
		String query = "select bbsId from BBS order by bbsId desc";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			rs= pstmt.executeQuery();
			if (rs.next()){
				return rs.getInt(1)+1;
			}
			return DEFAULT_BBS_ID; //1
		} catch (Exception e){
			e.printStackTrace();
		}
		return -4;//데이터베이스 오류
	}	
	
	
	private String now(){
		return LocalDateTime.now().format(DATE_TIME_FORMATTER);
	}
	
	public int write(String bbsTitle,String bbsContent,String userId){
		String query = "insert into BBS values(?, ?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, now());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
			return pstmt.executeUpdate(); //글쓰기 성공
		} catch (Exception e){
			e.printStackTrace();
		}
		return -5;//데이터베이스 오류
	} 
	public ArrayList<BBS> showBBS(int pageNumber){
		int count = countBBS();
		int rsPage = count - (pageNumber - 1) * 10;
		String query = "select * from BBS where bbsId < ? and bbsAvailable = 1 order by bbsId desc";
		ArrayList<BBS> list = new ArrayList<BBS>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext());
			rs = pstmt.executeQuery();
			while(rs.next()){
			if((rsPage-10 < count) && (count <= rsPage)){
			int bbsId=rs.getInt(1);
			String bbsTitle=rs.getString(2);
			String userId=rs.getString(3);
			String bbsDate=rs.getString(4);
			String bbsContent=rs.getString(5);
			int hits=rs.getInt(7);
			BBS dto = new BBS(bbsId, bbsTitle, userId, bbsDate, bbsContent, 1, hits);
			list.add(dto);
			}
			count--;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int countBBS(){
		String query = "select count(*) from BBS where bbsAvailable = 1";
		int result = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()){
			result = rs.getInt(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return result;
	} 
}
	
	public ArrayList<BBS> searchDefault(String c_content){
		String query = "select * from BBS where bbsAvailable = 1 and bbsTitle like ? order by bbsId desc limit 10"; //나중에 ? 이용해야함
		ArrayList<BBS> list = new ArrayList<BBS>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, bbsTitle);
			pstmt.setString(1, "%"+c_content+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
			int bbsId=rs.getInt(1);
			String _bbsTitle=rs.getString(2);
			String userId=rs.getString(3);
			String bbsDate=rs.getString(4);
			String bbsContent=rs.getString(5);
			int hits=rs.getInt(7);
			BBS dto = new BBS(bbsId, _bbsTitle, userId, bbsDate, bbsContent, 1, hits);
			list.add(dto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BBS> searchContent(String c_content){
		String query = "select * from BBS where bbsAvailable = 1 and bbsContent like ? order by bbsId desc limit 10"; //나중에 ? 이용해야함
		ArrayList<BBS> list = new ArrayList<BBS>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, bbsTitle);
			pstmt.setString(1, "%"+c_content+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
			int bbsId=rs.getInt(1);
			String _bbsTitle=rs.getString(2);
			String userId=rs.getString(3);
			String bbsDate=rs.getString(4);
			String bbsContent=rs.getString(5);
			int hits=rs.getInt(7);
			BBS dto = new BBS(bbsId, _bbsTitle, userId, bbsDate, bbsContent, 1, hits);
			list.add(dto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
		public ArrayList<BBS> searchId(String c_content){
		String query = "select * from BBS where bbsAvailable = 1 and userId like ? order by bbsId desc limit 10";
		ArrayList<BBS> list = new ArrayList<BBS>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+c_content+"%");
			//pstmt.setString(1, bbsTitle); 이걸로 해도됨. "%"+bbsTitle+"%" 이용하거나
			rs = pstmt.executeQuery();
			while(rs.next()){
			int bbsId=rs.getInt(1);
			String _bbsTitle=rs.getString(2);
			String userId=rs.getString(3);
			String bbsDate=rs.getString(4);
			String bbsContent=rs.getString(5);
			int hits=rs.getInt(6);
			BBS dto = new BBS(bbsId, _bbsTitle, userId, bbsDate, bbsContent, 1, hits);
			list.add(dto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public BBS selectBoard(int bbsId){
		String query = "select * from BBS where bbsAvailable = 1 and bbsId = ?";
		BBS dto = null;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			while(rs.next()){
			int _bbsId=rs.getInt(1);
			String bbsTitle=rs.getString(2);
			String userId=rs.getString(3);
			String bbsDate=rs.getString(4);
			String bbsContent=rs.getString(5);
			int hits=rs.getInt(7);
			dto = new BBS(_bbsId, bbsTitle, userId, bbsDate, bbsContent, 1, hits);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return dto;
	}
}
		/*public boolean userIdTrue(int bbsId, String session_id){
		String query = "select userId from BBS where bbsId =?";
		String id=null;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString(1);
				}
		} catch (Exception e){
			e.printStackTrace();
		}
	finally {
			if(id.equals(session_id)){
			return true;
		} else {
			return false;
		}		 //db오류든 뭐든 모두 최종결과 리턴
		//자원 반환(공통)
	
			//왜 pstmt.close()를 하면 오류가 나는지 알아볼것!
		} 
	
	} 일단 필요가 없으므로 폐기처분
	*/
	public int deleteBoard(int bbsId){
		String query = "update BBS set bbsAvailable = 0 where bbsId = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			return pstmt.executeUpdate();//글쓰기 성공
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	} 
	public int modifyBoard(int bbsId, String bbsTitle, String bbsContent){
		String query = "update BBS set bbsTitle = ? , bbsContent = ? where bbsId = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsId);
			return pstmt.executeUpdate();//글쓰기 성공
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	} 
	
	
	// 댓글 기능
	public int comment(int bbsId, String comment, String userId){
		String query = "insert into comment values(?, ?, ?, ?, ?, ?, ?)";
		try{
			int commentType= makeCommentType(bbsId);
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, comment);
			pstmt.setInt(3, commentType);
			pstmt.setInt(4, 1);
			pstmt.setInt(5, bbsId);
			pstmt.setInt(6, 1);
			pstmt.setString(7, now());
			return pstmt.executeUpdate(); //글쓰기 성공
		} catch (Exception e){
			e.printStackTrace();
		}
		return 0; //데이터베이스 오류
	} 
	
	public int upHits(int bbsId){
		String query = "update BBS set bbsHits = bbsHits + 1 where bbsId = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			return pstmt.executeUpdate(); 
		} catch (Exception e){
			e.printStackTrace();
		}
		return 0; //데이터베이스 오류
	} 
	
	public int second_Comment(int bbsId, int commentType, String comment, String userId){
		String query = "insert into comment values(?, ?, ?, ?, ?, ?, ?)";
		try{
			int commentId= makeCommentId(bbsId, commentType);
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, comment);
			pstmt.setInt(3, commentType);
			pstmt.setInt(4, commentId);
			pstmt.setInt(5, bbsId);
			pstmt.setInt(6, 1);
			pstmt.setString(7, now());
			return pstmt.executeUpdate(); //글쓰기 성공
		} catch (Exception e){
			e.printStackTrace();
		}
		return 0; //데이터베이스 오류
	} 
	
	// commentType(몇 번째 댓글인지 반환하는(대댓글X))함수
	public int makeCommentType(int bbsId){
		String query = "select commentType from comment where bbsId = ? order by commentType desc";
		int count = 1;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			if(rs.next()){
			count = rs.getInt(1) + 1;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return count;
	} 
}
		public ArrayList<comment> commentList(int bbsId){
		String query = "select * from comment where bbsId = ? and commentAvailable = 1 order by commentType, commentId asc";
		ArrayList<comment> list = new ArrayList<comment>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			while(rs.next()){
			String userId = rs.getString(1);
			String comment = rs.getString(2);
			int commentType = rs.getInt(3);
			int commentId = rs.getInt(4);
			int _bbsId = rs.getInt(5);
			int commentAvailable=rs.getInt(6);
			String commentDate =rs.getString(7);
			comment dto = new comment(_bbsId, commentType, commentAvailable, commentId, comment, userId, commentDate);
			list.add(dto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return list;
	} 
}
	
	
	public int isEmpty(int bbsId){
		String query = "select * from comment where bbsId = ?";
		int result = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			if(rs.next()){
			result = 1;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return result;
	} 
}
	
	public int countComment(int bbsId){
		String query = "select count(*) from comment where bbsId = ? and commentAvailable =1";
		int result = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			if(rs.next()){
			result = rs.getInt(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return result;
	} 
}
	public int modifyComment(int bbsId,int commentType,int commentId,String comment,String userId){
		String query = "update comment set comment = ? where bbsId = ? and commentType = ? and commentId =?";
		int result = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, comment);
			pstmt.setInt(2, bbsId);
			pstmt.setInt(3, commentType);
			pstmt.setInt(4, commentId);
			return pstmt.executeUpdate(); //글 수정 성공
			}
		 catch (Exception e){
			e.printStackTrace();
		}
		return result;
	} 
		public int deleteComment(int bbsId,int commentType,int commentId){
		String query = "update comment set commentAvailable = 0 where bbsId = ? and commentType = ? and commentId =?";
		int result = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			pstmt.setInt(2, commentType);
			pstmt.setInt(3, commentId);
			return pstmt.executeUpdate(); //글 수정 성공
			}
		 catch (Exception e){
			e.printStackTrace();
		}
		return result;
	} 
	public int makeCommentId(int bbsId, int commentType){
		String query = "select commentId from comment where bbsId = ? and commentType = ? order by commentId desc";
		int count = 0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsId);
			pstmt.setInt(2, commentType);
			rs = pstmt.executeQuery();
			if(rs.next()){
			count = rs.getInt(1) + 1;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{
		return count;
	} 
}
}