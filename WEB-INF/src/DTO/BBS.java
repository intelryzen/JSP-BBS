package DTO;

import java.sql.Statement;

import javax.swing.text.StringContent;

import org.omg.CORBA.NameValuePair;
import org.omg.CORBA.NamedValue;

public class BBS {
    
    private int bbsId;
    private String bbsTitle;
    private String userId;
	private String bbsDate;
    private String bbsContent;
	private int bbsAvailable;
    private int hits;
	
    public BBS(){}
    public BBS(int bbsId, String bbsTitle, String userId, String bbsDate, String bbsContent, int bbsAvailable, int hits){
        this.bbsId= bbsId;
        this.bbsTitle=bbsTitle;
        this.userId=userId;
		this.bbsDate=bbsDate;
        this.bbsContent=bbsContent;
		this.bbsAvailable=bbsAvailable;
		this.hits=hits;
    }
    public int getBbsId(){
        return bbsId;
    }
    public String getBbsTitle(){
        return bbsTitle;
    }
    public String getUserId(){
        return userId;
    }
	public int getHits(){
        return hits;
    }
	public String getBbsDate(){
        return bbsDate;
    }
    public String getBbsContent(){
        return bbsContent;
    }
	public int getBbsAvailable(){
        return bbsAvailable;
    }
    public void setBbsId(int BbsId){
        this.bbsId=BbsId;
    }    
    public void setBbsTitle(String BbsTitle){
        this.bbsTitle=BbsTitle;
    }      
    public void setUserId(String UserId){
        this.userId=UserId;
    } 
    public void setBbsDate(String BbsDate){
        this.bbsDate=BbsDate;
    } 
    public void setBbsContent(String BbsContent){
        this.bbsContent=BbsContent;
    }       
	public void setBbsAvailable(int BbsAvailable){
        this.bbsAvailable=BbsAvailable;
    }   
	public void setHits(int hits){
        this.hits=hits;
    } 
}
