function curDate() {
  var d = new Date();
  var n = d.getFullYear();
  document.getElementById("giveMeDate").innerHTML = n;
}
curDate();
