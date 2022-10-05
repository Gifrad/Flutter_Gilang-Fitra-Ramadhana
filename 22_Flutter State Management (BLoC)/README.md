# Resume Materi KMFlutter – Flutter State Management (BLoC)

## 3 hal yang di pelajari

1. BLoc
<p>
BLoc (Busines Logic Component) adalah sebuat cara untuk mengatur antara User Interface dan bussines logic.
sehingga Component pada project terbagi menjadi UI interface dan BLoc
<p>

2. BLoc Provider
<p>
Bloc Provider adalah class yang di gunakan untuk mendaftarkan BLoc yang sudah kita buat agar dapat di gunakan terhadapa semua widget dengan memanggil BLoc Builder/ BLoc Listener
<p>


3. BLoC Builder & BLoc Listener
<p>
BLoc Builder & BLoc Listener adalah dua class untuk memanggil BLoc yang terdapat event dan state.
dimana kedua nya dapat di panggil di dalam sebuah widget yang kita inginkan untuk merubah state yang terdapat pada BLoc Builder & BLoC Listener.
perbedaan antara kedua nya adalah untuk BLoC Listener terdapat sebuah parameter listener , dimana parameter tersebut untuk memberikan sebuah keadaan biasanya di gunakan untuk menampilkan snackbar , AlertDialog dll. tergantung keinginan kita.
<p>