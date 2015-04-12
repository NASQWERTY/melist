<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido a MeList</title>
		<style type="text/css" media="screen">
			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<div id="page-body" role="main">
			<div id="controller-list" role="navigation">
				<h1>
					<g:link controller="wishList">
						<div style="margin-left: auto;
						margin-right: auto;
						width: 100%;" >

							<div style="float: left; width: 50%;"><img src="images/wishlist.png" /></div>
							<div style="float: right; width: 50%; font-size: 25px; font-weight: 500; position: relative;
							top: 10%; -webkit-transform: translateY(-10%); -ms-transform: translateY(-10%); transform: translateY(-10%);">
								<br/>

								<br/>
								<br/>Bienvenido a MELIST
								<br/>
								<br/>
								<br/>El sitio donde podras las mas variadas wishLists, incluyendo de cumpleaños, donacion, casamientos, y más!!
							</div>
							</div>
					</g:link>
				</h1>
			</div>
			</div>
		</body>
	</html>
