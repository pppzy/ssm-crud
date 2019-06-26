package com.itpzy.service;

import com.itpzy.domain.Dept;

import java.util.List;

public interface DeptService {


    /**
     * 查询所有部门信息
     * @return
     */
    List<Dept> getAllDept();
}
