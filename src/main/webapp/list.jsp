<%--
  Created by IntelliJ IDEA.
  User: ppp
  Date: 2019/6/20
  Time: 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>emplist</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>


<body>
<!-- Modal -->
<div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增用户</h4>
            </div>
            <!--模态框内容 -->
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputLastName" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-8">
                            <input name="empName" type="text" class="form-control" id="inputLastName"
                                   placeholder="lastName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-8">
                            <input name="email" type="email" class="form-control" id="inputEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" id="genderCheckbox1" name="gender" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" id="genderCheckbox2" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select name="dId" class="form-control" id="deptId">
                                <%--   <option>1</option>

                                   <option>2</option>
                                   <option>3</option>
                                   <option>4</option>
                                   <option>5</option>--%>
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_submit">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改时候的模态框Modal -->
<div class="modal fade" id="updateEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改用户</h4>
            </div>
            <!--模态框内容 -->
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputLastName" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-8">
                            <!--静态控件，展示要修改的员工姓名 -->
                            <p class="form-control-static" id="showEmpName"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-8">
                            <input name="email" type="email" class="form-control" id="updateEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" id="genderMan" name="gender" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" id="genderFemale" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select name="dId" class="form-control" id="updateDeptId">
                                <%--   <option>1</option>

                                   <option>2</option>
                                   <option>3</option>
                                   <option>4</option>
                                   <option>5</option>--%>
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="update_btn_submit">提交修改</button>
            </div>
        </div>
    </div>
</div>


<!--搭建显示页面 -->
<div class="container">
    <!--第一行标题 -->
    <div class="row">
        <div class="col-md-4">
            <h1>CRUD-查询</h1>
        </div>
    </div>
    <!--第二行新增\删除按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button type="button" class="btn btn-primary " id="open_modal">新增</button>
            <button type="button" class="btn btn-danger" id="deleteAll">删除</button>
        </div>
    </div>
    <!--第三行表格 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll"></th>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                <%--        <tr>
                            <td>
                                <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-pencil" ></span>编辑
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash" ></span>删除
                                </button>
                            </td>
                        </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
    <!--第四行分页数据 -->
    <div class="row" id="pageInfo">
        <%--    <div class="col-md-6 middle"style="height: 75px"   >
                <p style="text-align: center;padding-top: 25px">当前第页，共有页，
                    总计条记录</p>
            </div>--%>
        <!--分页 -->
        <%-- <div class="col-md-6 ">

         </div>--%>
    </div>
</div>


</body>

<script>
    //当页面加载完后执行
    $(function () {
        getAjax(1);

    })

    var currentPage;
    var totalRecords;
    var totalPage;

    //封装了异步请求的方法
    function getAjax(pageNum) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/getEmpJson",
            data: "pageNum=" + pageNum,
            type: "GET",
            dataType: "json",
            success: function (empJson) {
                build_emp_table(empJson);
                build_pageInfo(empJson);
            }
        });
    };

    //将json数据解析到员工表
    function build_emp_table(empJson) {
        $("#tbody").empty();
        $.each(empJson.params.empPageInfo.list, function (index, emp) {
            var empId = $("<td></td>").append(emp.empId);
            var lastName = $("<td></td>").append(emp.empName);
            var email = $("<td></td>").append(emp.email);
            var gender = $("<td></td>").append(emp.gender);
            var departName = $("<td></td>").append(emp.dept.deptName);

            var button = ' <button type="button" updateid="' + emp.empId + '" class="btn btn-info edit_btn" style="margin-top: 2px">\n' +
                '        <span class="glyphicon glyphicon-pencil" ></span>编辑\n' +
                '        </button>\n' +
                '        <button type="button" delId="' + emp.empId + '" class="btn btn-danger del_btn" style="margin-left: 5px;margin-top: 2px">\n' +
                '        <span class="glyphicon glyphicon-trash" ></span>删除\n' +
                '        </button>';

            var tr_emp = $("<tr></tr>").append("<td><input type='checkbox' class='delBox'  delinfo='" + emp.empId + "'></td>").append(empId).append(lastName)
                .append(email).append(gender).append(departName).append($(button)).appendTo($("#tbody"));
        })
    }

    //将json数据解析到分页插件
    function build_pageInfo(empJson) {

        $("#pageInfo").empty();
        var pageinfo = '  <div class="col-md-6 middle"style="height: 75px"   >\n' +
            '          <p style="text-align: center;padding-top: 25px">当前第' + empJson.params.empPageInfo.pageNum + '页，共有' + empJson.params.empPageInfo.pages + '页，\n' +
            '              总计' + empJson.params.empPageInfo.total + '条记录</p>\n' +
            '      </div>';

        //totalPage:定义的全局变量，将分页的总页数赋值，以便于添加用户数据后，跳转到最后一页
        totalPage = empJson.params.empPageInfo.pages;
        //totalRecords:定义的全局变量，当总记录数/每页显示个数没有余数，则是跳转到最后一页+1，否则跳转到最后一页
        totalRecords = empJson.params.empPageInfo.total;
        //当前页
        currentPage = empJson.params.empPageInfo.pageNum;

        var page = '';
        if (empJson.params.empPageInfo.pageNum != 1) {
            var firstpage = ' <li onclick="getAjax(1)"><a href="javascript:void(0)">首页</a></li>';
        } else {
            var firstpage = ' <li class="disabled"><a href="javascript:void(0)">首页</a></li>';
        }
        page += firstpage;
        if (empJson.params.empPageInfo.hasPreviousPage) {

            var prepage = ' <li onclick="getAjax(' + empJson.params.empPageInfo.prePage + ')">\n' +
                '    <a href="javascript:void(0)" aria-label="Previous">\n' +
                '        <span aria-hidden="true">&laquo;</span>\n' +
                '    </a>\n' +
                '    </li>';
        } else {
            var prepage = '';
        }
        page += prepage;

        if (empJson.params.empPageInfo.hasNextPage) {
            var nextpage = '  <li onclick="getAjax(' + empJson.params.empPageInfo.nextPage + ')">\n' +
                '    <a href="javascript:void(0)" aria-label="Next">\n' +
                '        <span aria-hidden="true">&raquo;</span>\n' +
                '    </a>\n' +
                '    </li> ';
        } else {
            var nextpage = '';
        }

        if (!empJson.params.empPageInfo.isLastPage) {
            var lastpage = '   <li onclick="getAjax(' + empJson.params.empPageInfo.pages + ')"><a href="javascript:void(0)">末页</a></li> ';
        } else {
            var lastpage = '   <li class="disabled"><a href="javascript:void(0)">末页</a></li> ';
        }

        $.each(empJson.params.empPageInfo.navigatepageNums, function (index, number) {
            if (empJson.params.empPageInfo.pageNum == number) {
                var pageNum = '<li class="active" onclick="getAjax(' + number + ')" ><a href="javascript:void(0)">' + number + '</a></li> ';
            } else {
                var pageNum = '<li onclick="getAjax(' + number + ')"><a href="javascript:void(0)">' + number + '</a></li> ';
            }
            page += pageNum;
        });
        page += nextpage;
        page += lastpage;
        var p1 = $("<ul class='pagination'></ul>").append(page);
        var pageInfomation = $("<nav aria-label='Page navigation'></nav>").append(p1);
        $("#pageInfo").append($(pageinfo)).append(pageInfomation);

    }

    //单击新增按钮时，调用打开模态框的方法
    $("#open_modal").click(function () {
        //当打开模态框后，完全清除重置新增用户的缓存数据，包括提示类和提示span信息
        $("#addEmpModal form")[0].reset();
        $("#addEmpModal form").find("*").removeClass("has-success has-error");
        $("#addEmpModal form").find("span").text("");

        getAjaxDeptName("#deptId");
        $('#addEmpModal').modal({
            backdrop: "static"
        });
    });

    //异步获取部门信息并解析到模态框中
    function getAjaxDeptName(emp) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getDept",
            dataType: "json",
            success: function (deptInfo) {
                $(emp).empty();
                $.each(deptInfo.params.deptInfo, function (index, dept) {
                    var deptoption = $("<option></option>").append(dept.deptName).attr({value: dept.deptId});
                    $(emp).append($(deptoption));
                })
            }
        });
    };

    //提交新用户到数据库
    $("#btn_submit").click(function () {

        //0.后台校验方法，判断用户名是否重复，重复则无法提交
        var check = $("#inputLastName").attr("ajax_check");
        if ("fail" == check) {
            return false;
        }
        //1.前端校验方法，判断提交的数据是否符合格式
        /*     var flag = emp_add_check();
             if(flag!=true){
                 return false;
             }*/
        //2.发送异步请求，将员工信息添加到数据库中
        var empInfo = $("#addEmpModal form").serialize();
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/Emps",
            type: "POST",
            data: empInfo,
            dataType: "json",
            success: function (data) {

                //如果后台JSR330校验成功则
                if (data.code == 100) {
                    //1.成功处理后，关闭模态框
                    $('#addEmpModal').modal('hide');
                    //2.添加成功后，自动跳转到最后一页
                    if (totalRecords % 5 != 0) {
                        getAjax(totalPage);
                    } else {
                        getAjax(totalPage + 1);
                    }
                }
                //反之则跳出显示提示信息
                if (undefined != data.params.JSR330ERROR.empName) {
                    add_statu_check("#inputLastName", "fail", data.params.JSR330ERROR.empName);
                    return false;
                }
                if (undefined != data.params.JSR330ERROR.email) {
                    add_statu_check("#inputEmail", "fail", data.params.JSR330ERROR.email);
                    return false;
                }


            }
        });
    });

    //在添加用户时前端进行校验
    function emp_add_check() {

        //1.对员工姓名进行校验
        var empName = $("#inputLastName").val();
        var regex_empName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var flag = regex_empName.test(empName);
        if (flag != true) {
            add_statu_check("#inputLastName", "fail", "员工姓名格式错误，6-16个字母或2-5个中文字");
            /*          $("#inputLastName").parent().addClass("has-error");
                      $("#inputLastName").next().text("员工姓名格式错误，6-16个字母或2-5个中文字")*/
            return false
        }
        add_statu_check("#inputLastName", "success", "");
        /*   $("#inputLastName").parent().addClass("has-success");
           $("#inputLastName").next().text("")*/


        //2.对邮箱进行校验
        //0.在校验前，清除重置信息提示的类

        var email = $("#inputEmail").val();
        var regex_email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var flag2 = regex_email.test(email);
        if (flag2 != true) {
            add_statu_check("#inputEmail", "fail", "邮箱格式错误");
            /*    $("#inputEmail").parent().addClass("has-error");
                $("#inputEmail").next().text("邮箱格式错误");*/
            return false
        }
        add_statu_check("#inputEmail", "success", "");
        /*   $("#inputEmail").parent().addClass("has-success");
           $("#inputEmail").next().text("");*/

        return true;
    }

    //对校验信息提示进行封装成方法
    function add_statu_check(emp, statu, msg) {
        //消除重置信息提示的类
        $(emp).parent().removeClass("has-error has-success")
        if ("fail" == statu) {
            $(emp).parent().addClass("has-error");
            $(emp).next().text(msg);
        } else if ("success" == statu) {
            $(emp).parent().addClass("has-success");
            $(emp).next().text(msg);
        }
    }


    //Ajax校验用户名是否重复
    $("#inputLastName").change(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/checkName",
            type: "POST",
            data: {empName: $("#inputLastName").val()},
            dataType: "json",
            success: function (data) {
                if (data.code == 100) {
                    $("#inputLastName").attr("ajax_check", "success");
                    add_statu_check("#inputLastName", "success", "用户名可用");
                } else {
                    $("#inputLastName").attr("ajax_check", "fail");
                    add_statu_check("#inputLastName", "fail", data.params.msg);
                }
            }

        });
    });


    //给编辑按钮绑定方法,当点击修改按钮后，需要回显信息
    $("#tbody").on("click", ".edit_btn", function () {
        //0.打开前都完美重置下模态框信息和提示
        $("#updateEmpModal form")[0].reset();
        $("#updateEmpModal form").find("*").removeClass("has-success has-error");
        $("#updateEmpModal form").find("span").text("");
        //1.打开编辑信息模态框
        $('#updateEmpModal').modal({
            backdrop: "static"
        });

        //2.调用方法 回显所有部门的信息
        getAjaxDeptName("#updateDeptId");
        //获取当前操作信息的员工id
        var id = $(this).attr("updateid");
        //3.回显员工信息
        getEmp(id);

        //4.给模态框的提交按钮绑定属性，赋值编辑的员工Id
        $("#update_btn_submit").attr("empId", id);
    });

    //根据id查询员工信息的方法，用于回显员工信息
    function getEmp(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/Emps/" + id,
            type: "GET",
            success: function (data) {
                var info = data.params.EmpInfo;
                $("#showEmpName").text(info.empName);
                $("#updateEmail").val(info.email);
                $("#updateEmpModal input[name='gender']").val([info.gender]);
                /* if(info.gender=="男"){
                     $("#genderMan").prop("checked","checked")
                 }else{
                     $("#genderFemale").prop("checked","chedcked")
                 }*/
                $("#updateDeptId").val([info.dId]);
            }
        })
    }

    //给修改模态框中的提交按钮绑定方法，发送ajax请求，完成用户信息修改
    $("#update_btn_submit").click(function () {
        //1.对邮箱信息进行校验
        var email = $("#updateEmail").val();
        var regex_email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var flag2 = regex_email.test(email);
        if (flag2 != true) {
            add_statu_check("#updateEmail", "fail", "邮箱格式错误");
            return false
        }
        add_statu_check("#updateEmail", "success", "");

        var empdata = $("#updateEmpModal form").serialize();
        //2.发送ajax请求，用于修改用户信息
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/Emps/" + $(this).attr("empId"),
            type: "POST",
            data: empdata + "&_method=PUT",
            success: function (data) {
                $('#updateEmpModal').modal('hide');
                //2.添加成功后，自动跳转到最后一页
                if (totalRecords % 5 != 0) {
                    getAjax(totalPage);
                } else {
                    getAjax(totalPage + 1);
                }
            }
        });


    });


    //删除功能：单个删除
    $("#tbody").on("click", ".del_btn", function () {
        var text = $(this).parent("tr").find("td:eq(2)").text();
        var deId = $(this).parent("tr").find("td:eq(1)").text();
        if (confirm("确定要删除【" + text + "】吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/Emps/" + deId,
                type: "POST",
                data: "_method=DELETE",
                success: function (data) {
                    if (totalRecords % 5 == 1) {
                        getAjax(currentPage - 1);
                    } else {
                        getAjax(currentPage);
                    }

                }
            })
        }

    });


    //删除功能 多个删除之全选和全不选
    $("#selectAll").click(function () {

        $(".delBox").prop("checked", $(this).prop("checked"));
    })


    $("#tbody").on("click", ".delBox", function () {
        var flag = ($(".delBox:checked").length == $(".delBox").length);
        $("#selectAll").prop("checked", flag);
    })


    $("#deleteAll").click(function () {
        var empName = "";
        var empId = "";
        //提示要删除的用户的信息
        $.each($(".delBox:checked"), function () {

            var name = $(this).parents("tr").find("td:eq(2)").text() + ",";
            var id = $(this).parents("tr").find("td:eq(1)").text() + "-";
            empName += name;
            empId += id;
        })

        var nameList = empName.substring(0, empName.length - 1);
        var idList = empId.substring(0, empId.length - 1);
        if (confirm("确定要删除【" + nameList + "】用户吗？")) {
            //2.发送异步请求删除多选的用户信息
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/Emps/" + idList,
                type: "DELETE",
                data: "_method=DELETE",
                success: function (data) {
                    alert(data.msg);
                    getAjax(currentPage);
                }
            });
        }
    });


</script>

</html>
