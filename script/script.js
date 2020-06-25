$(function(){
	$('#btn').click(function(){
		let test = $('#test_id').text();
		let res = {'test':test};

		$('.question').each(function(){
			let id = $(this).data('id');
			res[id] = $('input[name=question-'+ id +']:checked').val();});

		$.ajax({
			url:'test.php',
			type:'POST',
			data: res,
			success: function(html){
				$('.questions').html(html);
			},
			error: function(){
				alert('Помилка');
			}
			
		});
	});
});

	
