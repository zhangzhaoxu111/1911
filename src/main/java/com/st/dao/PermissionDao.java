package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface PermissionDao {

	List getAllPerm(Map params);

	int getCount(Map params);

	void addperm(Map params);

	void updperm(Map params);

	void delperm(Map params);
	
}
