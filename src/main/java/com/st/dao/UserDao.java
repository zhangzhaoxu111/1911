package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.User;

@Repository
public interface UserDao {

	User getUser(String username);
	//List userList(Map params);

	int getCount(Map params);

	List getAlluser(Map params);

	void addUser(Map params);

	void delUser(Map params);

	void updateUser(Map params);

	int getaddcount(Map params);

	//void xxxUser(Map params);

	void add_user_role(Map params);

	void delUser_role(Map params);

	List getallrole(Map params);

	
}
