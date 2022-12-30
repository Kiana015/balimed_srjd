<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="csrf-token" value="{{ csrf_token() }}" />
	<title>Skala Resiko Jatuh | Balimed Integrated Hospital System</title>
	<link rel="shortcut icon" href="{{asset('assets/images/favicon.ico')}}">

	@vite('resources/css/app.css')
</head>
<body>
	<div id="app"></div>

	@vite('resources/js/app.js')
</body>
</html>