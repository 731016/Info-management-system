package com.Test;

import com.dao.impl.StudentDaoImpl;
import com.pojo.Student;

import java.lang.reflect.*;
import java.sql.Array;
import java.util.*;

/**
 * @author 涂鏊飞tu_aofei@163.com
 * @description: TODO reflect反射
 * @create 2021-09-30 10:13
 */
public class Demo {
    public static void main(String[] args) throws Exception {
        StudentDaoImpl studentDao = new StudentDaoImpl();
        // 获取反射对象
        Class<?> stuClass = Class.forName("com.dao.impl.StudentDaoImpl");
        Method selectAll = stuClass.getMethod("selectAll");
        Object invoke = selectAll.invoke(studentDao);
        List<Student> stuList = (List<Student>) invoke;
//        for (Student student : stuList) {
//            System.out.println(student.getAccount());
//        }
        Method selectAccAll = stuClass.getMethod("selectAll", String.class);
        Object invoke1 = selectAccAll.invoke(studentDao, "%a%");
        List<Student> stuList1 = (List<Student>) invoke1;
//        for (Student student : stuList1) {
//            System.out.println(student.getPwd());
//        }

        List<String> type = new ArrayList<>();
        Set<Object> hashset = new HashSet<>();
        Collections.addAll(hashset
                , Short.class
                , Integer.class
                , Float.class
                , Double.class
                , String.class
                , Boolean.class
                , Character.class
                , Byte.class
        );
        if (type instanceof Object && (!hashset.contains(type))) {
            System.out.println(type.getClass().getSimpleName());
        }
    }


}
