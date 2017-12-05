$(function() {

    getCurrentBooks()



})

function getCurrentBooks() {
  const id = $('#authors-books').attr('data-id')
  posting = $.getJSON('/authors/'+id+'/book_data', function(data) {
    const books = data["books"]
    console.log(books)
    const authorBooks = books.map(book => {
      return `<div class="four wide column"><a href="/authors/${id}/books/${book.id}" class="book-link" >`+book.title+'</a></div><br/>'
    })
    authorBooks.forEach( book => {
      $("#authors-books").append(book)
    })
  })
}
