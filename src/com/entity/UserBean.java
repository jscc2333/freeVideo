package com.entity;
import java.io.*;
import java.util.ArrayList;

public class UserBean {
	private String name;
	private String password;
	private ArrayList<String> record;
	
	public UserBean(){
		super();
		record = new ArrayList<String>();
	}
	public String getName(){
		return name;
	}
	public String getPassword(){
		return password;
	}
	public ArrayList getRecord(){
		return record;
	}
	public void setName(String name){
		this.name = name;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public void setRecord(String record){
		this.record.add(this.record.size(),record);
	}
}
