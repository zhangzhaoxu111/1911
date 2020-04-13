package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.CustomerDao;

@Service
public class CustomerService {
	@Autowired
	CustomerDao cusDao; 
	public int getCount(Map params) {
		int count = cusDao.getCount(params);
		return count;
	}

	public List getAllCus(Map params) {
		
		return cusDao.getAllCus(params);
	}

	public void addCustomer(Map params) {
		cusDao.addCustomer(params);
		
	}

	public void delCustomer(Map params) {
		cusDao.delCustomer(params);
		
	}

	public void updCustomer(Map params) {
		cusDao.updCustomer(params);
		
	}

	public void updgrade(Map params) {
		cusDao.updgrade(params);
		
	}

	public List getAllPub(Map params) {
		return cusDao.getAllPub(params);
	}

	public void cus_public(Map params) {
		cusDao.cus_public(params);
	}

	public List getAllPri(Map params) {
		System.out.println(params+"rrrrrrrrrrrrrr");
		return cusDao.getAllPri(params);
	}

	public void cus_private(Map params) {
		cusDao.cus_private(params);
		
	}

	public List getAllPr(Map params) {
		System.out.println(params+"ggggggggggggg");
		return cusDao.getAllPr(params);
	}

	public List getAllCustom(Map params) {
		return cusDao.getAllCustom(params);
	}

	public List getAllPubli(Map params) {
		return cusDao.getAllPubli(params);
	}
	public List no_visit_list(Map params) {
		return cusDao.no_visit_list(params);
	}

	public void init_tip(Map params) {
		cusDao.init_tip(params);
	}

	public List  visit_info(Map params) {
		return cusDao.visit_info(params);
		
	}

	public int getCount(String customer_id) {
		int count = cusDao.getCount(customer_id);
		return count;
	}
	
}
