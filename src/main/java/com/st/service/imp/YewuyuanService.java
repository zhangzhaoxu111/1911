package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.YewuyuanDao;

@Service
public class YewuyuanService {
	@Autowired
	YewuyuanDao ywyD;

	public int getCount(Map params) {
		int count = ywyD.getCount(params);
		return count;
	}

	public List getAllyw(Map params) {
		return ywyD.getAllyw(params);
	}

	public void delyw(Map params) {
		ywyD.delyw(params);
		
	}

	public void addyw(Map params) {
		ywyD.addyw(params);
		
	}

	public void updyw(Map params) {
		ywyD.updyw(params);
		
	}
	
}
