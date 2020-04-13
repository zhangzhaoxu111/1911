package com.st.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

@Repository
public interface BumenDao {

	int getCount(Map params);

	List getAllBumen(Map params);

	void delbumen(Map params);
	
	void addbumen(Map params);
	
	void updbumen(Map params);

	void xxxUser(Map params);

	//void delUser_role(Map params);

	//void add_user_role(Map params);

	void delBumen_role(Map params);

	void add_bumen_role(Map params);

	void creatGoods(HttpSession session, Map params);

	List findAll();

	List getAllBum(Map params);
}
