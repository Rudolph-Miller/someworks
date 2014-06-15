convert = ->
	input = $(".input-area").val()
	result = marked(input)
	console.log(result)
	$(".output-area").html(result)

$ ->
	$(".input-area").blur -> convert()
	$(".input-area").keyup -> convert()
	$(".input-area").keydown -> convert()
	$(".input-area").change -> convert()
	$(".input-area").blur -> convert()

	$(".convert").click ->
		convert()
	

