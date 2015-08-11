function proveraDatumOd() {
  var tekst = document.forma.datumOdK.value;
  var test = /(200[1-9]|202[0-9])-((0[1-9]|1[0-2]))-(0[1-9]|1[0-9]|2[0-9]|3[0-1])/;

  var rez = tekst.match(test);
  if (rez == null) {
    alert('neispravan oblik datuma');
  }
}

function proveraDatumDo() {
  var tekst = document.forma.datumDoK.value;
  var test = /(200[1-9]|202[0-9])-((0[1-9]|1[0-2]))-(0[1-9]|1[0-9]|2[0-9]|3[0-1])/;

  var rez = tekst.match(test);
  if (rez == null) {
    alert('neispravan oblik datuma');
  }
}