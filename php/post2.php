<?php

//if (isset($_POST['getpath']) ) {

    $path = $_POST['path'];
    $username = $_POST['username'];
              $newpath=str_replace(" ","\ ",$path);
              //echo '<div class="alert alert-success">'.'./php_wrapper search_contactID_by_name.sh '.'"'.$newpath.'"'.' '.$username.'</div>';
              $se=shell_exec('../bin/php_wrapper ../scripts/search_contactID_by_name.sh '.'"'.$newpath.'"'.' '.$username);
              //$ser=str_replace("\n","<br>",$se);
              echo '<div class="alert alert-success">'.$se.'</div>';
             
        //else {echo '<div class="alert alert-danger">Ups. Something_where wrong!!'.$ret.'</div>';}
         
  //  }

//echo '<div class="alert alert-success">OK, OK!!: '.$path.'</div>';

//    echo '<div class="alert alert-danger">ups. NOT OK!!</div>';


?>
