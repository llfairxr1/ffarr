<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

  <link
    rel="stylesheet"
    href="bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    type="text/css"
  />
  <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" type="text/css"
/>
</head>
<script type="text/javascript">
$("#m2").click(function(){
    $("#m3").toggle();
		})
</script>

<style type="text/css">
    body{
        background-color:  rgb(223, 233, 243);
    }
    .q{
        position: absolute;
      top: 20px;
      left:20px;
      background-color: white;
     width: 1600px;
     height: 450px;
    }
    .q2{
    position: absolute;
      top: 50px;
      left:1500px;
      background-color: white;
        width: 60px;
     height: 70px;
    }
    .w{
        height: 30px;
    }
    #m{
        position: absolute;
        left: 1500px;
        top:50px;
    }
    
    #m3{
      position: absolute;
        left: 1400px;
        top:50px;
         outline: none;
    }
    #pg{
     position: absolute;
    	left: 700px;
        top:380px;
    }
    .ddd{
    
     position: absolute;
     	height:100px;
        left: 700px;
        top:350px;
         outline: none;
    }
        .table{
       width: 1560px;
      position:absolute;
      top: 120px;
      left: 20px;
      height: 220px;
    }
    .v{
        position: absolute;
        top: 370px;
        left: 20px;
    }
    .g{
        position: absolute;
        top: 364px;
        left: 1384px;
        background-color: blue;
        border-style: none;
        height: 30px;
        width: 30px;
    }
    .f{
        position: absolute;
        top: 370px;
        left: 1330px;
        color:rgb(182, 182, 182);
        background-color: white;
        border-style: none;
    }
    .h{
        position: absolute;
        top: 370px;
        left: 1410px;
        background-color: white;
        color:rgb(182, 182, 182);
        border-style: none;
    }
    .o{
        width: 140px;
        height: 30px;
        position: absolute;
        top: 365px;
        left: 1329px;
    }
    td{
        text-align:center;
    }
   </style>
<body>
    <div class="q">
        <h3> &nbsp; &nbsp;用户管理</h3>
      	<form action="userShow" id=m2>
      		<input type="text" name="name">
      		<input type="submit" class="btn btn-primary" value="查询">
      	</form>
      	<a href="userShow" class="btn btn-primary" id="m3">首页</a>
       <div class="q2">	
       	<a href="add.jsp" class="btn btn-primary" >添加</a>
       	</div>
        
        
         <table  class="table table-bordered">
            <tr>
                 <td>序号</td>
                 <td>用户名</td>
                 <td>部门</td>
                 <td>角色</td>
                 <td>手机号</td>
                 <td>邮箱</td>
                 <td>更新时间</td>
                 <td>操作</td>
			</tr>
             
           <c:forEach items="${list}" var="user">
             <tr>
               <td>${user.userId}</td>
               <td>${user.username}</td>
               <td>${user.departmentId}</td>
               <td>${user.roleId}</td>
               <td>${user.mobile}</td>
               <td>${user.email}</td>
               <td>${user.updateTime}</td>
               <td>
            <a href="userAlter?userId=${user.userId}" ><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="userDelete?userId=${user.userId}" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>
               </td>
              </c:forEach>
        </table>
       <div class="ddd">
		<a href="userShow?name=${name}&n=1">第一页</a>
		<c:if test="${!pageInfo.hasPreviousPage}">
		<a href="userShow?name=${name}&n=1">上一页</a>
		</c:if>
		<c:if test="${pageInfo.hasPreviousPage}">
		<a href="userShow?name=${name}&n=${pageInfo.prePage}">上一页</a>
		</c:if>
	
		<c:forEach items="${pageInfo.navigatepageNums}" var="a">
			<a href="userShow?name=${name}&n=${a}">${a}</a>
		</c:forEach>
		<c:if test="${!pageInfo.hasNextPage}">
			<a href="#">下一页</a>
		</c:if>
		<c:if test="${pageInfo.hasNextPage}">
		<a href="userShow?name=${name}&n=${pageInfo.nextPage}">下一页</a>	
		</c:if>
	
		<a href="userShow?name=${name}&n=${pageInfo.pages}">尾页</a> 
		<br>
		共${pageInfo.total}条数据，共${pageInfo.pages}页，当前为${pageInfo.pageNum}页
		</div> 
		</div>
   
   
</body>

</html>