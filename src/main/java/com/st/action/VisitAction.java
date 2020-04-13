package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.VisitService;
import com.st.util.Page;

@Controller
public class VisitAction {
	@Autowired
	VisitService vs;

	@RequestMapping("/visit")
//visit页面跳转
	public String visit() {
		return "visit";
	}

//	查询所有
	@RequestMapping("/select_visit")
	@ResponseBody
	public LayJson user(@RequestParam Map params) {
		Page.pageParams(params);
		int count = vs.getCount(params);
		List listrole = vs.getAllVisit(params);
		LayJson json = new LayJson(listrole, count);
		json.setCount(count);
		System.out.println(json);
		return json;
	}

//查询visit_info
	@RequestMapping("/findAllInfo")
	@ResponseBody
	public List findAll() {
		List listfind = vs.findAllInfo();
		System.out.println(listfind + "--------info-------");
		return listfind;
	}

	// 查询visit_pattern
	@RequestMapping("/findAllPattern")
	@ResponseBody
	public List findAllP() {
		List listpattern = vs.findAllPattern();
		System.out.println(listpattern + "--------pattern-------");
		return listpattern;
	}

	// 查询visit_pay
	@RequestMapping("/findAllPay")
	@ResponseBody
	public List findAllPay() {
		List listpay = vs.findAllPay();
		System.out.println(listpay + "--------pay-------");
		return listpay;
	}
//	新增回访记录
	@RequestMapping("/insert_visit")
	@ResponseBody
	public void addvisit(@RequestParam Map params) {
		
		vs.addvisit(params);
	}
//	删除记录
	@RequestMapping("/del_visit")
	@ResponseBody
	public void del_visit(@RequestParam Map params) {
		
		vs.delvisit(params);
	}
	
}
