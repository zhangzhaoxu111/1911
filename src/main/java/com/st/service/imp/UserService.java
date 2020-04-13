package com.st.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.User;
import com.st.dao.UserDao;

@Service
public class UserService {
	@Autowired
	UserDao userD;
	
	public User getUser(String username) {
		return userD.getUser(username);
	}

	public int getCount(Map params) {
		int count = userD.getCount(params);
		return count;
	}

	public List getAllUser(Map params) {
		return userD.getAlluser(params);
	}

	public void addUser(Map params) {
		userD.addUser(params);
	}

	public void delUser(Map params) {
		userD.delUser(params);
		
	}

	public void updateUser(Map params) {
		userD.updateUser(params);
		
	}

	public int getaddcount(Map params) {
		int count = userD.getaddcount(params);
		return count;
	}

	public void xxxUser(Map params) {
		String str=(String)params.get("role_id");
		String regex="\\\"value\":\"(.*?)\\\",\"title\":\"";
		Pattern p=Pattern.compile(regex);
		Matcher m=p.matcher(str);
		List list = new ArrayList();
		while (m.find()){
			list.add(m.group(1));
		//System.out.println(m.group(1));
		}
		params.put("role_id", list);
		System.out.println("Userservice:"+params);
		userD.delUser_role(params);
		userD.add_user_role(params);
	}

	public List getallrole(Map params) {
		return userD.getallrole(params);
	}	
	
//	public List toList() {
//		List list = new ArrayList();
//		return list;
//		
//	}
}
