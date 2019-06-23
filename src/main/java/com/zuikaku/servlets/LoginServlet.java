package com.zuikaku.servlets;

import com.zuikaku.dao.UserDAO;
import com.zuikaku.dao.UserSaveDAO;
import com.zuikaku.javabean.User;
import com.zuikaku.javabean.UserSave;
import com.zuikaku.utils.C3P0DataSource;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Random;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //进入登录页面的跳转
        //把原来的登录信息先清空
        HttpSession session=req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("userSave");
        System.out.println("用户点击了登录，进入登录页面");
        RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/LoginPage.jsp");
        dispatcher.forward(req,resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //执行登录，提交登录表单时的操作
        System.out.println("用户执行登录");
        String emailAddress=req.getParameter("email");
        String password=req.getParameter("password");
        String randomString=req.getParameter("randomString");
        System.out.println("用户输入的图片验证码"+randomString);
        System.out.println("用户输入的电子邮箱"+emailAddress);
        System.out.println("用户输入的密码"+password);
        HttpSession session=req.getSession();
        //先进行人机判断，判断图片验证码是否正确
        String correctRandomString=session.getAttribute("randomString").toString();
        if(!randomString.equals(correctRandomString))
        {
            //说明图片验证码错误
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/LoginPage.jsp?wrongLoginCode=true");
            dispatcher.forward(req,resp);
            return;//退出
        }
        //说明图像验证码是正确的
        // 数据判断操作 成功则存入session 页面重定向方式跳转到PersonalData.jsp 失败则显示错误信息重定向到LoginPage.jsp
        Connection connection=C3P0DataSource.getConnection();
        User user= UserDAO.UserLogin(connection,emailAddress,password);
        if(user!=null)
        {
            //说明登录成功
            System.out.println(user);
            UserSave userSave= UserSaveDAO.GetUserSaveByUserid(connection,user.getId());
            C3P0DataSource.closeConnection(connection);//释放这个数据库连接

            session.setAttribute("user",user);
            session.setAttribute("userSave",userSave);
            //转到个人信息面板
//            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/WEB-INF/page/PersonalData.jsp");
//            requestDispatcher.forward(req,resp);【这个地方应该使用sendRedirect进行跳转，使地址栏变动，不然此页刷新的话，又要重新登录】
            resp.sendRedirect("/user");
            System.out.println("重定向到用户数据页面");
        }else {
            System.out.println("登录失败-原因：账户或密码出错");
            //再次重定向到本网页，并用url的使错误信息进行显示【使用forward更好，因为未转到其他jsp，地址栏最好不变】
            //resp.sendRedirect("/login?isOk=false");
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/LoginPage.jsp?isOk=false");
            dispatcher.forward(req,resp);
            System.out.println("跳转回登录页面");
        }
    }

    @Override
    public void init() throws ServletException {
        System.out.println("用户登录模块初始化");
        // 数据库连接池初始化
        // 读取全局配置
        //用application对象
        ServletContext application=this.getServletContext();
        String dbURL= application.getInitParameter("url");
        String username=application.getInitParameter("username");
        String password=application.getInitParameter("password");
        //System.out.println(dbURL+"   "+username+"    "+password);

        C3P0DataSource.init(dbURL,username,password);
        //C3P0DataSource.init();
    }

    @Override
    public void destroy() {
        //Servlet彻底关闭时，（整个服务器关闭时执行，把关闭连接池）
        C3P0DataSource.completeClose();
    }
}
