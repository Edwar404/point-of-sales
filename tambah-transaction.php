<?php
session_start();
session_regenerate_id();
date_default_timezone_set("Asia/Jakarta");
require_once 'config/koneksi.php';

// WAKTU
$currentTime = date('Y-m-d');
// $currentTime = date('Y-m-d H:i:s');

function generateTransactionCode() {
    // $query = "SELECT MAX(RIGHT(kode_transaksi, 6)) as kode_max FROM transaksi WHERE DATE(tanggal_transaksi) = CURDATE()";
    // $result = mysqli_query($conn, $query);
    // $data = mysqli_fetch_assoc($result);
    // $kode_max = $data['kode_max'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
    <title>Document</title>
</head>

<body>

    <?php include "inc/navbar.php"; ?>


    <div class="container">
        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-10">
                <form action="" method="POST">
                    <div class="mb-2">
                        <label class="form-label" for="">Kode Transaksi</label>
                        <input type="text" id="kode_transaksi" value="<?php echo 'TR-' . generateTransactionCode()?>" name="kode_transaksi" class="form-control w-50" readonly>
                    </div>
                    <div class="mb-2">
                        <label class="form-label" for="">Tanggal</label>
                        <input type="date" name="tanggal_transaksi" value="<?php echo $currentTime ?>" id="tanggal_transaksi" class="form-control w-50" readonly>
                    </div>
                    <div class="mt-4">
                        <button class="btn btn-primary btn-sm" type="button" id="counterBtn">Tambah</button>
                        <input type="number" style="width: 465px;" name="countDisplay" id="countDisplay" readonly>
                    </div>
                </form>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>