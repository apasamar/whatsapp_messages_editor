# whatsapp_messages_editor

With this tool you can edit Whatssapp messages from your local backup and sync it with your iPhone.

It works fine in MAC OS X, but if you want to use it in linux you have to compile src/php_wrapper.c and copy it to bin/ path. 
Then:
* chown root php_wrapper 
* chmod u=rwx,go=xr,+s php_wrapper

The wrapper is required to run the scripts with the right permissions from the web server.

You also need to set up 'local user' and 'backup path' at config.txt file.

Enable a web server and access http://<you_ip>/whatsapp_messages_editor/whatsapp_messages_editor.php

* Step 0: Set flight mode on your iPhone (or you could lose the messages after restore process)
* Step 1: Backup your iPhone with iTunes 
* Step 2: Use Whatssapp Messages Editor to edit any message you want
* Step 3: Restore you backup

Slides:
http://es.slideshare.net/abrahampasamar/modifying-whatsapp-messages-for-dummies

Video (Demo):
https://youtu.be/9BTMQSqJy_I


