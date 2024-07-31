#!/bin/bash

# Fungsi untuk menampilkan menu
show_menu() {
    echo "## Layanan Zerotier Tunnel [8d] ##"
    echo "## --------------------------------------  ##"
    echo "1. Install Paket Zerotier"
    echo "2. Uninstall Zerotier"
    echo "3. Join Network Net1"
    echo "4. Join Network Net2"
    echo "5. Enable Zerotier Service"
    echo "6. Restart Zerotier Service"
    echo "7. List Networks"
    echo "8. Hapus Network"
    echo "9. Kembali ke menu pilihan"
    echo "x. Keluar"
}

# Fungsi untuk instalasi paket Zerotier
install_zerotier() {
    if command -v zerotier-cli &> /dev/null
    then
        echo "Zerotier sudah terinstalasi."
    else
        echo "Menginstall Paket Zerotier..."
        curl -s https://install.zerotier.com | bash
        echo "Instalasi selesai."
    fi
}

# Fungsi untuk menghapus spasi di awal dan akhir input
trim() {
    echo "$1" | xargs
}

# Fungsi untuk join network Net1 dengan inputan manual
join_network_net1() {
    read -p "Masukkan Network ID untuk Net1: " network_id
    network_id=$(trim "$network_id")
    combined_id="8bd5124fd6f987b$network_id"
    echo "Join Network Net1 dengan ID: $combined_id..."
    zerotier-cli join "$combined_id"
    echo "Join selesai."
}

# Fungsi untuk join network Net2 dengan inputan manual
join_network_net2() {
    read -p "Masukkan Network ID untuk Net2: " network_id
    network_id=$(trim "$network_id")
    combined_id="565799d8f6bdd3c$network_id"
    echo "Join Network Net2 dengan ID: $combined_id..."
    zerotier-cli join "$combined_id"
    echo "Join selesai."
}

# Fungsi untuk enable service zerotier
enable_service() {
    echo "Enable Zerotier Service..."
    systemctl enable zerotier-one.service
    echo "Service enabled."
}

# Fungsi untuk restart service zerotier
restart_service() {
    echo "Restart Zerotier Service..."
    systemctl restart zerotier-one.service
    echo "Service restarted."
}

# Fungsi untuk menampilkan daftar network
list_networks() {
    echo "List Networks..."
    zerotier-cli listnetworks
}

# Fungsi untuk memilih network dari daftar yang terdaftar
select_network() {
    list_networks
    read -p "Masukkan Network ID dari daftar di atas: " network_id
    network_id=$(trim "$network_id")
    echo "Network ID yang dipilih: $network_id"
    echo "$network_id"
}

# Fungsi untuk menghapus network dengan inputan manual
leave_network() {
    echo "Pilih network untuk dihapus:"
    network_id=$(select_network)
    if [ -n "$network_id" ]; then
        echo "Hapus Network dengan ID: $network_id..."
        zerotier-cli leave "$network_id"
        echo "Network dihapus."
    else
        echo "ID jaringan tidak valid."
    fi
}

# Fungsi untuk uninstall zerotier
uninstall_zerotier() {
    echo "Uninstalling Zerotier..."
    apt-get remove --purge zerotier-one -y
    echo "Uninstall selesai."
}

# Fungsi untuk kembali ke menu pilihan
back_to_menu() {
    echo "Kembali ke menu pilihan..."
}

# Main loop untuk menampilkan menu dan membaca input pengguna
while true; do
    show_menu
    read -p "Pilih opsi [1-10]: " choice
    case $choice in
        1)
            install_zerotier
            ;;
        2)
            uninstall_zerotier
            ;;
        3)
            join_network_net1
            ;;
        4)
            join_network_net2
            ;;
        5)
            enable_service
            ;;
        6)
            restart_service
            ;;
        7)
            list_networks
            ;;
        8)
            leave_network
            ;;
        9)
            back_to_menu
            ;;
        x)
            echo "Keluar..."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid, silakan coba lagi."
            ;;
    esac
    echo ""
done
