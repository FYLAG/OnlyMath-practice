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
				<div class="container__infoSite">
					<p style="font-size:24px">Данный сайт предназначен для решения задач по теме «Элементы теории графов и неориентированные графы» при помощи матриц смежности.<br>
					На сайте можно найти следующие методы решения:
					</p>
				</div>
				<div class="container__method">
					<div class="method__image">
						<img style="transform: translate(-50%, -50%) scale(.75)" src="/static/pictures/graph.png">
					</div>
					<div class="method__info">
						<h2><a href="/method-fragments">Метод поиска фрагментов в графе</a></h2>
						<p>
							<b>Граф</b> — математическая абстракция реальной системы любой природы, объекты которой обладают парными связями. 
							Граф как математический объект есть совокупность двух множеств — множества самих объектов, называемого множеством вершин, и множества их парных связей, называемого множеством рёбер. 
							Элемент множества рёбер есть пара элементов множества вершин.
						</p>
						<p>
							Графы находят широкое применение в современной науке и технике. 
							Они используются и в естественных науках и в социальных науках, но наибольших масштабов применение графов получило в информатике и сетевых технологиях.
						</p>
						<p><b>Фрагментом</b> называется связный подграф остовного дерева графа.</p>
						<a class="method__link" href="/method-fragments"> перейти к методу</a>
					</div>
				</div>
				<div class="container__method">
					<div class="method__info">
						<h2><a href="/method-nodes-length">Метод поиска максимального окружения вершина на ярусе</a></h2>
						<p><b>Окружение</b> — множество вершин, смежных с заданной.</p>
						<p><b>Ярусно-параллельная форма</b> – это такой вид графа, у которого в верхний нулевой ярус помещены вершины, имеющие только исходящие дуги; в нижний ярус помещены вершины, имеющие только входящие дуги. На k-том ярусе помещены вершины, которые имеют входящие дуги из предыдущих ярусов, среди которых хотя бы одна дуга из (k-1)-того яруса.</p>
						<p>Данный метод позволяет при помощи матрицы смежности и уровня определить какие вершины имеют наибольшее окружение.</p>
						<a class="method__link" href="/method-nodes-length"> перейти к методу</a>
					</div>
					<div class="method__image">
						<img style="transform: translate(-50%, -50%) scale(.8)" src="/static/pictures/level_graph.jpg">
					</div>
				</div>
				<div class="container__method">
					<div class="method__image">
						<img style="transform: translate(-50%, -50%) scale(.9)" src="/static/pictures/euler-big.png">
					</div>
					<div class="method__info">
						<h2><a href="/method-eul">Метод нахождения эйлерова цикла или пути в графе</a></h2>
						<p><b>Эйлеров путь (эйлерова цепь) в графе </b>— это путь, проходящий по всем рёбрам графа и притом только по одному разу. (ср. Гамильтонов путь)</p>
						<p><b>Эйлеров цикл </b>— эйлеров путь, являющийся циклом, то есть замкнутый путь, проходящий через каждое ребро графа ровно по одному разу.</p>
						<p><b>Эйлеров граф </b>— граф, содержащий эйлеров цикл.</p>
						<p><b>Полуэйлеров граф </b>— граф, содержащий эйлеров путь.</p>
						<p>
							Можно всегда свести задачу поиска эйлерова пути к задаче поиска эйлерова цикла. Действительно, предположим, что эйлерова цикла не существует, а эйлеров путь существует.
							Тогда в графе будет ровно 2 вершины нечётной степени. Соединим эти вершины ребром, и получим граф, в котором все вершины чётной степени, и эйлеров цикл в нём существует.
							Найдём в этом графе эйлеров цикл (алгоритмом, описанным ниже), а затем удалим из ответа несуществующее ребро.
						</p>
						<a class="method__link" href="/method-eul"> перейти к методу</a>
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