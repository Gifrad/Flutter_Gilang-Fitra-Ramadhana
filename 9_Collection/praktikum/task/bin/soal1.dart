Future<List<int>> soal1(List<int> data, int pengali ) {
return Future.delayed(Duration(seconds: 1),(){
  List<int> list = [] ;
  for(int sum = 0; sum < data.length; sum++){
   list.add(data[sum] * pengali);
  }
  return list;
});
}

void main() async {
  List<int> soal = await soal1([2,3,4,8], 2);
  print(soal);
}