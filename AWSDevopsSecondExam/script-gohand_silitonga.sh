#!/bin/bash

# script-gohand_silitonga.sh
# Author: Gohand Silitonga
# Date: 09 May, 2023

# Fungsi untuk menampilkan informasi dan memberikan jeda
display_info() {
    echo "$1"
    sleep $2
}

# Perulangan while untuk menjalankan skrip secara terus menerus
while true; do

    # Menampilkan ukuran memory dalam satuan megabytes
    echo
    display_info "Ukuran memory sistem:" 3
    free -m 
    echo

    # Menampilkan penggunaan ruang disk pada filesystem dalam satuan gigabytes
    display_info "Penggunaan ruang disk pada filesystem:" 3
    df -BG
    echo

    # Menampilkan penggunaan ruang disk pada filesystem hanya untuk kolom Filesystem dan Use% (tanpa tmpfs)
    echo -e "Penggunaan ruang disk pada filesystem (Filesystem dan Use%):"
    df -h | grep -v "tmpfs" | awk '{print $1"\t"$5}'
    echo

    # Menyimpan riwayat perintah ke dalam berkas history-gohand_silitonga.txt
    history > history-gohand_silitonga.txt
    echo

    # Mengarsipkan berkas script dan berkas riwayat perintah menjadi submission1-shell-gohand_silitonga.zip
    zip submission1-shell-gohand_silitonga.zip script-gohand_silitonga.sh history-gohand_silitonga.txt
    echo

    # Menampilkan pesan bahwa tugas selesai
    echo -e "Tugas selesai. Berkas script-gohand_silitonga.sh, history-gohand_silitonga.txt, dan submission1-shell-gohand_silitonga.zip telah dibuat."
    echo

    # Memberikan jeda selama 1 menit sebelum menjalankan skrip kembali
    sleep 1m

done

# Akhir dari skrip
