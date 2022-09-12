class Matematika{
  
  hasil(x,y){}
}

class KelipatanPersekutuanTerkecil implements Matematika{
  
  @override
  hasil(x,y) {
    int i = x > y ? x : y;
    while(true){
      if(i % x == 0 && i % y == 0){
        return i;
      }
      i++;
    }
 }
}

class FaktorPersekutuanTerbesar implements Matematika{

  @override
   hasil(x, y) {
    if (y == 0) {
      return x;
    } else {
      return hasil(y, x % y);
    }
  }
}

void main(){
  Matematika kpk = KelipatanPersekutuanTerkecil();
  print(kpk.hasil(18, 20));
  Matematika fpb= FaktorPersekutuanTerbesar();
  print(fpb.hasil(18, 12));
}