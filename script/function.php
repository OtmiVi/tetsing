<?php 
require_once 'config.php';

function get_tests(){
	global $link;
	$stmt = $link->prepare("SELECT * FROM test;");
	$stmt->execute();
	$data = array();
	while ($row = $stmt->fetch()) {
		$data[] = $row;
	}
	return $data;
 }

function get_test_data($test_id){
	if(!$test_id) return;
	global $link;
	$stmt = $link->prepare("SELECT q.question, q.test_id, a.id, a.answer, a.question_id FROM questions q LEFT JOIN answers a ON q.id = a.question_id WHERE q.test_id = $test_id;");
	$stmt->execute();
	$data = null;
	while ($row = $stmt->fetch()) {
		if(!$row['question_id']) return false;
		$data[$row['question_id']][0]= $row['question'];
		$data[$row['question_id']][$row['id']]= $row['answer'];
	}
	return $data;
}
function get_correct_answers($test){
	if(!$test) return false;
	global $link;
	$stmt = $link->prepare("SELECT q.id AS question_id, a.id AS answer_id FROM questions q LEFT JOIN answers a ON q.id = a.question_id WHERE q.test_id = $test AND a.correct_answer = 1;");
	$stmt->execute();
	$data = null;
	while ($row = $stmt->fetch()) {
		if(!$row['question_id']) return false;
		$data[$row['question_id']]= $row['answer_id'];
	}
	return $data;
}
function get_result($test_all_data, $result, $POST){
	foreach ($result as $question => $answer) {
		$test_all_data[$question]['correct_answer'] = $answer;
		if(!isset($POST[$question])){
			$test_all_data[$question]['incorrect_answer'] = 0;
		}
	}
	foreach ($POST as $question => $answer) {
		if(!isset($test_all_data[$question])){
			unset($POST[$question]);
			continue;
		}
		if(!isset($test_all_data[$question][$answer])){
			$test_all_data[$question]['incorrect_answer'] = 0;
			continue;
		}
		if($test_all_data[$question]['correct_answer'] != $answer){
			$test_all_data[$question]['incorrect_answer'] = $answer;
		}
	}
	return $test_all_data;
}

function print_result($test_result){
	$count_result = count($test_result);
	$correct_answer_count = 0;
	$incorrect_answer_count = 0;
	foreach ($test_result as $item) {
		if (isset($item['incorrect_answer'])) {$incorrect_answer_count++;}
	}
	$correct_answer_count = $count_result - $incorrect_answer_count;
	$persent = ceil($correct_answer_count / $count_result * 100);
	$result = "<div class='content'>
				 	<div class='count_res'>
				 		<p>Всього питань: {$count_result}</p>
				 		<p>Правильно дано відповіді на {$correct_answer_count} з {$count_result} питань</p>
				 		<p>Ваш бал: {$persent}</p>
				 	</div>
				 </div>";
	$result .="<a href='/'><button>Повернутись на головну</button></a>";
	foreach ($test_result as $id_question => $item) {
		$correct_answer = $item['correct_answer'];
		$incorrect_answer = null;
		if(isset($item['incorrect_answer'])){
			$incorrect_answer = $item['incorrect_answer'];
			$class = 'mistake';
		}else{
			$class = 'ok';
		}
		$result .="<div class='content'>
 					<div class='$class'>";
 		foreach ($item as $id_answer => $answer) {
 			if(!$id_answer){
 				$result .=" <p class='question'><b>{$answer}</b></p><ul>";
 			}elseif(is_numeric($id_answer)){
 				if($id_answer == $correct_answer){
 					$class ='answer true';
 				}elseif($id_answer == $incorrect_answer){
 					$class ='answer false';
 				}
 				else{
 					$class ='answer';
 				}
 				$result .="<li class='$class'>$answer</li>";
 			}
 		}
 		$result .="</usl></div></div>";
	}
	echo($result);
}
 ?>
