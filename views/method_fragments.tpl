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
				<div class="container__linkTheory">
					<a href="#?id=theory">посмотреть теорию</a>
				</div>
				<form action="#" class="container__data" method="POST">
					<div class="data__input">
						<input class="count__matrix" placeholder="размерность матрицы" type="number" min="2" max="25" value="" name="" title="Значение должно быть не меньше 1 и не больше 25" required>
						<input accept=".txt" type="file" placeholder="asd" class="button__all button__open"></a>
						<a class="button__all button__save">сохранить</a>
						<input class="button__all button__apply" type="submit" name="form__button" value="посчитать результат">
					</div>
					<table class="table__matrix" id="matrix_JS"></table>

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

						$("#matrix_JS").on('click', 'input', function() {
							
							var changedInput = $(this);

							changedInput.val(Math.abs(changedInput.val() - 1))
							
							$("input[name='" + changedInput.attr("name").split("").reverse().join("") + "']").val(changedInput.val())

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

					 				matrix += "]\r\n"

					 			}

								this.href = 'data:application/txt;charset=utf-8,' + matrix;
								this.download = 'data.txt';
							});

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