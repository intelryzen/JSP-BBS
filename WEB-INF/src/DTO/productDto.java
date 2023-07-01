package DTO;

import java.sql.Statement;

import javax.swing.text.StringContent;

import org.omg.CORBA.NameValuePair;
import org.omg.CORBA.NamedValue;

public class productDto {
    
    private int productId;
	private String productName;
	private int productPrice;
	private String productInfo;

    public productDto(){}
    public productDto(int productId, String productName, int productPrice, String productInfo){
	this.productId = productId;
	this.productName = productName;
	this.productPrice =  productPrice;
	this.productInfo = productInfo;
    }
    public int getProductId(){
        return productId;
    }
	public String getProductName(){
        return productName;
    }
    public int getProductPrice(){
        return productPrice;
    }
    public String getProductInfo(){
        return productInfo;
    }
	
	public int setProductId(int productId){
        return this.productId = productId;
    }
    public String setProductName(String productName){
        return this.productName = productName;
    }
    public int setProductPrice(int productPrice){
        return this.productPrice = productPrice;
    }
	public String setProductinfo(String productInfo){
        return this.productInfo = productInfo;
    }
	
}
