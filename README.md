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

### Mode 2: Sensor Kelembapan
sensor adalah Metode yang mensimulasikan sensor kelembaban tanah untuk memantau tingkat kelembaban tanah. Metode ini beroperasi melalui beberapa keadaan, termasuk membaca level kelembaban, memeriksa ambang batas, dan proses penyiraman. Jika level kelembaban memenuhi atau melebihi ambang batas tertentu, modul mengaktifkan sinyal untuk menyiram tanaman dan menghitung jumlah penyiraman. Setelah proses penyiraman selesai, modul kembali ke keadaan awal dan siap untuk siklus berikutnya.

### Moed 3: Randomized Interval
randomizedWatering adalah Metode yang mensimulasikan sistem penyiraman tanaman secara acak. Metode ini memiliki fungsi untuk menghasilkan interval waktu penyiraman secara acak menggunakan generator angka acak. Sistem ini beroperasi melalui beberapa keadaan, mulai dari inisialisasi, mengatur waktu penyiraman, menunggu interval, hingga proses penyiraman sebenarnya. Pada akhir proses penyiraman, modul kembali ke keadaan awal dan siap untuk siklus penyiraman berikutnya.

