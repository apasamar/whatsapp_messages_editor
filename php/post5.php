<?php

//if (isset($_POST['getpath']) ) {

    $message = $_POST['message'];
    $path = $_POST['path'];
    $newtext= $_POST['newtext'];
			  $newpath=trim(str_replace(" ","\ ",$path));
              $newtext=trim(str_replace(" ","\ ",$newtext));
              $se=shell_exec('../bin/php_wrapper ../scripts/update_text_message_NOW.sh '.'"'.$newpath.'" '.$message.' '.'"'.$newtext.'"');
              echo '<div class="alert alert-success">'.$se.'</div>';
              echo '<div class="alert alert-info"><strong>REMEMBER!</strong> Restore you backup NOW.</div>';

?>
