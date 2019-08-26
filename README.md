# muhrice-dotfiles
My personal dotfiles, which I currently use on my Gentoo Linux and Void Linux machines.
These files will eventually form the basis of the muhrice meta-distribution, a somewhat minimalist setup.

The following programs have configuration files here:

- Awesome (Window manager)
- Bash (Default shell)
- Compton (Desktop compositor)
- Feh (Image viewer)
- Firefox (Web browser)
- Fish (Interactive shell)
- Htop (System monitor)
- MPD + Ncmpcpp (Music player)
- MPV (Video player)
- Neofetch (System information)
- Nvim (Text editor)
- Ranger (File browser)
- URxvt (Terminal emulator)
- Zathura (Document viewer)

Files for GTK and QT theming are here as well.

## Like my rice?

The easiest way to make use of these files is through
[Git](https://git-scm.com/) and
[Stow](https://www.gnu.org/software/stow/).
Use Git to keep them up to date, and Stow to create symlinks to the configs you want to use.
A good tutorial on such a setup can be found
[here](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

Eventually, one will be able to deploy these files and install all the programs using
[muhrice-setup](https://github.com/qcloutier/muhrice-setup),
once I get around to finishing it.
