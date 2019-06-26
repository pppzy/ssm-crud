package com.itpzy.service.impl;

import com.itpzy.dao.EmpMapper;
import com.itpzy.domain.Emp;
import com.itpzy.domain.EmpExample;
import com.itpzy.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    /**
     * 查询所有员工和其部门信息
     *
     * @return
     */
    @Override
    public List<Emp> getEmps() {
        List<Emp> emps = empMapper.selectByExampleWithDept(null);
        return emps;
    }

    /**
     * 根据员工id查询员工信息
     *
     * @param id
     * @return
     */
    @Override
    public Emp getEmpsById(int id) {
        return empMapper.selectByPrimaryKeyWithDept(id);
    }

    /**
     * 增加一名员工
     *
     * @param emp
     */
    @Override
    public void insertEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    /**
     * 查询重复姓名的员工个数
     *
     * @param name
     * @return
     */
    public boolean checkEmpName(String name) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(name);
        int i = empMapper.countByExample(example);
        if (i >= 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 编辑修改用户信息
     *
     * @param emp
     */
    @Override
    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    /**
     * 根据id删除用户信息
     *
     * @param id
     */
    @Override
    public void deleteEmpByid(int id) {
        int i = empMapper.deleteByPrimaryKey(id);
    }

    /**
     * 删除所有选择的用户信息
     *
     * @param list
     */
    @Override
    public void deleteAllSelected(List<Integer> list) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(list);
        empMapper.deleteByExample(example);
    }
}
