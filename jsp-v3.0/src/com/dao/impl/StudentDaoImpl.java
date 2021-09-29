package com.dao.impl;

import com.dao.StudentDao;
import com.pojo.Student;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 涂鏊飞tu_aofei@163.com
 * @description: TODO 类描述
 * @create 2021-09-16 13:44
 */
public class StudentDaoImpl implements StudentDao {
    private QueryRunner queryRunner;

    public StudentDaoImpl() {
        queryRunner=JdbcUtils.getQueryRunner();
    }

    @Override
    public Integer insertStudent(Student student) throws SQLException {
        String insertsql = "insert into d_student values(?,?,?,?,?)";
        Object[] objects = {
                student.getAccount(),
                student.getPwd(),
                student.getSex(),
                student.getEduc(),
                student.getHappy()
        };
        int updateFlag = queryRunner.update(insertsql, objects);
        return updateFlag;
    }

    @Override
    public List<Student> selectAll() throws SQLException {
        String selectAllSql="select * from d_student";
        BeanListHandler handler=new BeanListHandler(Student.class);
        List<Student> query = (List<Student>) queryRunner.query(selectAllSql,handler);
        return query;
    }

    @Override
    public Student selectOne(String stuName) throws SQLException {
        String selectOneSql="select * from d_student where account=?";
        Object[] objects={stuName};
        BeanHandler<Student> handler= new BeanHandler<>(Student.class);
        Student query = queryRunner.query(selectOneSql, handler, objects);
        return query;
    }

    @Override
    public Integer delOne(String stuName) throws SQLException {
        String delSql="delete from d_student where account=?";
        Object[] objects={stuName};
        int delFlag = queryRunner.update(delSql, objects);
        return delFlag;
    }

    @Override
    public Integer alterOne(Student student) throws SQLException {
        String alterSql="update d_student set sex=?,educ=?,happy=? where account=?";
        Object[] objects={
                student.getSex(),
                student.getEduc(),
                student.getHappy(),
                student.getAccount()
        };
        int alterFlag = queryRunner.update(alterSql, objects);
        return alterFlag;
    }

    @Override
    public List<Student> selectAll(String acc) throws SQLException {
        String selectAllSql="select * from d_student where account like ?";
        BeanListHandler<Student> handler=new BeanListHandler(Student.class);
        Object[] objects={acc};
        List<Student> query = queryRunner.query(selectAllSql, handler, objects);
        return query;
    }
}
