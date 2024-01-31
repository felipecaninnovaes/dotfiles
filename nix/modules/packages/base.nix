{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
#      firefox
      zsh
      git
      curl
      vim
      neovim
      dbus
      geekbench
    ];
  };
}

