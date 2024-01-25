{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      firefox
      git
      curl
      vim
      neovim
      dbus
    ];
  };
}

