void main() {
  // List<int> date = [21,22,23,24];
  // List<String> dayName = ['mon','sat','fri','sun'];
  // Map day = {
  //   'date' : date,
  //   'dayName' : dayName,
  // };

  // List list = [day];

  // print(list);

  /**
   * Revisi
   */

    var book = [
    ['dart',001],
    ['Kotlin', 002],
    ['java', 002]
  ];

  var order = book.map((e) {
    return {e[0]:e[1]};
  } );

  print(order);
  
}