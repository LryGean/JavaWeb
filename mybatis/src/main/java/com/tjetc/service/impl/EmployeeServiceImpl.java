package com.tjetc.service.impl;

import com.tjetc.dao.EmployeeMapper;
import com.tjetc.domain.Employee;
import com.tjetc.service.EmployeeService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    static SqlSessionFactory factory;

    static {
        try {
            //得到会话工厂
            factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // add方法
    @Override
    public boolean add(Employee employee) {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        int rows = mapper.add(employee);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
        return rows>0;
    }

    // 查看List方法
    @Override
    public List<Employee> list() {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        List<Employee> list = mapper.list();
        //关闭会话
        session.close();
        return list;
    }

    // FindById通过id查信息方法
    @Override
    public Employee findById(int id) {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        Employee employee = mapper.findById(id);
        //关闭会话
        session.close();
        return employee;
    }

    // update测试方法
    @Override
    public boolean update(Employee employee) {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        int rows = mapper.update(employee);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
        return rows>0;
    }

    // DelById方法 通过Id 删除
    @Override
    public boolean delById(int id) {
        // 得到会话对象
        SqlSession session = factory.openSession();
        //得到mapper对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        // 调用mapper对象的方法
        int rows = mapper.delById(id);
        //打印
        System.out.println("rows = " + rows);
        //提交事务
        session.commit();
        //关闭会话
        session.close();
        return rows>0;
    }
}
