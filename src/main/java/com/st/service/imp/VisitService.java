package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.VisitDao;

@Service
public class VisitService {
	@Autowired
	VisitDao vd;

	public int getCount(Map params) {
		int count = vd.getCount(params);
		return count;
	}

	public List getAllVisit(Map params) {
		return vd.getAllVisit(params);
	}

public List findAllInfo() {
	return vd.findAllInfo();
}

public List findAllPattern() {
	return vd.findAllPattern();
}

public List findAllPay() {
	return vd.findAllPay();
}

public void addvisit(Map params) {
	vd.addvisit(params);
	
}

public void delvisit(Map params) {
	vd.delvisit(params);
	
}
	
}
