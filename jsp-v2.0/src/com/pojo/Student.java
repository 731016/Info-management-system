package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.*;

/**
 * @author 涂鏊飞tu_aofei@163.com
 * @description: TODO 类描述
 * @create 2021-09-16 11:55
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Student {
    private String account;
    private String pwd;
    private String sex;
    private String educ;
    private String happy;

/*    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEduc() {
        return educ;
    }

    public void setEduc(String educ) {
        this.educ = educ;
    }

    public String getHappy() {
        return happy;
    }

    public void setHappy(String happy) {
        this.happy = happy;
    }

    public Student() {
    }

    public Student(String account, String pwd, String sex, String educ, String happy) {
        this.account = account;
        this.pwd = pwd;
        this.sex = sex;
        this.educ = educ;
        this.happy = happy;
    }*/
}
