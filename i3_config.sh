#!/usr/bin/env bash

# ---------- VARIAVES ---------- #

export green_color="\033[1;32m"
export blue_color="\033[1;34m"
export red_color="\033[1;31m"
export grey_color="\033[40;1;37m"
export yellow_color="\033[1;33m"

export xorg_drivers=(nvidia xorg-server xorg-apps xorg-minimal xinit xcape compton);
export libs=(glu base-devel);
export plugins=(sysstat lm_sensors thunar-archive-plugin python3-pip shellcheck);
export langueges=(nodejs python3 perl);
export services=(openssh git htop zsh flatpak bluez);
export desktop_apps=(alacritty slim nitrogen xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xdg-utils i3 Thunar file-roller i3status i3lock i3blocks firefox dmenu polybar);
export fonts=(noto-fonts-ttf liberation-fonts-ttf);
export terminal_apps=(nano neovim wget curl neofetch bash-completion scrot);
export tauri_deps=(curl wget openssl-devel webkit2gtk-devel appmenu-gtk-module libappindicator librsvg libvips gdk-pixbuf-devel cairo-devel pango-devel libsoup-devel libgtkdgl-devel webkit2gtk-devel)

# ---------- FUNCOES ---------- #

messages() {
    if [ "$3" = 0 ]; then
        echo -e "$1" " --- [$2] --- \033[0m";
    else
        echo -e "$1" " --- [$2] --- \033[0m \n";
    fi
}

messages_apps() {
    if [ "$4" = 0 ]; then
        echo -e "$1" "[$2] - $3 \033[0m";
    else
        echo -e "$1" "[$2] - $3 \033[0m \n";
    fi
}

install_apps_xbps() {
    apps=("${!1}")
    echo -e "$green_color" " --- Instalando pacotes via XBPS --- \033[0m"
    for nome_do_app in "${apps[@]}"; do
    if ! xbps-query -l | awk '{ print $2 }' | xargs -n1 xbps-uhelper getpkgname | grep -E "(^|\s)$nome_do_app($|\s)" ; then
        messages_apps "$yellow_color" "INSTALANDO" "$nome_do_app" 0;
        if ! sudo xbps-install "$nome_do_app" -y > /dev/null 2>&1; then
            messages_apps "$red_color" "Erro ao instalar" "$nome_do_app" 0;
            exit 1;
        fi
        messages_apps "$green_color" "CONCUIDO"  "$nome_do_app" 0;
    else
        messages_apps "$blue_color" "PREVIAMENTE INSTALADO" "$nome_do_app" 0;
    fi
done
}

# ---------- ATUALIZAÇÃO DE SISTEMA ---------- #

messages "$yellow_color" "Agora vamos iniciar o processo de atualização do Void Linux" 0
sleep 0.5
messages "$yellow_color" "Adicionando repositorios extras" 0

echo "repository=https://voidlinux.com.br/repo/current" | sudo tee -a /etc/xbps.d/00-repository-main.conf > /dev/null || exit 1;
echo "repository=https://voidlinux.com.br/repo/current/nonfree" | sudo tee -a /etc/xbps.d/10-repository-nonfree.conf > /dev/null|| exit 1;
echo "repository=https://voidlinux.com.br/repo/current/multilib" | sudo tee -a /etc/xbps.d/10-repository-multilib.conf > /dev/null|| exit 1;
echo "repository=https://voidlinux.com.br/repo/current/multilib/nonfree" | sudo tee -a /etc/xbps.d/10-repository-multilib-nonfree.conf > /dev/null|| exit 1;

if ! sudo xbps-install void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree -y > /dev/null 2>&1; then
    messages "$red_color" "Erro ao adicionar repositorios" 0
    exit;
fi
messages "$green_color" "Repositorios adicionados"
sleep 0.5
messages "$yellow_color" "Iniciando atualizaçãoes repositorios extras" 0

if ! sudo xbps-install -Su -y; then
    messages "$red_color" "Erro ao atualizar o sistema" 0
    exit;
fi
messages "$green_color" "Atualização finalizada"
sleep 0.5

# ---------- INSTALAR APPS VIA XBPS ---------- #

install_apps_xbps $"xorg_drivers[@]";
install_apps_xbps $"libs[@]";
install_apps_xbps $"plugins[@]";
install_apps_xbps $"langueges[@]";
install_apps_xbps $"services[@]";
install_apps_xbps $"desktop_apps[@]";
install_apps_xbps $"fonts[@]";
install_apps_xbps $"terminal_apps[@]";
install_apps_xbps $"tauri_deps[@]";

# ---------- INSTALANDO OH-MY-ZSH ---------- #

messages "$yellow_color" "Iniciando instalação do Oh-My-ZSH" 0

if [ -d "$HOME/.oh-my-zsh" ];
then
    printf "Já existe um instalação do Oh-My-ZSH, ao preceguir sera apagado toda instalação aterior (Y/N): "; read -r value
    if [ "$value" = "Y" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    else
        messages "$red_color" "Não será instalado o Oh-My-ZSH" 0
    fi
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi
# ---------- CONFIGURANDO HOME DO USUARIO ---------- #
messages "$yellow_color" "Iniciando configuração da HOME" 0

xdg-user-dirs-update --force
cd "$HOME" || exit 0

if [ -d "$HOME/dotfiles" ];
then
    printf "Já existe um diretorio dotfiles, deseja proceguir, apagado instalação aterior (Y/N): "; read -r value
    if [ "$value" = "Y" ]; then
        sudo rm -r "$HOME/dotfiles";
        git clone https://github.com/felipecaninnovaes/dotfiles;
        cp -r "$HOME/dotfiles/.config/"* "$HOME/.config/";
    else
        messages "$red_color" "Não será instalado as configuracoes" 0
    fi
else
    git clone https://github.com/felipecaninnovaes/dotfiles;
    cp -r "$HOME/dotfiles/.config/"* "$HOME/.config/";
fi

cp -r "$HOME/dotfiles/.zshrc" "$HOME/";

bash -c echo "exec i3" > ~/.xinitrc;
