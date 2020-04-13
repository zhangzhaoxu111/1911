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
import com.st.util.Page;

@Controller
public class AnnontionAction {
	@Autowired
	AnnontionService as;
	@RequestMapping("/annontion")
	public String annon() {
		return "annontion";
		
	}
//	查询所有信息
	@RequestMapping("/annon_select")
	@ResponseBody
	public LayJson an_select(@RequestParam Map params) {
		Page.pageParams(params);
		int count = as.getCount(params);
		List listannon = as.getAllAnnon(params);
		LayJson lj = new LayJson(listannon,count);
		lj.setCount(count);
		System.out.println(listannon);
		return lj;
	}
//	新增批注
	@RequestMapping("/insert_annon")
	@ResponseBody
	public void addanno(@RequestParam Map params) {
		as.add_annon(params);
	}
//	删除批注
	@RequestMapping("/del_annon")
	@ResponseBody
	public void del_annon(@RequestParam Map params) {
		as.del_annon(params);
	}
//	修改批注
	@RequestMapping("/upd_annon")
	@ResponseBody
	public void upd_annon(@RequestParam Map params) {
		as.upd_annon(params);
	}
}
