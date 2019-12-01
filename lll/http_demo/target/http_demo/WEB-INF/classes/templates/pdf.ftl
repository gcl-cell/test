
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title></title>
		<style>
			*{
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}
			body{
				font-family: SimSun;
			}
			section{
				display:block;
				margin: 20px 10px;
			}
			.title{
				text-align: center;
			}
			.preface p{
				line-height: 30px;
			}
			.preface p.content{
				text-indent: 2em;
			}
			section > table{
				table-layout: fixed;
				width: 100%;
				margin: 20px 0px;
				text-align:center;
				word-wrap:break-word;
			}
			section table td{
				padding:5px 0px;
			}
		</style>
	</head>
	<body>
		<!-- 标题 start -->
		<section class="title">
			<h2>产品列表</h2>
		</section>
		<!-- 标题 end -->
		
		<!-- 前言 start -->
		<section class="preface">
			<p>尊敬的用户：</p>
			<p class="content">pgf导出</p>
		</section>
		
		<!-- 明细 start -->
		<section class="detail">
			<h4>商品数据</h4>
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td width="5%">商品id</td>
					<td width="15%">商品名称</td>
					<td width="12%">上架时间</td>
					<td width="12%">是否启用</td>
			
				</tr>
				<#list list as brand>
					<tr>
						<td>${brand.id}</td>
						<td>${brand.brandname}</td>
						<td>${(brand.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
						<td>${brand.isEnable}</td>
					</tr>
				</#list>
			</table>
		</section>
		<!-- 明细 end -->
	</body>
</html>
