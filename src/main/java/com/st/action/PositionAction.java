package com.st.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.PositionService;
@Controller
public class PositionAction {
	@Autowired
	PositionService positionS;
	@RequestMapping("customer")
	public String customer() {
		return "customer";
	}
	@RequestMapping("/positionlist")
	@ResponseBody
	public LayJson positionlist(HttpSession session) {
		List list = positionS.getallrole();
		LayJson layjson = new LayJson(list,1);
		//session.setAttribute("checkUser", list);
		//System.out.println(layjson);
		return layjson;
	}
	@RequestMapping("/positionli")
	@ResponseBody
	public LayJson positionli(HttpSession session) {
		List list = positionS.getalluser();
		LayJson layjson = new LayJson(list,1);
		//session.setAttribute("checkUser", list);
		//System.out.println(layjson);
		return layjson;
	}
}
