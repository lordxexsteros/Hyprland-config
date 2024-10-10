<div align="justify">

<div align="center">

```ocaml
 My Hyprland Setup
```


# gallery
![pipes](./assets/pipes.png)
![fetch](./assets/fetch.png)
 

https://user-images.githubusercontent.com/77581181/204240865-8a272152-7c31-45f9-a46b-47099b071060.mp4

 
</div>
</div>




<div align="justify">

<div align="center">

# installation
 
<hr>
 
</div>
</div>

## Arch
dependencies
```
sudo pacman -S hyprland-git waybar-hyprland-git cava waybar-mpris-git python rustup wofi xdg-desktop-portal-hyprland-git tty-clock-git swaylockd grim flameshot pokemon-colorscripts-git starship jq dunst wl-clipboard swaylock-effects-git swww-git
```

## moving config files

```bash
git clone -b aurora https://github.com/flick0/dotfiles
cd dotfiles
cp -r ./config/* ~/.config
```

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

## building the tools used in this rice

`rgb-borders` | rgb borders for grouped windows
```bash
git clone https://github.com/flick0/rgb-rs
cd rgb-rs
cargo build --release
cp ./target/release/rgb ~/.config/hypr/scripts/
```


# extras

## vscode custom css

you will need the `custom css and js loader` extension, you can get it from [here](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css)

make a new css file anywhere that fits you
then copy the following css to the file

```css
.tab.active {
    border: 4px solid #f5c2e7 !important;
    color: #f5c2e7 !important;
}
.tab{
    font-weight: 700 !important;
    border-radius: 12px !important;
    margin: 5px !important;
    padding-bottom: 2px !important;
    height: 45px !important;
    border:3px solid #313244 !important;
    background-color: #1e1e2e !important;
}
.tabs-container{
    height: auto !important;
    padding: 5px !important;
}
```

allow modifications to vscode by running the following command pointing to your vscode installation
```bash
sudo chown -R {your username} /opt/visual-studio-code-insiders/
```
> replace visual-studio-code-insiders with your vscode installation,
> you can find your installation dir by doing `whereis code` on your terminal


then open the vscode `settings.json` file (you shud be able to open it from `ctrl` + `shift` + `p` and searching for `Open User Settings(JSON)`)
then add the following to the file

```json
"vscode_custom_css.imports": [
    "file:///{path_to_file}"
],
```

then finally to apply the changes, open the command pallette(`ctrl`+`shift`+`p`) and search for `Enable Custom CSS and JS`


<hr>





