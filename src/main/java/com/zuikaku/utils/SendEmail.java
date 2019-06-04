package com.zuikaku.utils;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    private static SendEmail instance;
    public static SendEmail Instance(){
        if(instance==null)
        {
            instance=new SendEmail();
        }
        return instance;
    }
    private Session session;

    private SendEmail()
    {
        //初始化邮件发送设置
        Properties properties=new Properties();
        properties.setProperty("mail.host","smtp.qq.com");
        properties.setProperty("mail.transport.protocol","smtp");
        properties.setProperty("mail.smtp.auth","true");
        //部署到公网,邮件发送使用465端口 ，默认25端口被封禁的。使用ssl模式
        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.setProperty("mail.smtp.socketFactory.fallback", "false");
        properties.setProperty("mail.smtp.port","465");
        properties.setProperty("mail.smtp.socketFactory.port","465");
        session=Session.getInstance(properties);
        session.setDebug(true);
    }

    /**
     * 发送邮件
     * @param receiverEmailAddress
     * @param emailTitle
     * @param emailContent
     * @throws Exception
     */
    public void SendEmail(String receiverEmailAddress,String emailTitle,String emailContent )
    {
        try {


            Transport transport = session.getTransport();
            //发件者邮箱
            transport.connect("smtp.qq.com", "1274659231", "rghkciatuinhbabh");
            //创建邮件
            Message message = CreateMessage(session, receiverEmailAddress, emailTitle, emailContent);
            //发送邮件
            transport.sendMessage(message, message.getAllRecipients());
            //关闭流
            transport.close();
        }catch (Exception e)
        {
            System.out.println("发送邮件时出现异常，异常信息为"+e);
        }
    }

    /**
     * 创建邮件
     * @param session
     * @param receiverEmail
     * @param emailTitle
     * @param emailContent
     * @return
     * @throws Exception
     */
    private Message CreateMessage(Session session,String receiverEmail,String emailTitle,String emailContent) throws Exception
    {
        //创建邮件对象
        MimeMessage message=new MimeMessage(session);
        //指定邮件发件人
        message.setFrom(new InternetAddress("1274659231@qq.com"));
        //指明邮件收件人
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(receiverEmail));
        //设置邮件标题
        message.setSubject(emailTitle);
        //设置内容
        message.setContent(emailContent, "text/html;charset=UTF-8");
        return message;
    }

}
