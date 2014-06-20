uuids = []
uploaded_tokens = []
root = "http://localhost:3000"

convert = ->
	input = $(".input-area").val()
	result = marked(input)
	img = result.match("<img src=\"\" alt=\"\">")
	for id in uuids
		id1 = id["id1"]
		id2 = id["id2"]
		upload_image(id1, id2)
	if img
		imguploader(input, result)
	else
		$(".output-area").html(result)

upload_image = (id1, id2) ->
	files = $("#image-#{id1}-#{id2}")[0].files
	if files.length > 0
		url = "#{root}/images/#{id1}/#{id2}"
		def = "#{root}/images/sample/sample.png"
		file = files[0]
		formdata = new FormData()
		formdata.append('image', file)
		formdata.append('token1', id1)
		formdata.append('token2', id2)
		$.ajax "upload_picture",
			type: "POST"
			processData: false
			contentType: false
			data: formdata
			dataType: "json"
			success: (result) -> change_src(url, id1, id2)
			error: (result) -> change_src(url, id1, id2)
	return false

change_src = (url, id1, id2) ->
	input = $(".input-area").val()
	$(".input-area").val(input.replace("#{id1}/#{id2}", url))
	$(".uploader").append(img_box(id1, id2))
	$("#form-#{id1}-#{id2}").html(" ")
	uuids.some (v, i) ->
		if v.id1 == id1 && v.id2 == id2
			uuids.splice(i,1)

imguploader = (input, result) ->
	date = new Date()
	uuid1 = Math.floor(Math.random()*10000000)
	uuid2 = Math.round(date.getTime() / 100000)
	uuids.push({id1: uuid1, id2: uuid2})
	uploaded_tokens.push("#{uuid1}:#{uuid2}")
	$(".input-area").val(input.replace("![]()", "![](#{uuid1}/#{uuid2})"))
	$(".uploader").append(upload_box(uuid1, uuid2))
	$(".output-area").html(result)

upload_box = (uuid1, uuid2) ->
	"<form  id=\"form-#{uuid1}-#{uuid2}\" method=\"POST\" enctype=\"multipart/form-data\" action=\"writers/articles/upload_picture\"><ul class=\"nav nav-tabs\"> <li class=\"btn btn-default\" class=\"upload_li\"><p style=\"font-size:20px; font-color: aquamarine;\">Drag Image</p><div style=\"border-width:1px; border-style:dotted;\"><input id=\"image-#{uuid1}-#{uuid2}\" style=\"opacity:0; height: 50px;\" type=\"file\" name=\"image\"></input></div></ul></form>"

img_box = (uuid1, uuid2) ->
	"<img id=\"result-#{uuid1}-#{uuid2}\" src=\"#{root}/images/#{uuid1}/#{uuid2}\" style=\"max-height: 200px; height: auto;\"></img>"
$ ->
  if $(".edit-article")[0] || $(".edit-task")[0]
    $(document).ready -> convert()
    $(".input-area").focus -> convert()
    $(".input-area").blur -> convert()
    $(".input-area").keyup -> convert()
    $(".input-area").keydown -> convert()
    $(".input-area").change -> convert()
    $(".input-area").blur -> convert()
    $(".convert").click -> convert()
    $("#save").click ->
      $("#tokens").val(uploaded_tokens)
    $(".upload_li").on("dragover", (e)-> e.dataTransfer.dropEffect='copy')
    $(".upload_li").on("drop", (e)-> e.dataTransfer.files)
