package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.CustomerService;
import com.st.util.Page;

@Controller
public class CustomerAction {
	@Autowired
	CustomerService cusS;

	@RequestMapping("/gonghai")
	public String gonghai_select() {
		return "gonghai";
	}

	@RequestMapping("/private")
	public String pri_select() {
		return "private";
	}

	// 显示所有客户信息
	@RequestMapping("/select_cus")
	@ResponseBody
	public LayJson cus(@RequestParam Map params) {
		Page.pageParams(params);
		int count = cusS.getCount(params);
		List listcus = cusS.getAllCus(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	// 查询客户信息
	@RequestMapping("/select_custom")
	@ResponseBody
	public LayJson custom(@RequestParam Map params) {
		Page.pageParams(params);
		int count = cusS.getCount(params);
		List listcus = cusS.getAllCustom(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	// 查询所有公海客户
	@RequestMapping("/select_pub")
	@ResponseBody
	public LayJson pub(@RequestParam Map params) {
		Page.pageParams(params);
		int count = cusS.getCount(params);
		List listcus = cusS.getAllPub(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	// 查询公海客户
	@RequestMapping("/select_publi")
	@ResponseBody
	public LayJson publi(@RequestParam Map params) {
		Page.pageParams(params);
		System.out.println(params + "gonghaiyonghu");
		int count = cusS.getCount(params);
		List listcus = cusS.getAllPubli(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	// 查询显示私人客户
	@RequestMapping("/select_pri")
	@ResponseBody
	public LayJson pri(@RequestParam Map params) {
		Page.pageParams(params);
		int count = cusS.getCount(params);
		List listcus = cusS.getAllPri(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	// 查询私人客户
	@RequestMapping("/select_pr")
	@ResponseBody
	public LayJson pr(@RequestParam Map params) {
		Page.pageParams(params);
		int count = cusS.getCount(params);
		List listcus = cusS.getAllPr(params);
		LayJson lj = new LayJson(listcus, count);
		lj.setCount(count);
		return lj;
	}

	@RequestMapping("/insert_cus")
	@ResponseBody
	public void addcus(@RequestParam Map params) {
		cusS.addCustomer(params);
	}

	@RequestMapping("/delete_cus")
	@ResponseBody
	public void delcus(@RequestParam Map params) {
		cusS.delCustomer(params);
	}

	@RequestMapping("/update_cus")
	@ResponseBody
	public void updcus(@RequestParam Map params) {
		cusS.updCustomer(params);
	}

	@RequestMapping("/update_grade")
	@ResponseBody
	public void updgrade(@RequestParam Map params) {
		System.out.println(params + "---------grade----------");
		cusS.updgrade(params);
	}

	// 公海客户跟单
	@RequestMapping("/customer_public")
	@ResponseBody
	public void cus_public(@RequestParam Map params) {
		System.out.println(params + "---------grade----------");
		cusS.cus_public(params);
	}

	// 个人客户
	@RequestMapping("/customer_private")
	@ResponseBody
	public void cus_private(@RequestParam Map params) {
		System.out.println(params + "---------grade----------");
		cusS.cus_private(params);
	}

	// 跳转到改指定客户的回访信息页面
	@RequestMapping("/visit_infos_page/{customer_id}")
	public String  visit_infos_page(@PathVariable String customer_id,HttpServletRequest request) {
		// 查询customer_id对应的回访记录信息
		request.setAttribute("customer_id",customer_id);
		return "visit_infos";
	}
	@RequestMapping("/visit_infos/{customer_id}")
	@ResponseBody
	public LayJson visit_infos(@PathVariable String customer_id,@RequestParam Map params) {
		//Page.pageParams(params);
		params.put("customer_id", customer_id);
		List list = cusS.visit_info(params);
		int count = cusS.getCount(params);
		LayJson lj = new LayJson(list, count);
		lj.setCount(count);
		return lj;
	}
}
