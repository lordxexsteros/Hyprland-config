<div align="justify">

<div align="center">

```ocaml
 🧿NEXEN🧿
```


# Preview
![pipes](./assets/pipes.png)
![fetch](./assets/fetch.png)


</div>
</div>




<div align="justify">

<div align="center">

# installation
 
<hr>
 
</div>
</div>

## Archlinux
dependencies
```
sudo pacman -S hyprland-git waybar-hyprland-git cava waybar-mpris-git python rustup wofi xdg-desktop-portal-hyprland-git tty-clock-git swaylockd grim flameshot pokemon-colorscripts-git starship jq dunst wl-clipboard swaylock-effects-git swww-git
```

## Seting up config files

```bash
git clone -b nexen https://github.com/lordxexsteros/Hyprland-config
cd dotfiles
cp -r ./config/* ~/.config
```

# Extras

## additional setup

```bash
mkdir ~/.config/hypr/store
touch ~/.config/hypr/store/dynamic_out.txt
touch ~/.config/hypr/store/prev.txt
touch ~/.config/hypr/store/latest_notif

chmod +x ~/.config/hypr/scripts/tools/*
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.config/hypr/*
```




