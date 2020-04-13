package com.st.bean;

import java.util.List;

public class TreeBean {
	
	private String perm_id;
	private String perm_name;
	private boolean spread = true;
	private boolean checked;
	private String role_id;
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		if(role_id!=null&&!role_id.equals("")) {
			checked = true;
		}
		this.role_id = role_id;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isSpread() {
		return spread;
	}
	public void setSpread(boolean spread) {
		this.spread = spread;
	}
	private String id;
	private String title;
	private List<TreeBean> children;
	public String getPerm_id() {
		return perm_id;
	}
	public void setPerm_id(String perm_id) {
		this.perm_id = perm_id;
	}
	public String getPerm_name() {
		return perm_name;
	}
	public void setPerm_name(String perm_name) {
		this.perm_name = perm_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<TreeBean> getChildren() {
		return children;
	}
	public void setChildren(List<TreeBean> children) {
		this.children = children;
	}
	
}
