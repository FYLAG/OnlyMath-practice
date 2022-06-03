<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://kit.fontawesome.com/77a916cda6.js" crossorigin="anonymous"></script>
		<script src="/static/scripts/modernizr-2.6.2.js"></script>
		<link rel="stylesheet" href="/static/content/header.css">
		<link rel="stylesheet" href="/static/content/pageMain.css">

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
				<div  class="article__container">
				<center><p style="font-size:50px"><b>OnlyMath</b></p>
				<p p style="font-size:24px">Данный сайт предназначен для решения задач по теме ""Элементы теории графов. Неориентированные графы." при помощи матриц смежности</p></center>
				
				</div>
				<div class="container__author">
					<div class="author__image">
						<img src="/static/pictures/clown_nose.gif">
					</div>
					<div class="author__info">
						<h2><a href="/method-fragments" style="color: #fff; text-decoration:underline;">Метод поиска фрагментов в графе</a></h2>
						<p>...Работа в процессе...</p>
					</div>
				</div>
				<div class="container__author">
					<div class="author__info">
						<h2><a href="/method-nodes-length" style="color: #fff; text-decoration:underline;">Метод поиска максимального окружения вершина на ярусе</a></h2>
						<p><b>Окружение</b> — множество вершин, смежных с заданной.</p>
						<p><b>Ярусно-параллельная форма</b> – это такой вид графа, у которого в верхний нулевой ярус помещены вершины, имеющие только исходящие дуги; в нижний ярус помещены вершины, имеющие только входящие дуги. На k-том ярусе помещены вершины, которые имеют входящие дуги из предыдущих ярусов, среди которых хотя бы одна дуга из (k-1)-того яруса.</p>
						<p>Данный метод позволяет при помощи матрицы смежности и уровня определить какие вершины имеют наибольшее окружение</p>
					</div>
					<div class="author__image">
						<img src="/static/pictures/level_graph.jpg">
					</div>
				</div>
				<div class="container__author">
					<div class="author__image">
						<img src="/static/pictures/euler-big.png">
					</div>
					<div class="author__info">
						<h2><a href="/method-eul" style="color: #fff; text-decoration:underline;">Метод нахождния эйлерова цикла или пути в графе</a></h2>
						<p><b>Эйлеров путь (эйлерова цепь) в графе </b>— это путь, проходящий по всем рёбрам графа и притом только по одному разу. (ср. Гамильтонов путь)</p>
						<p><b>Эйлеров цикл </b>— эйлеров путь, являющийся циклом, то есть замкнутый путь, проходящий через каждое ребро графа ровно по одному разу.</p>
						<p><b>Эйлеров граф </b>— граф, содержащий эйлеров цикл.</p>
						<p><b>Полуэйлеров граф </b>— граф, содержащий эйлеров путь.</p>
						<p>Можно всегда свести задачу поиска эйлерова пути к задаче поиска эйлерова цикла. Действительно, предположим, что эйлерова цикла не существует, а эйлеров путь существует.</p>
						<p>Тогда в графе будет ровно 2 вершины нечётной степени. Соединим эти вершины ребром, и получим граф, в котором все вершины чётной степени, и эйлеров цикл в нём существует.</p>
						<p>Найдём в этом графе эйлеров цикл (алгоритмом, описанным ниже), а затем удалим из ответа несуществующее ребро.</p>
						<p><b>Пример. </b>Каждая вершина графа на рисунке имеет чётную степень, поэтому этот граф — эйлеров. Обход рёбер в алфавитном порядке даёт эйлеров цикл</p>
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