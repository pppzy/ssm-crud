package com.itpzy.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itpzy.domain.Emp;
import com.itpzy.service.EmpService;
import com.itpzy.service.impl.EmpServiceImpl;
import com.itpzy.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpControl {

    @Autowired
    private EmpService empService;

    /**
     * 删除单个用户信息和删除多个用户信息合二为一
     *
     * @param ids
     * @return
     */
    @RequestMapping(value = "/Emps/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delEmp(@PathVariable String ids) {
        if (ids.contains("-")) {
            List<Integer> list = new ArrayList<>();
            String[] split = ids.split("-");
            for (String s : split) {
                int i = Integer.parseInt(s);
                list.add(i);
            }
            empService.deleteAllSelected(list);
            return Msg.success();

        } else {
            int id = Integer.parseInt(ids);
            empService.deleteEmpByid(id);
            return Msg.success();
        }
    }

    /**
     * 修改员工信息
     *
     * @param emp
     * @return
     */
    @RequestMapping(value = "/Emps/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Emp emp) {
        empService.updateEmp(emp);
        return Msg.success();
    }

    /**
     * 检查有无重复用户名的方法
     *
     * @param empName
     * @return
     */
    @RequestMapping(value = "/checkName", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmpName(String empName) {
        String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        boolean flag2 = empName.matches(regex);
        if (!flag2) {
            return Msg.fail().add("msg", "后台校验：用户名必须是6-16位字符或2-5位中文字");
        }

        //调用检查重复用户名的方法，得到boolean返回值，再判断
        boolean flag = empService.checkEmpName(empName);
        if (flag) {
            return Msg.fail().add("msg", "用户名已存在!");
        } else {
            return Msg.success();
        }
    }

    @RequestMapping(value = "/Emps/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpByid(@PathVariable Integer id) {
        Emp emp = empService.getEmpsById(id);
        return Msg.success().add("EmpInfo", emp);
    }

    /**
     * 新增一名员工，当请求方法为post
     *
     * @param emp
     * @return
     */
    @RequestMapping(value = "/Emps", method = RequestMethod.POST)
    @ResponseBody                           //Valid:指定要校验的bean对象 BindingResult:封装校验的结果
    public Msg insertEmp(@Valid Emp emp, BindingResult result) {
        Map<String, Object> errorMap = new HashMap<>();
        //如果校验结果有错误信息则将信息提取到msg并以json数据返回到页面
        if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField()); //错误的字段 ，校验失败的对象属性是哪个
                System.out.println(fieldError.getDefaultMessage()); //错误的详细信息
                errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("JSR330ERROR", errorMap);
        } else {
            empService.insertEmp(emp);
            return Msg.success();
        }
    }

    @GetMapping("/getEmp")
    public String getEmp(@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, Model model) {
        //分页插件，需要在第一条select查询语句前使用，参数列表中需要传参数 当前页数和每页显示个数
        PageHelper.startPage(pageNum, 5);
        List<Emp> emps = empService.getEmps();
        //使用分页插件来包装查询出来的结果，只需要将pageInfo交给页面，pageInfo除了包含分页参数还有查询出来的数据
        //navigatePage:连续显示的页数
        PageInfo empPageInfo = new PageInfo(emps, 5);
        model.addAttribute("pageinfo", empPageInfo);
        return "list";
    }

    @RequestMapping("/getEmpJson")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<Emp> emps = empService.getEmps();
        //使用分页插件来包装查询出来的结果，只需要将pageInfo交给页面，pageInfo除了包含分页参数还有查询出来的数据
        //navigatePage:连续显示的页数
        PageInfo empPageInfo = new PageInfo(emps, 5);
        return Msg.success().add("empPageInfo", empPageInfo);
    }

}
