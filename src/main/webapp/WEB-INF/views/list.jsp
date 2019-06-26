<%--
  Created by IntelliJ IDEA.
  User: ppp
  Date: 2019/6/20
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style>





</style>
</head>


<body>
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
              <button type="button" class="btn btn-primary">新增</button>
              <button type="button" class="btn btn-danger">删除</button>
          </div>
      </div>
      <!--第三行表格 -->
      <div class="row">
          <div class="col-md-12">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.pageinfo.list}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.email}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.dept.deptName}</td>
                    <td>
                        <button type="button" class="btn btn-info">
                            <span class="glyphicon glyphicon-pencil" ></span>编辑
                        </button>
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash" ></span>删除
                        </button>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
          </div>
      </div>
      <!--第四行分页数据 -->
      <div class="row">
            <div class="col-md-6 middle"style="height: 75px"   >
                <p style="text-align: center;padding-top: 25px">当前第${pageinfo.pageNum}页，共有${pageinfo.pages}页，
                    总计${pageinfo.total}条记录</p>
            </div>
          <!--分页 -->
            <div class="col-md-6 ">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${pageinfo.hasPreviousPage}">
                            <li><a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=1">首页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=${pageinfo.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageinfo.navigatepageNums}" var="num">
                            <c:if test="${num==pageinfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=${num}">${num}</a></li>
                            </c:if>
                            <c:if test="${num!=pageinfo.pageNum}">
                                <li ><a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=${num}">${num}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageinfo.hasNextPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=${pageinfo.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/emp/getEmp?pageNum=${pageinfo.pages}">末页</a></li>
                        </c:if>

                    </ul>
                </nav>
            </div>
      </div>


  </div>



</body>
</html>
