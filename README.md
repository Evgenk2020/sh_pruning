# sh_pruning
Scripts for quick installing current updates and autoclean Debian and Fedora systems

It often happes for Linux users to update system packages manually via terminal. It's possible to use automation scripts for this.

If so it would be comfortable not to type user password every time but set it once and then run the automation scrips.
You may use the given scripts for Fedora and Debian based systems and add them to system menu by editing **name.desktop** file.

<p>[Desktop Entry]</p>
<p>Name=[name_of_service]</p>
<p>Exec=gnome-terminal -e [path_to_file_*.sh]</p>
<p>Comment=[name_of_service]</p>
<p>Terminal=false</p
<p>Icon=[path_to_file_*.png]</p>
<p>Type=Application</p>
