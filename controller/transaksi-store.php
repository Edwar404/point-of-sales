<?php

session_start();
require_once '../config/koneksi.php';

if (isset($_POST['simpan'])) {
    $email = $_SESSION['EMAIL'];
    $id_user = $_SESSION['ID'] ? $_SESSION['ID'] : '';
    // $query = mysqli_query($koneksi, "SELECT * FROM user WHERE email = '$email'");
    // $row = mysqli_fetch_assoc($query);

    // $id_user = $row['id'];
    $kode_transaksi = $_POST['kode_transaksi'];
    $tanggal_transaksi = $_POST['tanggal_transaksi'];
    $total_harga = $_POST['total_harga'];
    $nominal_bayar = $_POST['nominal_bayar'];
    $kembalian = $_POST['kembalian'];

    $queryPenjualan = mysqli_query($koneksi, "INSERT INTO penjualan(id_user, kode_transaksi, tanggal_transaksi) VALUES ('$id_user','$kode_transaksi','$tanggal_transaksi')");

    $id_penjualan = mysqli_insert_id($koneksi);
    foreach ($_POST['id_barang'] as $key => $id_barang) {
        $jumlah = $_POST['jumlah'][$key];
        $harga = $_POST['harga'][$key];
        $sub_total = $_POST['sub_total'][$key];
        // $total_harga = $_POST['total_harga'][$key];

        // AMBIL STOCK DAN HARGA BARANG
        // $barang = mysqli_query($koneksi, "SELECT harga, qty FROM barang WHERE id ='$id_barang'");
        // $barangData = mysqli_fetch_assoc($barang);
        // $harga = $barangData['harga'];
        // $qty = $barangData['qty'];
        // $total_harga_detail = $jumlah * $harga;

        $detailPenjualan = mysqli_query($koneksi, "INSERT INTO detail_penjualan (sub_total, id_penjualan, id_barang, jumlah, harga, total_harga, nominal_bayar, kembalian) VALUES ('$sub_total','$id_penjualan','$id_barang','$jumlah','$harga','$total_harga','$nominal_bayar','$kembalian')");

        $updateQty = mysqli_query($koneksi, "UPDATE barang SET qty = qty - $jumlah WHERE id = '$id_barang'");
    }

    header('location: ../print.php?id=' . $id_penjualan);
    exit();

    // if ($queryPenjualan) {
    // }
    // $queryDetail = mysqli_query($koneksi, "INSERT INTO detail_penjualan(id_penjualan, id_produk, jumlah, harga_satuan) VALUES ('$kode_transaksi', $_POST[id_produk1], $_POST[qty1], $_POST[harga1]),
    // ('$kode_transaksi', $_POST[id_produk2], $_POST[qty2], $_POST[harga2]),
}
