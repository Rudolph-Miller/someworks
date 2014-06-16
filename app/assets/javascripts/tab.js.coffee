change_tab = (name) ->
  console.log(name)
  $(".tab1, .tab2, tab3").css("display", "none")
  $(name).css("display", "block")
         .css("width", "100%")

separate_tab = (name1, name2) ->
  console.log("separated")
  $(name1).css("display", "block")
          .css("width", "50%")
  $(name2).css("display", "block")
          .css("width", "50%")

$ ->
  $(".btab1").click -> change_tab (".tab1")
  $(".btab2").click -> change_tab(".tab2")
  $(".btab3").click -> separate_tab(".tab1", ".tab2")
