package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface AnnontionDao {

	int getCount(Map params);

	List getAllAnnon(Map params);

	void add_annon(Map params);

	void del_annon(Map params);

	void upd_annon(Map params);

}
