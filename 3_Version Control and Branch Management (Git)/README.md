# Resume Materi KMFlutter – Basic Version and Branch Management (Git)

## Terdapat 3 hal poin yang saya dapatkan pada materi Git kali ini:

1.	Git merge 
git merge adalah penggabungan kode dari branch satu dengan branch lain nya, sehingga ketika membuat branch yang tidak ingin di ubah di dalam isi branch nya maka kita cukup membuat branch baru atau branch cabang untuk mengubah kode apapun yang terdapat di dalam nya setelah kita selesai membuat perubahan maka kita lakukan "git merge" pada branch Awal(bukan cabang) terhadap branch cabang , dengan demikian semua isi di dalam branch awal akan sama dengan branch cabang.

2.	Git add & Git Commit
Pada dasar nya saat kita sudah melakukan konfigurasi terhadap penyimpanan local dan remote (terhubung).
Ketika kita melakukan perubahan kode terhdap penyimpanan local , maka perubahan kode tersebut akan tersimpan di dalam yang Namanya “Working Directory” . Di dalam Working Directory ini Kode kita belum sama dengan penyimpanan di dalam remote(Github Repository) ada tahapan yang harus di lakukan agar kita bisa membuat penyimpanan remote kita sama dengan penyimapan local.
Pertama kita melakukan “Git add” para perubahan kode  kita yang terdapat pada Working Directory, setelah kita melakukan Git add maka perubahan code tersebut akan masuk kedalam yang Namanya “Staging Area”.
Kedua Ketika perubahan kode kita sudah masuk di dalam Staging Area , maka kita melakukan sebuah yang Namanya “Git Commit” supaya perubahan kode kita dapat di teruskan sebelum masuk ke dalam penyimpanan remote.
Git Commit sendiri biasanya memasukan sebuah “Komentar” untuk mengetahui perubahan kode kita yang bertujuan memberikan petunjuk maksud dari perubahan kode tersebut.

3.	Git Push
Git push adalah sebuah sintaks di dalam Git, jika kita sudah melakukan Git Commit. Proses nya dari Staging Area setelah melakukan Git Push maka penyimpana Remote sudah di perbarui dengan komentar yang sudah di lakukan pada Git Commit.
Setelah itu sistem melakukan yang Namanya Git Push untuk mendorong penyimpanan Local yang sudah memiliki perubahan kode pada sebelumnya agar penyimpanan Remote berubah dan sama dengan penyimpanan Local yang sekarang.