package com.st.dao;

import java.util.List;
import java.util.Map;

public interface YewuyuanDao {

	int getCount(Map params);

	List getAllyw(Map params);

	void delyw(Map params);

	void addyw(Map params);

	void updyw(Map params);

}
