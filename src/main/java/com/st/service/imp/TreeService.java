package com.st.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.TestDao;
import com.st.dao.TreeDao;

@Service
public class TreeService {
	@Autowired
	TreeDao treeD;
	public List treeJson() {
		List list = treeD.treeJson();
		return list;
	}
}
