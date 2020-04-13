package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.RoleService;
import com.st.util.Page;

import net.sf.json.JSONObject;
@Controller

public class RoleAction {
	@Autowired
	RoleService testS;
	
	
	//删除
	@RequestMapping("delRole")
	@ResponseBody
	public void delRole(@RequestParam Map params) {
		testS.delRole(params);
	}
	//新增
	@RequestMapping("addRole")
	@ResponseBody
	public void addRole(@RequestParam Map params) {
		testS.addRole(params);
	}
	//修改
	
	@RequestMapping("updateRole")
	@ResponseBody
	public void updateRole(@RequestParam Map params) {
		testS.updateRole(params);
	}
	@RequestMapping("/role_perm/{role_id}/{perms}")
	public String role_perm(@PathVariable String role_id,@PathVariable String perms) {
		System.out.println(role_id);
		System.out.println(perms);
		testS.role_perm(role_id,perms);
		return "role";
	}
	
	
	//查询
		@RequestMapping("/select_role")
		@ResponseBody
		public LayJson juese(@RequestParam Map params) {
			Page.pageParams(params);
			int count = testS.getCount(params);
			List listjuese = testS.getAllJuese(params);
			LayJson json = new LayJson(listjuese,count);
			json.setCount(count);
			System.out.println(json);
			return json;
		}
}
