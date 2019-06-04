package com.zuikaku.dao;



import com.zuikaku.javabean.UserSave;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserSaveDAO {
    /**
     * 创建用户的基本数据
     * @param conn
     * @param userid
     */
    public static void CreatSaveForUser(Connection conn, int userid,String initialnickname)
    {
        //初始注册时，昵称和邮箱相同
        String insertSqlStr="INSERT INTO user_save(userid,nickname) VALUES (?,?)";
        try{
            PreparedStatement preparedStatement=conn.prepareStatement(insertSqlStr);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,initialnickname);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }catch (Exception e)
        {

            System.out.println("创建用户数据usersave时出现异常，异常信息为"+e);
        }
    }

    /**
     * 通过用户的id获得用户的数据usersave
     * @param conn
     * @param userid
     * @return
     */
    public static UserSave GetUserSaveByUserid(Connection conn, int userid)
    {
        String selectSqlStr="SELECT * FROM user_save WHERE userid=?";
        try{
            PreparedStatement preparedStatement=conn.prepareStatement(selectSqlStr);
            preparedStatement.setInt(1,userid);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {

                int id=resultSet.getInt("id");
                byte baselevel=(byte)resultSet.getInt("baselevel");
                String nickname=resultSet.getString("nickname");
                int coin=resultSet.getInt("coin");
                int diamond=resultSet.getInt("diamond");
                resultSet.close();
                preparedStatement.close();
                UserSave userSave=new UserSave(id,userid,nickname,baselevel,coin,diamond);
                return userSave;
            }
        }catch (Exception e)
        {

            System.out.println("获得用户数据usersave出现异常，异常信息为"+e);

        }
        return  null;
    }

    /**
     * 通过用户的id来修改用户的游戏昵称
     * @param conn
     * @param userid
     * @param newNickName
     * @return
     */
    public static boolean UpdateNickNameByUserid(Connection conn,int userid,String newNickName)
    {
        String updateSqlStr="UPDATE user_save SET nickname=? WHERE userid=?";
        try{
            PreparedStatement preparedStatement=conn.prepareStatement(updateSqlStr);
            preparedStatement.setString(1,newNickName);
            preparedStatement.setInt(2,userid);
            int effectRows=preparedStatement.executeUpdate();
            preparedStatement.close();
            if(effectRows>0)
            {
                return true;
            }else {
                return false;
            }
        }catch (Exception e)
        {
            System.out.println("更新玩家昵称时发生异常，异常信息为:"+e);
            return false;
        }
    }

    /**
     * 通过玩家id更新玩家的游戏资源
     * @param conn
     * @param userid
     * @param baseLevel
     * @param coins
     * @param diamonds
     * @return
     */
    public static boolean UpdatePlayerResourcesByuid(Connection conn,int userid,byte baseLevel,int coins,int diamonds)
    {
        String updateSqlStr="UPDATE user_save SET baselevel=?,coin=?,diamond=? WHERE userid=?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(updateSqlStr);
            preparedStatement.setByte(1,baseLevel);
            preparedStatement.setInt(2,coins);
            preparedStatement.setInt(3,diamonds);
            preparedStatement.setInt(4,userid);
            int isUpdate=preparedStatement.executeUpdate();
            preparedStatement.close();
            if(isUpdate>0)
            {
                //说明更改成功
                return true;
            }else {
                //说明更改失败
                return false;
            }

        }catch (Exception e)
        {
            System.out.println("更改玩家游戏数据时发生异常"+e);
            return false;
        }
    }

}
