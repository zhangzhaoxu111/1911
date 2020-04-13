package com.st.service.imp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.User;
import com.st.dao.TipDao;
import com.st.util.Context;
@Service
public class TimService {
	@Autowired
	TipDao td;
	
	public int login_tip_count(HttpSession session) {
		User user = (User) session.getAttribute(Context.LOGIN_USER);
		Map map = new HashMap();
		map.put("user_id", user.getUser_id());
		Context.TIP_YES(map);
		td.login_tip_count(map);
		return 0;
	}
}
