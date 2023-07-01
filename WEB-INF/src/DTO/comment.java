package DTO;

import java.sql.Statement;

import javax.swing.text.StringContent;

import org.omg.CORBA.NameValuePair;
import org.omg.CORBA.NamedValue;

public class comment {
    
    private int bbsId;
	private int commentType;
	private int commentAvailable;
	private int commentId;
    private String comment;
    private String userId;
	private String commentDate;
    
    public comment(){}
    public comment(int bbsId, int commentType, int commentAvailable, int commentId, String comment, String userId, String commentDate){
		this.bbsId = bbsId;
		this.commentType = commentType; 
		this.commentAvailable = commentAvailable; 
		this.commentId = commentId; 
		this.comment = comment; 
		this.userId = userId;
		this.commentDate = commentDate;
    }
    public int getBbsId(){
        return bbsId;
    }
	public String getCommentDate(){
        return commentDate;
    }
    public int getCommentType(){
        return commentType;
    }
    public int getCommentAvailable(){
        return commentAvailable;
    }
	public int getCommentId(){
        return commentId;
    }
    public String getComment(){
        return comment;
    }
	public String getUserId(){
        return userId;
    }
	
	public int setBbsId(){
        return this.bbsId = bbsId;
    }
    public int setCommentType(){
        return this.commentType = commentType;
    }
    public int setCommentAvailable(){
        return this.commentAvailable = commentAvailable;
    }
	public int setCommentId(){
        return this.commentId = commentId;
    }
    public String setComment(){
        return this.comment = comment;
    }
	public String setUserId(){
        return this.userId = userId;
    }
	public String setCommentDate(){
        return this.commentDate = commentDate;
    }
	
}
