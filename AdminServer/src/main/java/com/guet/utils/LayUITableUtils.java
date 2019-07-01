package com.guet.utils;

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LayUITableUtils<T> {

    public Map<String,Object> getLayUIMap(List<T> objects,int count) {
        Map<String ,Object> map = new HashMap<>();
        if(objects!=null){
            map.put("code",0);
            map.put("msg","success");
            map.put("count",count);
            map.put("data",objects);
        }else {
            map.put("code",1);
            map.put("msg","no result");
            map.put("count",0);
            map.put("data",null);
        }
        return map;
    }
}
