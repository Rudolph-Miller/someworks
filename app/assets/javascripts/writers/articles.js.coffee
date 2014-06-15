uuids = []
urls = []

convert = ->
	console.log('hi')
	input = $(".input-area").val()
	result = marked(input)
	img = result.match("<img src=\"\" alt=\"\">")
	for id in uuids
		upload_image(id)
	if img
		imguploader(input, result)
	else
		$(".output-area").html(result)

upload_image = (id) ->
	file = $("#image-#{id}").get(0)
	formdata = new FormData()
	formdata.append('file', file)
	result = {url:"sampe"}
	change_src(result, id)
	return true

change_src = (result, id) ->
	url = result["url"]
	input = $(".input-area").val()
	$(".input-area").val(input.replace(id, url))
	console.log(result)

imguploader = (input, result) ->
	uuid = generate_uuid()
	$(".input-area").val(input.replace("![]()", "![](#{uuid})"))
	$(".uploader").append(upload_box(uuid))
	$(".output-area").html(result)

upload_box = (uuid) ->
	"<form id=\"image-#{uuid}\"><input type=\"file\"></input><button type=\"button\" class=\"btn btn-default\" id=\"btn-#{uuid}\">upload</button></form>"


generate_uuid = ->
	rand = Math.floor(Math.random()*1000)
	date = new Date()
	time = date.getTime()
	result = rand + time.toString()
	uuids.push(result)
	result


$ ->
	$(document).ready -> convert()
	$(".input-area").focus -> convert()
	$(".input-area").blur -> convert()
	$(".input-area").keyup -> convert()
	$(".input-area").keydown -> convert()
	$(".input-area").change -> convert()
	$(".input-area").blur -> convert()
	$(".convert").click -> convert()
	
