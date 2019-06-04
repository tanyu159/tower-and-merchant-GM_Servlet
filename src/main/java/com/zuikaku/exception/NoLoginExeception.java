package com.zuikaku.exception;

/**
 * 没有登录异常，自定义异常
 */
public class NoLoginExeception extends Exception {
    public NoLoginExeception(String msg)
    {
        super(msg);
    }

}
