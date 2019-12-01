<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/11/21
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/jquery-3.3.1.min.js"></script>

</head>
  <script>
      $(function(){
          $.ajax({
              url:"http://localhost:8080/users/userlist",
              dataType:"json",
            success:function(data){
                  alert(JSON.stringify(data));
            }

          })
      })
  </script>
<body>

</body>
</html>
