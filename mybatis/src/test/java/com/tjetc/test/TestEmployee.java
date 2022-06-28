package com.tjetc.test;

import com.tjetc.dao.EmployeeMapper;
import com.tjetc.domain.Employee;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class TestEmployee {
    static SqlSessionFactory factory;

    static {
        try {
            //得到会话工厂
            factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // add测试方法
    @Test
    public void testAdd() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 创建Employee对象
        Employee employee = new Employee("郑敬聪", 20);
        // 调用mapper对象的方法
        int rows = mapper.add(employee);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
    }

    // update测试方法
    @Test
    public void testUpdate() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 创建Employee对象
        Employee employee = new Employee(12, "郑敬聪", 21);
        // 调用mapper对象的方法
        int rows = mapper.update(employee);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
    }

    // DelById测试方法 通过Id 删除
    @Test
    public void testDelById() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        int rows = mapper.delById(4);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
    }


    // 查看List测试方法
    @Test
    public void testList() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        //调用mapper的方法
        List<Employee> list = mapper.list();
        for (Employee employee : list) {
            System.out.println("employee = " + employee);
        }
        //关闭会话
        session.close();
    }

    // FindById通过id查信息测试方法
    @Test
    public void testFindById() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        //调用mapper的方法
        Employee employee = mapper.findById(14);
        //输出
        System.out.println("employee = " + employee);
        //关闭会话
        session.close();
    }
}
