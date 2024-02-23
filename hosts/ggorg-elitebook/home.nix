{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/nix-conf.nix # Nix package manager configuration
    ../../modules/home-manager/common.nix # General shared configuration

    ../../modules/home-manager/rice/default.nix # My Hyprland rice
    ../../modules/home-manager/cursor.nix # Bibata cursor my beloved

    ../../modules/home-manager/doom-emacs/default.nix # Doom Emacs config

    ../../modules/home-manager/syncthing.nix # File sync
  ];

  # --------------------

  home = {
    # TODO: move to module
    packages = with pkgs; [
      # Messengers
      armcord
      telegram-desktop
      element

      # Gaming
      prismlauncher
      mindustry

      # Misc
      libreoffice-fresh
      hunspell
      hunspellDicts.pl-pl
      kicad

      qalculate-gtk

      rnote
    ];
  };

  # --------------------

  # TODO: move to module
  programs.librewolf.enable = true;
}
