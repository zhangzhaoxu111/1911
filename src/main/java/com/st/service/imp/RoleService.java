package com.st.service.imp;

import java.lang.Thread.State;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.st.bean.User;
import com.st.dao.TestDao;

import ch.qos.logback.core.status.Status;

@Service
public class RoleService {
	@Autowired
	TestDao TestD;

	@Autowired
	TransactionTemplate transT;

	// 一个方法可以作为一个事务
	// @Transactional
	public void addBM() {
		// 新增部门数据
		// 新增两个部门信息 uuid bmname

		// 事务 ---整体--
		// 1
		transT.execute(new TransactionCallback<Boolean>() {

			@Override
			public Boolean doInTransaction(TransactionStatus status) {

				try {
					Map map = new HashMap();
					UUID uuid = UUID.randomUUID();
					map.put("uuid", uuid.toString());
					map.put("bmname", "人力部");
					TestD.addBM(map);
					System.out.println(1 / 0);
					// 2
					uuid = UUID.randomUUID();
					map.put("uuid", uuid.toString());
					map.put("bmname", "市场部");
					TestD.addBM(map);
				} catch (Exception e) {
					status.setRollbackOnly();
					return false;
				} // TODO Auto-generated method stub
				return true;
			}

		});
	}

	public void addBM2() {
		Map map = new HashMap();
		UUID uuid = UUID.randomUUID();
		map.put("uuid", uuid.toString());
		map.put("bmname", "人力部");
		TestD.addBM(map);
		System.out.println(1 / 0);
		// 2
		uuid = UUID.randomUUID();
		map.put("uuid", uuid.toString());
		map.put("bmname", "市场部");
		TestD.addBM(map);
	}

	public List getAllJuese(Map params) {

		return TestD.getAllJuese(params);
	}

	public int getCount(Map params) {
		int count = TestD.getCount(params);
		return count;
	}

	public void addRole(Map params) {
		TestD.addRole(params);

	}

	public void delRole(Map params) {
		TestD.delRole(params);

	}

	public void updateRole(Map params) {
		TestD.updateRole(params);

	}

	/**
	 * 保存角色和权限的关系
	 * 
	 * @param role_id
	 * @param perms
	 */
	public void role_perm(String role_id, String perms) {
		// 1、将perms转为集合
		List list = toList(perms);
		Map map = new HashMap();
		map.put("role_id", role_id);
		map.put("perms", list);
		System.out.println(map);
		TestD.delrole_permission(map);
		TestD.role_perm(map);
	}

	private List toList(String perms) {
		List list = new ArrayList();
		String[] perms_arr = perms.split(",");
		for (String str : perms_arr) {
			if (!str.trim().equals("")) {
				list.add(str);
			}

		}
		return list;
	}
	public List getPermByUsername(String username) {
		return TestD.getPermByUsername(username);
		
	}
}
