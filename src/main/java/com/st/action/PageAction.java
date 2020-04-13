package com.st.action;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sys")
public class PageAction {
	@RequestMapping(value = "/system", produces = "application/json;charset=utf-8")
	public String houtai() {
		return "system";
	}

	@RequestMapping(value = "/role", produces = "application/json;charset=utf-8")
	//@RequiresPermissions("user_system")
	public String juese() {
		return "role";
	}
	@RequestMapping("/user")
	public String userlist() {
		return "userlist";
	}
	@RequestMapping("/index")
	public String userindex() {
		return "index";
	}
}
