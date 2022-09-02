void main() {
  List<int> date = [21,22,23,24];
  List<String> dayName = ['mon','sat','fri','sun'];
  Map day = {
    'date' : date,
    'dayName' : dayName,
  };

  List list = [day];

  print(list);
  
}