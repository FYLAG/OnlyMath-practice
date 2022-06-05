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
			<div class="article__container">
			<!-- Блок с кнопкой истории -->
			%if image_path == "":
				<div class="container__links">
					<a class="links__theory" href="#Theory_Block">посмотреть теорию</a>
				</div>
				%end
				<!-- Форма для заполнения матрицы -->
				<form action="#" class="container__data" method="POST">
				<!-- Блок с изображением графа -->
					<div class = "graph_image">
					% if image_path != "":
						<img src="{{image_path}}"
						%end
					</div>
					<!-- Блок с результатом вычислений -->
					<div>
					% if image_path != "":
						<fragment style="font-size: 20px">Результат: {{result}}</fragment>
						%end
					</div>
					<!-- Блок с элементами ввода -->
					<div class="data__input">
					%if image_path != "":
						<input class="count__all count__matrix" placeholder="Размерность матрицы" type="number" min="2" max="25" value="{{len(matrixout)}}" name="matrix_size" title="Значение должно быть не меньше 1 и не больше 25" required>
						%else:
						<input class="count__all count__matrix" placeholder="Размерность матрицы" type="number" min="2" max="25" value="" name="matrix_size" title="Значение должно быть не меньше 1 и не больше 25" required>
						%end
						<a class="button__all button__save">Сохранить</a>
						<input class="button__all button__apply" type="submit" name="form__button" value="Результат">
					</div>
					<div class="matrix__help">
						<p style="margin-top:20px; font-size:20px">Введите матрицу смежности, нажимая на числа в ячейках. При нажатии число сменится с 0 на 1 или наоборот</p>
					</div>
					<!-- Создание таблицы -->
					<table class="table__matrix" id="matrix_JS">
						% if image_path != "":
							% for o in range(len(matrixout)):
							<tr>
								%for i in range (len(matrixout)):
								<td><input class = "count__lines" type = "number" min = "0" value = "{{matrixout[o][i]}}" name = "{{o+1}}.{{i+1}}" readonly="readonly" required></td>
								%end
							</tr>
							%end
						%end
					</table>

					%if image_path == "":
					<!-- Блок теории  -->
					<div class = "theory" style="font-size: 20px">
						<a name ="Theory_Block" ></a>
						<p></p>
						<p style="text-align:center"><b>ТЕОРИЯ</b><br></br></p>
						<p><b>Определение.</b> Эйлеров путь — это путь в графе, проходящий через все его рёбра. </p>
						<p><b>Определение.</b> Эйлеров цикл — это эйлеров путь, являющийся циклом.</p>
						<img src="static/pictures/euler-small.png"></img>
						<p>Граф на пяти вершинах и один из его эйлеровых циклов: CDCBBADEBC</p>
						<br></br>
						<p><b>Нахождение эйлерова цикла</b><br></br></p>
						<p><b>Теорема.</b> Эйлеров цикл существует тогда и только тогда, когда граф связный и степени всех вершин чётны.</p>
						<p><b>Доказательство.</b> Необходимость показывается так: можно просто взять эйлеров цикл и ориентировать все его ребра в порядке обхода.<br>
						Тогда из каждой вершины будет выходить столько же рёбер, сколько входить, а значит степень у всех вершин исходного неориентированного графа была четной.</br></p>
						<p><br><b><h>Алгоритм нахождения эйлерова цикла.</h></b></br>
						<br>
						1. Выбрать произвольную вершину А.
						</br>
						<br>
						2. Выбрать произвольно некоторое ребро, инцидентное вершине А, и присвоить ему номер 1. Это ребро называется помеченным.
						</br>
						<br>
						3. Каждое пройденное ребро вычеркиваем и присваиваем ему номер на 1 больше предыдущего пройденного ребра.
						</br>
						<br>
						4. Находясь в вершине X, не выбираем ребра, соединяющие вершину X с вершиной А, если есть возможность другого выбора.
						</br>
						<br>
						5. Находясь в вершине X, не выбираем рёбра, являющиеся мостом.
						</br>
						<br>
						6. После того как в графе пронумерованы все ребра, цикл образован ребрами с номерами от 1 до n, который является эйлеровым.
						</br></p>
						<br><p style="text-align:center">Алгоритм построения <b>эйлерова пути</b> аналогичен предыдущему, с той лишь разницей что начальной нужно выбирать вершину с нечетной степенью.</p></br>
					</div>
					%end
					<!-- Скрипт генерации таблицы-->
					<script>

						var testikMAX = Number($('.count__matrix').attr('max'));
						var testikMIN = Number($('.count__matrix').attr('min'));

						var testik = 2;

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
						// Генерация ячеек таблицы
						$("#matrix_JS").on('click', 'input', function() {
							
							var changedInput = $(this);

							changedInput.val(Math.abs(changedInput.val() - 1))
							var nameInput =changedInput.attr('name')
							
							$("input[name='" + nameInput.split(".")[1]+'.'+nameInput.split(".")[0] + "']").val(changedInput.val())

						});
						// Сохранение содержимого таблицы в файл в виде матрицы смежности
					 	// Добавление нового элемента на страницу.

							$('.button__save').click(function() {

								var matrix = "";
								var testik = Number($('.count__matrix').val());

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