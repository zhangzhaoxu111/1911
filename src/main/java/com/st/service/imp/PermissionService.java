package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.PermissionDao;

@Service
public class PermissionService {
	@Autowired
	PermissionDao pd;

	public int getCount(Map params) {
		int count = pd.getCount(params);
		return count;
	}

	public List getAllPerm(Map params) {

		return pd.getAllPerm(params);
	}

	public void addperm(Map params) {
		pd.addperm(params);
		
	}

	public void updperm(Map params) {
		pd.updperm(params);
		
	}

	public void delperm(Map params) {
		pd.delperm(params);
		
	}
	
}
