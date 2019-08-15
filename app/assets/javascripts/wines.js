$(function() {

    //home.html.erb
    homePageLoad()
})
class Wine {

  static all = []

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
        Wine.all.push(this)
    }
}

// formats table rows for wine index
Wine.prototype.tableHTML = function() {
    return `<tr class="wine-list">
              <td style="padding-left: 40px"><a data-id='${this.id}' class="wine-link black-link" data-toggle="modal" data-target="#exampleModal" href="#">${this.producer}</a></td>
              <td>${this.wine_name}</td>
              <td>${this.vintage}</td>
            </tr>`
          }
function showPicture(wine) {
  const winePicture = wine.picture ? `<div style="border: 1px solid #220F24" class="picture"><img src="${wine.picture}" style="height:150px"></div>` : ""
  return winePicture
}
// format for interior of wine modal
function wineModal(wine) {
    const wineLink = "/wines/"+`${wine.id}`
    return (`<div class="modal-body" background-color="white">
              <div class="top-container" style="width:80%">
                <h5 align="center"><b>${wine.producer} - ${wine.wine_name}</b></h5>
              </div>
               ${showPicture(wine)}
               <div>
                  <ul class="list-group list-group-flush" style="border: 1px solid #220F24">
                     <li class="list-group-item"><b>Country:</b> ${wine.country.country_name}</li>
                     <li class="list-group-item"><b>Vintage:</b> ${wine.vintage}</li>
                     <li class="list-group-item"><b>Varietal:</b> ${wine.varietal.varietal_name}</li>
                     <li class="list-group-item"><b>Type:</b> ${wine.wine_type}</li>
                  </ul>
               </div><br>
              <div align="center" background-color="white">
                 <button align="center" type="button" class="link_button"><a href="${wineLink}">View Details</a></button><br>
              </div>
            </div>`)
          }


          function homePageLoad() {
          	$.get('/wines' + '.json', function (jsonData) {
          		jsonData.forEach(function (data) {
          			const wineData = new Wine(data)
          			const tableHTML = wineData.tableHTML()
          			const wineDiv = document.getElementById('wine-js')
          			wineDiv.innerHTML += tableHTML

          		});
          		// creates event listener for click on a wine, prevents the default action, then fetches
          		// the json data for each object and displays it in the specified div
          		$(".wine-link").on("click", function (event) {
          			event.preventDefault();
          			const id = $(this).data("id");
          			fetch(`/wines/${id}.json`)
          				.then(function (response) {
          					return response.json();
          				}).then(function (wine) {
          					const modalDiv = document.getElementById('please-work')
          					// alert("yayyy");
          					modalDiv.innerHTML = wineModal(wine)

          				})

          		})
          	});
          }

            (function() {
              "use strict";

              function Pagination() {
                console.log("pagination")

                 const objJson = fetch(`/wines.json`);

                const prevButton = document.getElementById('button_prev');
                const nextButton = document.getElementById('button_next');
                const clickPageNumber = document.querySelectorAll('.clickPageNumber');

                let current_page = 1;
                let records_per_page = 5;

                this.init = function() {
                    changePage(1);
                    pageNumbers();
                    selectedPage();
                    clickPage();
                    addEventListeners();
               }

                let addEventListeners = function() {
                    prevButton.addEventListener('click', prevPage);
                    nextButton.addEventListener('click', nextPage);
                }

                let selectedPage = function() {
                    let page_number = document.getElementById('page_number').getElementsByClassName('clickPageNumber');
                    for (let i = 0; i < page_number.length; i++) {
                        if (i == current_page - 1) {
                            page_number[i].style.opacity = "1.0";
                        }
                        else {
                            page_number[i].style.opacity = "0.5";
                        }
                    }
                }

                let checkButtonOpacity = function() {
                  current_page == 1 ? prevButton.classList.add('opacity') : prevButton.classList.remove('opacity');
                  current_page == numPages() ? nextButton.classList.add('opacity') : nextButton.classList.remove('opacity');
                }

                let changePage = function(page) {
                    const wineJS = document.getElementById('wine-js');

                    if (page < 1) {
                        page = 1;
                    }
                    if (page > (numPages() -1)) {
                        page = numPages();
                    }

                    wineJS.innerHTML = "";

                    for(var i = (page -1) * records_per_page; i < (page * records_per_page) && i < objJson.length; i++) {
                        wineJS.innerHTML += tableHTML;
                    }
                    checkButtonOpacity();
                    selectedPage();
                }

                let prevPage = function() {
                    if(current_page > 1) {
                        current_page--;
                        changePage(current_page);
                    }
                }

                let nextPage = function() {
                    if(current_page < numPages()) {
                        current_page++;
                        changePage(current_page);
                    }
                }

                let clickPage = function() {
                    document.addEventListener('click', function(e) {
                        if(e.target.nodeName == "SPAN" && e.target.classList.contains("clickPageNumber")) {
                            current_page = e.target.textContent;
                            changePage(current_page);
                        }
                    });
                }

                let pageNumbers = function() {
                    let pageNumber = document.getElementById('page_number');
                        pageNumber.innerHTML = "";

                    for(let i = 1; i < numPages() + 1; i++) {
                        pageNumber.innerHTML += "<span class='clickPageNumber'>" + i + "</span>";
                    }
                }

                let numPages = function() {
                    return Math.ceil(objJson.length / records_per_page);
                }
             }
            let pagination = new Pagination();
            pagination.init();
          })();





// search bar
function searchFunction() {
	// Declare variables
	var input, filter, tr, td, a, i, txtValue;
	input = document.getElementById('myInput');
	filter = input.value.toUpperCase();
	tr = document.getElementsByClassName("wine-list");

	// Loop through all list items, and hide those who don't match the search query
	for (i = 0; i < tr.length; i++) {
		row = tr[i];
		txtValue = row.textContent || row.innerText;
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			tr[i].style.display = "";
		} else {
			tr[i].style.display = "none";
		}
	}
}
