

String nilai(int nilai){
  if(nilai > 70){
    return 'A';
  }else if(nilai > 40){
    return 'B';
  }else if(nilai > 0){
    return 'C';
  }else{
    return 'nilai kosong';
  }
}

void main(){
  var gilang = nilai(80);
  var fitra = nilai(50);
  var ramadhana = nilai(20);
  var gilangFitraRamadhana = nilai(0);

  print(gilang);
  print(fitra);
  print(ramadhana);
  print(gilangFitraRamadhana);

}