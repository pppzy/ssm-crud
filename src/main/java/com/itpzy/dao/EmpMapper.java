package com.itpzy.dao;

import com.itpzy.domain.Emp;
import com.itpzy.domain.EmpExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    int countByExample(EmpExample example);

    int deleteByExample(EmpExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    List<Emp> selectByExample(EmpExample example);

    Emp selectByPrimaryKey(Integer empId);

    //根据条件查询员工时并查询部门信息
    List<Emp> selectByExampleWithDept(EmpExample example);
    //根据员工ID查询员工并查询其部门信息
    Emp selectByPrimaryKeyWithDept(Integer empId);

    List<Emp> selectAllWithDept();

    int updateByExampleSelective(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByExample(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
}