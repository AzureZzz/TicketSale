package com.guet.annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

@Component
public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private RedisTemplate<String, Serializable> redis;

    @Autowired
    public void setRedis (RedisTemplate<String, Serializable> redis) {
        this.redis = redis;
    }

    public boolean preHandle (HttpServletRequest request,
                              HttpServletResponse response, Object handler) throws Exception {
        // 如果不是映射到方法直接通过
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod ();

        if (method.getAnnotation (AuthLogin.class) != null) {
            if(request.getSession().getAttribute("aId")!=null){
                return true;
            }
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }
}