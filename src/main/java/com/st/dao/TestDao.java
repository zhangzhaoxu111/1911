package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.User;
@Repository
public interface TestDao {
	
	void addBM(Map params);
	List getAllJuese(Map params);
	
	int getCount(Map params);
	void addRole(Map params);
	void delRole(Map params);
	void updateRole(Map params);
	void role_perm(Map map);
	List getPermByUsername(String username);
	void delrole_permission(Map map);
}
