{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ../../modules/home-manager/nix-conf.nix # Nix package manager configuration
    ../../modules/home-manager/common.nix # General shared configuration

    ../../modules/home-manager/cursor.nix # Bibata cursor my beloved

    ../../modules/home-manager/doom-emacs/default.nix # Doom Emacs config

    ../../modules/home-manager/syncthing.nix # File sync
  ];

  # --------------------

  home = {
    # TODO: move to module
    packages = (with pkgs; [
      # Messengers
      # armcord
      telegram-desktop

      # Gaming
      prismlauncher

      # Misc
      libreoffice-fresh
      hunspell
      hunspellDicts.pl-pl

      qalculate-gtk

      rnote
    ]) ++ (with pkgs-stable; [
      armcord # fix for installing ArmCord from stable repo to avoid https://snips.sh/f/bmCVQ3x63v caused by Electron 28
    ]);
  };

  # --------------------

  # TODO: move to module
  programs.librewolf.enable = true;

  # --------------------

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
