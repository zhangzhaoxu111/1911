package com.st.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.imp.RoleService;
import com.st.service.imp.TreeService;
@Controller
public class TreeAction {
	@Autowired
	TreeService treeS;
	//跳转树状图
	@RequestMapping("/treeJson")
	@ResponseBody
	public List treeJson() {
		List list = treeS.treeJson();
		return list;
	}
	//跳转权限
	@RequestMapping("index/{role_id}")
	public String index(@PathVariable String role_id,HttpServletRequest request) {
		request.setAttribute("role_id", role_id);
		return "index";
	}
}
