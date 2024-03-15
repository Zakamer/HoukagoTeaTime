<?php
session_start();
session_destroy();
include 'include/auth.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="csrf-token" content="<?= $_SESSION['csrf_token'] ?>">
  <title>UD.SILALAHI | Login</title>
  <link href="asset/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link href="asset/fontawesome-free-6.4.0/css/all.css" rel="stylesheet" id="bootstrap-css">
  <script src="asset/js/jquery.min.js"></script>
  <script src="asset/js/bootstrap.min.js"></script>
  <script src="asset/js/script.js"></script>
  <style>
      #main {
        border-style: solid;
        border-width: 0.5px;
        border-color: #d1cfcf;
        border-radius: 25px;

        background-color: ;
        margin-top : 100px;
        padding : 50px;
        
      }
  </style>
</head>
<body>
<div class="container header">
  <div class="row">
    <div class="col-md-4 col-md-offset-4" id="main">
      <form method="post" class="form-data" id="form-data">  
        <div class="row" style="margin-bottom: 20px;">
          <div class="col-md-12 text-center">
            <img src="asset/img/logo-hitam.png" id="icon" alt="User Icon"/>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="username" class="text-info">Username</label>
              <input type="text" name="usr" id="usr" class="form-control" placeholder="Username">
              <p class="text-danger" id="wr_usr"></p>
            </div>
          </div>
          <div class="col-md-12">
            <div class="form-group">
              <label for="password" class="text-info">Password</label>
              <input type="password" name="pws" id="pws" class="form-control" placeholder="Password">
              <p class="text-danger" id="wr_pws"></p>
              <div class="text-right" style="margin-top:10px;">
                <button type="button" class="btn btn-secondary btn-sm" id="toggle-pw-btn">
                  <i class="fa fa-eye" id="toggle-pw-i"></i> Hide
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-12">
            <div class="form-group">
              <button type="button" name="masuk" class="btn btn-primary" id="masuk"><i class="fa fa-sign-in" id="ic_simpan"></i> Masuk</button>
            </div>
          </div>
        </div>
      </form>
    </div><!-- form-->
  </div>
</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
		$.ajaxSetup({
				headers : {
				'Csrf-Token': $('meta[name="csrf-token"]').attr('content')
				}
		});
	})

	$("#masuk").click(function(){
		var data = $('.form-data').serialize();
		var usr = document.getElementById("usr").value;
		var pws = document.getElementById("pws").value;


		//alert(created_at);
		if (usr=="") {
			document.getElementById("wr_usr").innerHTML = "*Username Harus Diisi";
		} else {
			document.getElementById("wr_usr").innerHTML = "";
		}
		$lt=pws.length;
		if ($lt < 8) {
			if (pws=="") {
				document.getElementById("wr_pws").innerHTML = "*Password Harus Diisi";
			} else {
				document.getElementById("wr_pws").innerHTML = "*Password harus lebih dari 8 karakter";
			}

		} else {
			if (pws=="") {
				document.getElementById("wr_pws").innerHTML = "*Password Harus Diisi";
			} else {
				document.getElementById("wr_pws").innerHTML = "";
			}
		}
		if (usr!="" && pws!="" && $lt >= 8)
		{
			$.ajax({
					type: 'POST',
					url: "modal/login-view.php",
					data: data,
					dataType: 'json',
					success: function(data) {
            console.log(data);
            if(data.status=="ada"){
              alert(data.pesan);
						  window.location.replace("dashboard/");
            }else{
              alert(data.pesan);
            }
						
					}, error: function(response){
						console.log(response.responseText);
						alert("Username atau password salah");
					}
			});
		}
	});

	$("#refresh").click(function(){
		reset();
	});

  $("body").on('click', '#toggle-pw-btn', function() {
    
    var input = $("#pws");
    if (input.attr("type") === "password") {
      input.attr("type", "text");
      document.getElementById("toggle-pw-btn").innerHTML = '<i class="fa fa-eye-slash" id="toggle-pw-i"></i> Hide';
    } else {
      input.attr("type", "password");
      document.getElementById("toggle-pw-btn").innerHTML = '<i class="fa fa-eye" id="toggle-pw-i"></i> Show';
    }

  });

	function reset(){
		document.getElementById("usr").value="";
		document.getElementById("pws").value="";
		
		document.getElementById("wr_usr").innerHTML = "";
		document.getElementById("wr_pws").innerHTML = "";
		dtTable();
	}
</script>