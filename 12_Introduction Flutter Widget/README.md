# Resume Mater KMFlutter – Introduction Flutter Widget

## 3 poin yang dipelajari dari materi
---

1. Flutter

Flutter adalah alat pengembang antarmuka pengguna yang di gunakan untuk membuat aplikasi mobile, desktop, dan web.
Keunggulan Flutter:

- Mudah di gunakan 
- produktivitas tinggi 
- dokumentasi lengkap
- komunitas yang berkembang

Bagian dari Flutter:

- Sdk (Software Development Kit)
<p>alat untuk membantu proses pengembangan aplikasi<p>

- Framework
<p>Perlengkapan untuk membentuk aplikasi yang dapat di kostomisasi<p>

--- 

2. Statefull Widget
<p>Statefull Widget adalah Widget yang memiliki sifat dinamis atau dapat berubah - ubah. Berbeda dengan Stateless Widget. Statefull Widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris. Pada initnya Widget yang berada di Statefull Widget ini dapat berubah.</p>

Contoh Stateless Widget :

```dart
class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
---

3. Statefull Widget
<p>Statefull Widget adalah Widget yang memiliki sifat dinamis atau dapat berubah - ubah. Berbeda dengan Stateless Widget. Statefull Widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris. Pada initnya Widget yang berada di Statefull Widget ini dapat berubah.</p>

Contoh Statefull Widget

```dart
class name extends StatefulWidget {
  name({Key? key}) : super(key: key);

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```


