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
  return `<dt><a class="black-link country-link"href="countries/${this.id}/wines">${this.country_name}</a></dt>`
}

function listeningPageLoad() {
  $.get('/countries' + '.json', function(jsonData) {
    jsonData.forEach(function(data) {
      const countryData = new Country(data)
      const formatHTML = countryData.formatHTML()
      const listDiv = document.getElementById('list')
      listDiv.innerHTML += formatHTML
    });//a new event listener for the click
    //prevent default on click
  }).then(function(wines) {
                        $("#wines").html(`
                            <h1>number of wines: ${wines.length}
                            <p>the wines are:
                            ${wines.map(function(wine) {
                                return `<p>${wine.wine_name}</p>`;
                              })
                              .join("")}
                              `)
    });
  }
