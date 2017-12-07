$(function() {

  getCurrentBooks()

  $('.ui.search.dropdown').change(function() {
    const searchOption= ($( ".ui.search.dropdown option:selected").text());
    const authorId = $('#authors-books').attr('data-id')
    let sortedBooks = []
    let title;

    posting = $.getJSON('/authors/'+authorId+'/book_data')
    posting.done(function(data) {
      const books = data["books"]
      if (searchOption === "Books A-Z") {
        sortedBooks = sortBookAsc(books)
      } else if (searchOption === "Books Z-A") {
        sortedBooks = sortBookDesc(books)
      }
      const authorBooks = sortedBooks.map(book => {
        title = book.title === "" ? '<em>untitled</em>' : titleCase(book.title)
        return `<div class="four wide column"><a href="/books/${book.id}" class="book-link" >`+title+'</a></div><br/>'
      })
      refreshPageWithSortBooks(authorBooks)
    })
  })


})



function getCurrentBooks() {
    const id = $('#authors-books').attr('data-id')
    let title;
    posting = $.getJSON('/authors/'+id+'/book_data', function(data) {
        const books = data["books"]
        const authorBooks = books.map(book => {
            title = book.title === "" ? '<em>untitled</em>' : titleCase(book.title)
            return `<div class="four wide column"><a href="/authors/${id}/books/${book.id}" class="book-link" >`+title+'</a></div><br/>'
        })
        authorBooks.forEach( book => {
            $("#authors-books").append(book)
        })
      })
}

// $('#add-book').click(renderForm)
// 
// function renderForm() {
//         $('#book-form').html("<%= j render partial: 'books/form' %>")
// }
//
// function submitForm(e) {
//         e.preventDefault()
//         const id = $('#author-id').attr('data-id')
//         const values = $(this).serialize()
//         posting = $.post('/books', values)
//         .done(function(values) {
//             console.log(vaules)
//             getCurrentBooks()
//             $('form').trigger('reset')
//         })
//         console.log('done')
// }
//
//


function sortBookAsc(data) {
      return data.sort(function(a,b){
          return a.title.localeCompare(b.title);
      })
}

function sortBookDesc(data) {
        return data.sort(function(a,b){
            return b.title.localeCompare(a.title);
      })
}

function refreshPageWithSortBooks(data) {
    $("#authors-books").empty()
    data.forEach( book => {
      $("#authors-books").append(book)
    })
}

function titleCase(title) {
  if (title.indexOf(' ') === -1) {
    return title.charAt(0).toUpperCase()+title.slice(1)
  } else{
    return title.split(" ").map( word => { return word.charAt(0).toUpperCase()+word.slice(1) }).join(" ")
  }
}
