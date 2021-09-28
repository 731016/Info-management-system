package com.service.impl;

import com.dao.StudentDao;
import com.dao.impl.StudentDaoImpl;
import com.pojo.Student;
import com.service.StudentService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 涂鏊飞tu_aofei@163.com
 * @description: TODO 类描述
 * @create 2021-09-16 13:51
 */
public class StudentServiceImpl implements StudentService {
    private StudentDao studentDao;



    public StudentServiceImpl() {
        studentDao=new StudentDaoImpl();
    }

    @Override
    public Integer insertStudent(Student student) throws SQLException {
        Integer updateFlag = studentDao.insertStudent(student);
        return updateFlag;
    }

    @Override
    public Student selectOne(String stuName) throws SQLException {
        Student student = studentDao.selectOne(stuName);
        return student;
    }

    @Override
    public List<Student> selectAll() throws SQLException {
        List<Student> students = studentDao.selectAll();
        return students;
    }

    @Override
    public Integer delOne(String stuName) throws SQLException {
        return studentDao.delOne(stuName);
    }

    @Override
    public Integer alterOne(Student student) throws SQLException {
        return studentDao.alterOne(student);
    }

}
