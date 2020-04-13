package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.imp.YewuyuanService;
import com.st.util.Page;

@Controller
public class YewuyuanAction {
	
	@Autowired
	YewuyuanService ywyS;
	@RequestMapping("/yewuyuan")
	public String yewu() {
		return "yewuyuan";
	}
	@RequestMapping("/select_ywy")
	@ResponseBody
	public LayJson select_ywy(@RequestParam Map params) {
		Page.pageParams(params);
		int count = ywyS.getCount(params);
		List listbumen = ywyS.getAllyw(params);
		LayJson lj = new LayJson(listbumen, count);
		lj.setCount(count);
		
		return lj;
	}
	@RequestMapping("/del_yw")
	@ResponseBody
	public void del_yw(@RequestParam Map params) {
		ywyS.delyw(params);
	}
	@RequestMapping("/add_yw")
	@ResponseBody
	public void add_yw(@RequestParam Map params) {
		ywyS.addyw(params);
	}
	@RequestMapping("/upd_yw")
	@ResponseBody
	public void upd_yw(@RequestParam Map params) {
		ywyS.updyw(params);
	}
	
}
