{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      unzip
      lua
      python3
      gcc
      nodejs_21
      firefox
      git
      curl
      vim
      neovim
      glib
      dbus
    ];
  };
}

