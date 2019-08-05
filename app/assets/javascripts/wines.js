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
      return `<tr class="wine-list">
                <td style="padding-left: 40px"><a data-id='${this.id}' class="black-link wine-link" href="#">${this.producer}</a></td>
                <td>${this.wine_name}</td>
                <td>${this.vintage}</td>
              </tr>`
            }

function wineModal(wine) {
    const winePicture = wine.picture ? `<image src="${wine.picture}" />` : null
    return `<div class="picture">
            ${winePicture}
          </div>
            <div class="card-body">
              <h5 class="card-title"><b>${wine.producer} - ${wine.wine_name}</b></h5>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><b>Country:</b> ${wine.country.country_name}</li>
              <li class="list-group-item"><b>Vintage:</b> ${wine.vintage}</li>
              <li class="list-group-item"><b>Varietal:</b> ${wine.varietal.varietal_name}</li>
              <li class="list-group-item"><b>Rating:</b> ${wine.rating}</li>
            </ul>
            <div class="card-body" align="center">
              <p><a href="#">View Full Details</a></p>
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
          $(".wine-link").on("click", function(event) {
              event.preventDefault();
              const id = $(this).data("id");
              fetch(`/wines/${id}.json`)
                  .then(function(response) {
                      return response.json();
                  }).then(function(wine) {
                      const modalDiv = document.getElementById('modal')
                      // alert("yayyy");
                      modalDiv.innerHTML += wineModal(wine)

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


// search bar
function searchFunction() {
    // Declare variables
    var input, filter, tr, td, a, i, txtValue;
    input = document.getElementById('myInput');
    filter = input.value.toUpperCase();
    tr = document.getElementsByClassName("wine-list");
    // td = tr.getElementsByTagName('td');


    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        row = tr[i];
        txtValue = row.textContent || row.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none"; debugger
        }
    }
}
