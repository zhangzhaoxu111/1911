package com.st.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.imp.UserService;

@Controller
public class Zhuce {
	@Autowired
	UserService us;
	@RequestMapping("zhuce1")
	public String zhu() {
		return "zhuce1";
	}
	@RequestMapping("/zhuce_user")
	@ResponseBody
	public void zhuce(@RequestParam Map params, HttpServletResponse re) throws Exception{
		System.out.println(params);
		//System.out.println(getStringRandom(6));
		UUID uuid = UUID.randomUUID();
		params.put("user_id", uuid.toString());
		String pw = getStringRandom(6);
		System.out.println(params+"----50-----");
		Email((String) params.get("useremail"), pw);
		
		// 加密
		SimpleHash sh = new SimpleHash("md5",pw);
		params.put("userpass", sh.toString());
		System.out.println(pw+"mima");
		us.addUser(params);
	}
	//发送邮件
	private void Email(String string, String pw) throws MessagingException, IOException {
		
		Properties props = new Properties();
		props.setProperty("mail.host", "smtp.126.com");
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth", "true");
		//创建会话
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("zhaoxutongxue@126.com", "ENAJOKTKXCNYYCGE");
			}
		});
		//开启调试模式
		session.setDebug(true);
		//获得传输者对象
		Transport t = session.getTransport();
		//四个参数--邮箱服务--端口号--账号--登录密码
		t.connect("smtp.126.com", 25, "zhaoxutongxue@126.com", "ZHANGzhaoxu1008");
		//邮件内容
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("zhaoxutongxue@126.com"));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(string));
		message.setSubject("注册信息");
		//String userpass="";
		//URL url = new URL("http://localhost:8080/zhuce_user");
		//InputStream is = url.openStream();
		//char[] c_arr = new char[1024];
		//int l=0;
		//Reader r = new InputStreamReader(is);
		//while((l=r.read(c_arr))>0) {
		//	userpass+=new String(Arrays.copyOf(c_arr, l));
		//}
		//message.setContent("-----吔屎了嘞------", "text/html;charset=UTF-8");
		message.setContent("密码为："+pw, "text/html;charset=UTF-8");
		//发送邮件
		t.sendMessage(message, message.getAllRecipients());
		//关闭传输者流
		t.close();
	}
	//生成随机数字和字母
	private String getStringRandom(int length) {
		 String code="";
		    Random rand=new Random();//生成随机数
		    for(int a=0;a<length;a++){
		    code+=rand.nextInt(10);//生成6位验证码
		      }
			return code;
		    }
}
