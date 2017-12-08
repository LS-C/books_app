
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
      const updatedBook = data
      updatedBook.title ==="" ? $('.book-title').text('untitled') :   $('.book-title').text(updatedBook.title)
      updatedBook.description ==="" ? $('.book-description').text('Not scripted yet') : $('.book-description').text("Synopsis: "+ updatedBook.description)
      updatedBook.category === "" ? $('.book-title').text('need category') :   $('.book-title').text(updatedBook.title)
      $('form#edit_book')[0].reset();
    })
  })

})
