package com.st.bean;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String user_id;
	private String username;
	private String userpass;
	private List roles;
	public List getRoles() {
		return roles;
	}
	public void setRoles(List roles) {
		this.roles = roles;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
//	获得用户的所有的权限
	public List getAllPermission() {
		List list = new ArrayList();
		for(int i=0;i<roles.size();i++) {
			Role role = (Role) roles.get(i);
			list.addAll(role.getPermissions());
		}
		return list;
	}
	
	public List<String> getPermissionCodes(){
		List<Permission> list = getAllPermission();
		List<String> list_code =  new ArrayList();
		for(Permission p:list) {
			list_code.add(p.getPerm_code());
		}
			
		return list_code;
	}
}
