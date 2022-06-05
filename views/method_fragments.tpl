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
				<div class="container__links">
					<a class="links__matrix">перейти к матрице</a>
					<a class="links__graph">перейти к графику</a>
					<a class="links__theory" href="#theory">посмотреть теорию</a>
				</div>
				<div class="container__result">
					<div class="result__graph">
						<div class="graph__image">
							<button onclick="ChangeImage()">показать фрагмент</button>
							<img src="{{ imageGraph }}" alt="">
						</div>
						<p>изображение графа</p>
					</div>

					<script>

						changeBool = true;

						function ChangeImage() {

							if (changeBool) {

								$('.graph__image img').attr('src', '/static/pictures/duck.gif');
								document.querySelector('.graph__image button').innerHTML = 'показать граф';
								document.querySelector('.result__graph p').innerHTML = 'изображение фрагмента';
								changeBool = false;

							} else {

								$('.graph__image img').attr('src', '{{ imageGraph }}');
								document.querySelector('.graph__image button').innerHTML = 'показать фрагмент';
								document.querySelector('.result__graph p').innerHTML = 'изображение графа';
								changeBool = true;

							}
						}

					</script>

					<div class="result__fragments">
						<h2>точки фрагментов:</h2>
						<div class="fragments__listDots">
							% for i in listDots:
							<p>{{ i }}</p>
							% end
						</div>
					</div>
				</div>
				<form action="#" class="container__data" method="POST">
					<div class="data__input">
						<input class="count__all count__matrix" placeholder="введите размер матрицы" type="number" min="2" max="11" value="" name="matrixGraphSize" title="Значение должно быть не меньше 1 и не больше 11" required>
						<input class="count__all count__fragment" placeholder="введите размер фрагмента" type="number" min="2" max="11" value="" name="matrixFragmentSize" title="Значение должно быть не меньше 1 и не больше 11" required>
						<!-- <input accept=".txt" type="file" placeholder="asd" class="button__all button__open"></a> -->
						<a class="button__all button__save">сохранить матрицу</a>
						<input class="button__all button__apply" type="submit" name="" value="посчитать результат">
					</div>
					<p class="input__info">Изменяйте матрицу при помощи нажатия на ячейку с числом.</p>
					<div class="data__matrixs" id="matrixs__JS">
						<table class="table__matrix" id="matrix__JS__fullGraph"></table>
						<table class="table__matrix" id="matrix__JS__fragment"></table>
					</div>

					<script>

						var matrixCountMAX = Number($('.count__matrix').attr('max'));
						var matrixCountMIN = Number($('.count__matrix').attr('min'));

						var fragmentCountMIN = Number($('.count__fragment').attr('min'));

						var matrixCount = 0;

						function AddElementsInput(inputCountName, matrixName, inputName, countMAX, countMIN) {

							matrixCount = Number($(inputCountName).val());

							if (matrixCount <= countMAX && matrixCount >= countMIN) {

								$(matrixName + ' *').remove();

								for (var i = matrixCount; i > 0; i--) {

					 				$(matrixName).prepend('<tr>');
		
					 				for (var o = matrixCount; o > 0; o--) {

					 					$(matrixName).prepend('<td>');
					 					$(matrixName).prepend('<input class="count__lines" type="number" min="0" max="1" value="0" name="' + i + inputName + o +'" title="' + i + ' строка ' + o + ' столбец" readonly="readonly" required>');
					 					$(matrixName).prepend('</td>');

					 				}
		
					 				$('#matrix__JS__fullGraph').prepend('</tr>');

					 			}
							}
						}

						$('.count__matrix').change(function() {

							$('.count__fragment').attr('max', Number($('.count__matrix').val()));
							$('.count__fragment').attr('title', 'Значение должно быть не меньше 1 и не больше ' + $('.count__fragment').attr('max'));

							AddElementsInput('.count__matrix', '#matrix__JS__fullGraph', '.G.', matrixCountMAX, matrixCountMIN);
							
						})

						$('.count__fragment').change(function() {

							var fragmentCountMAX = Number($('.count__fragment').attr('max'));

							AddElementsInput('.count__fragment', '#matrix__JS__fragment', '.F.', fragmentCountMAX, fragmentCountMIN);

						})

						$("#matrixs__JS").on('click', 'input', function() {
							
							var changedInput = $(this);
							var nameInput = changedInput.attr("name");

							if (nameInput.split(".").reverse().join(".") != nameInput) {

								changedInput.val(Math.abs(changedInput.val() - 1));

								$("input[name='" + nameInput.split(".")[2]
									+ '.' + nameInput.split(".")[1]
									+ '.' + nameInput.split(".")[0]
									+ "']").val(changedInput.val());

							}

						});

					 	// Добавление нового элемента на страницу.

							$('.button__save').click(function() {

								var matrix = "";

								for (var i = 1; i <= testik; i++) {

									matrix += "[";

					 				for (var o = 1; o <= testik; o++) {

					 					matrix += $("input[name='" + i + "." + o +"']").val();

					 					matrix += (o != testik) ? "," : "";

					 				}

					 				matrix += "]\r\n";

					 			}

								this.href = 'data:application/txt;charset=utf-8,' + matrix;
								this.download = 'data.txt';
							});

					</script>

				</form>
				<div id="theory" class="container__theory">
					<div class="blockFlex">
						<img src="/static/pictures/graph-fragments.gif" width="300px" alt="">
						<p><b>Метод поиска фрагментов в графе</b><br>
						Граф — математическая абстракция реальной системы любой природы, объекты которой обладают парными связями. Граф как математический объект есть совокупность двух множеств — множества самих объектов, называемого множеством вершин, и множества их парных связей, называемого множеством рёбер. Элемент множества рёбер есть пара элементов множества вершин.<br>
						Графы находят широкое применение в современной науке и технике. Они используются и в естественных науках и в социальных науках, но наибольших масштабов применение графов получило в информатике и сетевых технологиях.<br>
						Фрагментом называется связный подграф остовного дерева графа.</p>
					</div>
					<div class="blockFlex">
						<p><b>Пояснение алгоритма поиска всех фрагментов</b><br>
						Алгоритм перебирает каждый вариант матрицы с размерностью заданного фрагмента и после каждого перебора сравнивает его с самим фрагментом. Если сравнение прошло успешно, то программа добавляет в список точки графа, через которые можно постоить заданный фрагмент.
						</p>
						<img src="/static/pictures/matrix-count.gif" alt="">
					</div>
				</div>

				<script>

					const blockData = document.querySelector('.container__data');
					const blockResult = document.querySelector('.container__result');
					const blockTheory = document.querySelector('.container__theory');

					function ViewBlockResult() {
						blockData.classList.add('close');
						blockTheory.classList.add('close');
						blockResult.classList.add('open');
					}

					function ViewBlockData() {
						blockResult.classList.remove('open');
						blockData.classList.remove('close');
						blockTheory.classList.remove('close');
					}

					$('.links__matrix').click(function() {
						ViewBlockData();
					});

					$('.links__graph').click(function() {
						ViewBlockResult();
					});

				</script>

			</div>
		</article>
		<!-- link footer -->
		%include footer.tpl year=year
		<!-- link footer -->
	</body>
</html>