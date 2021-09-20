#  :rainbow: bootstrap+JavaSE+JDBC的信息管理系统

### 介绍
使用bootstrap+JavaSE，JDBC实现一个用户信息的增删改查功能

### 源码
直接下载本项目即可

### 项目结构
![输入图片说明](https://images.gitee.com/uploads/images/2021/0920/122628_ae764554_8254421.png "项目结构.png")

### 数据库设计
```txt
用户表（账号，密码，性别，学历，爱好）
```
```sql
create table d_student(
account varchar(50) primary key,
pwd varchar(50) not null,
sex varchar(10) not null,
educ varchar(10) not null,
happy varchar(50) not null
)default charset=utf8;
``` 

### 主要功能
1. 注册，登录，登出
2. cookie 20s内免登录
3. session防止用户直接输入网站登录
4. 查看用户信息，并修改
5. 删除用户信息<br>

**注意** ：本系统可使用任何账号操作所有用户的信息！！！

### 页面效果
#### 登录
![登录页面](https://images.gitee.com/uploads/images/2021/0920/130948_b86c3707_8254421.png "登录页面.png")

#### 注册
![注册页面](https://images.gitee.com/uploads/images/2021/0920/131022_1316e31e_8254421.png "注册页面.png")

#### 注册验证
![注册输入验证](https://images.gitee.com/uploads/images/2021/0920/131142_a9dc3a11_8254421.png "注册输入验证.png")

#### 用户列表
![登录进入-用户列表页面](https://images.gitee.com/uploads/images/2021/0920/131103_ec92c157_8254421.png "登录进入-用户列表页面.png")

#### 用户详情
![用户详情页面](https://images.gitee.com/uploads/images/2021/0920/131121_0028f3a5_8254421.png "用户详情页面.png")


### db.properties
本数据库配置文件与  **src**  同级
```java
#通过反射获取获取包
driverClassName=com.mysql.jc.jdbc.Driver #8.0
#driverClassName=com.mysql.jdbc.Driver #5.0 数据库版本
# localhost 本地服务器
# 3306 端口
# demo 数据库名
# &useSSL=false&serverTimezone=UTC 数据库版本5.0左右可去除，我使用的是8.0以上的版本，&作为参数的连接符
url=jdbc:mysql://localhost:3306/demo?characterEncoding=utf8&useSSL=false&serverTimezone=UTC

# 用户名
username=root

# 密码
password=root
```

### utils
使用德鲁伊连接池和QueryRunner处理数据，需要导包
```java
package com.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Properties;

/**
 * @author 涂鏊飞tu_aofei@163.com
 * @description: 数据库操作工具类 类描述
 * @create 2021-09-01 17:18
 */
public class JdbcUtils {
    private static DataSource ds;
    static {
        try {
            //1.加载配置文件
            Properties pro = new Properties();
            pro.load(JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties"));
            //2.获取DataSource
            ds = DruidDataSourceFactory.createDataSource(pro);
        }
        catch (Exception e){
            ds = null;
        }
    }

    private static Connection getConnection(){
        Connection con;
        try {
            con = ds.getConnection();
        }
        catch (Exception ex){
            con = null;
        }
        return con;
    }
    /* 获取 QueryRunner */
    public static QueryRunner getQueryRunner(){
        QueryRunner runner = new QueryRunner(ds);
        return runner;
    }
}
```

### pojo层
数据库中的表对应的实体类:
[Student.java](https://gitee.com/LovelyHzz/Info-management-system/blob/master/src/com/pojo/Student.java)

### dao层
#### StudentDao接口
`public interface StudentDao`<br>
 **抽象方法** <br>
 :one: `public Integer insertStudent(Student student) throws SQLException;` //插入数据<br>
 :two: `public List<Student> selectAll() throws SQLException;` // 查询所有用户信息<br>
 :three: `public Student selectOne(String stuName) throws SQLException;`// 查询单个用户信息<br>
 :four: `public Integer delOne(String stuName) throws SQLException;` // 删除单个用户信息<br>
 :five: `public Integer alterOne(Student student) throws SQLException;` //修改单个用户信息<br>

### service层
接口和dao层相同
```java
public interface StudentService {
    public Integer insertStudent(Student student) throws SQLException;
    public List<Student> selectAll() throws SQLException;
    public Student selectOne(String stuName) throws SQLException;
    public Integer delOne(String stuName) throws SQLException;
    public Integer alterOne(Student student) throws SQLException;
}
```
### web目录
![输入图片说明](https://images.gitee.com/uploads/images/2021/0920/130847_edf56cc7_8254421.png "page.png")
 **WEB-INF** 目录下的包含 **web.xml** 文件配置
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
<!--    默认页面-->
    <welcome-file-list>
        <welcome-file>bootstrap_register.jsp</welcome-file>
    </welcome-file-list>
<!--    session失效时间30分钟-->
    <session-config>
        <session-timeout>30</session-timeout>
    </session-config>
</web-app>
```

