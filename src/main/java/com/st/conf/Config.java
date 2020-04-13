package com.st.conf;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class Config {
	@Bean
	public InternalResourceViewResolver vr() {
		InternalResourceViewResolver irvr = new InternalResourceViewResolver();
		irvr.setPrefix("/WEB-INF/");
		irvr.setSuffix(".jsp");
		return irvr;
	}

	@Bean(name = "shiroFilter")
	public ShiroFilterFactoryBean shiroFilter(org.apache.shiro.mgt.SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		//登录页面的路径--如果判断没有登录会跳转到该路径
		shiroFilterFactoryBean.setLoginUrl("/tologin");
		//权限不足的路径
		shiroFilterFactoryBean.setUnauthorizedUrl("tRole");
		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
		// <!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
		//过滤登录与否能否访问的路径配置
		//filterChainDefinitionMap.put("/webjars/**", "anon");
		//filterChainDefinitionMap.put("/system", "anon");
		filterChainDefinitionMap.put("/", "anon");
		//filterChainDefinitionMap.put("/front/**", "anon");
		//filterChainDefinitionMap.put("/api/**", "anon");

		filterChainDefinitionMap.put("/sys/**", "authc");
		//filterChainDefinitionMap.put("/role", "authc");
		//filterChainDefinitionMap.put("/user/**", "authc");
		// 主要这行代码必须放在所有权限设置的最后，不然会导致所有 url 都被拦截 剩余的都需要认证
		// filterChainDefinitionMap.put("/**", "authc");
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return shiroFilterFactoryBean;

	}

	/**
	 * 创建安全管理器
	 * 
	 * @return
	 */
	@Bean
	public org.apache.shiro.mgt.SecurityManager securityManager(AuthorizingRealm realm) {
		DefaultWebSecurityManager defaultSecurityManager = new DefaultWebSecurityManager();
		defaultSecurityManager.setRealm(realm);
		return defaultSecurityManager;
	}
	@Bean
	public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
		advisorAutoProxyCreator.setProxyTargetClass(true);
		return advisorAutoProxyCreator;
	}
	//开启注解支持
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
			org.apache.shiro.mgt.SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}
}
