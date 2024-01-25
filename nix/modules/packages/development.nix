{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      unzip
      lua
      python3
      gcc
      nodejs_21
      glib
    ];
  };
}
