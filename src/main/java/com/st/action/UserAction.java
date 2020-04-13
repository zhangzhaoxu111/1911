package com.st.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.UserService;
import com.st.util.Page;

@Controller
public class UserAction {
	@Autowired
	UserService userS;
	@RequestMapping("/select_user")
	@ResponseBody
	public LayJson user(@RequestParam Map params) {
		Page.pageParams(params);
		int count = userS.getCount(params);
		List listrole = userS.getAllUser(params);
		LayJson json = new LayJson(listrole,count);
		json.setCount(count);
		System.out.println(json);
		return json;
	}
	
	@RequestMapping("/insert_user")
	@ResponseBody
	public void addUser(@RequestParam Map params,HttpServletResponse response) throws IOException {
		int count = userS.getaddcount(params);
		if(count == 0) {
			SimpleHash sh = new SimpleHash("md5", params.get("userpass"), "username", 6);
			params.put("userpass", sh.toString());
			System.out.println("加密"+params);
			userS.addUser(params);
			response.getWriter().write("新增成功");
		}else {
			response.getWriter().write("新增失败");
		}
	}
	@RequestMapping("/delUser")
	@ResponseBody
	public void delUser(@RequestParam Map params) {
		userS.delUser(params);
	}
	@RequestMapping("/updateUser")
	@ResponseBody
	public void updateUser(@RequestParam Map params) {
		userS.updateUser(params);
	}
	@RequestMapping("transfer/{user_id}")
	public String transfer(@PathVariable String user_id,HttpServletRequest request) {
		request.setAttribute("user_id", user_id);
		
		return "transfer";
		
	}
	@RequestMapping("xxxUser")
	@ResponseBody
	public void transfer_xxx(@RequestParam Map params) {
		System.out.println(params+"-----------userparams-------------");
		userS.xxxUser(params);
	}
	@RequestMapping("/email2")
	public String email() {
		return "2";
	}
	@RequestMapping("/select_value")
	@ResponseBody
	public List select_value(@RequestParam Map params) {
		System.out.println(params+"value++++++++++++++++++++");
		List list = userS.getallrole(params);
		System.out.println(list+"value----------------------");
		return list;
	}
}
