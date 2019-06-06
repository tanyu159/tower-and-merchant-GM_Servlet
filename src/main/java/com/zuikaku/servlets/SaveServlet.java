package com.zuikaku.servlets;

import com.zuikaku.dao.UserSaveDAO;
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

public class SaveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //进入该游戏数据页面 直接转到GameData.jsp
        RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/GameData.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //对游戏数据进行更新
        HttpSession session=req.getSession();
        UserSave userSave=(UserSave) session.getAttribute("userSave");
        //获取提交的表单
        byte newBaseLevel=Byte.parseByte(req.getParameter("baseLevel"));
        int newCoins=Integer.parseInt(req.getParameter("coins"));
        int newDiamonds=Integer.parseInt(req.getParameter("diamonds"));
        Connection conn= C3P0DataSource.getConnection();
        boolean isChanged=UserSaveDAO.UpdatePlayerResourcesByuid(conn,userSave.getUserid(),newBaseLevel,newCoins,newDiamonds);
        if(isChanged)
        {
            //更新session中内容
            session.removeAttribute("userSave");
            UserSave newUserSave=new UserSave(userSave.getId(),userSave.getUserid(),userSave.getNickname(),newBaseLevel,newCoins,newDiamonds);
            session.setAttribute("userSave",newUserSave);
            //用forward方式，并设置attribute【因为未转到其他jsp，地址栏不变】
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/GameData.jsp?isChanged=true");
            dispatcher.forward(req,resp);
        }else {
            //用forward方式，并设置attribute【因为未转到其他jsp，地址栏不变】
            RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/page/GameData.jsp?isChange=false");
            dispatcher.forward(req,resp);
        }
    }
}
