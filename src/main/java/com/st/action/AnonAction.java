package com.st.action;

import org.apache.shiro.subject.Subject;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.RoleService;
import com.st.util.Page;

@Controller
public class AnonAction {
	
//	@RequestMapping("/error")
//	public String error() {
//		return "error";
//	}

//	@Override
//	public String getErrorPath() {
//		
//		return "/error";
//	}
	@RequestMapping("/login")
	public String login() {
		return "login";
		
	}
	
	@RequestMapping("/tologin")
	public String tologin() {
		return "tologin";
		
	}
	
	@RequestMapping("/login_system")
	public String login_system(String username,String password,HttpServletRequest req) {
		//生成安全令牌
		UsernamePasswordToken token=new UsernamePasswordToken(username,password);
		 Subject sub = SecurityUtils.getSubject();//当前访问用户的对象
		 try {
		 sub.login(token);//开始登录--执行realm
		 }catch (CredentialsException ce) {
			 req.setAttribute("msg", ce.getMessage());
			return "login";
		}
		 return "system";
		
	}
	@RequestMapping("/outlogin")
	public String outlogin(HttpSession session) {
		Subject sub = SecurityUtils.getSubject();
		sub.logout();
		return "login";
	}
}
