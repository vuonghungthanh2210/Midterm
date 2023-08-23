														
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Fashion MyLiShop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="Fashion MyLiShop - fashion mylishop"/>
    <meta name="description" content="Fashion MyLiShop - fashion mylishop" />
    <meta name="keywords" content="Fashion MyLiShop - fashion mylishop" />
    <meta name="author" content="Hôih My" />
    <meta name="author" content="Y Blir" />
    <link rel="icon" type="image/png" href="images/logohong.png">
    
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <link rel="stylesheet" type="text/css" href="admin/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" charset="utf-8"></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'> -->

    <!-- customer js -->
    <script src='js/wow.js'></script>
    <script type="text/javascript" src="js/mylishop.js"></script>
    <!-- customer css -->
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	</head>
	<body>
		
	</body>
	</html>										
	<?php													
	// include 'header.php';													
	// require_once('./model/connects.php');	
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
	error_reporting(1);													
														
	if (isset($_GET['notimage'])) {													
	$noimage = 'Vui lòng chọn hình ảnh hợp lệ!';													
	} else {													
	$noimage = '';													
	}													
	?>													
														
	<!-- Page Content -->													
	<div id="page-wrapper">													
	<div class="container-fluid">													
	<div class="row">													
	<div class="col-lg-12">													
	<h1 class="page-header"> Thêm sản phẩm </h1>													
	</div><!-- /.col-lg-12 -->													
														
	<div class="col-lg-7" style="padding-bottom:120px">													
	<form action="productadd-back.php" method="POST" enctype="multipart/form-data">													
	<div class="form-group">													
	<label> Tên sản phẩm </label>													
	<input type="text" class="form-control" name="txtName" placeholder="Nhập tên sản phẩm" required/>													
	</div>													
	<!-- //Tên sản phẩm -->													
														
	<div class="form-group">													
	<label> Danh mục sản phẩm </label>													
	<select class="form-control" name="category">													
	<?php													
	$sql = "SELECT * FROM categories";													
	$result = mysqli_query($conn,$sql);													
	if($result)													
	{													
	while($row = mysqli_fetch_assoc($result))													
	{													
	?>													
	<option													
	value="<?php echo $row['id']; ?>">													
	<?php echo $row['name']; ?>													
	</option>													
	<?php													
	}													
	}													
	?>													
	</select>													
	</div>													
	<!-- //Danh mục sản phẩm -->													
	<div class="row">													
	<div class="col-md-6 col-sm-6 col-xs-6">													
	<div class="form-group">													
	<label> Giá sản phẩm </label>	 												
	<input type ="number" class="form-control" name="txtPrice" placeholder="Nhập giá sản phẩm" min="20000" required/>													
	</div>													
	</div>													
	<div class="col-md-6 col-sm-6 col-xs-6">													
	<div class="form-group">													
	<label> Phần trăm giảm (nếu có) </label>													
	<input type = "number" class="form-control" name="txtSalePrice" placeholder="Nhập phần trăm giá giảm" value="0" min="0" max="50"/>													
	</div>													
	</div>													
	</div>													
	<!-- //Giá sản phẩm -->													
	<div class="form-group">													
	<label> Số lượng sản phẩm </label>													
	<input type="number" class="form-control" name="txtNumber" placeholder="Nhập số lượng sản phẩm" required/>													
	</div>													
	<!-- //Số lượng sản phẩm -->													
														
	<div class="form-group">													
	<label> Chọn hình ảnh sản phẩm </label>													
	<input type="file" name="FileImage" required>													
	<span style="color: red"><?php echo $notimage; ?></span>													
	</div>													
	<!-- //Chọn hình ảnh sản phẩm -->													
														
	<div class="form-group">													
	<label> Nhập từ cho khách hàng tìm kiếm </label>													
	<input class="form-control" name="txtKeyword" placeholder="Nhập từ khóa tìm kiếm" />													
	</div>													
	<!-- //Nhập từ cho khách hàng tìm kiếm -->													
														
	<div class="form-group">													
	<label> Mô tả sản phẩm </label>													
	<textarea class="form-control" rows="3" name="txtDescript"></textarea>													
	</div>													
	<!-- //Mô tả sản phẩm -->													
	<div class="row">													
	<div class="col-md-6 col-sm-6 col-xs-6">													
	<button type="submit" name="addProduct" class="btn btn-warning btn-block btn-lg"> Thêm </button>													
	</div>													
	<!-- //Button Thêm -->													
														
	<div class="col-md-6 col-sm-6 col-xs-6">													
	<button type="reset" class="btn btn-default btn-block btn-lg" style="background: gray; color:white;"> Thiết lập lại </button>													
	</div>													
	<!-- //Button Reset -->													
	</div>													
	<!-- /.row -->													
	</form>													
	</div><!-- /.col -->													
	</div><!-- /.row -->													
	</div><!-- /.container-fluid -->													
	</div><!-- /#page-wrapper -->													
	<meta charset="utf-8">													