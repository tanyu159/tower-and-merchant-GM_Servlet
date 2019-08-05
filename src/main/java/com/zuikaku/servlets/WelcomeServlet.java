package com.zuikaku.servlets;

import com.zuikaku.utils.C3P0DataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Console;
import java.io.IOException;
import java.util.ResourceBundle;

public class WelcomeServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
//        super.init();
        // 数据库连接池初始化
//        ServletContext application=this.getServletContext();
//        String dbURL= application.getInitParameter("url");
//        String username=application.getInitParameter("username");
//        String password=application.getInitParameter("password");
//        C3P0DataSource.init(dbURL,username,password);
        //测试使用properties配置文件初始化数据库
        ResourceBundle rb= ResourceBundle.getBundle("jdbc");

        String driverClassName=rb.getString("driverClassName");
        String url=rb.getString("url");
        String username=rb.getString("username");
        String password=rb.getString("password");
        C3P0DataSource.init(url,username,password);
        System.out.println("通过properties文件加载"+driverClassName+"\n"+
                url+"\n"+
                username+"\n"+
                password+"\n"
                );

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("已通过/welcome方式进入网站");
        //消除上次登录的信息
        HttpSession session=req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("userSave");
        //forward方式定位到网页（服务器跳转，保留url不变，上一个url参数可以拿得到）
        RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/Welcome.jsp");
        dispatcher.forward(req,resp);
        //sendRedirect方式定位到网页（相当于重新用户发起请求，url改变，上一个url参数拿不到）
        //resp.sendRedirect("/WEB-INF/page/Welcome.jsp");此处不适用，jsp放在WEB-INF下不能通过url访问得到
    }


    @Override
    public void destroy() {
        C3P0DataSource.completeClose();
    }
}
