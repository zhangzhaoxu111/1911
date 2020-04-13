package com.st.bean;

import java.util.List;

public class Role {
	private String role_id;
	private String role_name;
	private List permissions;
	public List getPermissions() {
		return permissions;
	}
	public void setPermissions(List permissions) {
		this.permissions = permissions;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
}
