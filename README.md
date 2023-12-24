# Finpro-PSD---AP02
Final Project Praktikum PSD Kelompok AP02

## Automated-Watering-System

### Members:
* Aqshal Ilham Samudera      (2206829995)
* Ryan Safa Tjendana         (2206826835)
* Irfan Yusuf Khaerullah     (2206813290)
* Valentino Farish Adrian    (2206825896)

## Overview
Automated Plant watering system Merupakan sebuah alat yang dirancang untuk memberikan air kepada tanaman secara otomatis berdasarkan dua metode: metode waktu dan metode sensor kelembaban tanah.\
Metode pertama adalah berdasarkan waktu, di mana tanaman akan disiram air setiap periode waktu tertentu. Metode kedua adalah dengan menggunakan sensor kelembaban tanah yang akan mengukur tingkat kelembaban tanah. Jika kelembaban tanah turun di bawah ambang batas tertentu, sistem akan menyiram tanaman.

## Metode:
### Mode 1: Interval Waktu
wateringSystem adalah Metode yang mengkoordinasikan interval penyiraman tanaman secara deterministik. Metode ini memiliki fungsi untuk mengatur waktu penyiraman berdasarkan interval waktu yang ditentukan. Sistem ini beroperasi melalui beberapa keadaan, mulai dari inisialisasi, mengatur waktu penyiraman, menunggu interval, hingga proses penyiraman sebenarnya. Setelah proses penyiraman selesai, modul kembali ke keadaan awal dan menunggu interval waktu berikutnya untuk menyiram tanaman secara konsisten.
#### State Diagram Mode 1:
https://cdn.discordapp.com/attachments/1188127698728534067/1188502131922194524/Diagram_Tanpa_Judul.drawio_27.png?ex=659ac1dd&is=65884cdd&hm=cb672a217df3bcaeaec525d70e3d460249345027549b95218b0bc2fc1c3fe8ea&

### Mode 2: Sensor Kelembapan
sensor adalah Metode yang mensimulasikan sensor kelembaban tanah untuk memantau tingkat kelembaban tanah. Metode ini beroperasi melalui beberapa keadaan, termasuk membaca level kelembaban, memeriksa ambang batas, dan proses penyiraman. Jika level kelembaban memenuhi atau melebihi ambang batas tertentu, modul mengaktifkan sinyal untuk menyiram tanaman dan menghitung jumlah penyiraman. Setelah proses penyiraman selesai, modul kembali ke keadaan awal dan siap untuk siklus berikutnya.
#### State Diagram Mode 2:
https://cdn.discordapp.com/attachments/1188127698728534067/1188502402438021172/image.png?ex=659ac21e&is=65884d1e&hm=5ac9d70d8b8e208f842a40ac337c5450a67eb9cca38ef53f64dda61aa7ba1883&

### Mode 3: Randomized Interval
randomizedWatering adalah Metode yang mensimulasikan sistem penyiraman tanaman secara acak. Metode ini memiliki fungsi untuk menghasilkan interval waktu penyiraman secara acak menggunakan generator angka acak. Sistem ini beroperasi melalui beberapa keadaan, mulai dari inisialisasi, mengatur waktu penyiraman, menunggu interval, hingga proses penyiraman sebenarnya. Pada akhir proses penyiraman, modul kembali ke keadaan awal dan siap untuk siklus penyiraman berikutnya.
#### State Diagram Mode 3:
https://cdn.discordapp.com/attachments/1188127698728534067/1188502131922194524/Diagram_Tanpa_Judul.drawio_27.png?ex=659ac1dd&is=65884cdd&hm=cb672a217df3bcaeaec525d70e3d460249345027549b95218b0bc2fc1c3fe8ea&

## Main Component:
#### State Diagram Main Component:
https://cdn.discordapp.com/attachments/1188127698728534067/1188502132152860754/Diagram_Tanpa_Judul.drawio_28.png?ex=659ac1dd&is=65884cdd&hm=620f94dae3b0de87df75cfc8fd52c36857a92748eab96f784c064a92f1b6e809&
