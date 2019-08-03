$(function() {

    //home.html.erb
    homePageLoad()
})
class Wine {
    constructor(json) {
        this.id = json.id;
        this.producer = json.producer;
        this.wine_name = json.wine_name;
        this.wine_type = json.wine_type;
        this.price_range = json.price_range;
        this.vintage = json.vintage;
        this.rating = json.rating;
        this.favorite = json.favorite;
        this.picture = json.picture;
        this.varietal = json.varietal;
        this.country = json.country;
        this.producer = json.producer;
        this.wine_aromas = json.wine_aromas;
        this.wine_tasting_terms = json.wine_tasting_terms
    }
  }

Wine.prototype.tableHTML = function() {
      return `<tr>
                <td style="padding-left: 40px"><a data-id='${this.id}' class="black-link wine-table" href="#">${this.producer} - ${this.wine_name}</a></td>
                <td>${this.wine_name}</td>
                <td>${this.vintage}</td>
              </tr>`
            }

Wine.prototype.showHTML = function() {
    let winePicture = this.picture ? `<image src="${this.picture}" />` : null
    return `<div class="picture">
            winePicture
          </div>
            <div class="card-body">
              <h5 class="card-title"><b>${this.producer} - ${this.wine_name}</b></h5>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><b>Country:</b> ${this.country.country_name}</li>
              <li class="list-group-item"><b>Vintage:</b> ${this.vintage}</li>
              <li class="list-group-item"><b>Rating:</b> ${this.rating}</li>
            </ul>
            <div class="card-body" align="center">
              <p>link to full page</p>
            </div>
          </div>`
        }

  function homePageLoad() {
      $.get('/wines' + '.json', function(jsonData) {
          jsonData.forEach(function(data) {
              const wineData = new Wine(data)
              const tableHTML = wineData.tableHTML()
              const wineDiv = document.getElementById('wine-js')
              wineDiv.innerHTML += tableHTML
              // debugger

          });
          // creates event listener for click on a wine, prevents the default action, then fetches
          // the json data for each object and displays it in the specified div
          $("wine-table").on("click", function(event) {
              event.preventDefault();
              const id = $(this).data("id");
              fetch(`/wines/${id}.json`)
                  .then(function(response) {
                      return response.json();
                  }).then(function(wine) {
                      $("#modal").html(showHTML)

                  })
          })
      });
  }

//
//
//
//
//
// New wine form submits dynamically, then shows success message with link to
// view new object, or error messages if not created
$(function() {
    $('form').submit(function(event) {
        //prevent form from submitting the default way
        event.preventDefault();

        // Get the messages div.

        const formMessages = $('#form-messages');
        $(formMessages).removeClass('alert-success')
        $(formMessages).removeClass('alert-danger')
        $(formMessages).html("<ul></ul>")

        var formData = new FormData($(this)[0]);
        //  debugger
        var action = $('#myForm').attr('action');

        $.ajax({
            url: "/wines",
            type: 'POST',
            data: formData,
            async: true,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
        }).then(function(data){
                const wine = data;
                if (!data.errors) {
                    $(formMessages).addClass(
                        'alert-success');
                    $(formMessages).show();
                    document.querySelector('#form-messages')
                        .innerHTML +=
                        `<p>${wine.producer} - ${wine.wine_name} has been added to your cellar - click <a class="alert-link" href="/wines/${wine.id}">here</a> to view. </p>`
                    $("#producer").text(wine["producer"]);
                    $("#wineName").text(wine["wine_name"]);
                    $('form')[0].reset();
                } else {
                    $(formMessages).addClass(
                        'alert-danger');
                    $(formMessages).show();

                    data.errors.forEach(function(error) {
                        document.querySelector(
                                '#form-messages')
                            .innerHTML +=
                            `<p>${error}</p>`
                    })
                }
            });
    });
})
