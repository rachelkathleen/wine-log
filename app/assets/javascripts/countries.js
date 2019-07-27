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
  // return `<dt><a href="countries/${this.id}">${this.country_name}</a></dt>`
  return `<dt><a class="black-link"href="countries/${this.id}">${this.country_name}</a></dt>`
}

function listeningPageLoad() {
  $.get('/countries' + '.json', function(jsonData) {
    jsonData.forEach(function(data) {
      const countryData = new Country(data)
      const formatHTML = countryData.formatHTML()
      const listDiv = document.getElementById('list')
      listDiv.innerHTML += formatHTML
      // moreClick()
    })
  })
}
