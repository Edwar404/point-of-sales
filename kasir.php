<?php
session_start();
session_regenerate_id();
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
            <div class="col-2"></div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h1>Management Kasir</h1>
                    </div>
                    <div class="card-body mt-3">
                        <div class="table-responsive">
                            <div class="mb-2">
                                <a href="tambah-transaction.php" class="btn btn-primary btn-sm">Tambah Transaksi</a>
                            </div>
                            <table class="table table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>Kode Transaksi</th>
                                        <th>Tanggal transaksi</th>
                                        <th>Struk Pembayaran</th>
                                        <th>Status Pembayaran</th>
                                        <th>Settings</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Tanggal</th>
                                        <th>Jenis Transaksi</th>
                                        <th>Total Transaksi</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php for ($i = 1; $i <= 10; $i++) : ?>
                                        <tr>
                                            <td><?php echo $i; ?></td>
                                            <td>2021-01-<?php echo $i; ?></td>
                                            <td>Penjualan</td>
                                            <td>Rp. 100000</td>
                                            <td>
                                                <a href="#" class="btn btn-sm btn-primary">Detail</a>
                                            </td>
                                        </tr>
                                    <?php endfor; ?>
                        </div> -->
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </div>

    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>