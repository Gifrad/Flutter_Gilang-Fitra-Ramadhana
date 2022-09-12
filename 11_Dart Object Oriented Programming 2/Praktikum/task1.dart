  class BangunRuang{
  late double panjang;
  late double lebar;
  late double tinggi;

  void volume(){
    print('program menghitung volume bangun ruang');
  }

}

class Kubus extends BangunRuang{
    double sisi = 6;
    late double vKubus;
@override
  void volume() {
    vKubus = sisi * sisi * sisi;
    print('volume bangun ruang kubus dengan sisi : $sisi, adalah: $vKubus');
  }  
}

class Balok extends BangunRuang{  
  double panjang = 12;
  double lebar = 6;
  double tinggi = 5;
  late double vBalok;
@override
  void volume() {
    vBalok = panjang * lebar * tinggi;
    print('volumen bangun ruang balok dengan Panjang : $panjang , Lebar : $lebar, Tinggi : $tinggi , adalah : $vBalok');
  }

}

void main(){
   BangunRuang bangun = BangunRuang()..volume();
   BangunRuang balok = Balok()..volume();
   BangunRuang kubus = Kubus()..volume();
}