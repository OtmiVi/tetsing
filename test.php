<?php 
require_once 'script/function.php';
if (isset($_GET['test'])){
	$test_id = (int)$_GET['test'];
	$test_data = get_test_data($test_id);

	if(is_array($test_data)){
		$count_questions = count($test_data);
	}
}
if(isset($_POST['test'])){
	$test = (int)$_POST['test'];
	unset($_POST['test']);
	$result = get_correct_answers($test);
	if(!is_array($result)) exit('помилка');
	$test_all_data = get_test_data($test);
	$test_result = get_result($test_all_data, $result, $_POST);
	print_result($test_result);
	die;
}

 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Ваш тест</title>
	<link rel="stylesheet" type="text/css" href="../css/test.css">
	<script type="text/javascript" src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
	<script type="text/javascript" src='../script/script.js'></script>	
</head>
<body>
	<div class="questions">
		<a href="/"><button>Назад</button></a>
		<?php if(isset($test_data)): ?>
			<?php if(is_array($test_data)):?>
				<p>Кількість питань: <?=$count_questions?></p>
				<span class='none' id='test_id'><?=$test_id?></span>
				<div class="test_data">
					<?php foreach ($test_data as $id_questions => $item):?>
						<div class="question" data-id='<?=$id_questions?>' id='question-<?=$id_questions?>'>
							<?php foreach ($item as $id_answer => $answer):?>
								<?php if(!$id_answer): ?>
									<div class="question_q"><b><?=$answer?></b></div>
								<?php else: ?>
									<div class="question_a">
										<input type="radio" id='answer-<?=$id_answer?>' name =question-<?=$id_questions?> value='<?=$id_answer?>'>
										<label for='answer-<?=$id_answer?>'><?=$answer?></label>
									</div>
								<?php endif; ?>
							<?php endforeach; ?><hr>
						</div>
					<?php endforeach; ?>
					<button id='btn'>Закінчити тест</button>
				</div>
			<?php else: ?>
				<div class="error" >Тест в розробці</div>
			<?php endif; ?>
		<?php else: ?>
			<div class="error">Помилка в тесті. Будь ласка поверніться на попередню сторінку</div>
		<?php endif; ?>
	</div>
</body>
</html>