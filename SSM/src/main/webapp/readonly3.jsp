<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
 height: 600px;
}
textarea {
    width: 1000px;
    height: 300px;
}
.a{
        text-align:center;
    }
    .table{
       
       width: 1560px;
     position:absolute;
     top: 120px;
     left: 20px;
     height: 400px;
   }
   #m{
  position: absolute;
  left: 700px;
  top: 560px;
}
#n{
  position: absolute;
  left: 780px;
  top: 560px;
}
#n2{
  position: absolute;
  left: 780px;
  top: 580px;
}
#n3{
  position: absolute;
  left: 700px;
  top: 580px;
 
}
</style>
<body>
<form action="email_get2">
    <div class="q">
        <h3> &nbsp; &nbsp;查看邮件</h3>
     <table  class="table table-bordered">
         <tr>
            <td class="a" >收件人</td>
            <td><input type="text" name="receiver" value="${message.username}" readonly="readonly"></td>
         </tr>
          <tr>
            <td class="a" >主题</td>
            <td><input type="text" name="subject" value="${message.subject}" readonly="readonly"></td>
         </tr>
         <tr>
             <td class="a">内容</td>
             <td> <textarea cols="200px" rows="6px" name="content" readonly="readonly" >${message.content}</textarea></td>
         </tr>
         
      </table>
		
  		</div>
  		
  </form>
   <a href="email_get2?e=get"  id="n2"><button>返回</button></a>
</body>
</html>