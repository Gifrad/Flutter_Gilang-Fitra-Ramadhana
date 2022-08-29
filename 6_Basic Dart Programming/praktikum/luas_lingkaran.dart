import 'dart:io';

void main() {
  print('program sederhana menghitung luas lingkaran');
  const phi = 3.14;
  var jari;
  stdout.write ('Masukan nilai jari jari Lingkaran : ');
  jari = stdin.readLineSync(); 
  double hasilJari = double.parse(jari);
  double Luas = phi * hasilJari * hasilJari;
  print('Luas Lingkaran adalah : $Luas');
  
}