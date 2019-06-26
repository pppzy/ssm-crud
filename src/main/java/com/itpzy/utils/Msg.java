package com.itpzy.utils;

import java.util.HashMap;
import java.util.Map;

//定义一个状态类，当浏览器访问控制器时，返回该类
public class Msg {

    //状态码code,100=成功，200=失败
    private int code;
    //访问后返回的信息
    private String msg;

    //用于存储返回的数据
    private Map<String, Object> params = new HashMap<String, Object>();

    //添加要返回到页面的参数
    public Msg add(String key, Object value) {

        this.params.put(key, value);
        return this;
    }

    //定义个访问成功的方法
    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("访问成功!");
        return result;
    }

    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("访问失败!");
        return result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
