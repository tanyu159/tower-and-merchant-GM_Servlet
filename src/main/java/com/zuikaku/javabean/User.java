package com.zuikaku.javabean;

public class User {
    private int id;
    private String email;
    private String password;
    private String idcard;

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean isRoot() {
        return root;
    }

    public void setRoot(boolean root) {
        this.root = root;
    }

    private boolean admin=false;
    private boolean root=false;



    public User(int id,String email,String password,String idcard,boolean isAdmin,boolean isRoot)
    {
        this.id=id;
        this.email=email;
        this.password=password;
        this.idcard=idcard;
        this.admin=isAdmin;
        this.root=isRoot;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    @Override
    public String toString()
    {
        String s="用户id："+id+"用户邮箱："+email+"密码："+password+"身份证："+idcard+"管理员："+admin+"超级管理员："+root;
        return  s;
    }

}
