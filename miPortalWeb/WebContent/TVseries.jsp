<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Clean Blog</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/clean-blog.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">The age of TV is over</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="index.jsp">Home</a></li>
					<li><a href="TVseries.jsp">Series</a></li>
					<li><a href="films.jsp">Films</a></li>
					<li><a href="aporte.jsp">Upload</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('img/maxresdefault.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<h1>Cinephile's Portal</h1>
						<hr class="small">
						<span class="subheading">Films</span>
					</div>
					<%
						String query = "SELECT titulo FROM series";
						beanDB basededatos = new beanDB();
						String[][] tablares = basededatos.resConsultaSelectA3(query);
					%>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->

	<div style="width: 70%; margin: 0 auto;">
		<%
			int i = 0, j = 0;
			for (i = 0; i < tablares.length; i++) {
		%>
		<%
			for (j = 0; j < tablares[i].length; j++) {

					String query2 = "Select ROUND(AVG(votacion),2) from valoraciones_series join series ON (valoraciones_series.idSerie=series.idSerie) WHERE series.titulo LIKE '"
							+ tablares[i][j] + "' GROUP BY valoraciones_series.idSerie ;";
					String[][] tablares2 = basededatos.resConsultaSelectA3(query2);
					System.out.print(query2);

					if (tablares2 == null) {
						tablares2 = new String[1][1];
						tablares2[0][0] = "0";
					}
		%>

		<div style="float: left; margin: 25px; height: 180px; width: 460px;">
			<div>
				<img src="img/noPhoto.jpg" alt="Photo view"
					style="width: 105px; height: 160px;"> <span><%=tablares[i][j]%>
				</span><br>
				<div style=" text-align: center; width: 105px; border-style:ridge; ; border-color: rgb(255, 199, 14); border-width:2px ;margin-bottom: 10px; font-size: 23px; font-style: oblique;">
					<span><%=tablares2[0][0]%></span>
				</div>
			</div>
		</div>
		<%
			}
			}
		%>

	</div>

	<!-- Pager -->

	<hr>



	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<ul class="list-inline text-center">
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-twitter fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-facebook fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-github fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
				</ul>
				<p class="copyright text-muted">Copyright &copy; Your Website
					2014</p>
			</div>
		</div>

	</footer>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/clean-blog.min.js"></script>

</body>

</html>
