package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.AnnontionDao;

@Service
public class AnnontionService {
	@Autowired
	AnnontionDao ad;

	public int getCount(Map params) {
		int count = ad.getCount(params);
		return count;
	}

	public List getAllAnnon(Map params) {
		return ad.getAllAnnon(params);
	}

	public void add_annon(Map params) {
		ad.add_annon(params);
	}

	public void del_annon(Map params) {
		ad.del_annon(params);
		
	}

	public void upd_annon(Map params) {
		ad.upd_annon(params);
		
	}
	
	
	
}
