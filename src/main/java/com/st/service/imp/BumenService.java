package com.st.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.BumenDao;
import com.st.dao.UserDao;

@Service
public class BumenService {
	@Autowired
	BumenDao bmD;
	public int getCount(Map params) {
		int count = bmD.getCount(params);
		return count;
	}

	public List getAllBumen(Map params) {
		return bmD.getAllBumen(params);
	}

	public void delbumen(Map params) {
	bmD.delbumen(params);
		
	}

	public void add_bumen(Map params) {
		bmD.addbumen(params);
		
	}

	public void upd_bumen(Map params) {
		bmD.updbumen(params);
		
	}

	public void xxxBumen(Map params) {
		String str=(String)params.get("user_id");
		String regex="\\\"value\":\"(.*?)\\\",\"title\":\"";
		Pattern p=Pattern.compile(regex);
		Matcher m=p.matcher(str);
		List list = new ArrayList();
		while (m.find()){
			list.add(m.group(1));
		//System.out.println(m.group(1));
		}
		params.put("user_id", list);
		System.out.println("Bumenservice:"+params);
		bmD.delBumen_role(params);
		bmD.add_bumen_role(params);
		
	}

	public void creatGoods(HttpSession session, Map params) {
		bmD.creatGoods(session,params);
		
	}

	public List findAll() {
		
		return bmD.findAll();
	}

	public List getAllBum(Map params) {
	
		return bmD.getAllBum(params);
	}
}
