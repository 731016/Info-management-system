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
}
