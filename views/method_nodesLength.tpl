<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://kit.fontawesome.com/77a916cda6.js" crossorigin="anonymous"></script>
		<script src="/static/scripts/modernizr-2.6.2.js"></script>
		<link rel="stylesheet" href="/static/content/header.css">
		<link rel="stylesheet" href="/static/content/pageMethods.css">
		<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
		<title>OnlyMath</title>
	</head>
	<body>
		<!-- link header -->
		%include header.tpl title=title
		<!-- link header -->
		<article>
			<p><a name="top"></a></p>
			<div class="article__container"> 
				<div class="container__linkTheory">
					<a href="#theory_top">посмотреть теорию</a>
				</div>

				<form action="#" class="container__data" method="post">
				
				<figure>
				<!-- загрузка графика если мы нажали на кнопку подссчета результата -->
				%if image !="":
					<!-- Установка изображения по выбранному пути -->
					<img src="{{image}}" 
					<div class = "data__input">
					<!-- Вывод результата -->
					<figcaption style="font-size: 20px">{{resultout}}</figcaption>
				%end
				</figure>
					<!--Контейнер с кнопками -->
					<div class="data__input">
						<input class="count__matrix" placeholder="размерность матрицы" type="number" min="2" max="25" value="" name="matrix_size" title="Значение должно быть не меньше 1 и не больше 25" required>
						<input class="count__matrix" placeholder="Уровень" type="number" min="0" max="25" value="0" name="level" title="Значение должно быть не меньше 0 и не больше 25" required>
						<input accept=".txt" type="file" placeholder="asd" class="button__all button__open"></a>
						<a class="button__all button__save">сохранить</a>
						<input class="button__all button__apply" type="submit" name="form__button" value="посчитать результат">
					</div>
					<!--Перенос введенной матрицы -->
					<table class="table__matrix" id="matrix_JS">
					%if image !="":
						%for o in range(len(matrixout)):
						<tr>
							%for i in range(len(matrixout)):
							<td><input class="count__lines" type="number" min="0" max="1" value="{{matrixout[o][i]}}" name="{{o+1}}.{{i+1}}" readonly="readonly" required></td>
							%end
						</tr>
						%end
					%end
					</table>

					<!--Теория необходимая для работы -->
					<h1>Теория</h1>
					
					<p><a name="theory_top"></a></p>
					<p style="text-align:center"><span style="font-size:20px"><strong>Матрица смежности</strong></span></p>
					<p><span style="font-size:20px"><strong>Матрица смежности графа</strong>&nbsp;&mdash; это квадратная матрица, в которой каждый элемент принимает одно из двух значений: 0 или 1.</span></p>
					<p><span style="font-size:20px">Прежде чем отобразить граф через матрицу смежности, рассмотрим простой пример такой матрицы (рис. 1).</span></p>
					<p><img src="/static/pictures/binary_matrix.jpg" /></p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p><span style="font-size:20px">Это двоичная квадратная матрица, т. к. число строк в ней равно числу столбцов, и любой из ее элементов имеет значение либо 1, либо 0. Первая строка и первый столбец (не входят в состав матрицы, а показаны здесь для легкости ее восприятия) содержат номера, на пересечении которых находится каждый из элементов, и они определяют индексное значение последних. Имея в наличии лишь матрицу такого типа, несложно построить соответствующий ей граф</span></p>
					<p><img src="/static/pictures/matrix_smeghnost.jpg" /></p>
					<p>Слева на рисунке изображена все та же матрица смежности, имеющая размерность 4&times;4. Числа, выделенные синим, можно рассматривать как вершины смешанного графа, расположенного справа &ndash; того, представлением которого является матрица.</p>
					<p>&nbsp;</p>
					<p style="text-align:center"><span style="font-size:20px"><strong>Степень вершины.</strong></span></p>
					<p><span style="font-size:20px">Вершины в графе могут отличаться друг от друга тем, скольким ребрам они принадлежат.<br />
					<strong>Степенью вершины</strong>&nbsp;называется число ребер графа, которым принадлежит эта вершина.</span></p>
					<h2 dir="ltr" style="text-align:center"><span style="font-size:20px"><strong>Достижимость и связность в графах</strong></span></h2>
					<h3 dir="ltr"><strong><span style="font-size:20px">Определение достижимости вершин</span></strong></h3>
					<p dir="ltr"><span style="font-size:20px">Если существует путь, идущий от вершины xi к вершине xj, то говорят, что вершина xj достижима для вершины xi.&nbsp;</span></p>
					<p dir="ltr"><span style="font-size:20px">Пусть задан неориентированный граф G=〈X, &Gamma;〉 и его матрица смежности A. Достижимое множество вершин R(xi) для вершины xi - есть множество вершин, которые достижимы для вершины xi. Но, по определению, любая достижимая для xi вершина соединена с ней хотя бы одним путем длины ноль (при i = j), один, два, &hellip;, или k&le; n. Тогда достижимое множество для xi можно представить в виде:</span></p>
					<p dir="ltr"><span style="font-size:20px">R(xi)={xi}&cup;&Gamma;(xi)&cup;&Gamma; 2(xi)&cup;&hellip;&cup;&Gamma; k(xi),</span></p>
					<p dir="ltr"><span style="font-size:20px">где k имеет такое наименьшее значение, после которого R(xi) уже не изменяется, т.е. не наращивается.</span></p>
					<p dir="ltr"><span style="font-size:20px">Ограниченно достижимое множество обозначают через Rk(xi). Это множество вершин, достижимых путем максимальной длины k (и менее). Иными словами, Rk(xi) &ndash;это матрица числа вершин, находящихся в первых k ярусах, относительно каждой из них. Тогда полностью достижимое множество R(xi)=Rk(xi), если Rk(xi)=Rk+1(xi).</span></p>
					<p dir="ltr"><span style="font-size:20px">Определим матрицу достижимостей R=[rij] следующим образом:</span></p>
					<p dir="ltr"><span style="font-size:20px"><img src="https://lh5.googleusercontent.com/KwblPZ6444Th444TBaCmXXI_2F6Ovju32tI17EJszE3xcNWad6wk4x5CN8TPZSTmTUQAwdmM6Rf9g00HWYm2sl4rUNDq_lYWo0uG61GqoUYoqsaGpk23jymh2hko-iIhpklEVsV3Df8MZQq0uQ" style="height:49px; width:384px" /></span></p>
					<p dir="ltr"><span style="font-size:20px">При этом i-е строки матрицы достижимостей есть вектора, соответствующие множествам R(xi) в упорядоченном перечислении их элементов.&nbsp;</span></p>
					<p dir="ltr"><span style="font-size:20px">Задав определенное значение k, найдем в Rk(xi) максимальную из сумм элементов строк и получим номер (или номера) вершины, имеющей в первых k ярусах наибольшее количество вершин.</span></p>
					<h3 dir="ltr" style="text-align:center"><span style="font-size:20px"><strong>Матрица инциденций</strong></span></h3>
					<p dir="ltr"><span style="font-size:20px">Представление графа с помощью матрицы Н: array [1..p,1..q] of 0..1 (для орграфов H: array [l..p, l..q] of -1..1), отражающей инцидентность вершин и рёбер, называется матрицей инциденций, где для неориентированного графа</span></p>
					<p dir="ltr"><span style="font-size:20px"><img src="https://lh6.googleusercontent.com/F4RpTeFhLDXydKDGS4ijSrW-abKzcRY3GPSU35iBUtn5kh2b4LoSmr4aauW-eyT51L9VYVIJc5f83GAjE8xynR2c42pwsErohG4282smzYxeUqrM6YYnVhkvqpPzwtOc8-xAbYR5P1gDi-_18Q" style="height:50px; width:338px" /></span></p>
					<p dir="ltr"><span style="font-size:20px">а для ориентированного графа</span></p>
					<p dir="ltr"><span style="font-size:20px"><img src="https://lh3.googleusercontent.com/voaA1Lxatmc_XOSHl0jLbGB04D52pK9VcFRai3RNtXpvbToqa7fojwnRmkyh2DI_6YEP4Irn-Dqgb7BYm7TdXxIVi8jDYjQtb7DtDgyTdmDzBOLDY7OJk6F1D34iI2Tr852Cjj4Un-SDM5VssA" style="height:82px; width:506px" /></span></p>
					<p dir="ltr"><span style="font-size:20px">Для матрицы инциденций n(p,q) = O(pq).</span></p>
					<p dir="ltr"><span style="font-size:20px">Пример:</span></p>
					<p dir="ltr"><span style="font-size:20px"><img src="https://lh3.googleusercontent.com/LSVpvpxyH1U6UY8UsAk51RZrphzqPonHLIDd74aw5Gdfo81pri4TbiSSZfdmKrCAHHNKmGfoKLjeo-TKMqwGBqVMsI2IqkY-T7tcD2XwXwFGspnweMD-vbfxD2mBDE1lx_gJ3l6pGuO6be9QAA" style="height:94px; width:372px" /></span></p>
					
					<p><a href="#top">Наверх</a></p>
					
					<script>

						var testikMAX = Number($('.count__matrix').attr('max'));
						var testikMIN = Number($('.count__matrix').attr('min'));

						// событие смены размерности матрицы(добавление клеток для ввода матрицы смежности)
						$('.count__matrix').change(function() { 

							testik = Number($('.count__matrix').val());

							if (testik <= testikMAX && testik >= testikMIN) {

								$('#matrix_JS *').remove();

								for (var i = testik; i > 0; i--) {

					 				$('#matrix_JS').prepend('<tr>');
		
					 				for (var o = testik; o > 0; o--) {

					 					$('#matrix_JS').prepend('<td>');
					 					$('#matrix_JS').prepend('<input class="count__lines" type="number" min="0" max="1" value="0" name="' + i + '.' + o +'" readonly="readonly" required>');
					 					$('#matrix_JS').prepend('</td>');

					 				}
		
					 				$('#matrix_JS').prepend('</tr>');

					 			}
							}
						})

						// Инверсия введенного числа(1 или 0) при нажатии на клетку матрицы смежности
						$("#matrix_JS").on('click', 'input', function() {
							
							var changedInput = $(this);

							changedInput.val(Math.abs(changedInput.val() - 1))
							
							$("input[name='" + changedInput.attr("name").split("").reverse().join("") + "']").val(changedInput.val())

						});

					 	//  Сохранение матрицы в "Загрузки"

							$('.button__save').click(function() {

								var matrix = "";

								for (var i = 1; i <= testik; i++) {

									matrix += "[";

					 				for (var o = 1; o <= testik; o++) {

					 					matrix += $("input[name='" + i + "." + o +"']").val();

					 					matrix += (o != testik) ? "," : "";

					 				}

					 				matrix += "]\r\n"

					 			}

								this.href = 'data:application/txt;charset=utf-8,' + matrix;
								this.download = 'data.txt';
							});

							//  Загрузка матрицы из файла
							$('.button__open').change(function() {

								/*$('.button__open').on('change', function () {

								    var fileReader = new FileReader();

								    fileReader.onload = function () {

								      var data = fileReader.result;  // data <-- in this var you have the file data in Base64 format

								    };

								    fileReader.readAsDataURL($('.button__open').prop('files')[0]);

								});*/

								/*alert($('.button__open').val())
								var filename = $('.button__open').val().replace(/C:\\fakepath\\/i, '')
								var myFile = $('.button__open').prop('files');
								alert($('.button__open'))

								$.get(filename, function(data) {    
								 	alert("clown")
    				// 			var lines = data.split("\n");

	    			// 				$.each(lines, function(n, elem) {
	       // 							alert("clown")
	    			// 				});
    				 			}, "text");*/
							});

					</script>

				</div>
				<div id="theory" class="container__theory">
					
				</div>
			</div>
		</article>
		<!-- link footer -->
		%include footer.tpl year=year
		<!-- link footer -->
	</body>
</html>
</html>