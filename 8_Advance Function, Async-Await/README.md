# Resume Materi – Advance Function, Async-Await

1. Async-Await

Async-Await adalah suatu cara untuk melakukan prosess yang berjalan tanpa memperdulikan proses lain nya, biasanya saya menyebut nya background thread.
ada juga yang namanya ui thread dimana ui thread adalah proses yang berjalan secara statis.
lain hal dengan background thread (async await) dimana ketika proses ini berjalan bisa dengan menunggu proses ini selesai atau tidak menunggu proses ini selesai.
ketika kita menggunakan async tanpa await pada suatu function , maka output yang di hasilkan adalah proses async ini akan di jalankan belakangan atau tidak menunggu.
jika kita menggunakan async dengan await pada suatu function , maka proses ini akan berjalan dengan menunggu proses ini selesai baru proses selanjutnya boleh berjalan.


---
2. Anonymous Function & Arrow Function

- Anonymous function adalah sebuah fungsi yang tidak memiliki nama , dan fungsi dari anonymous function adalah sebagai data cotoh dari penulsan anonymous function
```dart
var hello = (){
    print('Hello);
}
```

- Arrow Function adalah fungsi di bahasa pemograman dart yang dapat memiliki nama atau tidak memilkik nama , berisi 1 data (dari proses maupun statis), nilia return fungsi ini diambil dari data tersebut
cara penulisan arrow function
```dart
var hello = () => print('hello');
```

---
3. List & Map

- List adalah suatu collection data secara berurutan di dalam bahasa pemograman dart yang di baca sesuai index.
dimana index ini dibaca dari angka nol[0].
untuk membuat suatu List kita menggunakan kata kunci kurung buka kurung tutup "[]"
untuk memasukan data nya kita menggunakan "List.add()", sedangkan untuk mmemanggil data nya kita menggunakan "print(List[0])" dengan menggunakan index value nya

- Map adalah suatu collection data seperti List yang menggunakan "key-value" , dimana key ini bisa kita sebut di dalam List adalah index.
untuk membuat Map dengan menggunkan kata kunci kurung kurawal "{}".
untuk memasukan data nya kita menggunakan "Map[key] = value", 
untuk memanggil data nya kita menggunakan "print(Map[key])"
