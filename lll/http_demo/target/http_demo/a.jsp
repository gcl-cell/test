<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>jQuery常用电商导航</title>

    <link type="text/css" href="css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>

<div class="row">
    <div class="container col-md-2">
        <div class="sec-mainL left">
            <div class="mainL-hd-box">
            </div>
            <ul class="sec-mainNav" id="left">
            </ul>
        </div>

        <script type="text/javascript">

            $(function () {
                var $top = $('.sec-mainNav').offset().top + $('.sec-mainNav').height()
                //左侧导航动画
                $('.sec-mainNav li').on('mouseenter', function () {
                    var $height = $(this).offset().top + $(this).find('.menu-panel').outerHeight();
                    $(this).find('.menu-panel').show();
                    if ($height - $top >= 0) {
                        $(this).find('.menu-panel').css({
                            top: -($height - $top) + 'px'
                        })
                    }
                });
                $('.sec-mainNav li').on('mouseleave', function () {
                    $(this).find('.menu-panel').hide();
                });
            });
        </script>
        <script type="text/javascript">
            var shopHtml = "";
            $.ajax({
                url: "http://localhost:8080/queryTypeJsonStr",
               // url: "<%=request.getContextPath()%>/queryTypeJsonStr",
                type: "get",
                dataType: "json",
                async: false,
                success: function (result) {
                    shopHtml += '<div class="mainL-hd-box" > <h2 class="mainL-hd">' + result[0].name + '</h2> </div>'
                    $("#left").html(shopHtml);

                    var secondNodes = result[0].children;
                    if (secondNodes.length > 0) {
                        typeList(secondNodes);
                    }

                },
                error: function () {
                    alert("失败了")
                }
            })


            function typeList(secondNodes) {
                for (var i = 0; i < secondNodes.length; i++) {
                    shopHtml += '<ul class="sec-mainNav"><li>'
                    shopHtml += '<h3>' + secondNodes[i].name + '</h3>'

                    var secondNodes2 = secondNodes[i].children;
                    if (secondNodes2.length > 0) {
                        shopTypeList(secondNodes2);
                    }
                    shopHtml += '</li> </ul>'
                }

                $("#left").html(shopHtml);

            }

            function shopTypeList(secondNodes2) {
                shopHtml += '<div class="menu-tab">'
                for (var i = 0; i < secondNodes2.length; i++) {
                    shopHtml += '<a href="javascript:;" onclick="shopShow('+secondNodes2[i].id+')">'+ secondNodes2[i].name + '</a>'
                    shopHtml += '<div class="fix"></div> </div> <span class="menu-more">更多</span> <div class="menu-panel"> <div class="menu-panel-hd"> <h4>热门分类</h4> <div class="sub-group"> <a href="">京东</a><a href="">易迅</a> <a href="">苏宁易购</a> <a href="">新蛋商城</a> <a href="">手机数码</a> <a href="">摄像影音</a> <a href="">耳麦音响</a> <a href="">国美在线</a> </div> </div> <div class="menu-panel-bd"><ul> <li> <a href=""><img src="./commons/img/0.png" /></a> </li> <li> <a href=""><img src="./commons/img/0(1).png" /></a> </li> <li> <a href=""><img src="./commons/img/0(2).png" /></a> </li> <li> <a href=""><img src="./commons/img/0 (3).png" /></a> </li> <li> <a href=""><img src="./commons/img/0.jpg" /></a> </li> </ul> </div> <a href="" class="menu-panel-btn"><span>查看全部商家</span> <em></em> </a> </div>'
                }

                shopHtml += '<div class="menu-panel"><div class="menu-panel-hd"><h4>热门分类</h4> <div class="sub-group">'
                for (var j = 0; j < secondNodes2.length; j++) {
                    shopHtml += '<a href="javascript:;" onclick="shopShow(' + secondNodes2[j].id + ')">' + secondNodes2[j].name + '</a>'
                }
                shopHtml += '</div></div>'
                $("#left").html(shopHtml);
            }


        </script>

        <script>
            function shopShow(id) {
                $.ajax({
                    "url":"<%=request.getContextPath()%>/toShopShow",
                    dataType:"html",
                    data:{"typeId":id},
                    success:function(result){
                        $("#shopTable").html(result)
                    }
                })
            }
        </script>
    </div>

    <%--展示--%>
    <div class="container col-md-10" id="shopJsp" style="height: 70%">
    </div>
</div>

<body>
<!--左侧菜单-->


</body>
</html>
