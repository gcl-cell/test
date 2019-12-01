<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/commons/jquery-3.3.1.min.js"></script>
<link href="<%=request.getContextPath()%>/commons/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">
	function login(){
		var name=$("#name").val();
		var password=$("#password").val();
		$.post({
			url:"<%=request.getContextPath()%>/login",
			data:{"name":name,"password":password},
			dataType:"json",
			success:function(da){
				if(da.login==1){
					alert("账号不存在");
				}
				if(da.login==2){
					alert("密码错误");
				}
				if(da.login==0){
					//location.href="index.jsp";
                    window.location.href="index.jsp";
					//alert("success")
				}
			},
			error:function(){
				alert("登陆异常");
			}
		});
	}
	function register(){
		location.href="<%=request.getContextPath()%>/register.jsp";
	}
</script>
<body>
	<center>
	
	账号:<input type="text" id="name" name="userName" /><br>
	密码:<input type="password" id="password" name="passworde" /><br>
	<!--<input type="button" onclick="login()"  value="登陆"/>	-->
     <a href="register.jsp">注册</a>
        <button type="button" onclick="login()" class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;">
                <span class="glyphicon glyphicon-user"></span> 登陆
          </button> 
	<br>
	
	</center>
</body>
</html>