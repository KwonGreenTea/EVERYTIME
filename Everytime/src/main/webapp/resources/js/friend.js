$(document).ready(function() {
	$('.nameListItem').click(function(event) {
		var requestId = $(this).find('.frdId').val();
		var requestName = $(this).find('.frdName').val();
		$('#requestId').val(requestId);
		$('#requestName').val(requestName);
		$('#memberForm').submit();
	});
});