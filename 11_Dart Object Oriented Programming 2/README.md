# Resume Materi KMFlutter – Dart Object Oriented Programming 2

## 3 poin yang dipelajari dari materi 

1. Constructor

Constructor adalah method yang di jalankan saat pembuatan object
constructor dapat menerima parameter, tidak memiliki return
dan constructor nama sama dengan nama class.
contoh code constructor

```dart
class hewan{
    Hewan(int mata,int kaki){}
}
```

2. Inheritance

Inherintace adalah salah satu cara kemampuan membuat class baru dengan memanfaatkan class yang sudah ada , bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru.
inheritance dibuat dengan menggunakan kata kunci 'extends'
contoh code inherintace

```dart
class Hewan{
int mata = 0;
}

class kambing extends Hewan{
    mata = 2;
}
```


3. Interface

interface adalah berupa sebuah class , yang menunjukan method apa saja yang ada pada suatu class.
seluruh method wajib di override dan di gunakan dengan kata kunci 'implements'.
contoh code interface

```dart
class Hewan{
    void fungsiHewan(){}
}

class Kambing implements Hewan{
    @override
    void fungsiHewan(){}
    
}
```