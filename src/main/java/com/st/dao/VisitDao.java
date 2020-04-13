package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface VisitDao {

	int getCount(Map params);

	List getAllVisit(Map params);

	List findAllInfo();

	List findAllPattern();

	List findAllPay();

	void addvisit(Map params);

	void delvisit(Map params);
	
}
