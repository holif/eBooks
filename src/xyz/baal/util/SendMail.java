package xyz.baal.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import xyz.baal.orm.User;
/**
 * 邮件发送类
 *
 */
public class SendMail extends Thread {
	private String from = "admin@baal.xyz";//发送邮箱
	private String username = "admin@baal.xyz";
	private String password = "";//邮箱密码
	private String host = "smtp.ym.163.com";
	private User user;
	public SendMail(User user) {
		this.user = user;
	}
	public void run() {
		try {
			Properties prop = new Properties();
			prop.setProperty("mail.host", host);
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.setProperty("mail.smtp.auth", "true");
			Session session = Session.getInstance(prop);
			session.setDebug(true);
			Transport ts = session.getTransport();
			ts.connect(host, username, password);
			Message message = createEmail(session, user);
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private Message createEmail(Session session, User user) throws Exception {
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO,
				new InternetAddress(user.getEmail()));
		message.setSubject("用户注册邮件");
		String info = "eBooks:<br/>&nbsp;&nbsp;&nbsp;&nbsp;恭喜您注册成功，您的用户名：" 
		+ user.getUsername() + ",您的密码："+ user.getPassword() + 
		"，请妥善保管，如有问题请联系我们!<br/>";
		message.setContent(info, "text/html;charset=UTF-8");
		message.saveChanges();
		return message;
	}
}