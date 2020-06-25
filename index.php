<?php 
require_once 'script/function.php';
$tests = get_tests();
 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Головна</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="tests">
		<?php if($tests): ?>
			<h3>Теми тестів:</h3>
			<ul>
				<?php foreach ($tests as $value):?>
					<li><a href="test.php/?test=<?= $value['id']?>"><?= $value['test_name']?></a></li>
				<?php endforeach;?>
			</ul>
		<?php else: ?>
			<h3>тестів немає</h3>
		<?php endif; ?>
	</div>
</body>
</html>