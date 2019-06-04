package com.zuikaku.filter;


import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");//设置请求编码类
        filterChain.doFilter(servletRequest,servletResponse);//对请求和响应都进行设置
    }

    @Override
    public void destroy() {

    }
}
