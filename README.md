# sh_pruning
<b>Scripts for quick installing current updates and autoclean Debian and Fedora systems</b>
<p>It often happes for Linux users to update system packages manually via terminal. It's possible to use automation scripts for this.</p>
<p>If so it would be comfortable not to type user password every time but set it once and then run the automation scrips.</p>
<p>You may add the given scripts to system menu by editing <b>name.desktop</b> file renamed according to <b>*.sh</b> files then put it into your <b>.local/share/applications</b> folder.</p>

><p>[Desktop Entry]<br />
>Name=[name_of_service]<br />
>Exec=gnome-terminal -e [path_to_file_*.sh]<br />
>Comment=[name_of_service]<br />
>Terminal=false<br />
>Icon=[path_to_file_*.png]<br />
>Type=Application</p>
>
<p><b>passwriter.sh</b> file must be run first to write down user pass. After that run other scripts</p>
<p>Running <b>passwriter.sh</b> without entering your password will erase the recorded pass files. Do it if you don't need to store them on disk all the time.</p>
