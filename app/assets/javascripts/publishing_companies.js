$(function() {


  $('#interests-book-btn').click(function() {
    const clientId = $('.welcome-client').attr('data-id')
    let title;
    request = $.getJSON('/publishing_companies/'+clientId+'/interests')
    request.done(function(data) {
      const books = data
      const interestedBooks = books.map(book => {
        return returnCard(book.book)
      })
      console.log(interestedBooks)
      $('#all-book-scripts').empty()
      $('#interested-books').append(interestedBooks)
    })
  })


})





function returnCard(data) {
  const book = data
  return `<div class="card">
      <div class="content">
        <div class="header">${book.title}</div>
          <div class="description">
          ${book.description}
          </div>
        </div>
        <div class="ui bottom attached button">
        <i class="mail outline icon"></i>
        Message Author
      </div>
    </div>`
}
