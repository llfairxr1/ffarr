<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>草稿箱</title>

  <link
    rel="stylesheet"
    href="bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    type="text/css"
  />
  <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" type="text/css"
/>
</head>


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
<body >
    <div class="q">
        <h3> &nbsp; &nbsp;草稿箱</h3>
      	<table  class="table table-bordered">
            <tr>
                 <td>序号</td>
                 <td>主题</td>
                 <td>内容</td>
                 <td>收件人</td>
                 <td>操作</td>
			</tr>
             
           <c:forEach items="${list}" var="email">
             <tr>
                 <td>${email.message_id}</td>
              <td>${email.subject}</td> 
               <td>${email.content}</td>
               <td>${email.username}</td>
              <td>
               <a href="email_get2?e=readonly2&message_id=${email.message_id}" ><i class="fa fa-github-alt" aria-hidden="true"></i></a> 
           <a href="email_get2?e=rewrite&message_id=${email.message_id}" ><i class="fa fa-pencil" aria-hidden="true"></i></a>    
       <a href="email_get2?e=delete&message_id=${email.message_id}" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>
               </td>
              </c:forEach>
        </table>
        <div id="pg">
           <c:if test="${count%2==0}">
           	<c:set var="page" value="${count/2}"></c:set>
           </c:if>
           <c:if test="${count%2!=0}">
           	<c:set var="page" value="${(count-count%2)/2+1}"></c:set>
           </c:if>
           
           <c:if test="${num==1}">
           	<a href="#" class="btn btn-primary">上一页</a>
           </c:if>
           
            <c:if test="${num!=1}">
           	<a href="email_get2?e=get&num=${num-1}" class="btn btn-primary">上一页</a>
           </c:if>
           
           <c:forEach var="i" begin="1" end="${page}">
			<a class="btn btn-default btn-xs"  href="email_get2?e=get&num=${i}">${i}</a>
			</c:forEach>
           <c:if test="${num==page}">
           	<a href="#" class="btn btn-primary">下一页</a>
           </c:if>
           
            <c:if test="${num!=page}">
           	<a href="email_get2?e=get&num=${num+1}" class="btn btn-primary">下一页</a>
           </c:if>
      </div>
   </div>
   
</body>

</html>