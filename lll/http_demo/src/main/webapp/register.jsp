<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/commons/jquery-3.3.1.min.js"></script>


    <script>
        function add() {
            var userName = $("#userName").val();
            var password = $("#password").val();
            var createTime = $("#createTime").val();
            var phone = $("#phone").val();
            alert(phone);
            $.ajax({
                url: "http://localhost:8080/users/user",
                type: "post",
                data: {
                    "userName": userName,
                    "password": password,
                    "createTime": createTime,
                    "phone": phone
                },
                dataType: "json",
                success: function (result) {
                    alert("成功");
                },
                error: function () {
                    alert("failed")
                }
            })
        }

    </script>
<body>
<center><br><h1>用户信息注册页面</h1>
    <form   method="post" enctype="multipart/form-data"  >
        账号<input type="text"  name="userName"  id="userName"/><br>
        密码<input type="password"  name="password"   id="password" /><br>
        注册时间<input type="date"  name="createTime"   id="createTime" /><br>
        手机号<input type="text" name="phone" id="phone"><br>
        <input type="button" value=" 注册" onclick="add()" >
    </form>
</center>

</form>
</center>
</body>
</html>