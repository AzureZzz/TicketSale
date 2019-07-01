package com.guet.utils;

import sun.misc.BASE64Encoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ServiceUtils {

    public static String md5(String message) {

        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] md5 = md.digest(message.getBytes());
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(md5);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException();
        }
    }

    public static Integer getNowTimeStr(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
//        return Integer.parseInt(dateFormat.format(new Date()));
        return Integer.parseInt(new Date().getTime()+"");
    }

    public static String getDayAddOne(String day){
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date today = null;
        try {
            today = f.parse(day);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar c = Calendar.getInstance();
        c.setTime(today);
        c.add(Calendar.DAY_OF_MONTH, 1);
        return f.format(c.getTime());
    }

    public static Long getUid(HttpServletRequest request){
        Long uId = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if(cookie.getName().equals("token")){
                uId = Long.valueOf(cookie.getValue());
            }
        }
        return uId;
    }

}
