package com.st.shiro;

import javax.mail.Session;
import javax.security.auth.login.CredentialException;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.st.bean.PermBean;
import com.st.bean.User;
import com.st.service.imp.RoleService;
import com.st.service.imp.UserService;
@Component
public class MyRealm extends AuthorizingRealm{
	@Autowired
	RoleService testS;
	@Autowired
	UserService userS;
	@Autowired
	HttpSession Session;
	/**
	 * 该方法一定是登录成功之后运行
	 * 每当需要权限认证时，都会执行此方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//		System.out.println("------获取权限------");
//		String username = (String) SecurityUtils.getSubject().getPrincipal();
//		List list = testS.getPermByUsername(username);//PermBean对象的集合
//		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
//		//需要一个字符串的集合
//		List<String> str_perm_list = getPermList(list);
//		sai.addStringPermissions(str_perm_list);
//		return sai;
		User user = (User) Session.getAttribute("login_user");
		List<String> list = user.getPermissionCodes();
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		sai.addStringPermissions(list);
		return sai;
		
	}
	private List<String> getPermList(List list){
		List<PermBean>Pblist = (List<PermBean>)list;
		List<String> str_perm_list = new ArrayList<String>();
		for(PermBean pb:Pblist) {
			str_perm_list.add(pb.getPerm_code());
		}
		return str_perm_list;
	}
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获得用户名和密码
		String username=token.getPrincipal().toString();
		String password=new String((char[])token.getCredentials());
		SimpleHash sh = new SimpleHash("md5", password);
		//sh=new SimpleHash("md5",password, username);
		//sh=new SimpleHash("md5", password, username, 12);
		System.out.println("-------------"+sh.toString());
		System.out.println(sh.toString());
		//数据库验证是否正确
		System.out.println("没有做验证");
		User user = userS.getUser(username);
		System.out.println(user.getAllPermission().size()+"----------size----------");
		Session.setAttribute("login_user", user);
		Session.setAttribute("login_username", username);
		System.out.println(username+"-------------username------------");
		System.out.println(user+"------------");
		if(!sh.toString().equals(user.getUserpass())) {
			throw new CredentialsException("密码不正确");
		}
		return new SimpleAuthenticationInfo(username,password,getName());
	}

}
