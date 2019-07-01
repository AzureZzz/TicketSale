package com.guet.utils;

import sun.misc.BASE64Encoder;

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

    public static int  dayForWeek(String pTime) throws  Exception {
        SimpleDateFormat format = new  SimpleDateFormat("yyyy-MM-dd" );
        Calendar c = Calendar.getInstance();
        c.setTime(format.parse(pTime));
        int  dayForWeek = 0 ;
        if (c.get(Calendar.DAY_OF_WEEK) == 1 ){
            dayForWeek = 7 ;
        }else {
            dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1 ;
        }
        return dayForWeek;
    }

    public static Date addAndSubtractDaysByCalendar(Date dateTime, int n){
        java.util.Calendar calstart = java.util.Calendar.getInstance();
        calstart.setTime(dateTime);
        calstart.add(java.util.Calendar.DAY_OF_WEEK, n);
        return calstart.getTime();
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
}
