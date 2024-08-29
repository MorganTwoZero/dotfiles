#!/usr/bin/env fish
if test $current_theme = "light"
	sed -i'.bak' 's/light/dark/' ~/.config/alacritty/alacritty.toml
	sed -i'.bak' 's/github_light/github_dark/' ~/.config/helix/config.toml
	gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	sed -i'.bak' 's/theme=Arc/theme=ArcDark/' ~/.config/Kvantum/kvantum.kvconfig
	swww img -o DP-3 ~/Pictures/horizontal.jpg
	swww img -o HDMI-A-1 ~/Pictures/vertical-night.jpg
	sed -i'.bak' 's/catppuccin-latte/gruvbox-dark/' ~/.config/zellij/config.kdl
	sed -i'.bak' "s/@import 'themes\/light.scss'/\/\/ @import 'themes\/light.scss'/" ~/.config/eww/eww.scss
	sed -i'.bak' "s/\/\/ @import 'themes\/dark.scss'/@import 'themes\/dark.scss'/" ~/.config/eww/eww.scss
	cp -f ~/.config/swaync/dark.css ~/.config/swaync/style.css
	set -U current_theme dark
else
	sed -i'.bak' 's/dark/light/' ~/.config/alacritty/alacritty.toml
	sed -i'.bak' 's/github_dark/github_light/' ~/.config/helix/config.toml
	gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
	sed -i'.bak' 's/theme=ArcDark/theme=Arc/' ~/.config/Kvantum/kvantum.kvconfig
	swww img -o DP-3 ~/Pictures/horizontal.jpg
	swww img -o HDMI-A-1 ~/Pictures/vertical-day.jpg
	sed -i'.bak' 's/gruvbox-dark/catppuccin-latte/' ~/.config/zellij/config.kdl
	sed -i'.bak' "s/@import 'themes\/dark.scss'/\/\/ @import 'themes\/dark.scss'/" ~/.config/eww/eww.scss
	sed -i'.bak' "s/\/\/ @import 'themes\/light.scss'/@import 'themes\/light.scss'/" ~/.config/eww/eww.scss
	cp -f ~/.config/swaync/light.css ~/.config/swaync/style.css
	set -U current_theme light
end

swaync-client -rs
