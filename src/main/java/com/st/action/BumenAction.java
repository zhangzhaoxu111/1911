package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.BumenService;
import com.st.util.Page;

@Controller
public class BumenAction {
	@Autowired
	BumenService bumenS;
	@RequestMapping("/bumen")
	public String bumen_select() {
		return "bumen";
	}
//	显示所有部门信息
	@RequestMapping("/select_bumen")
	@ResponseBody
	public LayJson select_bumen(@RequestParam Map params) {
		Page.pageParams(params);
		int count = bumenS.getCount(params);
		List listbumen = bumenS.getAllBumen(params);
		LayJson lj = new LayJson(listbumen, count);
		lj.setCount(count);
		System.out.println(listbumen);
		return lj;
	}
//	查询部门信息
	@RequestMapping("/select_bum")
	@ResponseBody
	public LayJson select_bum(@RequestParam Map params) {
		Page.pageParams(params);
		int count = bumenS.getCount(params);
		List listbumen = bumenS.getAllBum(params);
		LayJson lj = new LayJson(listbumen, count);
		lj.setCount(count);
		System.out.println(listbumen);
		return lj;
	}
	@RequestMapping("/del_bumen")
	@ResponseBody
	public void del_bumen(@RequestParam Map params) {
		bumenS.delbumen(params);
	}
	@RequestMapping("/add_bumen")
	@ResponseBody
	public void add_bumen(@RequestParam Map params) {
		System.out.println(params+"------addbumen-----");
		bumenS.add_bumen(params);
	}
	@RequestMapping("/upd_bumen")
	@ResponseBody
	public void upd_bumen(@RequestParam Map params) {
		bumenS.upd_bumen(params);
	}
	@RequestMapping("yonghu/{bmid}")
	public String transfer(@PathVariable String bmid,HttpServletRequest request) {
		request.setAttribute("bmid", bmid);
		
		return "yonghu";
		
	}
	@RequestMapping("xxxBumen")
	@ResponseBody
	public void transfer_xxx(@RequestParam Map params) {
		System.out.println(params+"66666666666666666");
		bumenS.xxxBumen(params);
	}
	
//	@RequestMapping("/creatGoods")
//	public String creatGoods(HttpSession session,@RequestParam Map params) {
//		//保存表单数据到goods表 
//		//获取商品图片的信息（）,保存到
//		bumenS.creatGoods(session, params);
//		return "shopManager";
//	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List findAll() {
		List listfind = bumenS.findAll();
		return listfind;
	}
}
