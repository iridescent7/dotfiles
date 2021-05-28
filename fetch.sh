#!/bin/bash

ROOT_CONFIG=(.scripts .bash_profile .bashrc .gtkrc-2.0 .xinitrc .Xresources)
CONFIG=(cava clipit dunst flameshot fontconfig gtk-3.0 i3 kitty nvim picom polybar ranger rofi sxiv zathura)

REPO_DIR="$(dirname "$0")"

cleanup() {
	for dir in ${ROOT_CONFIG[@]}; do
		rm -rf "$REPO_DIR/$dir"
	done

	rm -rf "$REPO_DIR/.config"
}

fetch() {
	for dir in ${ROOT_CONFIG[@]}; do
		cp -r "$HOME/$dir" "$REPO_DIR/$dir"
	done

	mkdir "$REPO_DIR/.config"

	for dir in ${CONFIG[@]}; do
		cp -r "$HOME/.config/$dir" "$REPO_DIR/.config/$dir"
	done
}

cleanup
fetch
