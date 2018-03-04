#!/bin/bash

###### configure git #####

cat << EOF > ~/.gitconfig
[alias]
	simlog = log --graph --color --pretty=format:' %Cred%h %Creset/ %<(10,trunc)%Cblue%an%Creset | %<(60,trunc)%s | %ci %Cred%d'
	alllog = log --graph --color --pretty=format:' %Cred%h %Creset/ %<(10,trunc)%Cblue%an%Creset | %<(60,trunc)%s | %ci %Cred%d' --remotes --branches
[user]
	name = Bao Li
[push]
	default = simple
[core]
	editor = vim
EOF
