package com.leador.common.system.filter;

import com.leador.common.system.utils.ShiroUtils;
import org.apache.shiro.web.servlet.AdviceFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpServletResponse;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/5/7 9:52
 * @description：
 */
public class LoginFilter extends AdviceFilter {

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        ShiroHttpServletRequest shiroHttpServletRequest = (ShiroHttpServletRequest) request;
        ShiroHttpServletResponse shiroHttpServletResponse = (ShiroHttpServletResponse) response;
        Object user = ShiroUtils.getSubjct().getPrincipal();
        //判断用户是否存在，不存在返回登录界面，继续拦截，存在通过拦截，放行到访问页面
        if (user != null) {
            return true;
        }

        if (shiroHttpServletRequest.getHeader("x-requested-with") != null &&
                shiroHttpServletRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
            //如果是ajax请求响应头会有，x-requested-with
            shiroHttpServletResponse.setHeader("SESSIONSTATUS", "TIMEOUT");
            shiroHttpServletResponse.setHeader("CONTEXTPATH", "/login");
            shiroHttpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);//401 没有权限
            response = shiroHttpServletResponse;
        } else {
            //request.getRequestDispatcher("/login").forward(request, response);//转发到登录界面 地址栏不发生变化
            ((ShiroHttpServletResponse) response).sendRedirect("/login");//转发到登录界面 地址栏发生变化
        }

        return false;
    }

    @Override
    protected void postHandle(ServletRequest request, ServletResponse response) throws Exception {

    }

    @Override
    public void afterCompletion(ServletRequest request, ServletResponse response, Exception exception) throws Exception {

    }

}
