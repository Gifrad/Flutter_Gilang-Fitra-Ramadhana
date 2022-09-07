import 'Hewan.dart';

class Mobil {
  int kapasitas = 100;
  List<Hewan> muatan = [];

  void tambahMuatan(Hewan hewan){
    if (kapasitas > hewan.berat) {
      muatan.add(hewan);
    }else{
      print('maaf hewan \"${hewan.namaHewan}\" yang anda masukan melampaui kapasitas');
    }
  }

  void totalMuatan(){
    int totalBerat = 0;
    for (Hewan hewan in muatan) {
      totalBerat += hewan.berat;
    }
    if(totalBerat <= kapasitas){
      int sisaBerat = kapasitas - totalBerat ;
    print('Total berat semua hewan di dalam mobil $totalBerat kg , berat sisa yang bisa di masukan ke dalam mobil $sisaBerat kg');
    }else{
      print('maaf total berat di dalam mobil $totalBerat kg melampaui kapasitas mobil sebesar $kapasitas kg');
    }
  }
}



