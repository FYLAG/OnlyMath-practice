<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://kit.fontawesome.com/77a916cda6.js" crossorigin="anonymous"></script>
		<script src="/static/scripts/modernizr-2.6.2.js"></script>
		<link rel="stylesheet" href="/static/content/header.css">
		<link rel="stylesheet" href="/static/content/pageAuthors.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
		
		<title>OnlyMath</title>
	</head>
	<body>
		<!-- link header -->
		%include header.tpl title=title
		<!-- link header -->
		<article>
			<!-- начало блока приветствия -->
			<div class="article__container">
				<div class="container__author">
					<div class="author__image">
						<img src="/static/pictures/clown_nose.gif">
					</div>
					<div class="author__info">
						<h2>Андреев Егор Романович</h2>
						<p>Работает в отделе по костылям.</p>
					</div>
				</div>
				<div class="container__author">
					<div class="author__info">
						<h2>Гаврилов Александр Юрьевич</h2>
						<p>Рандомный чел... возможно, предатель.</p>
					</div>
					<div class="author__image">
						<img style="transform: translate(-50%, -50%) scale(-.5, .5); filter: grayscale(100%)" src="/static/pictures/amogus.gif">
					</div>
				</div>
				<div class="container__author">
					<div class="author__image">
						<img src="/static/pictures/leclerc.gif">
					</div>
					<div class="author__info">
						<h2>Маганков Григорий Дмитриевич</h2>
						<p>Всё просто, он наш гигачат!</p>
					</div>
				</div>
			</div>
			<!-- конец блока приветствия -->
		</article>
		<!-- link footer -->
		%include footer.tpl year=year
		<!-- link footer -->
	</body>
</html>