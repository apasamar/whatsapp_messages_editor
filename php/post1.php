<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

if (isset($_POST['getpath'])) {
    $getpath = $_POST['getpath'];
    if ($getpath == "go")
            {
              echo "asasdasd";
              $se=shell_exec('../bin/php_wrapper /Library/WebServer/Documents/whatsapp/scripts/backup_finder.sh');
              echo $se;
             }
        else {echo '<div class="alert alert-danger">ups. NOT OK!!</div>';}
         
    }

if (!$_POST['getpath']) {
            $getpath = 'Please enter path to backup ...';
            echo '<div class="alert alert-danger">'.$errgetpath.'</div>';
        }

?>
