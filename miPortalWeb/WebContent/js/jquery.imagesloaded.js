<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="mipk.beanDB"%>
<!DOCTYPE html>

<html lang="en">
<head>
<style type="text/css">

</style>
<!-- start: Meta -->
<meta charset="utf-8">
<title>Querys</title>
<meta name="keyword"
	content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link href="css/mi-css-propio.css" rel="stylesheet">
<link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link id="base-style" href="css/style.css" rel="stylesheet">
<link id="base-style-responsive" href="css/style-responsive.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<!-- end: CSS -->


<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->

<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="img/favicon.ico">
<!-- end: Favicon -->




</head>

<body>
	<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="index.html"><span>AdriAPP - Query's home</span></a>
				</ul>
			</div>
			<!-- end: Header Menu -->

		</div>
	</div>
	</div>
	<!-- start: Header -->

	<!--  MenÃº de la izq -->


	<div class="container-fluid-full">
		<div class="row-fluid">

			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">

					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="index.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Home</span></a></li>
						<li><a href="query1.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 1</span></a></li>
						<li><a href="query2.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 2</span></a></li>
						<li><a href="query3.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 3</span></a></li>
						<li><a href="query4.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 4</span></a></li>
						<li><a href="query5.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 5</span></a></li>
						<li><a href="query6.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 6</span></a></li>
						<li><a href="query7.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 7</span></a></li>
						<li><a href="query8.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 8</span></a></li>
						<li><a href="query9.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 9</span></a></li>
						<li><a href="query10.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 10</span></a></li>
						<li><a href="query11.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 11</span></a></li>
						<li><a href="query12.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 12</span></a></li>
						<li><a href="query13.jsp"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> Query 13</span></a></li>
					</ul> 
				</div>
			</div>
			<!-- end: Main Menu -->
			<!-- start: Content -->
			
 
	<% String query="select grupos.nombre, count(idAlumno ) from alumnos join grupos on (alumnos.idGrupo=grupos.idGrupo) group by grupos.idGrupo order by count(idAlumno) DESC";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
%> 
<div class="box-content" id = "tabla-queryX"> 
<div style="box-header">
<h2 >¿Cuántos alumnos tiene cada curso?</h2>
</div>

<table id="tabla1 "class="table table-striped table-bordered bootstrap-datatable datatable">
<% for (int i=0; i<tablares.length;i++) {
	%><tr > <%
	for (int j=0; j<tablares[i].length;j++) {
	%> <td  class="center"> <%=tablares[i][j] %> </td> <%
	}
	%> </tr> <%
}
%>
</table>
</div>
		</div>
		<!--/.fluid-container-->
		
		<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
		<script src="js/jquery-migrate-1.0.0.min.js"></script>
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
		<script src="js/jquery.ui.touch-punch.js"></script>
		<script src="js/modernizr.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.cookie.js"></script>
		<script src='js/fullcalendar.min.js'></script>
		<script src='js/jquery.dataTables.min.js'></script>
		<script src="js/excanvas.js"></script>
		<script src="js/jquery.flot.js"></script>
		<script src="js/jquery.flot.pie.js"></script>
		<script src="js/jquery.flot.stack.js"></script>
		<script src="js/jquery.flot.resize.min.js"></script>
		<script src="js/jquery.chosen.min.js"></script>
		<script src="js/jquery.uniform.min.js"></script>
		<script src="js/jquery.cleditor.min.js"></script>
		<script src="js/jquery.noty.js"></script>
		<script src="js/jquery.elfinder.min.js"></script>
		<script src="js/jquery.raty.min.js"></script>
		<script src="js/jquery.iphone.toggle.js"></script>
		<script src="js/jquery.uploadify-3.1.min.js"></script>
		<script src="js/jquery.gritter.min.js"></script>
		<script src="js/jquery.imagesloaded.js"></script>
		<script src="js/jquery.masonry.min.js"></script>
		<script src="js/jquery.knob.modified.js"></script>
		<script src="js/jquery.sparkline.min.js"></script>
		<script src="js/counter.js"></script>
		<script src="js/retina.js"></script>
		<script src="js/custom.js"></script>
		<!-- end: JavaScript-->
</body>
</html>
