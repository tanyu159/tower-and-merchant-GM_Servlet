package com.zuikaku.servlets;

import com.zuikaku.dao.UserDAO;
import com.zuikaku.utils.C3P0DataSource;
import com.zuikaku.utils.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Random;

public class SpawnSecurityCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得来自前台的邮箱号码
        String email=req.getParameter("email");
        //判断数据库中该邮箱是否被占用
        Connection connection= C3P0DataSource.getConnection();
        boolean emailIsExist= UserDAO.JudgeEmailExist(connection,email);
        C3P0DataSource.closeConnection(connection);//释放连接
        if(emailIsExist)
        {
            //给出信息-邮箱已经存在
            System.out.println("邮箱已经存在");
            resp.sendRedirect("/register?isExist=true");
        }else{
            //邮箱不存在-可以注册，生成验证码并下发到邮箱，验证码存入cookie，重定向到注册页面。
            String emailSecurityCode= String.valueOf((new Random().nextInt(899999) + 100000));//生成6位随机数
            SendEmail.Instance().SendAnEmail(email,"你正在注册箭塔与商人","你的邮件验证码是："+emailSecurityCode);//下发到邮箱
            // 验证码存入cookie
            Cookie cookie=new Cookie("emailSecurityCode",emailSecurityCode);
            cookie.setMaxAge(600);
            //cookie存入客户端
            resp.addCookie(cookie);
            //重定向
            resp.sendRedirect("/register?isExist=false&email="+email);
        }
    }
}
