<?php
session_start();
session_regenerate_id();
date_default_timezone_set("Asia/Jakarta");
require_once 'config/koneksi.php';

// WAKTU
$currentTime = date('Y-m-d');
// $currentTime = date('Y-m-d H:i:s');

function generateTransactionCode()
{
    $kode = date('ymdHis');
    return $kode;
}

// CLICK COUNT
if (empty($_SESSION['click_count'])) {
    $_SESSION['click_count'] = 0;
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
                        <input type="text" id="kode_transaksi" value="<?php echo 'TR-' . generateTransactionCode() ?>" name="kode_transaksi" class="form-control w-50" readonly>
                    </div>
                    <div class="mb-2">
                        <label class="form-label" for="">Tanggal</label>
                        <input type="date" name="tanggal_transaksi" value="<?php echo $currentTime ?>" id="tanggal_transaksi" class="form-control w-50" readonly>
                    </div>
                    <div class="my-4">
                        <button class="btn btn-primary btn-sm" type="button" id="counterBtn">Tambah</button>
                        <input type="number" style="width: 465px;" name="countDisplay" value="<?php echo $_SESSION['click_count'] ?>" id="countDisplay" readonly>
                    </div>
                    <div class="table table-responsive">
                        <table class="table table-bordered">
                            <thead class="text-center">
                                <tr>
                                    <th>No.</th>
                                    <th>Nama Kategori</th>
                                    <th>Nama Barang</th>
                                    <th>jumlah</th>
                                    <th>Sisa Produk</th>
                                    <th>Harga</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                                <!-- DATA DITAMBAH DI SINI -->

                            </tbody>
                            <tfoot class="text-center">
                                <tr>
                                    <th colspan="5">Total Harga</th>
                                    <td><input type="number" id="total_harga_keseluruhan" name="total_harga" class="form-control" readonly></td>
                                </tr>
                                <tr>
                                    <th colspan="5">Nominal Bayar</th>
                                    <td><input type="number" id="nominal_bayar_keseluruhan" name="nominal_bayar" class="form-control" required></td>
                                </tr>
                                <tr>
                                    <th colspan="5">Kembalian</th>
                                    <td><input type="number" id="kembalian_keseluruhan" name="kembalian" class="form-control" readonly></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <br><br>
                    <div class="mb-3">
                        <input type="submit" class="btn btn-primary" name="simpan" value="Hitung">
                        <a href="kasir.php" class="btn btn-danger">Kembali</a>
                    </div>
                </form>
            </div>
            <div class="col-1"></div>
        </div>
    </div>


    <?php
    $queryCategories = mysqli_query($koneksi, "SELECT * FROM kategori_barang");
    $categories = mysqli_fetch_all($queryCategories, MYSQLI_ASSOC);
    ?>
    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const button = document.getElementById('counterBtn');
            const countDisplay = document.getElementById('countDisplay');
            const tbody = document.getElementById('tbody');

            button.addEventListener('click', function() {
                let currentCount = parseInt(countDisplay.value) || 0;
                currentCount++;
                countDisplay.value = currentCount;
                // FUNGSI TAMBAH TD
                let newRow = "<tr>";
                newRow += "<td>" + currentCount + "</td>";
                newRow += "<td><select class='form-control category-select' name='id_kategori[]' required>";
                newRow += "<option value=''>--Pilih Kategori--</option>"
                <?php foreach ($categories as $category) { ?>
                    newRow += "<option value='<?php echo $category['id'] ?>'><?php echo $category['nama_kategori'] ?></option>";
                <?php } ?>
                newRow += "</select></td>";
                newRow += "<td><select class='form-control item-select' name='id_barang[]' required>";
                newRow += "<option value=''>--Pilih Barang--</option>"

                newRow += "</select></td>";
                newRow += "<td><input type='number' name='jumlah[]' class='form-control jumlah-input' value='0' required></td>"
                newRow += "<td><input type='number' name='sisa_produk[]' class='form-control' readonly></td>"
                newRow += "<td><input type='number' name='harga[]' class='form-control' readonly></td>"
                newRow += "</tr>";
                tbody.insertAdjacentHTML('beforeend', newRow);

                attachCategoryChangeListener();
            });

            function attachCategoryChangeListener() {
                const categorySelects = document.querySelectorAll('.category-select');
                categorySelects.forEach(select => {
                    select.addEventListener('change', function() {
                        const categoryId = this.value;
                        const itemSelect = this.closest('tr').querySelector('.item-select');

                        if (categoryId) {
                            fetch(`controller/get-product-dari-category.php?id_kategori=${categoryId}`)
                                .then(response => response.json())
                                .then(data => {
                                    itemSelect.innerHTML += "<option value=''>--Pilih Barang--</option>";
                                    data.forEach(item => {
                                        itemSelect.innerHTML += `<option value='${item.id}'>${item.nama_barang}</option>`;
                                    });
                                });
                        } else {
                            itemSelect.innerHTML = "<option value=''>--Pilih Barang--</option>";
                        }
                    });
                })
            }
        })
    </script>
</body>

</html>