main_plist="com.reuben.kanata.plist"
k_daemon_plist="com.reuben.karabiner-vhiddaemon.plist" 
k_manager_plist="com.reuben.karabiner-vhidmanager.plist"
launch_daemon_path="/Library/LaunchDaemons/" 
main_plist_path="$launch_daemon_path$main_plist"
k_manager_plist_path="$launch_daemon_path$k_manager_plist"
k_daemon_plist_path="$launch_daemon_path$k_daemon_plist"

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
	<key>KeepAlive</key>
	<true/>
	<key>Label</key>
	<string>com.reuben.kanata</string>
	<key>ProgramArguments</key>
	<array>
  <string>$(brew --prefix)/bin/kanata</string>
      <string>-c</string>
      <string>$HOME/.config/kanata/config.kbd</string>
      <string>--port</string>
      <string>10000</string>
      <string>--debug</string>
	</array>

	<key>RunAtLoad</key>
	<true/>
  
  <key>KeepAlive</key>
  <true/>

	<key>StandardErrorPath</key>
	<string>/Library/Logs/Kmonad/kmonad.err.log</string>

	<key>StandardOutPath</key>
	<string>/Library/Logs/Kmonad/kmonad.out.log</string>
</dict>
</plist>" > $main_plist_path
cat $main_plist_path
cp $k_daemon_plist $launch_daemon_path
cp $k_manager_plist $launch_daemon_path

launchctl bootstrap system $main_plist_path
launchctl enable system/$main_plist
launchctl start ${main_plist%.plist}

launchctl bootstrap system $k_daemon_plist_path
launchctl enable system/$k_daemon_plist
launchctl start ${k_daemon_plist%.plist}

launchctl bootstrap system $k_manager_plist_path
launchctl enable system/$k_manager_plist
launchctl start ${k_manager_plist%.plist}
