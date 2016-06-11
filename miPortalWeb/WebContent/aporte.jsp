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
						<span class="subheading">Upload</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

				<hr>
				<hr>
				<!-- Pager -->
			</div>
		</div>
	</div>

	<hr>
	<div style="text-align: center; width: auto; margin: 0 auto;">
		<h3>Make a contribution</h3>
	</div>


	<div style="width: 70%; margin: 0 auto;" class="well">
		<form class="form-horizontal" role="form" action="aporte.jsp"
			method="get">
			<fieldset>
				<div style="width: 40%; position: relative;" class="col-sm-10">
					<label class="col-sm-2">Title&nbsp;&nbsp;</label> <input
						type="text" class="form-control" name="titulo" />
				</div>
				<br> <br>
				<%
					String query = "select idGenero, descripcion from generos";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaSelectA3(query);
				%>
				<br>

				<div class="col-sm-10" style="">
					<select data-rel="chosen" name="genero">
						<br>
						<option>Select a genre</option>
						<%
							for (int i = 0; i < tablares.length; i++) {
						%>
						<option value="<%=tablares[i][0]%>"><%=tablares[i][1]%>
						</option>
						<%
							}
						%>
					</select> <br> <br> <br>

					<%
						String query2 = "select idDirector, nombre from directores";
						String[][] tablares2 = basededatos.resConsultaSelectA3(query2);
					%>
					<br>

					<div class="row-fluid" style="">
						<select class="selectpicker" data-show-subtext="true"
							data-live-search="true" name="director">
							<br>
							<option>Select a director</option>
							<%
								for (int i = 0; i < tablares2.length; i++) {
							%>
							<option value="<%=tablares2[i][0]%>"><%=tablares2[i][1]%>
							</option>
							<%
								}
							%>
						</select>
					</div>

					<br> <br> <br>

					<div class="col-sm-10" style="">
						<select data-rel="chosen" name="categoria">
							<br>
							<option>Select a category</option>
							<option value="peliculas">Upload a film</option>
							<option value="series">Upload a TV Serie</option>
						</select>
					</div>

					<div style="margin-top: 7px;" class="col-sm-10">
						<input type="submit" value="Upload">
					</div>
				</div>


			</fieldset>
		</form>

		<%
			String tipo = "";
			String titulo = "";
			String idGenero = "";
			String idDirector = "";
			try {
				tipo = request.getParameter("categoria").toString();
				titulo = request.getParameter("titulo").toString();
				idGenero = request.getParameter("director").toString();
				idDirector = request.getParameter("genero").toString();

				String queryInsert = "insert into " + tipo + " (titulo, idGenero, idDirector) values('" + titulo + "', "
						+ idGenero + ", " + idDirector + ")";
				basededatos.insert(queryInsert);
		%>
	</div>
	<div class="col-md-6"
		style="text-align: center; justify-content: center;">
		<%
			if (tipo.equals("") || titulo.equals("") || idGenero.equals("") || idDirector.equals("")) {
		%>
		<label style="font-color: red">One or more fields are
			incomplete</label>
		<%
			} else {
		%>
		<b>Uploaded</b>
		<%
			}
			} catch (Exception e) {
			}
		%>


	</div>
	<!-- Footer -->
	<footer>
		<div class="container">






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
