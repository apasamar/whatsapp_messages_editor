<?php

    $message = $_POST['message'];
    $path = $_POST['path'];
              $newpath=trim(str_replace(" ","\ ",$path));
              $se=shell_exec('../bin/php_wrapper ../scripts/show_message_by_id.sh '.'"'.$newpath.'" '.$message);
              echo '<div class="alert alert-success">'.$se.'</div>';

?>
