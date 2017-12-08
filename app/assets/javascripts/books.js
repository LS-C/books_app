
$(function() {

  $('form#edit_book').submit(function(e) {
    e.preventDefault()
    const url = $(this).attr('action')
    console.log(url)
    const params = $(this).serialize()

    $.ajax({
      method: "patch",
      url: url,
      data: params,
    })
    .done(function(data) {
      console.log(data)
    })
  })

})
