Ya, Anda bisa menggabungkan semua perintah instalasi ke dalam satu skrip shell (bash script) sehingga Anda hanya perlu menjalankan satu perintah untuk menginstal semuanya. Berikut adalah contoh skrip lengkap yang dapat Anda gunakan:

---

### Skrip Instalasi Lengkap
Buat file skrip, misalnya install_all.sh:




---

### Cara Menggunakan Skrip
1. git clone https://github.com/daimun29/install.git
2. cd install
3. chmod +x install.sh
3. ./install_all.sh
   

---

### Apa yang Dilakukan Skrip Ini?
1. Memperbarui sistem.
2. Menginstal Node.js dan npm versi terbaru.
3. Menginstal Python3 dan pip versi terbaru.
4. Menginstal Git versi terbaru.
5. Menginstal Tmux versi terbaru dari sumber (source).
6. Membuka port 8080 menggunakan ufw.
7. Menampilkan versi dari semua paket yang diinstal untuk memverifikasi keberhasilannya.

---

### Catatan
- Pastikan Anda menjalankan skrip ini sebagai pengguna dengan hak akses sudo.
- Jika Anda menggunakan distribusi Linux selain Ubuntu/Debian, beberapa perintah mungkin perlu disesuaikan.
- Skrip ini akan menghapus file sumber Tmux setelah instalasi selesai untuk menghemat ruang.

Dengan skrip ini, Anda hanya perlu menjalankan satu perintah untuk menginstal semua kebutuhan Anda! 🚀# install
