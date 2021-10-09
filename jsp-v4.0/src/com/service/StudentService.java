package com.service;

import com.pojo.Student;

import java.sql.SQLException;
import java.util.List;

public interface StudentService {
    public Integer insertStudent(Student student) throws SQLException;
    public List<Student> selectAll() throws SQLException;
    public List<Student> selectAll(String acc) throws SQLException;
    public Student selectOne(String stuName) throws SQLException;
    public Integer delOne(String stuName) throws SQLException;
    public Integer alterOne(Student student) throws SQLException;
}
