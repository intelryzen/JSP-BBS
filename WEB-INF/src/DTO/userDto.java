package DTO;

import java.sql.Statement;

import javax.swing.text.StringContent;

import org.omg.CORBA.NameValuePair;
import org.omg.CORBA.NamedValue;

public class userDto {
    
    private String id;
    private String pw;
    private String name;
	private String gender;
    private String email;
    
    public userDto(){}
    public userDto(String id, String pw, String name, String gender, String email){
        this.id= id;
        this.pw=pw;
        this.name=name;
		this.gender=gender;
        this.email=email;
    }
    public String getId(){
        return id;
    }
    public String getPw(){
        return pw;
    }
    public String getName(){
        return name;
    }
	public String getGender(){
        return gender;
    }
    public String getEmail(){
        return email;
    }
    public void setGender(String gender){
        this.gender=gender;
    }    
    public void setId(String id){
        this.id=id;
    }      
    public void setPw(String pw){
        this.pw=pw;
    } 
    public void setName(String name){
        this.name=name;
    } 
    public void setEmail(String email){
        this.email=email;
    }        

    public String toString(){
        return "id:"+id+"pw:"+pw+"name"+name+"email"+email;
    }
        
        
        
        
}
