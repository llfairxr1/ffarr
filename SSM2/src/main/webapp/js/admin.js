

$('.menu-title').click(function(){
	$('.menu-title').removeClass('active');
	$(this).addClass('active');
});
$('.sub-menu li').click(function(){
	$('.sub-menu li').removeClass('active');
	$('.sub-menu li .fa-star').removeClass('fa-star').addClass('fa-star-o');
	$(this).addClass('active');
	$(this).find('i').removeClass('fa-star-o').addClass('fa-star');
})