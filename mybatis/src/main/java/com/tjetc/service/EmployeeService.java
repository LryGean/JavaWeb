package com.tjetc.service;

import com.tjetc.domain.Employee;
import java.util.List;

public interface EmployeeService {
    // add接口
    boolean add(Employee employee);
    // List接口
    List<Employee> list();
    // findBId
    Employee findById(int id);
    // update接口
    boolean update(Employee employee);
    // delById接口
    boolean delById(int id);
}
