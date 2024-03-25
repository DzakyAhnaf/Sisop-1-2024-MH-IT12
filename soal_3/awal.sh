#!/bin/bash

# Download file yang diberikan oleh Yanuar
wget 'https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN' -O genshin.zip

# Unzip file
unzip genshin.zip
unzip genshin_character.zip

# Membuat folder genshin_character
mkdir -p genshin_character

# Fungsi untuk mendapatkan nama karakter dari file CSV
get_nama_karakter() {
  while IFS=, read -r nama region element senjata; do
    if [[ "$1" == "$nama" ]]; then
      echo "$region - $nama - $element - $senjata"
      return
    fi
  done <list_character.csv
}

# Memproses setiap file dalam folder genshin_character
for file_path in genshin_character/*; do
  if [ -f "$file_path" ]; then
    # Mendapatkan nama file tanpa path
    file_name=$(basename "$file_path")

    # Mendekode nama file dari hexadecimal
    nama_karakter=$(echo "$file_name" | xxd -r -p)

    # Mendapatkan nama karakter dari nama file yang telah didekode
    character_name=$(get_nama_karakter "$nama_karakter")

    if [ -n "$character_name" ]; then
      # Membuat nama baru
      nama_baru="$character_name.jpg"

      # Mendapatkan region dari nama karakter
      region=$(echo "$character_name" | cut -d' ' -f1)

      # Membuat path folder region
      region_folder="genshin_character/$region"

      # Membuat folder region jika belum ada
      mkdir -p "$region_folder"

      # Membuat path file baru
      new_path="$region_folder/$nama_baru"

      # Merubah nama file dan memindahkannya ke folder region
      mv "$file_path" "$new_path"
    fi
  fi
done

awk -F ',' 'NR > 1 {print $4}' 'list_character.csv' | sort | uniq -c

# Menghapus file yang tidak diperlukan
rm list_character.csv genshin.zip genshin_character.zip
