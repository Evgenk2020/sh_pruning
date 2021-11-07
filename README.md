# sh_pruning
<b>Scripts for quick installing current updates and autoclean Debian and Fedora systems</b>
<p>It often happes for Linux users to update system packages manually via terminal. It's possible to use automation scripts for this.</p>
<p>If so it would be comfortable not to type user password every time but set it once and then run the automation scrips.</p>
<p>You may use the given scripts for Fedora and Debian based systems and add them to system menu by editing <b>name.desktop</b> file renamed according to <b>*.sh</b> files and put them into your<br /><>b.local/share/applications</b><br />folder.</p>

><p>[Desktop Entry]<br />
>Name=[name_of_service]<br />
>Exec=gnome-terminal -e [path_to_file_*.sh]<br />
>Comment=[name_of_service]<br />
>Terminal=false<br />
>Icon=[path_to_file_*.png]<br />
>Type=Application</p>
>
<p><b>passwriter.sh</b> file must be run first to write down user pass. Then use other scripts</p>
