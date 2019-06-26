package com.itpzy.service;

import com.itpzy.domain.Emp;

import java.util.List;

public interface EmpService {


    /**
     * 查询所有员工信息和其部门信息
     * @return
     */
    List<Emp> getEmps();

    Emp getEmpsById(int id);

    /**
     * 添加一名员工
     * @param emp
     */
    void insertEmp(Emp emp);

    /**
     * 检测是否有重复姓名的员工
     * @param name
     * @return
     */
    boolean checkEmpName(String name);

    /**
     *修改指定的用户信息
     * @param emp
     */
    void updateEmp(Emp emp);

    /**
     * 删除指定的用户信息
     * @param id
     */
    void deleteEmpByid(int id);

    /**
     * 删除所有选择用户信息
     * @param list
     */
    void deleteAllSelected(List<Integer> list);
}
