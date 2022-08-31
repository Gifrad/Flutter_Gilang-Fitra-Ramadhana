# Resume Materi KMFlutter – Branching – Looping – Function

3 poin yang dipelajari dari materi

---

1. Branching (percabangan)

Percabangan adalah menetukan alur program dari kondisi tertentu.

ada beberapa cara dalam melakukan percabangan yaitu : 

- if

dilakukan untuk satu kali kondisi , atau kondisi tunggal atau if tunggal.
```dart 
if(kondisi){
    // statment yang di jalankan
}
```

- if else

digunakan untuk 2 kondisi dimana ketika kondisi pertama(if) tidak terpenuhi, maka kondisi selanjutnya(else) akan otomatis tereksekusi.
```dart 
if(kondisi){
    // statment yang di jalankan
}else {
    // statment ketika kondisi tidak terpenuhi
}
```

- else if

digunakan untuk beberapa kondisi dimana else if adalah kondisi selanjutnya dari kondisi pertama(if).

```dart 
if(kondisi){
    // statment yang di jalankan
}else if(kondisi) {
    // statment ketika kondisi pertama tidak terpenuhi
}else{
    // statment ketika semua kondisi tidak terpenuhi
}
```

sebenernya tidak ada di dalam materi , tapi masih ada satu lagi percabangan yaitu _switch_ , switch ini sama dengan dengan if.
dimana switch berbeda sintaks penulisan dengan peanambahan "case" di dalam nya setelah penulisan switch.

---

2. Looping (perulangan)

Looping di dalam bahasa pemograman dart yaitu bagaimana caranya melakkukan sesutu perintah dengan cara tanpa melakukan nya berulang-ulang.
yaitu dengan cara feature Looping atau perulangan.

ada beberapa perulangan di dalam Dart yaitu :

- for

For di gunakan untuk perulangan di dalam bahasa pemograman dart, for memiliki nilai awal , kondisi yang bernilai boolean , serta perubahan yang dilakukan dari nilai awal.
sintak penulisan nya seperti ini

```dart
for(nilai awal ; kondisi boolean ; nilia perubahan dari nilai awal){
    // perintah perulangan 
}
```
- while

while sama kegunaan nya  dengan perulangan for hanya berbeda cara penulisan nya.
```dart
variable nilai awal
while(kondisi){
    // perintah perulangan 
    // nilai perubahan dari nilai awal
}
```

- do-while

do-while adalah sautu perulangan yang dilakukan minimal sekali walupun kondisi tidak terpenuhi.
layaknya while , penulisan do-while agak sedikit berbeda

```dart
do{
    //statment perulangan jika kondisi bernilai true
}while(kondisi);
```

---

3. Function 

function adalah kumpulan kode yang dapat di gunakan ulang.

untuk membuat suatu fungsi dengan cara

```dart
void namaFunction(){
    //statment yang di akan dijalankan ketika fungsi di panggil
}
```

untuk memanggi fungsi 
```dart
void main(){
    namaFunction();
}
```

Terdapat juga Function yang memilki parameter.

yaitu dapat mengirimkan data saat menjalankan function.
```dart
void namaFunction(tipeData namaParameter){
    //statment yang di akan dijalankan ketika fungsi di panggil
}

void main(){
    namaFunction(isi parameter);
}
```

Terdapat juga Function dengan Return.

Memberi nilai pada fungsi saat di panggil 

```dart
TipeDataReturn namaFunction(tipeDataParameter namaParameter){
    return // pengembalian nilai saat fungsi di panggil
}

void main(){
    tipeVariable namaVariable = namaFunction(isi parameter);
    print(namaVariabel);
}

```