{ inputs, lib, config, pkgs, ...}: 

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  # Add flake inputs as a registry
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # Add inputs to the system's legacy channels
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  # Nix Settings
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Environment
  environment.pathsToLink = ["/libexec"];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable networking
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true; 

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Latest Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";

    # gnome
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # xfce
    desktopManager.xfce.enable = true;
    desktopManager.xfce.noDesktop = true;
    desktopManager.xfce.enableXfwm = false;

    # i3
    displayManager.defaultSession = "none+i3";
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
	i3lock
	rofi
      ];
    };

    # hyperv
    modules = [ pkgs.xorg.xf86videofbdev ];
    videoDrivers = [ "hyperv_fb" ];
  };

  environment = {
    systemPackages = with pkgs; [
      firefox
      neovim
      neofetch
      tmux
      xfce.xfce4-terminal
    ];
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
  };

  virtualisation.hypervGuest = {
    enable = true;
    videoMode = "1920x1080";
  };

  # User Settings
  users.users = {
    gdm = { extraGroups = [ "video" ]; };
    ekrenz = {
      isNormalUser = true;
      description = "Eric Krenz";
      extraGroups = [ "networkmanager" "wheel" "video" ];
      packages = with pkgs; [];
      openssh.authorizedKeys.keys = [];
    };
  };

  # Global Fonts
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [" JetBrainsMono Nerd Font "];
      };
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}


