package com.tjetc.dao;

import com.tjetc.domain.Employee;

import java.util.List;

public interface EmployeeMapper {
    int add(Employee employee);
    int update(Employee employee);
    int delById(int id);
    List<Employee> list();
    Employee findById(int id);
}

