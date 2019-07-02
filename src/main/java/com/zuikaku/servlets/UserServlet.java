package com.zuikaku.servlets;

import com.zuikaku.dao.UserDAO;
import com.zuikaku.dao.UserSaveDAO;
import com.zuikaku.javabean.User;
import com.zuikaku.javabean.UserSave;
import com.zuikaku.utils.C3P0DataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //进入个人信息页面 直接转到 PersonalData.jsp
        RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/PersonalData.jsp");
        //System.out.println("测试得到req中的attribute"+req.getAttribute("isChanged"));//读不到，url传过来较parameter，而这个是Attribute
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得session中的对象
        HttpSession session=req.getSession();
        User user=(User) session.getAttribute("user");
        UserSave userSave=(UserSave) session.getAttribute("userSave");
        //对玩家信息进行更新
        int uid=Integer.parseInt(req.getParameter("userid"));
        String newNickname =req.getParameter("nickname");
        String newPassword =req.getParameter("password");
        Connection conn= C3P0DataSource.getConnection();
        boolean isPasswordChanged= UserDAO.UpdatePasswordByid(conn,uid,newPassword);
        boolean isNickNameChanged= UserSaveDAO.UpdateNickNameByUserid(conn,uid,newNickname);
        //归还数据库连接
        C3P0DataSource.closeConnection(conn);
        if(isNickNameChanged&&isPasswordChanged)
        {
            //所有修改均生效
            //修改成功后，session中存储的内容也要更新
            //重新生成新的对象放入session
            User newUser=new User(user.getId(),user.getEmail(),newPassword,user.getIdcard(),user.isAdmin(),user.isRoot());
            UserSave newUserSave=new UserSave(userSave.getId(),userSave.getUserid(),newNickname,userSave.getBaselevel(),userSave.getCoin(),userSave.getDiamond());
            session.removeAttribute("user");//清空session
            session.removeAttribute("userSave");
            session.setAttribute("user",newUser);
            session.setAttribute("userSave",newUserSave);
            //resp.sendRedirect("/user?isChanged=true");
            //使用forward方式更好，因为未跳到其他页面，地址栏最好不要变动
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/PersonalData.jsp?isChanged=true");
            dispatcher.forward(req,resp);
        }else {
            //所有修改并未全生效
            //resp.sendRedirect("/user?isChanged=false");
            //使用forward方式更好，因为未跳到其他页面，地址栏最好不要变动
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/PersonalData.jsp?isChanged=false");
            dispatcher.forward(req,resp);
        }

    }
}
