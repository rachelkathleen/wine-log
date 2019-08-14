$(function() {

    //index.html.erb
    listeningPageLoad()
})
class Country {
    static all = []

    constructor(json) {
        this.country_name = json.country_name;
        this.id = json.id
        Country.all.push(this)
    }

    render(){
      const formatHTML = this.formatHTML()
      const listDiv = document.getElementById('list')
      listDiv.innerHTML += formatHTML
    }

    formatHTML(){
      return `<dt><a data-id='${this.id}' class="black-link country-link"href="countries/${this.id}/wines">${this.country_name}</a></dt>`
    }

    // static displayFirstFive() {
    //     let five = Country.all.slice(0, 5)
    //     five.forEach(function(country) {
    //       country.render()
    //     })
    // }

    static displayAll() {
        Country.all.forEach(function(country) {
          country.render()
        })
    }

    static createCountries(jsonData) {
      jsonData.forEach(function(data) {
          const countryData = new Country(data)
      });

    }

   formatWines(){
      return `<div class="container">
                <dt>There are ${country.wines.length} wines from ${country.country_name}</dt>
                <dd>
                ${country.wines.map(function(wine) {
                    return `<dd><a class="black-link" href="/wines/${wine.id}">${wine.wine_name}</a></dd>`;
                  })
                  .join("")}
              </div>`
    }

    static showWines(){
      $(".country-link").on("click", function(event) {
          event.preventDefault();
          const id = $(this).data("id");
          fetch(`/countries/${id}/wines.json`)
              .then(function(response) {
                  return response.json();
              }).then(function(country) {
                  $("#wines").html(`<div class="container">
                                      <dt>There are ${country.wines.length} wines from ${country.country_name}</dt>
                                      <dd>
                                      ${country.wines.map(function(wine) {
                                          return `<dd><a class="black-link" href="/wines/${wine.id}">${wine.wine_name}</a></dd>`;
                                        })
                                        .join("")}
                                    </div>`)
                });
              })
            }
          }

// fetches the countries json data, sets variables for each country object, the formatted html
// from the prototype method, then sets the inner html of specified div to the formatted html
function listeningPageLoad() {
    $.get('/countries' + '.json', function(jsonData) {
        Country.createCountries(jsonData)
        Country.displayAll()
        Country.showWines()
    });
}


//search bar
function countrySearchFunction() {
    console.log("hello world")
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
