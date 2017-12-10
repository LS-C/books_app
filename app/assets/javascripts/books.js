// class Book {
//   constructor(title, category, description) {
//     this.title = title
//     this.category = category
//     this.description = description
//   }
//
//   renderCard() {
//     console.log(`Book title ${this.title}`)
//   }
//
// }
//
//
// $(function() {
//
//
//   $('#test-button').click(function() {
//     console.log('hi')
//     const newBook = new Book('test', 'test', 'test')
//     newBook.renderCard()
//     const source   = $("#entry-template").html();
//     const template = Handlebars.compile(source);
//     const context = {title: newBook.title, body: newBook.description};
//     const html    = template(context);
//     $('.show-card').append(html)
//   })
//
//
//
// })
// 
// $('#2').click(function(e) {
//   e.preventDefault()
//   console.log("hi")
//   const url = $(this).attr('action')
//   console.log(ur)
//
//   $.ajax({
//     method: "DELETE",
//     url: url
//   })
//   .done(function(data) {
//     console.log(data)
//     $('form#edit_book input:submit').prop('disabled',false);
//   })
//   $('#edit-form1').fadeOut('1000')
// })
