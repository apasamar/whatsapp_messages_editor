<?php

    $session = $_POST['session'];
    $path = $_POST['path'];
              $newpath=trim(str_replace(" ","\ ",$path));
              $se=shell_exec('../bin/php_wrapper ../scripts/show_messages_by_chatsessions.sh "'.$newpath.'" '.$session);
              echo '<div class="alert alert-success">'.$se.'</div>';

?>
