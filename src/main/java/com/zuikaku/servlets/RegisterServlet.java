package com.zuikaku.servlets;

import com.zuikaku.dao.UserDAO;
import com.zuikaku.utils.C3P0DataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //进入注册页面
        //直接跳转到RegisterPage.jsp
        RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/RegisterPage.jsp");
        dispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //注册表单提交时操作
        //获得来自注册界面的表单数据
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String adminCode=req.getParameter("adminCode");
        String idCard=req.getParameter("idCard");
        Connection connection=C3P0DataSource.getConnection();
        boolean isAdmin=false;
        if(adminCode.equals("cdut"))
        {
            isAdmin=true;//管理员
        }
        boolean isSuccessful= UserDAO.InsertUser(connection,email,password,idCard,isAdmin);
        C3P0DataSource.closeConnection(connection);//释放数据库连接
        if(isSuccessful)
        {
            //注册成功
            resp.sendRedirect("/welcome?isSuccessful=true");
        }else{
            //注册失败
            resp.sendRedirect("/welcome?isSuccessful=false");
        }
    }

    @Override
    public void init() throws ServletException {
        System.out.println("用户注册模块初始化");
        // 数据库连接池初始化
        // 读取全局配置
        //用application对象
        ServletContext application=this.getServletContext();
        String dbURL= application.getInitParameter("url");
        String username=application.getInitParameter("username");
        String password=application.getInitParameter("password");
        C3P0DataSource.init(dbURL,username,password);
    }
}
