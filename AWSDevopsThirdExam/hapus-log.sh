#!/bin/bash

# Menampilkan informasi penggunaan disk dari semua berkas journalctl
echo "Informasi penggunaan disk sebelum menghapus log:"
journalctl --disk-usage

# Menghapus journalctl log hingga ruang disk yang digunakan untuk log berkisar 10 MB
journalctl --vacuum-size=10M

# Menampilkan kembali informasi penggunaan disk dari semua berkas journalctl
echo "Informasi penggunaan disk setelah menghapus log:"
journalctl --disk-usage

