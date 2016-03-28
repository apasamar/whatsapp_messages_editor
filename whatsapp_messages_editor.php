

<html>
  <head>
    <title>WhatsApp Messages Editor</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <link href="docs/css/bootstrap.min.css" rel="stylesheet">
    <link href="docs/css/highlight.css" rel="stylesheet">
    <link href="dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
    <link href="docs/css/main.css" rel="stylesheet">
    <script src="docs/js/jquery.min.js"></script>
    <script src="docs/js/bootstrap.min.js"></script>
    <script src="docs/js/highlight.js"></script>
    <script src="dist/js/bootstrap-switch.js"></script>
    <script src="docs/js/main.js"></script>



<script>

var ruta1="";
var ruta_backup="";

$(document).ready(function(){
    $("#form1").submit(function( event ) {
        event.preventDefault();
        var datastring = $("#form1").serialize();
        $.ajax({
            type: "POST",
            url: "php/post1.php",
            data: datastring,
            success: function(data) {
                $("#path").val(data);
                ruta_backup=data;

            }
        });
    });
});

$(document).ready(function(){
    $("#form2").submit(function( event ) {
        event.preventDefault();
        var datastring = $("#form2").serialize();
        $.ajax({
            type: "POST",
            url: "php/post2.php",
            data: datastring,
            success: function(data) {
                $("#div2").html(data);
            }
        });
    });
});

$(document).ready(function(){
    $("#form3").submit(function( event ) {
        event.preventDefault();
        var datastring = encodeURI($("#form3").serialize() + '&path=' + ruta_backup) ;
        $.ajax({
            type: "POST",
            url: "php/post3.php",
            data: datastring,
            success: function(data) {
                $("#div3").html(data);
            }
        });
    });
});


$(document).ready(function(){
    $("#form4").submit(function( event ) {
        event.preventDefault();
        var datastring = $("#form4").serialize() + '&path=' + ruta_backup ;
        $.ajax({
            type: "POST",
            url: "php/post4.php",
            data: datastring,
            success: function(data) {
                $("#div4").html(data);
            }
        });
    });
});

$(document).ready(function(){
    $("#form5").submit(function( event ) {
        event.preventDefault();
        var datastring = $("#form5").serialize() + '&path=' + ruta_backup ;
        $.ajax({
            type: "POST",
            url: "php/post5.php",
            data: datastring,
            success: function(data) {
                $("#div5").html(data);
            }
        });
    });
});

</script>

</head>

<body>


<h2><center><span style="font-size:150%"  class="label label-success">Whatsapp Messages Editor Tool</span></center></h2>


<br>
<center><span style="font-size:150%" class="label label-default">First of all...<strong>BACK YOU PHONE NOW!</strong> </span></center>
<br>
<br>

<div class="container">

<form class="form-horizontal" name="form1" id="form1" role="form" method="post" action="#">

    <div class="form-group">
     <label for="submit1" class="col-sm-2 control-label" name="submit1">Get path</label>
        <div class="col-sm-10">
            <input id="getpath" name="getpath" type="hidden" value="go">
            <input id="submit1" name="submit1" type="submit"  value="GO!" class="btn btn-primary">
        </div>
        <div class="col-sm-10 col-sm-offset-2" id="div1">      
        </div>
    </div>    
</form>


<form class="form-horizontal" name="form2" id="form2" role="form" method="post" action="#">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Path</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="path" name="path" placeholder="Whatsapp DDBB Backup Path">
        </div> 
        <br>
        <label for="name" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="username" name="username" placeholder="Whatsapp User Name">
            <br>
            <input id="submit2" name="submit2" type="submit" value="GO!" class="btn btn-primary">
        </div>
            <div class="col-sm-10 col-sm-offset-2" id="div2">
            </div>    
    
    </div>  
</form>


<form class="form-horizontal" name="form3" id="form3" role="form" method="post" action="#">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Chat Session</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="session" name="session" placeholder="Whatsapp Chat Session Number (#)">
            <br>
            <input id="submit3" name="submit3" type="submit" value="GO!" class="btn btn-primary">
        </div>
            <div class="col-sm-10 col-sm-offset-2" id="div3">
            </div> 

    </div>

</form>

<form class="form-horizontal" name="form4" id="form4" role="form" method="post" action="#">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Message</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="message" name="message" placeholder="Whatsapp Message Number (#)">
            <br>
            <input id="submit4" name="submit4" type="submit" value="GO!" class="btn btn-primary">
        </div>
            <div class="col-sm-10 col-sm-offset-2" id="div4">
            </div>  
    </div>

</form>


<form class="form-horizontal" name="form5" id="form5" role="form" method="post" action="#">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Message</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="message" name="message" placeholder="Whatsapp Message Number (#)">
            <br>
            <input type="text" class="form-control" id="newtext" name="newtext" placeholder="NEW TEXT for Whatsapp Message">
            <br>
            <input id="submit5" name="submit5" type="submit" value="GO!" class="btn btn-primary">
        </div>
            <div class="col-sm-10 col-sm-offset-2" id="div5">
            </div> 
    </div>
</form>
</div>

</body>
</html> 
