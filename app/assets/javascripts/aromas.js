console.log("Hello world")

function searchAromaFunction() {
  // Declare variables
  var input, filter, dl, dt, a, i, txtValue;
  input = document.getElementById('myInput');
  filter = input.value.toUpperCase();
  dl = document.getElementById("aroma-list");
  dt = dl.getElementsByTagName('dt');

  for (i = 0; i < dt.length; i++) {
    item = dt[i].getElementsByClassName("aromas")[0];
    txtValue = item.textContent || item.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      dt[i].style.display = "";
    } else {
      dt[i].style.display = "none";
    }
  }
}
