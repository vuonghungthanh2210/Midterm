<?php

$host = "localhost";
$user = "root";
$password = "";
$database = "db_fashion_mylishop";

// Create connection
$conn = mysqli_connect($host, $user, $password, $database);
mysqli_set_charset($conn, 'UTF8');

// Check connection
if (!$conn) {
	die("Connection failed: " . mysqli_connect_error());
}
// echo "Connected successfully";
?>

<!-- page content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<h1 class="page-header"> Danh sách sản phẩm </h1>
			</div><!-- /.col -->

			<table class="table table-striped table-bordered table-hover" id="dataTables-example">
				<thead>
					<tr align="center">
						<th> STT </th>
						<th> Tên sản phẩm </th>
						<th> Mã danh mục </th>
						<th> Hình ảnh </th>
						<th> Giá </th>
						<th> Giảm giá </th>
						<th> Chỉnh sửa </th>
						<th> Xóa </th>
					</tr>
				</thead>
				<tbody>
					<?php
						$sql = "SELECT * FROM products ORDER BY id DESC";
						$result = mysqli_query($conn,$sql);
						if ($result)
						{
							while ($row = mysqli_fetch_assoc($result))
							{
								if ($row['image'] == null || $row['image'] =='')
								{
									$thumbImage = "";
								} else {
									$thumbImage = "../" . $row["image"];
								}
					?>
								<tr class="odd gradeX" align="center">
									<td><?php echo $row['id'];?></td>
									<td><?php echo $row['name'];?></td>
									<td><?php echo $row['category_id'];?></td>
									<td>
										<img src = "<?php echo $thumbImage; ?>" width="100px"; height="100px";>
									</td>
									<td><?php echo $row['price']; ?></td>
									<td><?php echo $row['saleprice']; ?></td>

									<td class="center">
										<a href="product-edit.php?idProducts=<?php echo $row['id']; ?>"><i class="fa fa-pencil fa-lg" title="Chỉnh sửa"></i>
									</td>
									<td class="center">
									<a href="product-delete.php?idProducts=<?php echo $row['id']; ?>"><i class="fa fa-trash-o fa-lg" title="Xóa"></i>
									</td>
								</tr>
					<?php
								}
								
							}
						?>
				</tbody>
			</table>
		</div><!-- /.row -->
	</div><!-- /.container-fluid -->
</div><!-- /#page-wrapper -->