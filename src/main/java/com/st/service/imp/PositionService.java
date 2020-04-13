package com.st.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.st.dao.PositionDao;
@Service
public class PositionService {
	@Autowired
	PositionDao pd;
	public List getallrole() {
		
		return pd.getallrole();
	}
	public List getalluser() {
		
		return pd.getalluser();
	}
	
}
