#!/bin/bash

# Soal 1
echo "Menampilkan nama pembeli dengan total sales paling tinggi"
awk -F, '{print $6, $17}' Sandbox.csv | sort | head -n 1 | 
awk '{print "Pembeli dengan total sales paling tinggi:", $1, $2}'
echo -e "\n"

# Soal 2
echo "Menampilkan segment yang memiliki profit paling kecil"
awk -F, '{print $20, $7}' Sandbox.csv | sort | head -n 1 | 
awk '{print "Customer segment dengan profit paling kecil:", $2, $3}'
echo -e "\n"

# Soal 3
echo "Menampilkan nama pembeli dengan total sales paling tinggi"
awk -F, '{print $20, $14}' Sandbox.csv | sort -nr | head -n 3
echo -e "\n"

# Soal 4
echo "Mengecek pesanan atas nama Adriaens"
grep "Adriaens" Sandbox.csv | awk -F',' '{print "Ditemukan purchade date", $2,"dengan Quantitiy", $18, "atas nama Adriaens"}'
