# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems = {
    "/tmp" = {
      fsType = "tmpfs";
    };
  };

  networking = {
    hostName = "wintermute";
    networkmanager.enable = true;
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Ljubljana";

  # java config -- from: https://nixos.org/wiki/Using_Oracle_JDK_instead_of_Open_JDK
  nixpkgs.config = {
    allowUnfree = true;
    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
      jre = true;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    nix
    nix-repl

    wget
    curl
    htop
    lsof
    tree
    binutils
    sudo
    manpages
    psmisc
    file
    zip
    unzip
    which
    lshw
    powertop
    iotop
    xorg.libXrandr
    gnome3.gdm
    gnupg
    numix-icon-theme-circle

    # tmux
    vimHugeX
    gitAndTools.gitFull
    meld

    gnumake
    libffi
    libtool
    libxml2
    libxslt
    nodejs-6_x
    openssl
    xmlsec
    libzip
    python27Full
    python27Packages.lxml
    python27Packages.virtualenv
    python27Packages.docker_compose
    python27Packages.pip
    stdenv
    zlib
    clamav
    mtpfs
    libmtp

    oraclejdk8
    vlc
    firefox
    gimp
    libreoffice
    chromium
    google-chrome
    obs-studio
    slack
    idea.pycharm-professional
    idea.idea-community
    sublime3

    evince  # gnome's pdf reader
    sbt
    scala

    # rvm basic dependencies
    sqlite
    autoconf
    automake
    bison
    pkgconfig
    readline
    zlib
    libyaml
    gdbm
    ncurses
  ];

  # make zsh available on the system
  programs = {
    zsh.enable = true;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      inconsolata
      symbola
      unifont
      vistafonts
    ];
  };

  services = {
    xserver = {
      enable = true;
      layout = "us,si";
      xkbOptions = "caps:swapescape,grp:switch";
      # synaptics = {
      #   enable = true;
      #   twoFingerScroll = true;
      #   horizontalScroll = true;
      # };
      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true;
    };
    printing.enable = true;

    dbus.enable = true;
    # gnome3.gvfs.enable = true;
    # gnome3.tracker.enable = false;
    telepathy.enable = false;
  };

  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.samo = {
    home = "/home/samo";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "audio" "docker" "networkmanager" "vboxusers" "wheel" ];
  };

  # zsh as system-wide default
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

  systemd.targets."multi-user".conflicts = [ "getty@tty1.service" ];
}
