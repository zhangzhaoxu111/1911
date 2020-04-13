package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface CustomerDao {

	int getCount(Map params);

	List getAllCus(Map params);

	void addCustomer(Map params);

	void delCustomer(Map params);

	void updCustomer(Map params);

	void updgrade(Map params);

	List getAllPub(Map params);

	void cus_public(Map params);

	List getAllPri(Map params);

	void cus_private(Map params);

	List getAllPr(Map params);

	List getAllCustom(Map params);

	List getAllPubli(Map params);
	 
	List no_visit_list(Map params);

	void init_tip(Map params);

	//List visit_info(String customer_id);

	int getCount(String customer_id);

	List visit_info(Map params);
}
