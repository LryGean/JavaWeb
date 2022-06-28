package com.tjetc.controller;

import com.tjetc.service.EmployeeService;
import com.tjetc.service.impl.EmployeeServiceImpl;
import com.tjetc.domain.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(value = "/EmployeeServlet/*")
public class EmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码
        request.setCharacterEncoding("UTF-8");
        // 设置响应编码
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // EmployeeServlet/add
        String uri = request.getRequestURI();
        String op = uri.substring(uri.lastIndexOf("/") + 1);
        if (op.equals("add")) {
            add(request, response);
        }
        if (op.equals("list")) {
            list(request, response);
        }
        if (op.equals("findById")) {
            findById(request, response);
        }
        if (op.equals("update")) {
            update(request, response);
        }
        if (op.equals("delById")) {
            delById(request, response);
        }
    }

    protected void delById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到请求参数值
        int id=Integer.parseInt(request.getParameter("id"));
        //调用业务层的方法
        boolean b=employeeService.delById(id);
        System.out.println("b = " + b);
        //重定向列表
        response.sendRedirect(request.getContextPath()+"/EmployeeServlet/list");
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到请求参数值
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age=Integer.parseInt(request.getParameter("age"));
        //创建Employee对象
        Employee employee = new Employee(id,name, age);
        //调用业务层的方法
        boolean b=employeeService.update(employee);
        System.out.println("b = " + b);
        //重定向列表
        response.sendRedirect(request.getContextPath()+"/EmployeeServlet/list");
    }

    // 修改回显
    //根据id查询记录回显
    //EmployeeServlet添加findById()方法
    private void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int  id=Integer.parseInt(request.getParameter("id"));
        //根据id查找对应的记录
        Employee employee=employeeService.findById(id);
        //将得到的Employee对象放到请求作用域里
        request.setAttribute("employee",employee);
        //请求转发
        request.getRequestDispatcher("/update.jsp").forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> list=employeeService.list();
        request.setAttribute("list", list);//employee数据表得到所有的数据加到request作用域里
        request.getRequestDispatcher("/list.jsp").forward(request, response);//请求转发到/list.jsp进行显示数据
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到请求参数值
        String name = request.getParameter("name");
        int age=Integer.parseInt(request.getParameter("age"));
        //创建Employee对象
        Employee employee = new Employee(name, age);
        //调用业务层的方法
        boolean b=employeeService.add(employee);
        System.out.println("b = " + b);
        //重定向列表
        response.sendRedirect(request.getContextPath()+"/EmployeeServlet/list");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
