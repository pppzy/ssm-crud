package com.itpzy.control;


import com.itpzy.domain.Dept;
import com.itpzy.service.DeptService;
import com.itpzy.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptControl {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/getDept")
    @ResponseBody
    public Msg getAllDept(){
        List<Dept> allDept = deptService.getAllDept();
        return Msg.success().add("deptInfo",allDept);
    }
}
