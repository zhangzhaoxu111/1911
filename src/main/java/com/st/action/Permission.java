package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.AnnontionService;
import com.st.service.imp.PermissionService;
import com.st.util.Page;
@Controller
public class Permission {
	@Autowired
	PermissionService ps;
	@Autowired
	AnnontionService as;
	@RequestMapping("/perm")
	public String perm() {
		return "perm";
		
	}
	@RequestMapping("/select_perm")
	@ResponseBody
	public LayJson select_perm(@RequestParam Map params) {
		Page.pageParams(params);
		int count = ps.getCount(params);
		List listbumen = ps.getAllPerm(params);
		LayJson lj = new LayJson(listbumen, count);
		lj.setCount(count);
		
		return lj;
	}
	@RequestMapping("/insert_perm")
	@ResponseBody
	public void addperm(@RequestParam Map params) {
		ps.addperm(params);
	}
	@RequestMapping("/update_perm")
	@ResponseBody
	public void updperm(@RequestParam Map params) {
		ps.updperm(params);
	}
	@RequestMapping("/delete_perm")
	@ResponseBody
	public void delperm(@RequestParam Map params) {
		ps.delperm(params);
	}
}
