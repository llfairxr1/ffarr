<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="jquery/jquery.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<script src="jquery/messages_zh.js"></script>
    <title>Document</title>
    <link
    rel="stylesheet"
    href="bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    type="text/css"
  />
  <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" type="text/css"
/>

<style type="text/css">
body{
  background-color: rgb(223, 233, 243);
}
.a{
  position: absolute;
  top: 20px;
  left:20px;
  background-color: white;
 width: 1600px;
 height: 830px;
}
.table{
  width: 1560px;
  position:absolute;
  top: 50px;
  left: 20px;
  height: 680px;
  
}
textarea{
  resize: none;
  width: 1350px;
  height: 100px;
  color: rgb(121, 121, 121);
}
h4{
  position:relative;
  left: 15px;
  top: 10px;
  

}
.e{
  text-align:center;
 
}
.d{
  width: 650px;
  height: 30px;
}
#m{
  position: absolute;
  left: 700px;
  top: 780px;
}
#n{
  position: absolute;
  left: 780px;
  top: 780px;
}
#aaa{
  position: relative;
  left: 720px;
  top: 780px;
  width:30px;
  height:20px;
}


</style>
</head>
<body>
 <form action="userAdd" id="f2"  onsubmit="return func()">
<div class="a">
  <h4>新增用户</h4>
 
    <table class="table table-bordered" id ="f">
      <tr>
          <td class="e">用户名</td>
          <td><input type="text" name="username"  >
          		<i id="i"></i>
          </td>
          <td class="e">密码</td>
          <td><input type="password" name="password" ></td>
      </tr>
      <tr>
        <td class="e">部门</td>
        <td>
          <select name="departmentName" >
          <c:forEach items="${deptname}" var="dept" >
             <option value="${dept.departmentName}">${dept.departmentName}</option>
          </c:forEach>
         </select>
      </td>
        <td class="e">角色</td>
        <td>  <select name="roleName">
          <c:forEach items="${rolename}" var="role">
             <option value="${role.roleName}">${role.roleName}</option>
         </c:forEach>
        </select></td>
	</tr>
	
	
	 <tr>
        <td class="e">是否是管理员</td>
        <td>
          <select name="isAdmin">
          <option value="1">是</option>
          <option value="2">否</option>
           </select>
        </td>
        
	</tr>
	
	
	
    <tr>
      <td class="e">性别</td>
      <td>女<input type="radio" name="isMale" value="女"  />
                             男<input type="radio" name="isMale" value="男"/><br></td>
      <td class="e">手机号</td>
      <td><input type="text" name="mobile" ></td>


  </tr>
  <tr>
    <td class="e">地址</td>
    <td><input class="d" type="text" name="address" ></td>
    <td class="e">年龄</td>
    <td><input type="text" name="age" ></td>


</tr>
<tr>
  <td class="e">固定电话</td>
  <td><input type="number" name="tel" ></td>
  <td class="e">身份证号</td>
  <td><input    type="number" name="idNum" ></td>


</tr>
<tr>
  <td class="e">电子邮箱</td>
  <td><input type="email" name="email" ></td>
  <td></td> 
  <td></td>


</tr>
<tr>
  <td class="e">爱好</td>
  <td><input type="text" name="hobby" ></td>
  <td class="e">学历</td>
  <td><select name="education">
    <option value="1">小学</option>
    <option value="2">初中</option>
    <option value="3">高中</option>
    <option value="4">大学</option>
  </select></td>
</tr>
<tr>
  <td class="e">工资卡号</td>
  <td><input type="number" name="cardNum" ></td>
  <td class="e">民族</td>
  <td><input type="text" name="nation" ></td>
</tr>
<tr>
  <td class="e">婚姻状况</td>
  <td><select name="marry">
    <option value="-1">离异</option>
    <option value="0">未婚</option>
    <option value="1">已婚</option>
  </select></td>
    <td class="e">用户状态</td>
    <td><select name="status">
    <option value="-1">已禁用</option>
    <option value="2">正常</option>
    <option value="1">已创建</option>
  </select></td>
  <td></td>
</tr>
<tr>
  <td class="e" >备注</td>
  <td colspan="3">  <textarea name="remark" cols="200px" rows="6px" ></textarea></td>
</tr>
</table>
</div>
    <div id="aaa">
    
    <input type="submit"    value="提交">
     </div>
   </form>
   <a href="userShow"  ><button>返回</button></a>
    
</body>
<script type= "text/javascript">


$().ready(function() {
	$("form").validate({
		rules:{
			username:{
				required:true,
				minlength:6,
				maxlength:14
			},
			password:{
				required:true,
				minlength:8
			},
			mobile:{
				required:true,
				minlength:11,
				naxlength:11
			},
			address:{
				required:true,
			},
			age:{
				required:true,
				
			},
			tel:{
				required:true,
				
			},
			id_num:{
				required:true,
			},
			email:{
				required:true,
				email:true
			},
			card_num:{
				required:true,
				minlength:6
			},
			nation:{
				required:true
				
			},
			remark:{
				required:true
			}
			
		},
		messages:{
			username:{
				required:"请输入用户名",
				minlength:"最小长度为6",
				maxlength:"最大长度为14"
			},
			password:{
				required:"请输入密码",
				minlength:"密码最短为8位"
			},
			mobile:{
				required:"请输入手机号",
				minlength:"手机号长度为11位",
				naxlength:"手机号长度为11位"
			},
			address:{
				required:"输入地址",
			},
			age:{
				required:"输入年龄"
				
			},
			tel:{
				required:"输入电话号"
				
			},
			id_num:{
				required:"输入身份证号"
			},
			email:{
				required:"输入邮箱",
				email:"邮箱格式为xx@xxx"
			},
			card_num:{
				required:"输入工资卡号",
				minlength:"最短的长度为6位"
			},
			nation:{
				required:"输入民族"
				
			},
			remark:{
				required:"输入备注"
			}
			
			
		}
	});
})

var flag = true;

$("#name").blur(function(){
	$.ajax({
		url:"user",
		data:{
			name:$("#name").val(),
			n:"check"
		},
		success:function(data){
			if(data=="1"){
				$("#i").text("用户名可以使用");
				flag=true;
			}else{
				$("#i").text("用户名重复");
				flag=false;
			}
		}
	})
})


function func(){
	return flag;
}
</script>
</html>