$(function() {

  //index.html.erb
  listeningPageLoad()
})

class Country {
  constructor(json) {
    this.country_name = json.country_name;
    this.id = json.id
  }
}

Country.prototype.formatHTML = function() {
  return `<dt><a data-id='${this.id}' class="black-link country-link"href="countries/${this.id}/wines">${this.country_name}</a></dt>`
}

function listeningPageLoad() {
  $.get('/countries' + '.json', function(jsonData) {
    jsonData.forEach(function(data) {
      const countryData = new Country(data)
      const formatHTML = countryData.formatHTML()
      const listDiv = document.getElementById('list')
      listDiv.innerHTML += formatHTML
    });

    $(".country-link").on("click", function(event) {
      event.preventDefault();
      const id = $(this).data("id");
      fetch(`/countries/${id}/wines.json`)
        .then(function(response) {
          return response.json();
        }).then(function(country) {
                              $("#wines").html(`
                                  <p>number of wines: ${country.wines.length}</p>
                                  <p>the wines are:
                                  ${country.wines.map(function(wine) {
                                      return `<p>${wine.wine_name}</p>`;
                                    })
                                    .join("")}
                                    `)

    })
  })
    });
  }
  // search bar
    function searchFunction() {
      // Declare variables
      var input, filter, dl, dt, a, i, txtValue;
      input = document.getElementById('myInput');
      filter = input.value.toUpperCase();
      dl = document.getElementById("list");
      dt = dl.getElementsByTagName('dt');

      // Loop through all list items, and hide those who don't match the search query
      for (i = 0; i < dt.length; i++) {
        a = dt[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          dt[i].style.display = "";
        } else {
          dt[i].style.display = "none";
        }
      }
    }
