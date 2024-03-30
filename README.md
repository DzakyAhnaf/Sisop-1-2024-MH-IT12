# Laporan Resmi Praktikum Sistem Operasi 2024 Modul-1

---

### Anggota Kelompok IT 12 :

- Muhammad Dzaky Ahnaf (5027231039)
- Adlya Isriena Aftarisya (5027231066)
- Nisrina Atiqah Dwiputri Ridzki (5027231075)

## Soal 1

Dikerjakan oleh Muhammad Dzaky Ahnaf (5027231039)

---

### Deskripsi Soal

---

Pada soal ini, kita diminta untuk membuat beberapa kesimpulan dari data penjualan lewat file “Sandbox.csv” menggunakan perintah `awk` sesuai dari modul yang telah diajarkan. 

Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk olseh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan. Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe. Cipung dan Abe menyuruhmu untuk melakukan tugas sebagai berikut:

1. Tampilkan nama pembeli dengan total sales paling tinggi
2. Tampilkan customer segment yang memiliki profit paling kecil
3. Tampilkan 3 category yang memiliki total profit paling tinggi
4. Cari purchase date dan amount (quantity) dari nama adriaens

### Download file CSV

---

Sebelum lanjut ke langkah pertama, download file yang dibutuhkan menggunakan
command `wget` seperti berikut :

```bash
wget 'https://docs.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0' -O Sandbox.csv
```

Rangkaian Command diatas menggunakan `wget` untuk mendownload file pada link gdrive
`https://docs.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0`
dan menggunakan option `-O` untuk mengubah nama file yang telah didownload menjadi `Sandbox.csv` 

### Pembeli dengan total sales paling tinggi

---

Pada poin A di soal, kita diharapkan untuk **menampilkan nama
pembeli dengan total sales paling tinggi**. Sehingga didapatkan
penyelesaian sebagai berikut:

```bash
awk -F, '{print $6, $17}' Sandbox.csv | sort | head -n 1 | awk '{print "Pembeli dengan total sales paling tinggi:", $1, $2}'
```

Pada rangkaian command diatas kita menggunakan `awk` sebagai command program untuk mengolah teks dan melakukan operasi pada file. `-F,` menetapkan koma (,) sebagai field separator (pemisah kolom). Lalu menggunakan print `{print $6, $17}`untuk mencetak nilai dari kolom ke-6 (Pembeli) dan ke-17 (Total sales) dari setiap baris dan `Sandbox.csv` adalah nama file CSV yang akan diproses.

Selanjutnya tambahkan pipa `(|)` untuk meneruskan output dari perintah sebelumnya ke perintah berikutnya. `sort` akan mengurutkan baris-baris dari output sebelumnya secara alfanumerik dan `head -n 1` akan mengambil 1 baris pertama dari output yang sudah diurutkan. Gunakan `awk` lagi untuk `'{print "Pembeli dengan total sales paling tinggi:"` dan mencetak string “Customer segment dengan profit paling kecil:” diikuti
dengan `, $1, $2}'`yaitu nilai dari kolom ke-1 dan ke-2 dari baris yang tersisa (yaitu baris dengan nilai kombinasi kolom ke-6 dan ke-17s terendah).

### Customer segment dengan profit paling kecil

---

Selanjutnya, pada poin B, kita diharapkan untuk **menampilkan customer
segment yang memiliki profit paling kecil**. Sehingga didapatkan
penyelesaian sebagai berikut :

```bash
awk -F, '{print $20, $7}' Sandbox.csv | sort | head -n 1 | awk '{print "Customer segment dengan profit paling kecil:", $2, $3}'
```

Pada rangkaian command diatas kita menggunakan `awk` sebagai command untuk mengolah teks dan melakukan operasi pada file. `-F,` menetapkan koma (,) sebagai field separator (pemisah kolom). Lalu menggunakan print `{print $20, $7}` untuk mencetak nilai dari kolom ke-20 (Total Profit) dan ke-7 (Segment) dari setiap baris dan `Sandbox.csv` adalah nama file CSV yang akan diproses.

Selanjutnya tambahkan pipa `(|)` untuk meneruskan output dari perintah sebelumnya ke perintah berikutnya. `sort` akan mengurutkan baris-baris dari output sebelumnya secara alfanumerik dan `head -n 1` akan mengambil 1 baris pertama dari output yang
sudah diurutkan. Gunakan `awk` lagi untuk `'{print "Customer segment dengan profit paling kecil:"` dan mencetak string “Customer segment dengan profit paling kecil:” diikuti
dengan `, $2, $3}'`yaitu nilai dari kolom ke-2 dan ke-3 dari baris yang tersisa (yaitu baris dengan nilai kombinasi kolom ke-20 dan ke-7 terendah).

### Kategori dengan Total Profit Paling Tinggi

---

Ketiga, pada poin C, kita diminta untuk menampilkan 3 category yang memiliki total profit paling tinggi. Didapatkan penyelesaian sebagai berikut :

```bash
awk -F, '{print $20, $14}' Sandbox.csv | sort -nr | head -n 3
```

Kita menggunakan `awk` untuk mengolah teks dan melakukan operasi pada file, dengan `-F,` menetapkan koma (,) sebagai field separator. `{print $20, $14}` mencetak nilai dari kolom
ke-20 (Profit) dan ke-14 (Category) dari setiap baris dari file `Sandbox.csv`. Selanjutnya, Pipa`(|)` digunakan untuk meneruskan output dari perintah sebelumnya ke perintah
berikutnya.

Lalu mengurutkan baris 20 atau `$20` dengan menggunakan `sort -nr` yang mengurutkan baris-baris secara numerik descending (dari nilai tertinggi ke terendah). Opsi `-n` menyatakan pengurutan numerik dan `-r` untuk descending (terbalik). Terakhir, memunculkan hanya 3 teratas dari operasi yang telah dijalankan sebelumnya menggunakan `head -n 3`

### Mencari Purchase Date dan Amount (quantity) atas nama Adriaens

---

Yang terakhir, kita diminta untuk mengecek atas nama Adriaens ada dengan mencari purchase date dan amount (quantity) dari nama Adriaens. Didapatkan penyelesaian sebagai berikut :

```bash
grep "Adriaens" Sandbox.csv | awk -F',' '{print "Ditemukan purchade date", $2,"dengan Quantitiy", $18, "atas nama Adriaens"}'
```

Pertama, kita menggunakan `grep` sebagai utilitas untuk mencari pola teks dalam file, `"Adriaens"` adalah pola teks yang akan dicari dalam file `Sandbox.csv`. Command ini akan
menampilkan semua baris dari file CSV yang mengandung teks “Adriaens”. Pipa `(|)` digunakan untuk meneruskan output dari perintah sebelumnya ke perintah `awk` berikutnya. `-F','` menetapkan koma (,) sebagai field separator.

Lalu, `{print "Ditemukan purchase date", $2,"dengan Quantity", $18, "atas nama Adriaens"}` akan mencetak sebuah kalimat dengan menggabungkan teks statis dan nilai
dari kolom ke-2 (Purchase date) dan kolom ke-18 (Quantity) untuk setiap baris yang mengandung “Adriaens”.
### Output
---
![alt text](<Screenshot from 2024-03-30 21-21-52.png>)
## Soal 2

---

Dikerjakan oleh Nisrina Atiqah Dwiputri Ridzki (5027231075)

### Deskripsi Soal
Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya.

a. Buatlah 2 program yaitu login.sh dan register.sh

b. Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

c. Username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin 

d. Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi

+ Password tersebut harus di encrypt menggunakan base64
    
+ Password yang dibuat harus lebih dari 8 karakter
    
+ Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
    
+ Harus terdapat paling sedikit 1 angka 
    
e. Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.

f. Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.

g. Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password.

h. Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan   keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin. 

i. Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit.

j. Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.

  Format: [date] [type] [message]
  
  Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
  
  Ex:
  
[23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully

[23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

### Penyelesaian
  - Pertama, kita membuat program register dimulai dari fungsi untuk menyimpan email
    ```bash
    echo "Enter your email!"
    read email
    if grep -q "$email" users.txt; then   #cek apakah email sudah tersimpan atau belum
        echo "Email already exist. Use another email!"
        log "REGISTER FAILED" "Failed to register user with email $email: Email already exists"
        exit 1
    fi

 - Apabila email mengandung kata admin maka masuk user admin, sementara apabila tidak ada masuk ke user biasa.
```bash
    if [[ "$email" == *"admin"* ]]; then
    role="admin"   #jika email terdapat kata admin maka termasuk akun admin
    else
        role="user"  #jika tidak, temasuk ke user biasa
    fi
    echo " "
```

-  Lanjut input untuk username, security question dan answer nya
    ```bash
    echo "Enter your username!"
    read username
    echo " "

    echo "Enter a security question!"
    read question
    echo " "

    echo "Enter the security answer"
    read answer
    echo " "


- Setelah itu, kita input fungsi password dengan ketentuan yaitu harus di encrypt menggunakan base64, harus lebih dari 8 karakter harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil, harus terdapat paling sedikit 1 angka.

    ```bash
    echo "Enter your password"
    read -s password
    if [[ ${#password} -lt 8 || ! "$password" =~ [A-Z] || ! "$password" =~ [a-z] || ! "$password" =~ [0-9] ]]; then   #cek kriteria password
        echo "Password doesn't meet the criteria. Try again!!!"
        exit 1
    fi

    encrypted_password=$(echo "$password" | base64)
    echo " "
    ```
- Email, username, security question, security answer, dan password yang sudah diinput tadi disimpan dengan menggunakan fungsi. 
  ```bash
    echo "$email,$username,$question,$answer,$encrypted_password,$role" >> users.txt
    echo "REGISTER SUCCESS!"

  
- Setelah program register.sh sudah selesai, buat program login.sh. Dimulai dari menu login. Buat fungsi untuk input email dan password. 
  ```bash
  login() {
    echo "Enter your email"
    read email
    
    if ! grep -q "^$email|" users.txt; then
        echo -e "Email not found. Please register first."
        return 1
  else  #apabila benar maka muncul untuk memasukkan password
    echo "Enter the password"
    read -s password

  
- Masuk ke fungsi password, menggunakan ``grep -q`` untuk mencari apakah password sesuai atau belum. Jika enkripsi password termasuk admin maka akan langsung diarahkan ke menu admin. Laporan berhasil login akan disimpan ke auth.log dengan detail hari, bulan, tahun, jam, menit, detik terjadinya.
  ```bash
  user_check=$(grep "^$email:" users.txt | cut -d '|' -f 2)
    encrypted_password=$(echo $password | base64)
    if grep -q "^$user_check:.*:.*:.*:$encrypted_password" users.txt; then
	echo -e "Login Successful"
	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$user_check] logged in successfully" >> auth.log
        admin_menu
`
  - Apabila tidak termasuk email tidak termasuk admin maka diarahkan ke menu member. Laporan berhasil login akan disimpan ke auth.log dengan detail hari, bulan, tahun, jam, menit, detik terjadinya.
  
  ```bash
elif grep -q "^$user_check:.*:.*:.*:$encrypted_password" users.txt; then
    	echo -e "Login Successful"
        echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$user_check] logged in successfully" >> auth.log
    	member
```

- Dan apabila password tidak masuk keduanya maka akan keluar "Password incorrect. Enter again". Laporan gagal login akan disimpan ke auth.log dengan detail hari, bulan, tahun, jam, menit, detik terjadinya.
```bash
    else
    	echo -e "Password incorrect. Enter again"
   	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN FAILED] ERROR Failed login attempt on user with email [$email]" >> auth.log
   	return 1
     fi
  fi
}
```

- Beralih ke menu forgot password, menggunakan ``grep -q`` untuk mencari apakah ada di users.txt.
  ```bash
  forgot_password() {
    	echo "Enter your email"
    	read -r email
    	
    if grep -q "^$email:" users.txt; then
	echo -e "Email not found. Please register first."
        return 1
  ```

- Apabila email tercatat maka akan diproses menggunakan fungsi ``cut -d`` untuk memotong bagian dari setiap baris berdasarkan dilimiter dan fungsi ``-f 3`` untuk meminta cut mengambil bagian ketiga.
  ```bash
    else
    	security_question=$(grep "^$email:" users.txt | cut -d '|' -f 3)
        echo "Security Question : $security_question"
 ``

 - Input jawaban dari pertanyaan keamanaan dan cek kebenarannya, apabila salah maka keluar "Answer incorrect. Try Again"
   ```bash
   echo "Enter your answer:"
    	read -r answer_check
    if ! grep -q "^$email:.*:.*:answer_check" users.txt; then
        echo "Answer Incorrect. Try again"
        return 1
  
- Jika benar, maka akan mengecek enkripsi password dan akan memunculkan password dari email tersebut.
  ```bash
  else
    	encrypted_password=$(grep "^$email:" users.txt | cut -d '|' -f 5)
	password_check=$(echo $encrypted_password | base 64 -d)
    	echo "Your password is: $password_check"
    fi
  fi
  }
  
- Selanjutnya, mengingat di fungsi apabila termasuk user biasa maka masuk ke menu member dan akan memunculkan "Welcome Member".
  ```bash
  member() {
	echo "Welcome Member!"
  }
  
- Untuk user yang termasuk admin, maka akan masuk ke menu admin. Terdapat 4 pilihan yaitu add user, edit user, delete user, dan logout dengan menggunakan fungsi case.
  ```bash
  admin_menu() {
    while true; do
    echo "1. Add User"
    echo "2. Edit User"
    echo "3. Delete User"
    echo -e "4. Logout"
    
    echo "Choose Menu: "
    read admin_choice

    case $admin_choice in
        1) add_user ;;
        2) edit_user ;;
        3) delete_user ;;
        4) logout ;;
        *) echo "NOT VALID" ;;
    esac 
  done
  }
  
- Untuk fungsi add user, cek email apakah ada di users.txt dengan grep -q dan apabila tidak maka email tidak valid. Laporan gagal login akan disimpan ke auth.log dengan detail hari, bulan, tahun, jam, menit, detik terjadinya.
  ```bash
  add_user() {
    echo "Enter new email"
    read new_email
    if grep -q "^$new_email" users.txt; then
        echo "User with this email already exists. Please add another email."
        echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN FAILED] ERROR Failed register attempt on user with email [$email] >> auth.log
        return
    fi
    
    	if [[$email != "*@*.*"]]; then
    	echo -e "Email not valid"
    	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN FAILED] ERROR Failed login attempt on user with email [$email] >> auth.log
    	echo " "
   	return
   fi
  
- Masukkan username baru, pertanyaan keamanan dan jawabannya, serta password.
  ```bash
  echo "Enter new username"
    read new_username
    echo " "

    echo "Enter security question:"
    read security_question
    echo " "

    echo "Enter the security answer:"
    read new_answer
    echo " "
 
    echo "Enter password"
    read -s new_password
    echo " "

    encrypted_password=$(echo $new_password | base64)
  
- Simpan data baru tadi ke users.txt dengan menggunakan fungsi dibawah ini. Laporan login akan disimpan ke auth.log dengan detail hari, bulan, tahun, jam, menit, detik terjadinya.
  ```bash
  echo "$new_email|$new_username|$security_question|$new_answer|$encrypted_password" >> users.txt
    echo -e "NEW USER ADDED"
    echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$new_username] logined successfully" >> auth.log
  }

- Untuk fungsi add user, pertama cek email dengan ``grep -q`` apabila tidak maka akan muncul email not found.
  ```bash
  edit_user() {
    echo "Enter the email to edit"
    read edit_email
    if ! grep -q "^$edit_email" users.txt; then
        echo "User with this email not found."
        echo " "
        return
  
- Jika ada, maka bisa untuk mengedit username, pertanyaan keamanan dan jawabannya, serta password. Fungsi yang digunakan tidak lain sama dengan fungsi add user.
  ```bash
  else
    echo "Enter new username"
    read edit_username
    echo " "

    echo "Enter new security question"
    read edit_question
    echo " "

    echo "Enter new security answer"
    read edit_answer
    echo " "

    echo "Enter new password"
    read -s edit_password
    echo " "

    newencrypted_password=$(echo $edit_password | base64)
  
- Simpan hasil edit user kedalam fungsi dibawah ini
  ```bash
  sed -i "/^$edit_email:/c\\$edit_email|$edit_username|$edit_question|$edit_answer|$encrypted_password" users.txt
    echo -e "USER EDIT UPDATED"
  fi
  }
  
- Untuk delete user, kita masukkan email dan cek kebenarannya. Apabila tidak ada maka akan muncul "User with this email not found".
  ```bash
  delete_user() {
    echo "Enter the email of user to delete"
    read delete_email
    if ! grep -q "^$delete_email" users.txt; then
        echo "User with this email not found."
        echo " "
        return
- Apabila email benar, maka program akan menghapus user dengan fungsi ``/^$delete_email/:d`` :
  ```bash
  else
    sed -i "/^$delete_email/:d" users.txt
    echo -e "USER DELETED SUCCESSFULLY"
  fi
  }
  
- Terakhir untuk fungsi logout maka akan menyetak "Logout Successfully" dengan fungsi ``exit 1`` untuk otomatis keluar dari program.
  ```bash
  logout() {
    echo "Logout Successfully!"
    exit 1
  }


- Kembali ke main yaitu berisi print untuk welcome login system, menu login dan forgot password. Menggunakan fungsi case untuk menjalankan menu login dan forgot password.
  ```bash
  echo "=== Welcome to Login System ==="
  echo " "
  echo "1. Login"
  echo "2. Forgot Password"
  echo " "
  echo "Choose Menu: "
  read choice

  case $choice in
    1) login ;;
    2) forgot_password ;;
    *) echo "NOT VALID" ;;
  esac

  date + %d%m%y %H:%M:%S

## Revisi
- Untuk menu login di bagian input password selalu password incorrect, revisi kodenya seharusnya menggunakan
  ```bash
  else
        echo "Enter the password"
        read -s password
    
        user_check=$(grep "^$email:" users.txt | cut -d '|' -f 2)
        encrypted_password=$(echo $password | base64)
        stored_password=$(grep "^$email:" users.txt | cut -d '|' -f 5)
        
        if [[ "$encrypted_password" != "$stored_password" ]]; then
            echo -e "Password incorrect. Enter again"
            echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN FAILED] ERROR Failed login attempt on user with email [$email]" >> auth.log
            return 1
        fi
    fi
  
- Untuk menu forgot password di bagian security question tidak muncul, security answer selalu salah. Maka dari itu, revisi kodenya
  ```bash
    else
        security_question=$(grep "^$email:" users.txt | cut -d '|' -f 3)
        echo "Security Question : $security_question"
        
        echo "Enter your answer:"
        read -r answer_check
        
        stored_answer=$(grep "^$email:" users.txt | cut -d '|' -f 4)
        if [[ "$answer_check" != "$stored_answer" ]]; then
            echo "Answer Incorrect. Try again"
            return 1
        else
            encrypted_password=$(grep "^$email:" users.txt | cut -d '|' -f 5)
            password_check=$(echo $encrypted_password | base64 -d)
            echo "Your password is: $password_check"
        fi
    fi
- Mengkategorikan user termasuk user admin atau user biasa
  ```bash
  echo -e "Login Successful"
    echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$user_check] logged in successfully" >> auth.log
    
    if [[ "$user_role" == "admin" ]]; then
        admin_menu
    else
        member
    fi
   

### Kendala
- Bagian menu admin masih tidak bisa muncul (add user, edit user, delete user)

### Hasil Output

![alt text](image-2.png)

![alt text](image-6.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

## Soal 3

Dikerjakan oleh Muhammad Dzaky Ahnaf (5027231039)

---


### Deskripsi Soal
Inti pada soal ini terdapat 2 tahap pengerjaan, yaitu mendecode nama sebuah file dan menemukan sebuah secret picture dalam file txt. Script awal.sh digunakan untuk tahap mendecode dan script search.sh digunakan untuk mencari the secret picture.

Pada tahap pertama, kita diberikan file dan diminta unutk membuat script bernama ```awal.sh``` untuk mendownload dan unzip file tersebut. Selanjutnya, kita diminta mendecode setiap nama file yang terenkripsi dengan hex dan merename setiap file berdasarkan file ```list_character.csv``` lalu mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter dengan format : ```Region - Nama - Elemen - Senjata.jpg```. Setelahnya, kita menampilkan output jumlah pengguna untuk setiap senjata yang ada di folder ```genshin_character``` dengan format: [Nama Senjata] : [jumlah] dan  menghapus file - file yang tidak digunakan, yaitu ```genshin_character.zip```, ```list_character.csv```, dan ```genshin.zip```

Tahap selanjutnya, kita membuat script baru bernama ```search.sh``` untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string url. Setelah mendapatkan url yang dicari, langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.
Dalam prosesnya, setiap kali melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang diinginkan, maka akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, kita melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar

### Penyelesaian
awal.sh 
```bash awal.sh
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

```
search.sh
```bash
#!/bin/bash

while true
do
    for image in genshin_character/*.jpg
    do
        steghide extract -sf "$image" -p "" -xf output.txt >/dev/null 2>&1
        if [ -f output.txt ]
        then
            decoded=$(xxd -p -r output.txt)
            if [[ $decoded == *"url"* ]]
            then
                echo "Found the secret image! URL: $decoded"
                rm output.txt
                exit
            else
                echo "Not the secret image, removing output.txt"
                rm output.txt
            fi
        fi
        echo "$(date +'%d/%m/%y %H:%M:%S') [NOT FOUND] $image" >> image.log
    done
    sleep 1
done
```
### Penjelasan
---
### awal.sh
---
1. ```wget 'https://...``` : Perintah ini mengunduh file ```genshin.zip``` dari URL yang diberikan dan menyimpannya dengan nama ```genshin.zip```.
2. ```unzip genshin.zip```: Perintah ini mengekstrak isi dari file ```genshin.zip```.
3. ```unzip genshin_character.zip```: Perintah ini mengekstrak isi dari file ```genshin_character.zip``` yang berada di dalam ```genshin.zip```.
4. ```mkdir -p genshin_character```: Perintah ini membuat direktori ```genshin_character``` jika belum ada.
5. ```get_nama_karakter() { ... }```: Ini adalah definisi fungsi ```get_nama_karakter``` yang akan mencari nama karakter dari file ```list_character.csv``` berdasarkan nama yang diberikan. Fungsi ini membaca setiap baris dari ```list_character.csv``` dan mencari kecocokan dengan nama yang diberikan. Jika ditemukan, fungsi akan mengembalikan nama karakter dalam format ```"region - nama - element - senjata"```.
6. ```for file_path in genshin_character/*; do ... done```: Perulangan ini mengiterasi setiap file di dalam direktori ```genshin_character```.
7. ```if [ -f "$file_path" ]; then ... fi```: Kondisi ini memastikan bahwa ```$file_path``` adalah sebuah file reguler, bukan direktori atau file spesial lainnya.
8. ```file_name=$(basename "$file_path")```: Perintah ini mendapatkan nama file dari ```$file_path``` tanpa path.
9. ```nama_karakter=$(echo "$file_name" | xxd -r -p)```: Perintah ini mendekode nama file dari representasi heksadesimal ke string menggunakan ```xxd -r -p```.
10. ```character_name=$(get_nama_karakter "$nama_karakter")```: Perintah ini memanggil fungsi ```get_nama_karakter``` dengan ```$nama_karakter``` sebagai argumen, dan hasilnya disimpan dalam variabel ```$character_name```.
11. ```if [ -n "$character_name" ]; then ... fi```: Kondisi ini dijalankan jika ```$character_name``` tidak kosong (artinya nama karakter ditemukan dalam ```list_character.csv```).
12. ```nama_baru="$character_name.jpg"```: Perintah ini membuat nama file baru dengan format ```"region - nama - element - senjata.jpg"```.
13. ```region=$(echo "$character_name" | cut -d' ' -f1)```: Perintah ini mengekstrak region dari ```$character_name``` dengan memisahkan string pada spasi dan mengambil bagian pertama.
14. ```region_folder="genshin_character/$region"```: Perintah ini membuat path direktori untuk region tersebut.
15. ```mkdir -p "$region_folder"```: Perintah ini membuat direktori untuk region jika belum ada.
16. ```new_path="$region_folder/$nama_baru"```: Perintah ini membuat path file baru dengan nama baru di dalam direktori region.
17. ```mv "$file_path" "$new_path"```: Perintah ini memindahkan file dari ```$file_path``` ke ```$new_path``` (dengan nama baru di dalam direktori region).
18. ```awk -F ',' 'NR > 1 {print $4}' 'list_character.csv' | sort | uniq -c```: Perintah ini mengambil kolom keempat (senjata) dari ```list_character.csv``` (kecuali baris pertama), mengurutkannya, dan menghitung jumlah entri unik untuk setiap senjata.
19. ```rm list_character.csv genshin.zip genshin_character.zip```: Perintah ini menghapus file ```list_character.csv```, ```genshin.zip```, dan ```genshin_character.zip``` yang tidak diperlukan lagi.
### Hasil Output
Hasil ```Tree``` dari Program ```awal.sh```

![alt text](<Screenshot from 2024-03-30 19-04-15.png>)

Hasil program ```awal.sh```

![alt text](<Screenshot from 2024-03-30 19-02-47.png>)

![alt text](<Screenshot from 2024-03-30 19-02-39.png>)

### search.sh

---
1. ```while true; do ... done``` adalah loop tak terbatas yang akan terus berjalan sampai dihentikan secara eksplisit (misalnya dengan exit atau Ctrl+C).
2. ```for image in genshin_character/*/*.jpg; do ... done``` adalah loop yang akan mengiterasi setiap file JPG di dalam folder ```genshin_character``` dan subfolder-subfoldernya.
3. ```secret_file=$(steghide extract -sf "$image" -p "" 2>/dev/null)``` Perintah ini menggunakan ```steghide``` untuk mengekstrak file tersembunyi dari gambar ```$image``` dengan menggunakan kata sandi kosong (```-p ""```). Output dari perintah ini disimpan dalam variabel ```secret_file```. ```2>/dev/null``` digunakan untuk menekan output error.
4. ```if [ -n "$secret_file" ]; then ... fi``` adalah kondisi yang akan dijalankan jika ```secret_file``` tidak kosong (artinya file tersembunyi ditemukan).
5. ```hex_string=$(cat "$secret_file" | tr -d '\n')```: Membaca isi dari ```secret_file``` dan menghapus semua karakter newline (```\n```) dari isinya, kemudian menyimpan hasilnya dalam variabel ```hex_string```.
6. ```decoded_string=$(echo -n "$hex_string" | xxd -r -p)```: Mendekode ```hex_string``` dari representasi heksadesimal menjadi string menggunakan ```xxd -r -p```, dan menyimpan hasilnya dalam variabel ```decoded_string```.
7. ```if [[ "$decoded_string" == http* ]]; then ... fi``` adalah kondisi yang akan dijalankan jika ```decoded_string``` dimulai dengan ```http``` (artinya merupakan URL).
8. ```url="$decoded_string"```: Menyimpan ```decoded_string``` dalam variabel ```url```.
9. ```wget "$url"```: Mengunduh file dari URL yang disimpan dalam ```url``` menggunakan ```wget```.
10. ```exit 0```: Keluar dari script dengan status sukses (0) setelah menemukan URL dan mengunduhnya.
11. ```else ... fi``` akan dijalankan jika ```decoded_string``` bukan URL. Di sini, ```secret_file``` dihapus dengan ```rm "$secret_file"```.
12. ```log_entry="..."```: Menyusun string log entri dengan format yang diminta, baik untuk kasus "FOUND" maupun "NOT FOUND".
13. ```echo "$log_entry" >> image.log```: Menambahkan log_entry ke file image.log.
14. ```sleep 1```: Menunggu 1 detik sebelum melanjutkan ke gambar berikutnya.

### Hasil Output
Hasil program ```search.sh```

![alt text](<Screenshot from 2024-03-30 18-55-28.png>)

### Kendala
Masih belum menemukan secret picture dari hasil dekripsi setiap file.txt  yang dimaksud pada soal alias ```NOT FOUND```

![alt text](<Screenshot from 2024-03-30 18-55-10.png>)

## Soal 4

---

Dikerjakan oleh Adlya Isriena Aftarisya (5027231066)

### Deskripsi Soal

Stitch adalah seorang streamer. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer. 

Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/

### Mencatat Metrics ke dalam file log etrics_{YmdHms}.log

---

sebelum itu, buat file script dengan nama minute_log.sh untuk meletakkan script-script yang akan digunakan untuk mencari metrics RAM dan disk. Selanjutnya, jika dilihat dari contoh, file log akan terdiri dari 3 variabel, yaitu memory, swap, dan path. untuk mendapatkan metriks dari RAM (memory dan swap) dan metrics dari disk (path) perlu menggunakan command seperti berikut:

```bash
mem=$(free -m | grep Mem | awk '{print $2,",",$3,",",$4,",",$5,",",$6,",",$7}')
swap=$(free -m | grep Swap | awk '{print $2,",",$3,",",$4}')
path=$(du -sh ~ | awk '{print $2,",",$1}')
```

- `mem=$(…)` untuk mendeklarasikan suatu variabel
- `free -m` dan `du -sh <target_path>` digunakan untuk mencari metrics RAM dan disk
- untuk melanjutkan ke command selanjutnya, kita perlu menyalurkan output dari command sebelumnya menjadi input untuk command selanjutnya menggunakan command pipe `|`
- `grep` digunakan untuk mencari teks tertentu dari output metrics `free -m` dan `du -sh`
- `awk` digunakan untuk menyaring teks hanya pada kolom tertentu

selanjutnya cetak hasil dari variabel ini ke dalam file metrics_{YmdHms}.log pada directory log (pastikan folder log sudah dibuat sebelumnya)

```bash
timestamp=$(date '+%Y%m%d%H%M%S')
echo mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size >> log/metrics_$timestamp.log
echo $mem,$swap,$path >> log/metrics_$timestamp.log
```

- `date ‘+%Y%m%d%H%M%S’` digunakan untuk membuat tanggal dengan format tahun, bulan, hari, jam, menit, detik
- `echo` digunakan untuk mencetak teks atau variabel, lalu hasilnya akan diletakkan pada file log/metrics_$timestamp.log menggunakan command `>>`

### Ubah Permission agar hanya user yang dapat membaca

```bash
chmod 600 /home/{user}/log/metrics_$timestamp.log
```

- `chmod` digunakan untuk mengganti permission suatu file atau folder menjadi 600 (hanya user yang dapat membaca dan mengganti)

### Isi file script minute_log.sh

```bash
#!/bin/sh
#* * * * * minute_log_sh

timestamp=$(date '+%Y%m%d%H%M%S')
echo mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size >> log/metrics_$timestamp.log

mem=$(free -m | grep Mem | awk '{print $2,",",$3,",",$4,",",$5,",",$6,",",$7}')
swap=$(free -m | grep Swap | awk '{print $2,",",$3,",",$4}')
path=$(du -sh ~ | awk '{print $2,",",$1}')

echo $mem,$swap,$path >> log/metrics_$timestamp.log

chmod 600 /home/tarisa/log/metrics_$timestamp.log
```

### Output dari file script minute_log.sh

![alt text](image.png)

---

### Agregasi file log ke **satuan jam**

---

Pada bagian ini, soal meminta untuk membuat agregasi file log ke satuan jam**.** Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. File hasil agregasi metrics_agg_2024032015.log disimpan dengan format metrics_agg_{YmdH}.log ****

### Langkah penyelesaian

---

```bash
timestamp=$(date '+%Y%m%d%H')
hourago=$(date '+%Y%m%d%H' -d "1 hour ago")
echo "type,mem_count,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_count,swap_used,swap_free,path,path_size" >> log/metrics_agg_$timestamp.log
```

pertama-tama, deklarasi variabel timestamp dan hourago terlebih dahulu. Variabel `timestamp` akan berguna untuk format penamaan file hasil agregasi log, sedangkan variabel `hourago` dibuat agar agregasi dilakukan dari satu jam yang lalu sampai dengan waktu generate file. Kemudian echo teks agar sesuai dengan output file log yang diinginkan soal.

```bash
awk -F ',' 'BEGIN {
        for (i = 0; i <11; i++) {
            min[i] = 999999
            max[i] = 0
            avg[i] = 0
        }
        count=0
        path = ""
        typeavg=""
        typemin=""
        typemax=""
    } 
NR%2 == 0 {
        for (i = 1; i <= 11; i++) {
            path = $10
            value = $i
            if (i != 10) {
                if (i == 11) {
                    type = substr($i,length($i))
                    if (type == "K") {
                        avg[i-1] += $i * 1024
                        value = $i * 1024
                    } else if (type == "M") {
                        avg[i-1] += $i * 1024 * 1024
                        value = $i * 1024 * 1024
                    }
                } else {
                    avg[i-1] += $i
                }
                if (value < min[i-1]) {
                    min[i-1] = value
                }
                if (value > max[i-1]) {
                    max[i-1] = value
                }
            }
            count++
        }
    } END {
        for (i = 0; i < 11; i++) {
            avg[i] = avg[i]/count
            if (i == 10) {
                if (avg[i]/1024 > 1) {
                    typeavg = "K"
                    avg[i] = avg[i]/1024
                    if (avg[i]/1024 > 1) {
                        typeavg = "M"
                        avg[i] = avg[i]/1024
                    }
                }
                if (min[i]/1024 > 1) {
                    typemin="K"
                    min[i] = min[i]/1024
                    if (min[i]/1024 > 1) {
                        typemin = "M"
                        min[i] = min[i]/1024
                    }
                }
                if (max[i]/1024 > 1) {
                    typemax="K"
                    max[i] = max[i]/1024
                    if (max[i]/1024 > 1) {
                        typemax = "M"
                        max[i] = max[i]/1024
                    }
                }
            }
        }
        printf("minimum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            min[0], min[1], min[2], min[3], min[4], min[5], min[6], min[7], min[8], path, min[10],typemin);
        printf("maximum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            max[0], max[1], max[2], max[3], max[4], max[5], max[6], max[7], max[8], path, max[10],typemax);
        printf("average,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%s,%.1f,%s\n", 
            avg[0], avg[1], avg[2], avg[3], avg[4], avg[5], avg[6], avg[7], avg[8], path, avg[10],typeavg);
    }' log/metrics_$hourago*.log >> log/metrics_agg_$timestamp.log
    
    chmod 600 log/metrics_agg_$timestamp.log
```

selanjutnya, lakukan `awk` untuk membaca log/metrics_$hourago.log kemudian lakukan kalkulasi di dalamnya:

- BEGIN: bagian ini digunakan untuk mendeklarasikan variabel kosongyang akan dipakai saat kalkulasi nilai maximum, minimum, dan average nanti
- `NR % 2 == 0` bagian ini hanya membaca baris genap saja yaitu baris ke dua, bagian ini dilakukan dengan looping untuk mencari nilai dari setiap kolom dan mengisi variabel variabel kosong yang sudah dideklarasikan di bagian BEGIN sebelumnya
- END: bagian ini adalah bagian terakhir dari proses kalkulasi, nilai-nilai variabel yang sudah didapatkan dari proses sebelumnya akan dihitung di bagian ini dan di cetak dengan `printf`
- `>>` log/metrics_agg_$timestamp.log : hasil dari kalkulasi dan printf akan dimasukkan ke dalam file log/metrics_agg_$timestamp.log
- `chmod 600` log/metrics_agg_$timestamp.log digunakan untuk mengganti permission suatu file atau folder menjadi 600 (hanya user yang dapat membaca dan mengganti)

### isi file script aggregate_minutes_to_hourly_log.sh

```bash
#!/bin/bash
#0 * * * * aggregate_minutes_to_hourly_log.sh

timestamp=$(date '+%Y%m%d%H')
hourago=$(date '+%Y%m%d%H' -d "1 hour ago")
echo "type,mem_count,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_count,swap_used,swap_free,path,path_size" >> log/metrics_agg_$timestamp.log

#calculate max, min, and avg values
awk -F ',' 'BEGIN {
        for (i = 0; i <11; i++) {
            min[i] = 999999
            max[i] = 0
            avg[i] = 0
        }
        count=0
        path = ""
        typeavg=""
        typemin=""
        typemax=""
    } 
NR%2 == 0 {
        for (i = 1; i <= 11; i++) {
            path = $10
            value = $i
            if (i != 10) {
                if (i == 11) {
                    type = substr($i,length($i))
                    if (type == "K") {
                        avg[i-1] += $i * 1024
                        value = $i * 1024
                    } else if (type == "M") {
                        avg[i-1] += $i * 1024 * 1024
                        value = $i * 1024 * 1024
                    }
                } else {
                    avg[i-1] += $i
                }
                if (value < min[i-1]) {
                    min[i-1] = value
                }
                if (value > max[i-1]) {
                    max[i-1] = value
                }
            }
            count++
        }
    } END {
        for (i = 0; i < 11; i++) {
            avg[i] = avg[i]/count
            if (i == 10) {
                if (avg[i]/1024 > 1) {
                    typeavg = "K"
                    avg[i] = avg[i]/1024
                    if (avg[i]/1024 > 1) {
                        typeavg = "M"
                        avg[i] = avg[i]/1024
                    }
                }
                if (min[i]/1024 > 1) {
                    typemin="K"
                    min[i] = min[i]/1024
                    if (min[i]/1024 > 1) {
                        typemin = "M"
                        min[i] = min[i]/1024
                    }
                }
                if (max[i]/1024 > 1) {
                    typemax="K"
                    max[i] = max[i]/1024
                    if (max[i]/1024 > 1) {
                        typemax = "M"
                        max[i] = max[i]/1024
                    }
                }
            }
        }
        printf("minimum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            min[0], min[1], min[2], min[3], min[4], min[5], min[6], min[7], min[8], path, min[10],typemin);
        printf("maximum,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%d,%s\n", 
            max[0], max[1], max[2], max[3], max[4], max[5], max[6], max[7], max[8], path, max[10],typemax);
        printf("average,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%.1f,%s,%.1f,%s\n", 
            avg[0], avg[1], avg[2], avg[3], avg[4], avg[5], avg[6], avg[7], avg[8], path, avg[10],typeavg);
    }' log/metrics_$hourago*.log >> log/metrics_agg_$timestamp.log
   
chmod 600 log/metrics_agg_$timestamp.log
```

### Output dari file script aggregate_minutes_to_hourly_log.sh

![alt text](image-1.png)

---

### Mengatur cron jobs

setelah file script .sh sudah berhasil dibuat semua, lakukan cron jobs agar file script dapat berjalan secara otomatis

1. `crontab -e` 
2. edit isi crontab seperti ini:
    
    ```bash
    * * * * * minute_log.sh
    0 * * * * aggregate_minutes_to_hourly_log.sh
    ```
    
3. tutup crontab

setelah semua proses ini selesai, file script minute_log.sh dan aggregate_minutes_to_hourly_log.sh akan berjalan secara otomatis sesuai dengan waktu yang diinginkan:

- `* * * * *` cron berjalan setiap menit minute_log.sh
- `0 * * * *` cron berjalan setiap jam untuk file script aggregate_minutes_to_hourly_log.sh
