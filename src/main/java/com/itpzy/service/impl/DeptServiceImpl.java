package com.itpzy.service.impl;

import com.itpzy.dao.DeptMapper;
import com.itpzy.domain.Dept;
import com.itpzy.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    /**
     * 查询所有部门信息
     *
     * @return
     */
    @Override
    public List<Dept> getAllDept() {
        List<Dept> depts = deptMapper.selectByExample(null);
        return depts;
    }
}
