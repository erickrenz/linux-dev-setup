{ inputs, lib, config, pkgs, ... }:

{
  imports = [];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "ekrenz";
    homeDirectory = "/home/ekrenz";
  };

  # Enable programs
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Add Packages
  home.packages = with pkgs; [ 
    bacon
    cmake
    cmatrix
    curl
    fd
    fzf
    gcc
    gh
    git
    gnumake
    go
    julia
    jq
    libclang
    libllvm
    lld
    lua
    luarocks
    neofetch
    neovim
    nix-ld
    nodejs
    parallel
    perl
    php
    python311Packages.pip
    python311Packages.pynvim
    python3
    ripgrep
    ruby
    rustup
    starship
    stow
    tmux
    unzip
    wget
    zsh
    zulu # java
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
