#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Export some variables
export PATH=$PATH:$HOME/Scripts

# Use fish as interactive shell
exec fish
