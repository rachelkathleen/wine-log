// New wine form submits dynamically, then shows success message with link to
// view new object, or error messages if not created
  $(function () {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
      // Get the messages div.

      const formMessages = $('#form-messages');
      $(formMessages).removeClass('alert-success')
      $(formMessages).removeClass('alert-danger')
      $(formMessages).html("<ul></ul>")


      const values = $(this).serialize();
      const posting = $.post('/wines', values);
      posting.done(function(data) {
      const wine = data;
      if (!data.errors) {
        $(formMessages).addClass('alert-success');
        $(formMessages).show();
        document.querySelector('#form-messages').innerHTML+=`<p>${wine.producer} - ${wine.wine_name} has been added to your cellar - click <a class="alert-link" href="/wines/${wine.id}">here</a> to view. </p>`
        $("#producer").text(wine["producer"]);
        $("#wineName").text(wine["wine_name"]);
        $('form')[0].reset();
      } else {
        $(formMessages).addClass('alert-danger');
        $(formMessages).show();

        data.errors.forEach(function(error){
          document.querySelector('#form-messages').innerHTML+=`<p>${error}</p>`
        })
      }
      });
    });
  })
