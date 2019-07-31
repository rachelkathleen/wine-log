
  function searchGlossaryFunction() {
    console.log("Hello world")
    // Declare variables
    var input, filter, dl, div, item, i, txtValue;
    input = document.getElementById('myInput');
    filter = input.value.toUpperCase();
    dl = document.getElementById("term-list");
    div = dl.getElementsByClassName('term');

    for (i = 0; i < div.length; i++) {
      item = div[i]

      txtValue = item.textContent || item.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        div[i].style.display = "";
      } else {
        div[i].style.display = "none";
      }
    }
  }
