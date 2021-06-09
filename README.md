# dotfiles
Dotfiles and other conf

# Vim

## windows

Link vim file to C:\Users\(YOUR_USER)\AppData\Local\nvim\init.vim

requires plug for neovim to be installed
requires python3 package neovim to be installed
after setup run :PlugInstall in nvim then restart

## windows

setting vim / vi alias. Make sure powershell script execution is enabled for unsigned
```
nvim $PROFILE
```

Add
```
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
```

reload the script for this login with
```
. $PROFILE
```


# Firefox
installing userChrome.css
	navigate to about:support
	open the Profile folder
	should look like C:\Users\(YOUR_USER)\AppData\Roaming\Mozilla\Firefox\Profiles\(GENERATED-VALUE).default-release\
	create new folder chrome
	create symbolic link to userChrome.css inside chrome folder
	navigate to about:config
	change toolkit.legacyuserProfileCustomizations.stylesheets to true

## Current Plugins
	https://addons.mozilla.org/en-US/firefox/addon/tabliss/?src=search
		on the new tab page hit the settings icon and click OpenTabliss when Firefox starts for instructions
		to set homepage too
		TODO: back up theme settings
	https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?src=search
	// privacy badger
	// vim vixen
