
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="mobile">	
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta name="viewport" content="minimal-ui, width=640, initial-scale=1, maximum-scale=0.5, minimum-scale=0.5, user-scalable=no"/>
	<script type="text/javascript" src="${resource(dir:'js', file:'jquery-1.11.0.min.js') }"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'jquery.mobile-1.3.2.min.js') }"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'web-sql4chat.js') }"></script>
	<script type="text/javascript">
		$( document ).ready(function() {
		    initDb();
		    fm();
		});

		function fm() {
			fetchMessage();
			patientsNeedcompleting() ;
			setTimeout(fm, 2000);
		}
	</script>
	<title>医患互动</title>
</head>
<body>
   <div class="content-wrapper">
	   <a href="javascript:fetchMessage()">fetch</a><br/><br/>
	   <a href="javascript:select()">select</a><br/>
   </div>
</body>
</html>
