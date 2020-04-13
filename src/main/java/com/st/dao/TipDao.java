package com.st.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface TipDao {

	void login_tip_count(Map map);
	
}
