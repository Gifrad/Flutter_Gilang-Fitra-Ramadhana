import 'Hewan.dart';
import 'Mobil.dart';


void main() {
  Hewan burung = Hewan('burung',20);
  Hewan kucing= Hewan('kucing',20);
  Hewan ayam = Hewan('ayam',20);
  Hewan sapi = Hewan('sapi',22);
  Hewan gajah = Hewan('gajah',100);

  Mobil mobil = Mobil();
  mobil.tambahMuatan(burung);
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(ayam);
  mobil.tambahMuatan(sapi);
  mobil.tambahMuatan(gajah);
  mobil.totalMuatan();

}