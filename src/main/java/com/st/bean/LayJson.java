package com.st.bean;

import java.util.List;

public class LayJson {
	private String code = "0";
	private String msg = "";
	private int count = 100;
	private List data = null;

	/**
	 * 防止list为null
	 * 
	 * @param data
	 */
	public LayJson(List data,int count) {
		super();
//		if (data != null) {
//			this.count = data.size();
//		}
		this.count = count;
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public int getCount() {
		return count;
	}

	public List getData() {
		return data;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setData(List data) {
		if (data != null) {
			this.count = data.size();
		}
		this.data = data;
	}

	@Override
	public String toString() {
		return "LayJson [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}
	
}
